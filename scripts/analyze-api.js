#!/usr/bin/env node

const fs = require('fs')
const path = require('path')

// Ler JSON da API
const apiData = JSON.parse(fs.readFileSync('/tmp/carnaval_api.json', 'utf-8'))

console.log('📊 ANÁLISE DA API OFICIAL DO CARNAVAL RIO 2026\n')
console.log('='.repeat(60))

// Estatísticas gerais
console.log('\n🔢 ESTATÍSTICAS GERAIS:')
console.log(`  - Total de blocos: ${apiData.street_attractions.length}`)
console.log(`  - Total de bairros: ${apiData.neighborhoods.length}`)
console.log(`  - Última atualização: ${apiData.last_update}`)

// Tipos de atração
const attractionTypes = {}
apiData.street_attractions.forEach(bloco => {
  attractionTypes[bloco.attraction_type] = (attractionTypes[bloco.attraction_type] || 0) + 1
})

console.log('\n🎭 TIPOS DE BLOCOS:')
Object.entries(attractionTypes)
  .sort((a, b) => b[1] - a[1])
  .forEach(([type, count]) => {
    console.log(`  - ${type}: ${count} blocos`)
  })

// Analisar campos disponíveis
const sampleBloco = apiData.street_attractions[0]
console.log('\n📋 CAMPOS DISPONÍVEIS POR BLOCO:')
Object.keys(sampleBloco).forEach(key => {
  const value = sampleBloco[key]
  const type = value === null ? 'null' : typeof value
  console.log(`  - ${key}: ${type}`)
})

// Blocos com público estimado
const blocosComPublico = apiData.street_attractions.filter(b => b.estimated_audience > 0)
console.log(`\n👥 PÚBLICO ESTIMADO:`)
console.log(`  - Blocos com estimativa: ${blocosComPublico.length}`)
console.log(`  - Blocos sem estimativa: ${apiData.street_attractions.length - blocosComPublico.length}`)

// Top 10 maiores blocos
const top10 = [...apiData.street_attractions]
  .sort((a, b) => (b.estimated_audience || 0) - (a.estimated_audience || 0))
  .slice(0, 10)

console.log('\n🏆 TOP 10 MAIORES BLOCOS:')
top10.forEach((bloco, index) => {
  console.log(`  ${index + 1}. ${bloco.title}`)
  console.log(`     Público: ${bloco.estimated_audience?.toLocaleString() || 'N/A'}`)
  console.log(`     Data: ${new Date(bloco.date).toLocaleDateString('pt-BR')}`)
  console.log(`     Bairro ID: ${bloco.neighborhood_id}`)
  console.log()
})

// Blocos por mês
const blocosPorMes = {}
apiData.street_attractions.forEach(bloco => {
  const mes = new Date(bloco.date).toLocaleDateString('pt-BR', { month: 'long', year: 'numeric' })
  blocosPorMes[mes] = (blocosPorMes[mes] || 0) + 1
})

console.log('\n📅 DISTRIBUIÇÃO POR MÊS:')
Object.entries(blocosPorMes)
  .sort((a, b) => {
    const dateA = new Date(a[0].split(' de ').reverse().join(' '))
    const dateB = new Date(b[0].split(' de ').reverse().join(' '))
    return dateA - dateB
  })
  .forEach(([mes, count]) => {
    console.log(`  - ${mes}: ${count} blocos`)
  })

// Campos úteis para nosso schema
console.log('\n🔄 MAPEAMENTO PARA NOSSO SCHEMA:')
console.log('  API → Nossa DB')
console.log('  ---------------------')
console.log('  ✅ id → bloco_id (referência)')
console.log('  ✅ title → nome')
console.log('  ✅ description → descricao')
console.log('  ✅ date → data')
console.log('  ✅ parade_time → horario')
console.log('  ✅ lat/lng → local_lat/local_lng')
console.log('  ✅ address → local_endereco')
console.log('  ✅ neighborhood_id → bairro (join)')
console.log('  ✅ estimated_audience → publico_estimado (novo campo)')
console.log('  ✅ attraction_type → tipo (novo campo)')
console.log('  ✅ foundation_year → ano_fundacao (novo campo)')
console.log('  ✅ extra_text4 → descricao_detalhada (pt)')
console.log('  ❌ extra_text1/2/3 → informação de contexto')
console.log('  ❌ photo_url → sempre null (buscar de outra fonte)')

// Campos que NÃO temos na API
console.log('\n⚠️  CAMPOS QUE PRECISAMOS ADICIONAR:')
console.log('  - instagram_url (não está na API)')
console.log('  - whatsapp_url (não está na API)')
console.log('  - photo_url (null na API, buscar manualmente)')
console.log('  - local_nome (extrair do address ou criar)')

// Regiões disponíveis
const regioes = {}
apiData.neighborhoods.forEach(n => {
  regioes[n.region] = (regioes[n.region] || 0) + 1
})

console.log('\n🗺️  REGIÕES DA CIDADE:')
Object.entries(regioes)
  .sort((a, b) => b[1] - a[1])
  .forEach(([regiao, count]) => {
    console.log(`  - ${regiao}: ${count} bairros`)
  })

console.log('\n' + '='.repeat(60))
console.log('✅ Análise completa!\n')

// Exportar resumo em JSON
const resumo = {
  total_blocos: apiData.street_attractions.length,
  total_bairros: apiData.neighborhoods.length,
  tipos_de_blocos: attractionTypes,
  blocos_por_mes: blocosPorMes,
  top_10_blocos: top10.map(b => ({
    nome: b.title,
    publico: b.estimated_audience,
    data: b.date,
    tipo: b.attraction_type
  })),
  campos_disponiveis: Object.keys(sampleBloco),
  regioes: regioes,
  ultima_atualizacao: apiData.last_update
}

fs.writeFileSync(
  path.join(__dirname, '../api-analysis.json'),
  JSON.stringify(resumo, null, 2)
)

console.log('📄 Resumo salvo em: scripts/../api-analysis.json\n')
