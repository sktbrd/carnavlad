#!/usr/bin/env node

const fs = require('fs')
const https = require('https')
const { execSync } = require('child_process')

const API_URL = 'https://www.carnavalderua.rio/api/carnaval-rio-2026/batch.json'
const TMP_FILE = '/tmp/carnaval_api.json'

console.log('🎭 CARNAVLAD - IMPORTAÇÃO COMPLETA\n')
console.log('📡 Baixando dados da API oficial...')
console.log(`   ${API_URL}\n`)

https.get(API_URL, (res) => {
  let data = ''

  res.on('data', (chunk) => {
    data += chunk
  })

  res.on('end', () => {
    try {
      const json = JSON.parse(data)
      
      console.log('✅ Dados baixados com sucesso!')
      console.log(`   - ${json.street_attractions.length} eventos`)
      console.log(`   - ${json.neighborhoods.length} bairros\n`)
      
      // Salvar em /tmp
      fs.writeFileSync(TMP_FILE, data)
      console.log(`💾 Salvo em: ${TMP_FILE}\n`)
      
      // Rodar script de importação
      console.log('🔄 Executando script de importação...\n')
      execSync('node scripts/import-from-api.js', { stdio: 'inherit' })
      
      console.log('\n🎉 IMPORTAÇÃO CONCLUÍDA!\n')
      console.log('📋 PRÓXIMOS PASSOS:')
      console.log('   1. Acesse Supabase SQL Editor')
      console.log('   2. Rode migration 004_add_extra_fields.sql')
      console.log('   3. Rode migration 005_import_bairros.sql')
      console.log('   4. Rode migration 006_import_blocos_eventos.sql')
      console.log('   5. Confira no Table Editor\n')
      
    } catch (err) {
      console.error('❌ Erro ao processar JSON:', err.message)
      process.exit(1)
    }
  })
}).on('error', (err) => {
  console.error('❌ Erro ao baixar API:', err.message)
  process.exit(1)
})
