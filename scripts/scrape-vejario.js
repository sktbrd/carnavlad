#!/usr/bin/env node

const axios = require('axios');
const cheerio = require('cheerio');
const fs = require('fs');
const path = require('path');

const TARGET_URL = 'https://vejario.abril.com.br/carnaval/';

// Palavras-chave para detectar alertas
const ALERT_KEYWORDS = [
  'cancelado', 'cancelamento', 'cancela',
  'adiado', 'adiamento', 'adia',
  'mudança', 'mudou', 'muda', 'alteração', 'alterado',
  'atenção', 'aviso', 'importante',
  'novo local', 'novo horário', 'nova data'
];

// Palavras-chave para tags
const TAG_KEYWORDS = {
  cancelamento: ['cancelado', 'cancelamento', 'cancela'],
  adiamento: ['adiado', 'adiamento', 'adia'],
  mudanca: ['mudança', 'mudou', 'muda', 'alteração', 'alterado'],
  horario: ['novo horário', 'muda horário', 'mudança de horário'],
  local: ['novo local', 'muda local', 'mudança de local'],
  carnaval: ['carnaval', 'bloco', 'blocos', 'desfile']
};

function isAlerta(texto) {
  const textoLower = texto.toLowerCase();
  return ALERT_KEYWORDS.some(keyword => textoLower.includes(keyword));
}

function extractTags(texto) {
  const tags = [];
  const textoLower = texto.toLowerCase();
  
  for (const [tag, keywords] of Object.entries(TAG_KEYWORDS)) {
    if (keywords.some(keyword => textoLower.includes(keyword))) {
      tags.push(tag);
    }
  }
  
  return tags;
}

async function scrapeVejaRio() {
  console.log('🔍 Scraping Veja Rio...\n');
  console.log(`📍 URL: ${TARGET_URL}\n`);

  try {
    const { data: html } = await axios.get(TARGET_URL, {
      headers: {
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'
      }
    });

    const $ = cheerio.load(html);
    const noticias = [];

    // Estratégia 1: Buscar artigos estruturados
    $('article, .post, .article-item, .card-news').each((i, elem) => {
      const $article = $(elem);
      
      const titulo = $article.find('h1, h2, h3, .title, .headline').first().text().trim();
      const resumo = $article.find('p, .summary, .excerpt, .description').first().text().trim();
      const linkElem = $article.find('a').first();
      const url = linkElem.attr('href');
      const imagem = $article.find('img').first().attr('src') || $article.find('img').first().attr('data-src');

      if (titulo && url) {
        // Resolver URL relativa
        const fullUrl = url.startsWith('http') ? url : `https://vejario.abril.com.br${url}`;

        noticias.push({
          titulo,
          resumo: resumo || null,
          url: fullUrl,
          fonte: 'vejario',
          imagem_url: imagem || null,
          publicado_em: new Date().toISOString(),
          coletado_em: new Date().toISOString(),
          tags: extractTags(titulo + ' ' + resumo),
          is_alerta: isAlerta(titulo + ' ' + resumo)
        });
      }
    });

    // Estratégia 2: Fallback - buscar links com "carnaval" no texto
    if (noticias.length === 0) {
      $('a').each((i, elem) => {
        const $link = $(elem);
        const href = $link.attr('href');
        const texto = $link.text().trim();

        if (href && texto && 
            (texto.toLowerCase().includes('bloco') || 
             texto.toLowerCase().includes('carnaval') ||
             texto.toLowerCase().includes('desfile'))) {
          
          const fullUrl = href.startsWith('http') ? href : `https://vejario.abril.com.br${href}`;

          noticias.push({
            titulo: texto,
            resumo: null,
            url: fullUrl,
            fonte: 'vejario',
            imagem_url: null,
            publicado_em: new Date().toISOString(),
            coletado_em: new Date().toISOString(),
            tags: extractTags(texto),
            is_alerta: isAlerta(texto)
          });
        }
      });
    }

    // Remover duplicados por URL
    const noticiasUnicas = Array.from(
      new Map(noticias.map(n => [n.url, n])).values()
    );

    console.log(`✅ Encontradas ${noticiasUnicas.length} notícias\n`);

    noticiasUnicas.slice(0, 10).forEach((noticia, idx) => {
      const emoji = noticia.is_alerta ? '🚨' : '📰';
      console.log(`${idx + 1}. ${emoji} ${noticia.titulo.substring(0, 80)}${noticia.titulo.length > 80 ? '...' : ''}`);
      console.log(`   URL: ${noticia.url}`);
      console.log(`   Tags: ${noticia.tags.length > 0 ? noticia.tags.join(', ') : 'nenhuma'}\n`);
    });

    // Salvar em arquivo JSON
    const dataDir = path.join(__dirname, '..', 'data');
    if (!fs.existsSync(dataDir)) {
      fs.mkdirSync(dataDir, { recursive: true });
    }

    const outputPath = path.join(dataDir, 'noticias-vejario.json');
    fs.writeFileSync(outputPath, JSON.stringify(noticiasUnicas, null, 2));
    console.log(`💾 Salvo em: ${outputPath}\n`);

    return noticiasUnicas;
  } catch (error) {
    console.error('❌ Erro ao fazer scraping:', error.message);
    return [];
  }
}

// Exportar função
module.exports = { scrapeVejaRio };

// Executar se chamado diretamente
if (require.main === module) {
  scrapeVejaRio();
}
