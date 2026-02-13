#!/usr/bin/env node

/**
 * Executa scrapers e importa notícias diretamente no Supabase
 * Uso: node scripts/import-to-supabase.js [source]
 * Onde source = all | diariodorio | g1
 */

const { createClient } = require('@supabase/supabase-js');
const { scrapeDiarioDoRio } = require('./scrape-diariodorio.js');
const { scrapeG1 } = require('./scrape-g1.js');
require('dotenv').config({ path: '.env.local' });

// Inicializar Supabase
const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
  console.error('❌ Erro: Variáveis NEXT_PUBLIC_SUPABASE_URL e NEXT_PUBLIC_SUPABASE_ANON_KEY não configuradas');
  console.error('   Crie um arquivo .env.local com essas variáveis');
  process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function importToSupabase(source = 'all') {
  console.log('🚀 Iniciando importação para Supabase...\n');
  console.log(`📡 Supabase URL: ${supabaseUrl}`);
  console.log(`🎯 Fonte: ${source}\n`);

  let allNoticias = [];

  try {
    // Executar scrapers
    if (source === 'all' || source === 'diariodorio') {
      console.log('📰 Coletando Diário do Rio...');
      const noticias = await scrapeDiarioDoRio();
      allNoticias.push(...noticias);
      console.log(`✅ Diário do Rio: ${noticias.length} notícias\n`);
    }

    if (source === 'all' || source === 'g1') {
      console.log('📰 Coletando G1...');
      const noticias = await scrapeG1();
      allNoticias.push(...noticias);
      console.log(`✅ G1: ${noticias.length} notícias\n`);
    }

    console.log(`📊 Total coletado: ${allNoticias.length} notícias\n`);

    if (allNoticias.length === 0) {
      console.log('⚠️  Nenhuma notícia coletada. Scrapers podem ter falhado.');
      return { success: false, count: 0, skipped: 0 };
    }

    // Inserir no Supabase
    console.log('💾 Inserindo no Supabase...\n');

    let insertedCount = 0;
    let skippedCount = 0;
    let errorCount = 0;

    for (const noticia of allNoticias) {
      const { data, error } = await supabase
        .from('noticias')
        .upsert(
          {
            titulo: noticia.titulo,
            resumo: noticia.resumo,
            url: noticia.url,
            fonte: noticia.fonte,
            imagem_url: noticia.imagem_url,
            publicado_em: noticia.publicado_em,
            coletado_em: noticia.coletado_em,
            tags: noticia.tags,
            is_alerta: noticia.is_alerta,
          },
          {
            onConflict: 'url',
            ignoreDuplicates: false, // Atualiza se já existe
          }
        )
        .select();

      if (error) {
        if (error.code === '23505') {
          // Duplicate key (URL já existe)
          skippedCount++;
          console.log(`⏭️  Duplicado: ${noticia.titulo.substring(0, 50)}...`);
        } else {
          errorCount++;
          console.error(`❌ Erro ao inserir: ${error.message}`);
          console.error(`   Notícia: ${noticia.titulo.substring(0, 50)}...`);
        }
      } else if (data && data.length > 0) {
        insertedCount++;
        const emoji = noticia.is_alerta ? '🚨' : '📰';
        console.log(`${emoji} Inserido: ${noticia.titulo.substring(0, 60)}...`);
      }
    }

    console.log('\n' + '='.repeat(60));
    console.log('✅ IMPORTAÇÃO CONCLUÍDA!');
    console.log(`   Inseridas: ${insertedCount}`);
    console.log(`   Duplicadas (puladas): ${skippedCount}`);
    console.log(`   Erros: ${errorCount}`);
    console.log(`   Total coletado: ${allNoticias.length}`);
    console.log('='.repeat(60) + '\n');

    return {
      success: true,
      count: insertedCount,
      skipped: skippedCount,
      errors: errorCount,
      total: allNoticias.length,
    };
  } catch (error) {
    console.error('\n❌ Erro fatal:', error);
    return { success: false, error: error.message };
  }
}

// Executar se chamado diretamente
if (require.main === module) {
  const source = process.argv[2] || 'all';
  
  importToSupabase(source)
    .then(result => {
      if (result.success) {
        console.log(`🎉 Sucesso! ${result.count} notícias importadas.`);
        process.exit(0);
      } else {
        console.error(`💥 Falha: ${result.error || 'Erro desconhecido'}`);
        process.exit(1);
      }
    })
    .catch(err => {
      console.error('💥 Erro crítico:', err);
      process.exit(1);
    });
}

module.exports = { importToSupabase };
