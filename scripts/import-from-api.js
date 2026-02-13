#!/usr/bin/env node

const fs = require('fs')
const path = require('path')

// Ler JSON da API
const apiData = JSON.parse(fs.readFileSync('/tmp/carnaval_api.json', 'utf-8'))

console.log('🔄 IMPORTANDO DADOS DA API OFICIAL...\n')

// Helper: criar slug
function createSlug(name) {
  return name
    .toLowerCase()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-|-$/g, '')
}

// Helper: extrair nome do local do endereço
function extractLocalName(address) {
  // Tenta pegar a primeira parte antes da vírgula
  const parts = address.split(',')
  if (parts.length > 0) {
    return parts[0].trim()
  }
  return address
}

// 1. GERAR SQL PARA BAIRROS
console.log('📍 Gerando SQL para bairros...')
let bairrosSql = '-- Inserir bairros\n'
bairrosSql += 'INSERT INTO bairros (id, nome, regiao) VALUES\n'

const bairrosValues = apiData.neighborhoods.map(bairro => {
  const nome = bairro.name.replace(/'/g, "''")
  const regiao = bairro.region.replace(/'/g, "''")
  return `  (${bairro.id}, '${nome}', '${regiao}')`
}).join(',\n')

bairrosSql += bairrosValues + '\n'
bairrosSql += 'ON CONFLICT (id) DO UPDATE SET\n'
bairrosSql += '  nome = EXCLUDED.nome,\n'
bairrosSql += '  regiao = EXCLUDED.regiao,\n'
bairrosSql += '  updated_at = NOW();\n\n'

// 2. AGRUPAR BLOCOS (múltiplos eventos do mesmo bloco)
console.log('🎭 Agrupando blocos...')
const blocosMap = new Map()

apiData.street_attractions.forEach(attraction => {
  const blocoNome = attraction.title.trim()
  const slug = createSlug(blocoNome)
  
  if (!blocosMap.has(slug)) {
    blocosMap.set(slug, {
      nome: blocoNome,
      slug: slug,
      descricao: attraction.extra_text4 || attraction.description || null,
      ano_fundacao: attraction.foundation_year || null,
      eventos: []
    })
  }
  
  blocosMap.get(slug).eventos.push(attraction)
})

console.log(`  - Total de blocos únicos: ${blocosMap.size}`)

// 3. GERAR SQL PARA BLOCOS
console.log('🎪 Gerando SQL para blocos...')
let blocosSql = '-- Inserir blocos\n'
let eventosInserts = []

blocosMap.forEach((bloco, slug) => {
  const nome = bloco.nome.replace(/'/g, "''")
  const descricao = bloco.descricao ? bloco.descricao.replace(/'/g, "''") : null
  const anoFundacao = bloco.ano_fundacao || null
  
  blocosSql += `DO $$\n`
  blocosSql += `DECLARE\n`
  blocosSql += `  bloco_uuid UUID;\n`
  blocosSql += `BEGIN\n`
  blocosSql += `  -- Inserir ou atualizar bloco\n`
  blocosSql += `  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)\n`
  blocosSql += `  VALUES ('${nome}', '${slug}', ${descricao ? `'${descricao}'` : 'NULL'}, ${anoFundacao ? `'${anoFundacao}'` : 'NULL'})\n`
  blocosSql += `  ON CONFLICT (slug) DO UPDATE SET\n`
  blocosSql += `    nome = EXCLUDED.nome,\n`
  blocosSql += `    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),\n`
  blocosSql += `    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),\n`
  blocosSql += `    updated_at = NOW()\n`
  blocosSql += `  RETURNING id INTO bloco_uuid;\n\n`
  
  // Inserir eventos deste bloco
  bloco.eventos.forEach(evento => {
    const data = evento.date.split('T')[0] // YYYY-MM-DD
    const horario = evento.parade_time || evento.date.split('T')[1]?.split(':').slice(0, 2).join(':') || null
    const horaFim = evento.end_time || null
    const localNome = extractLocalName(evento.address).replace(/'/g, "''")
    const localEndereco = evento.address.replace(/'/g, "''")
    const lat = parseFloat(evento.lat) || null
    const lng = parseFloat(evento.lng) || null
    const tipo = evento.attraction_type.replace(/'/g, "''")
    const publico = evento.estimated_audience || 0
    
    blocosSql += `  -- Evento do dia ${data}\n`
    blocosSql += `  INSERT INTO eventos (\n`
    blocosSql += `    bloco_id, api_id, data, horario, horario_confirmado,\n`
    blocosSql += `    local_nome, local_endereco, local_lat, local_lng, local_confirmado,\n`
    blocosSql += `    tipo, publico_estimado, hora_fim, bairro_id\n`
    blocosSql += `  ) VALUES (\n`
    blocosSql += `    bloco_uuid,\n`
    blocosSql += `    ${evento.id},\n`
    blocosSql += `    '${data}',\n`
    blocosSql += `    ${horario ? `'${horario}'` : 'NULL'},\n`
    blocosSql += `    true,\n`
    blocosSql += `    '${localNome}',\n`
    blocosSql += `    '${localEndereco}',\n`
    blocosSql += `    ${lat},\n`
    blocosSql += `    ${lng},\n`
    blocosSql += `    true,\n`
    blocosSql += `    '${tipo}',\n`
    blocosSql += `    ${publico},\n`
    blocosSql += `    ${horaFim ? `'${horaFim}'` : 'NULL'},\n`
    blocosSql += `    ${evento.neighborhood_id || 'NULL'}\n`
    blocosSql += `  )\n`
    blocosSql += `  ON CONFLICT (api_id) DO UPDATE SET\n`
    blocosSql += `    data = EXCLUDED.data,\n`
    blocosSql += `    horario = EXCLUDED.horario,\n`
    blocosSql += `    local_nome = EXCLUDED.local_nome,\n`
    blocosSql += `    local_endereco = EXCLUDED.local_endereco,\n`
    blocosSql += `    local_lat = EXCLUDED.local_lat,\n`
    blocosSql += `    local_lng = EXCLUDED.local_lng,\n`
    blocosSql += `    tipo = EXCLUDED.tipo,\n`
    blocosSql += `    publico_estimado = EXCLUDED.publico_estimado,\n`
    blocosSql += `    bairro_id = EXCLUDED.bairro_id;\n\n`
  })
  
  blocosSql += `END $$;\n\n`
})

// 4. SALVAR ARQUIVOS SQL
const outputDir = path.join(__dirname, '../supabase/migrations')
const bairrosFile = path.join(outputDir, '005_import_bairros.sql')
const blocosFile = path.join(outputDir, '006_import_blocos_eventos.sql')

fs.writeFileSync(bairrosFile, bairrosSql)
fs.writeFileSync(blocosFile, blocosSql)

console.log('\n✅ ARQUIVOS GERADOS:')
console.log(`  📄 ${bairrosFile}`)
console.log(`     - ${apiData.neighborhoods.length} bairros`)
console.log(`  📄 ${blocosFile}`)
console.log(`     - ${blocosMap.size} blocos`)
console.log(`     - ${apiData.street_attractions.length} eventos`)

console.log('\n📊 ESTATÍSTICAS:')
console.log(`  - Blocos únicos: ${blocosMap.size}`)
console.log(`  - Total de eventos: ${apiData.street_attractions.length}`)
console.log(`  - Média de eventos por bloco: ${(apiData.street_attractions.length / blocosMap.size).toFixed(1)}`)

// Top blocos com mais eventos
const topBlocosComMaisEventos = [...blocosMap.entries()]
  .map(([slug, bloco]) => ({ nome: bloco.nome, eventos: bloco.eventos.length }))
  .sort((a, b) => b.eventos - a.eventos)
  .slice(0, 10)

console.log('\n🏆 TOP 10 BLOCOS COM MAIS EVENTOS:')
topBlocosComMaisEventos.forEach((bloco, index) => {
  console.log(`  ${index + 1}. ${bloco.nome}: ${bloco.eventos} eventos`)
})

console.log('\n🎯 PRÓXIMOS PASSOS:')
console.log('  1. Rodar migration 004_add_extra_fields.sql (adiciona campos)')
console.log('  2. Rodar migration 005_import_bairros.sql (84 bairros)')
console.log('  3. Rodar migration 006_import_blocos_eventos.sql (todos os blocos)')
console.log('  4. Verificar no Table Editor')
console.log('\n✨ Dados prontos para importar!\n')
