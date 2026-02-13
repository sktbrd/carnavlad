import { NextRequest, NextResponse } from 'next/server';
import { createClient } from '@/lib/supabase/server';

// Importar scrapers (quando rodar no servidor)
const scrapeDiarioDoRio = async () => {
  try {
    const module = await import('@/../scripts/scrape-diariodorio.js');
    return module.scrapeDiarioDoRio();
  } catch (err) {
    console.error('[scrape] Error loading diariodorio scraper:', err);
    return [];
  }
};

const scrapeG1 = async () => {
  try {
    const module = await import('@/../scripts/scrape-g1.js');
    return module.scrapeG1();
  } catch (err) {
    console.error('[scrape] Error loading G1 scraper:', err);
    return [];
  }
};

export async function POST(request: NextRequest) {
  const { searchParams } = new URL(request.url);
  const source = searchParams.get('source') || 'all'; // all, diariodorio, g1
  
  console.log(`[scrape] Starting scrape for source: ${source}`);
  
  try {
    const supabase = await createClient();
    
    if (!supabase) {
      return NextResponse.json(
        { success: false, error: 'Supabase not configured' },
        { status: 500 }
      );
    }

    let allNoticias: any[] = [];

    // Executar scrapers
    if (source === 'all' || source === 'diariodorio') {
      console.log('[scrape] Running Diário do Rio scraper...');
      const noticias = await scrapeDiarioDoRio();
      allNoticias.push(...noticias);
      console.log(`[scrape] Diário do Rio: ${noticias.length} notícias`);
    }

    if (source === 'all' || source === 'g1') {
      console.log('[scrape] Running G1 scraper...');
      const noticias = await scrapeG1();
      allNoticias.push(...noticias);
      console.log(`[scrape] G1: ${noticias.length} notícias`);
    }

    console.log(`[scrape] Total de notícias coletadas: ${allNoticias.length}`);

    // Inserir no Supabase
    let insertedCount = 0;
    let skippedCount = 0;

    for (const noticia of allNoticias) {
      const { error } = await supabase
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
            onConflict: 'url', // Não duplicar mesma URL
            ignoreDuplicates: true,
          }
        );

      if (error) {
        console.error('[scrape] Error inserting noticia:', error);
        skippedCount++;
      } else {
        insertedCount++;
      }
    }

    console.log(`[scrape] ✅ Inserted: ${insertedCount}, Skipped: ${skippedCount}`);

    return NextResponse.json({
      success: true,
      count: insertedCount,
      skipped: skippedCount,
      total: allNoticias.length,
      source,
    });
  } catch (error: any) {
    console.error('[scrape] Fatal error:', error);
    return NextResponse.json(
      { success: false, error: error.message },
      { status: 500 }
    );
  }
}

// GET para testar
export async function GET(request: NextRequest) {
  return NextResponse.json({
    message: 'Scraper endpoint. Use POST to trigger scraping.',
    usage: 'POST /api/scrape?source=all|diariodorio|g1',
  });
}
