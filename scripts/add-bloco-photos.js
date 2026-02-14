#!/usr/bin/env node

/**
 * Script para adicionar fotos dos blocos mais icônicos do Rio
 * 
 * Fontes de fotos:
 * 1. Instagram oficial dos blocos
 * 2. Unsplash (busca por "carnaval rio bloco [nome]")
 * 3. Fotos públicas conhecidas
 */

const fs = require('fs')
const path = require('path')

// Blocos com fotos curadas (URLs públicas de alta qualidade)
const BLOCOS_COM_FOTOS = [
  // MEGA BLOCOS
  {
    slug: 'cordao-da-bola-preta',
    nome: 'Cordão da Bola Preta',
    photo_url: 'https://images.unsplash.com/photo-1583275479873-0b8e9c2e0d70?w=1200&q=80', // Multidão fantasiada
    tipo: 'MEGA BLOCO',
    descricao: 'O maior bloco de rua do mundo, fundado em 1918'
  },
  {
    slug: 'monobloco',
    nome: 'Monobloco',
    photo_url: 'https://images.unsplash.com/photo-1518467166778-b88f373ffec7?w=1200&q=80', // Banda tocando
    tipo: 'TRADICIONAL',
    descricao: 'Bloco instrumental que reúne músicos profissionais'
  },
  {
    slug: 'sargento-pimenta',
    nome: 'Sargento Pimenta',
    photo_url: 'https://images.unsplash.com/photo-1514320291840-2e0a9bf2a9ae?w=1200&q=80', // Beatles theme
    tipo: 'TRADICIONAL',
    descricao: 'Dedicado aos Beatles, um dos mais queridos do Rio'
  },
  
  // BLOCOS DESCOLADOS/JOVENS
  {
    slug: 'fervo-da-lud',
    nome: 'Fervo da Lud',
    photo_url: 'https://images.unsplash.com/photo-1533174072545-7a4b6ad7a6c3?w=1200&q=80', // Festa colorida
    tipo: 'MEGA BLOCO',
    descricao: 'Comandado por Ludmilla, o maior bloco LGBT+ do Brasil'
  },
  {
    slug: 'bloco-da-anitta',
    nome: 'Bloco da Anitta',
    photo_url: 'https://images.unsplash.com/photo-1516450360452-9312f5e86fc7?w=1200&q=80', // Pop star vibe
    tipo: 'MEGA BLOCO',
    descricao: 'Comandado pela Anitta, pura energia pop'
  },
  {
    slug: 'orquestra-voadora',
    nome: 'Orquestra Voadora',
    photo_url: 'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=1200&q=80', // Instrumentos
    tipo: 'TRADICIONAL',
    descricao: 'Bloco instrumental com repertório de clássicos do samba'
  },
  {
    slug: 'ceu-na-terra',
    nome: 'Céu na Terra',
    photo_url: 'https://images.unsplash.com/photo-1514525253161-7a46d19cd819?w=1200&q=80', // Festa noturna
    tipo: 'TRADICIONAL',
    descricao: 'Um dos blocos mais tradicionais do Rio, desde 1979'
  },
  
  // BLOCOS HISTÓRICOS
  {
    slug: 'banda-de-ipanema',
    nome: 'Banda de Ipanema',
    photo_url: 'https://images.unsplash.com/photo-1549451371-64aa98a6f660?w=1200&q=80', // Ipanema beach vibe
    tipo: 'TRADICIONAL',
    descricao: 'O mais famoso bloco de Ipanema, desde 1965'
  },
  {
    slug: 'simpatia-e-quase-amor',
    nome: 'Simpatia É Quase Amor',
    photo_url: 'https://images.unsplash.com/photo-1519735777090-ec97df092a72?w=1200&q=80', // Love theme
    tipo: 'TRADICIONAL',
    descricao: 'Bloco romântico que desfila em Ipanema'
  },
  {
    slug: 'cordao-do-boi-tolo',
    nome: 'Cordão do Boi Tolo',
    photo_url: 'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=1200&q=80', // Música ao vivo
    tipo: 'TRADICIONAL',
    descricao: 'Um dos blocos mais antigos do Rio, fundado em 1959'
  },
  
  // BLOCOS TEMÁTICOS
  {
    slug: 'bloco-areia',
    nome: 'Bloco Areia',
    photo_url: 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=1200&q=80', // Beach party
    tipo: 'MEGA BLOCO',
    descricao: 'O bloco da praia, reúne milhares em Copacabana'
  },
  {
    slug: 'bloco-da-gold',
    nome: 'Bloco da Gold',
    photo_url: 'https://images.unsplash.com/photo-1523464862212-d6631d073194?w=1200&q=80', // Gold/luxury vibe
    tipo: 'MEGA BLOCO',
    descricao: 'Comandado por Pabllo Vittar, puro glamour'
  },
  {
    slug: 'cha-da-alice',
    nome: 'Chá da Alice',
    photo_url: 'https://images.unsplash.com/photo-1530103043960-ef38714abb15?w=1200&q=80', // Alice in Wonderland
    tipo: 'TRADICIONAL',
    descricao: 'Inspirado em Alice no País das Maravilhas'
  },
  
  // BLOCOS INFANTIS
  {
    slug: 'bloco-da-preta',
    nome: 'Bloco da Preta',
    photo_url: 'https://images.unsplash.com/photo-1517457373958-b7bdd4587205?w=1200&q=80', // Kids party
    tipo: 'INFANTIL',
    descricao: 'O maior bloco infantil do Rio'
  },
  
  // BLOCOS ALTERNATIVOS
  {
    slug: 'boitata',
    nome: 'Boitatá',
    photo_url: 'https://images.unsplash.com/photo-1492684223066-81342ee5ff30?w=1200&q=80', // Fire/energy
    tipo: 'TRADICIONAL',
    descricao: 'Bloco underground de Botafogo'
  },
  {
    slug: 'bloco-que-merda-e-essa',
    nome: 'Bloco Que Merda É Essa',
    photo_url: 'https://images.unsplash.com/photo-1574391884720-bbc3740c59d1?w=1200&q=80', // Fun chaos
    tipo: 'TRADICIONAL',
    descricao: 'Irreverente e crítico, puro sarcasmo carioca'
  },
]

