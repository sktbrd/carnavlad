#!/usr/bin/env node

const axios = require('axios');
const cheerio = require('cheerio');
const fs = require('fs');
const path = require('path');

const TARGET_URL = 'https://diariodorio.com/agenda-dos-blocos-de-rua-do-rio-de-janeiro-em-2026/';

// Palavras-chave para detectar alertas
const ALERT_KEYWORDS = [
  'cancelado', 'cancelamento', 'cancela',
  'adiado', 'adiamento', 'adia',
  'mudança', 'alteração', 'muda', 'alterado',
  'atenção', 'aviso', 'importante',
  'novo local', 'novo horário', 'nova data'
];

// Helper: detectar se é alerta
function isAlerta(texto) {
  const textoLower = texto.toLowerCase();
  return ALERT_KEYWORDS.some(keyword => textoLower.includes(keyword));
}

// Helper: extrair tags do texto
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
  if (textoLower.includes('novo horário')) {
    tags.push('horario');
  }
  if (textoLower.includes('novo local')) {
    tags.push('local');
  }
  
  return tags;
}

// Helper: formatar data ISO
function parseDataBR(dataStr) {
  // Exemplo: "13/02/2026" → "2026-02-13T12:00:00Z"
  const match = dataStr.match(/(\d{2})\/(\d{2})\/(\d{4})/);
  if (match) {
    const [, dia, mes, ano] = match;
    return new Date(`${ano}-${mes}-${dia}T12:00:00Z`).toISOString();
  }
  return new Date().toISOString();
}

async function scrapeDiarioDoRio() {
  console.log('🔍 Scraping Diário do Rio...\n');
  console.log(`📍 URL: ${TARGET_URL}\n`);

  try {
    // Fetch HTML
    const { data: html } = await axios.get(TARGET_URL, {
      headers: {
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36',
        'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        'Accept-Language': 'pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7'
      }
    });

    const $ = cheerio.load(html);
    const noticias = [];

    // Estratégia 1: Buscar artigos/posts
    $('article, .post, .entry-content, .wp-block-post').each((i, elem) => {
      const $elem = $(elem);
      
      // Título
      const titulo = $elem.find('h1, h2, h3, .entry-title').first().text().trim();
      if (!titulo) return;
      
      // Resumo
      const resumo = $elem.find('p').first().text().trim() || 
                     $elem.find('.excerpt, .summary').text().trim();
      
      // Imagem
      const imagem = $elem.find('img').first().attr('src');
      
      // URL
      const url = $elem.find('a').first().attr('href') || TARGET_URL;
      
      // Data (tentar extrair)
      const dataText = $elem.find('.date, time, .post-date').text().trim();
      const publicado_em = dataText ? parseDataBR(dataText) : new Date().toISOString();
      
      // Detectar alerta
      const textoCompleto = titulo + ' ' + resumo;
      const is_alerta = isAlerta(textoCompleto);
      const tags = extractTags(textoCompleto);
      
      noticias.push({
        titulo,
        resumo: resumo.substring(0, 300) + (resumo.length > 300 ? '...' : ''),
        url,
        fonte: 'diariodorio',
        imagem_url: imagem || null,
        publicado_em,
        coletado_em: new Date().toISOString(),
        tags,
        is_alerta
      });
    });

    // Estratégia 2: Se não encontrou nada, buscar links
    if (noticias.length === 0) {
      console.log('⚠️  Estratégia 1 falhou, tentando buscar links...\n');
      
      $('a').each((i, elem) => {
        const $elem = $(elem);
        const titulo = $elem.text().trim();
        const url = $elem.attr('href');
        
        // Filtrar por títulos relevantes
        if (titulo.length > 20 && 
            (titulo.toLowerCase().includes('bloco') || 
             titulo.toLowerCase().includes('carnaval') ||
             titulo.toLowerCase().includes('cancelado'))) {
          
          const is_alerta = isAlerta(titulo);
          const tags = extractTags(titulo);
          
          noticias.push({
            titulo,
            resumo: 'Clique para ler mais no Diário do Rio.',
            url: url?.startsWith('http') ? url : `https://diariodorio.com${url}`,
            fonte: 'diariodorio',
            imagem_url: null,
            publicado_em: new Date().toISOString(),
            coletado_em: new Date().toISOString(),
            tags,
            is_alerta
          });
        }
      });
    }

    // Remover duplicados por URL
    const noticiasUnicas = [];
    const urlsVistas = new Set();
    
    noticias.forEach(noticia => {
      if (!urlsVistas.has(noticia.url)) {
        urlsVistas.add(noticia.url);
        noticiasUnicas.push(noticia);
      }
    });

    console.log(`✅ Encontradas ${noticiasUnicas.length} notícias\n`);
    
    // Mostrar preview
    noticiasUnicas.slice(0, 5).forEach((noticia, i) => {
      console.log(`${i + 1}. ${noticia.is_alerta ? '🚨 ALERTA:' : '📰'} ${noticia.titulo}`);
      console.log(`   URL: ${noticia.url}`);
      console.log(`   Tags: ${noticia.tags.join(', ') || 'nenhuma'}`);
      console.log('');
    });

    // Salvar JSON
    const outputPath = path.join(__dirname, '../data/noticias-diariodorio.json');
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

// Executar se chamado diretamente
if (require.main === module) {
  scrapeDiarioDoRio()
    .then(noticias => {
      console.log('🎉 Scraping concluído!');
      process.exit(noticias.length > 0 ? 0 : 1);
    })
    .catch(err => {
      console.error('💥 Erro fatal:', err);
      process.exit(1);
    });
}

module.exports = { scrapeDiarioDoRio };
