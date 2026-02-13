#!/usr/bin/env node

const axios = require('axios');
const cheerio = require('cheerio');
const fs = require('fs');
const path = require('path');

const TARGET_URL = 'https://g1.globo.com/rj/rio-de-janeiro/carnaval/';

// Palavras-chave para detectar alertas
const ALERT_KEYWORDS = [
  'cancelado', 'cancelamento', 'cancela',
  'adiado', 'adiamento', 'adia',
  'mudança', 'alteração', 'muda', 'alterado',
  'atenção', 'aviso', 'importante',
  'novo local', 'novo horário', 'nova data',
  'bloco não sai', 'não haverá'
];

function isAlerta(texto) {
  const textoLower = texto.toLowerCase();
  return ALERT_KEYWORDS.some(keyword => textoLower.includes(keyword));
}

function extractTags(texto) {
  const tags = [];
  const textoLower = texto.toLowerCase();
  
  if (textoLower.includes('cancelado') || textoLower.includes('cancelamento')) {
    tags.push('cancelamento');
  }
  if (textoLower.includes('adiado') || textoLower.includes('adiamento')) {
    tags.push('adiamento');
  }
  if (textoLower.includes('mudança') || textoLower.includes('alteração')) {
    tags.push('mudanca');
  }
  if (textoLower.includes('bloco') || textoLower.includes('blocos')) {
    tags.push('blocos');
  }
  if (textoLower.includes('carnaval')) {
    tags.push('carnaval');
  }
  
  return tags;
}

async function scrapeG1() {
  console.log('🔍 Scraping G1 Carnaval Rio...\n');
  console.log(`📍 URL: ${TARGET_URL}\n`);

  try {
    const { data: html } = await axios.get(TARGET_URL, {
      headers: {
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36',
        'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        'Accept-Language': 'pt-BR,pt;q=0.9'
      }
    });

    const $ = cheerio.load(html);
    const noticias = [];

    // G1 usa estrutura específica: feed-post, bastian-feed-item, etc
    $('.feed-post, .bastian-feed-item, article, .feed-post-link').each((i, elem) => {
      const $elem = $(elem);
      
      // Título
      let titulo = $elem.find('.feed-post-link, .feed-post-header, h2, h3, .bastian-feed-title').text().trim();
      if (!titulo) {
        titulo = $elem.find('a').first().text().trim();
      }
      if (!titulo || titulo.length < 10) return;
      
      // Resumo
      let resumo = $elem.find('.feed-post-body-resumo, .feed-post-body, p').first().text().trim();
      if (!resumo) {
        resumo = 'Leia mais no G1.';
      }
      
      // URL
      let url = $elem.find('a').first().attr('href');
      if (!url) return;
      if (!url.startsWith('http')) {
        url = 'https://g1.globo.com' + url;
      }
      
      // Imagem
      let imagem = $elem.find('img').first().attr('src') || 
                   $elem.find('img').first().attr('data-src');
      
      // Data
      let dataText = $elem.find('.feed-post-datetime, time, .bastian-timestamp').text().trim();
      let publicado_em = new Date().toISOString();
      
      // Tentar parsear data relativa ("há 2 horas", "ontem", etc)
      if (dataText) {
        if (dataText.includes('hora')) {
          const horasAtras = parseInt(dataText.match(/\d+/)?.[0] || 1);
          publicado_em = new Date(Date.now() - horasAtras * 60 * 60 * 1000).toISOString();
        } else if (dataText.includes('minuto')) {
          const minutosAtras = parseInt(dataText.match(/\d+/)?.[0] || 1);
          publicado_em = new Date(Date.now() - minutosAtras * 60 * 1000).toISOString();
        } else if (dataText.includes('ontem')) {
          publicado_em = new Date(Date.now() - 24 * 60 * 60 * 1000).toISOString();
        }
      }
      
      // Detectar alerta
      const textoCompleto = titulo + ' ' + resumo;
      const is_alerta = isAlerta(textoCompleto);
      const tags = extractTags(textoCompleto);
      
      noticias.push({
        titulo,
        resumo: resumo.substring(0, 300) + (resumo.length > 300 ? '...' : ''),
        url,
        fonte: 'g1',
        imagem_url: imagem || null,
        publicado_em,
        coletado_em: new Date().toISOString(),
        tags,
        is_alerta
      });
    });

    // Remover duplicados
    const noticiasUnicas = [];
    const urlsVistas = new Set();
    
    noticias.forEach(noticia => {
      if (!urlsVistas.has(noticia.url)) {
        urlsVistas.add(noticia.url);
        noticiasUnicas.push(noticia);
      }
    });

    console.log(`✅ Encontradas ${noticiasUnicas.length} notícias\n`);
    
    // Preview
    noticiasUnicas.slice(0, 5).forEach((noticia, i) => {
      console.log(`${i + 1}. ${noticia.is_alerta ? '🚨 ALERTA:' : '📰'} ${noticia.titulo}`);
      console.log(`   URL: ${noticia.url}`);
      console.log(`   Tags: ${noticia.tags.join(', ') || 'nenhuma'}`);
      console.log('');
    });

    // Salvar
    const outputPath = path.join(__dirname, '../data/noticias-g1.json');
    const outputDir = path.dirname(outputPath);
    
    if (!fs.existsSync(outputDir)) {
      fs.mkdirSync(outputDir, { recursive: true });
    }
    
    fs.writeFileSync(outputPath, JSON.stringify(noticiasUnicas, null, 2));
    console.log(`💾 Salvo em: ${outputPath}\n`);

    return noticiasUnicas;

  } catch (error) {
    console.error('❌ Erro ao fazer scraping:', error.message);
    if (error.response) {
      console.error(`   Status: ${error.response.status}`);
    }
    return [];
  }
}

// Executar
if (require.main === module) {
  scrapeG1()
    .then(noticias => {
      console.log('🎉 Scraping G1 concluído!');
      process.exit(noticias.length > 0 ? 0 : 1);
    })
    .catch(err => {
      console.error('💥 Erro fatal:', err);
      process.exit(1);
    });
}

module.exports = { scrapeG1 };