// Gerar SQL de update
console.log('🎨 ADICIONANDO FOTOS DOS BLOCOS\n')
console.log(`Total de blocos com fotos: ${BLOCOS_COM_FOTOS.length}\n`)

let sql = '-- Adicionar fotos dos blocos principais\n\n'

BLOCOS_COM_FOTOS.forEach((bloco, index) => {
  sql += `-- ${index + 1}. ${bloco.nome} (${bloco.tipo})\n`
  sql += `UPDATE blocos\n`
  sql += `SET photo_url = '${bloco.photo_url}'\n`
  if (bloco.descricao) {
    sql += `,    descricao = '${bloco.descricao.replace(/'/g, "''")}'\n`
  }
  sql += `WHERE slug = '${bloco.slug}';\n\n`
})

// Salvar arquivo SQL
const outputFile = path.join(__dirname, '../supabase/migrations/011_add_bloco_photos.sql')
fs.writeFileSync(outputFile, sql)

console.log('✅ ARQUIVO GERADO:')
console.log(`  📄 ${outputFile}`)
console.log(`  📸 ${BLOCOS_COM_FOTOS.length} blocos com fotos\n`)

console.log('🎯 PRÓXIMOS PASSOS:')
console.log('  1. Acesse Supabase SQL Editor')
console.log('  2. Rode migration 011_add_bloco_photos.sql')
console.log('  3. Verifique fotos no Table Editor\n')

console.log('📊 BLOCOS ATUALIZADOS:')
BLOCOS_COM_FOTOS.forEach((bloco, i) => {
  console.log(`  ${i + 1}. ${bloco.nome}`)
})

console.log('\n✨ Feito!\n')
