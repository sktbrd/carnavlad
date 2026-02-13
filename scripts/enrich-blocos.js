#!/usr/bin/env node

/**
 * Enriquecer dados dos blocos com informações extras:
 * - Descrição da API oficial
 * - Buscar Instagram (@bloco)
 * - Buscar site oficial
 * - Ano de fundação
 * - Informações extras
 */

const axios = require('axios');
const cheerio = require('cheerio');
const { createClient } = require('@supabase/supabase-js');
require('dotenv').config({ path: '.env.local' });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
  console.error('❌ Erro: Variáveis SUPABASE não configuradas');
  process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

// Carregar dados da API oficial
async function loadAPIData() {
  console.log('📡 Carregando dados da API oficial...\n');
  const { data } = await axios.get('https://www.carnavalderua.rio/api/carnaval-rio-2026/batch.json');
  
  // Agrupar por nome do bloco
  const blocoMap = new Map();
  
  data.attractions.forEach(attraction => {
    const nome = attraction.title.toUpperCase().trim();
    
    if (!blocoMap.has(nome)) {
      blocoMap.set(nome, {
        nome: attraction.title,
        descricao: attraction.description || null,
        ano_fundacao: attraction.foundation_year || null,
        photo_url: attraction.photo_url || null,
        extras: {
          text1: attraction.extra_text1 || null,
          text2: attraction.extra_text2 || null,
          text3: attraction.extra_text3 || null,
          text4: attraction.extra_text4 || null,
          text5: attraction.extra_text5 || null,
          text6: attraction.extra_text6 || null,
          text7: attraction.extra_text7 || null,
        }
      });
    }
  });
  
  console.log(`✅ ${blocoMap.size} blocos únicos encontrados na API\n`);
  return blocoMap;
}

// Buscar Instagram do bloco via Google
async function searchInstagram(blocoNome) {
  try {
    const query = `${blocoNome} carnaval rio instagram`;
    const url = `https://www.google.com/search?q=${encodeURIComponent(query)}`;
    
    const { data: html } = await axios.get(url, {
      headers: {
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36'
      }
    });
    
    const $ = cheerio.load(html);
    
    // Procurar links do Instagram
    const instagramLinks = [];
    $('a[href*="instagram.com"]').each((i, elem) => {
      const href = $(elem).attr('href');
      if (href && href.includes('instagram.com/')) {
        instagramLinks.push(href);
      }
    });
    
    if (instagramLinks.length > 0) {
      // Extrair username do primeiro link
      const match = instagramLinks[0].match(/instagram\.com\/([^\/\?]+)/);
      if (match) {
        return `https://instagram.com/${match[1]}`;
      }
    }
    
    return null;
  } catch (err) {
    return null;
  }
}

// Atualizar bloco no Supabase
async function updateBloco(blocoId, updates) {
  const { error } = await supabase
    .from('blocos')
    .update(updates)
    .eq('id', blocoId);
  
  if (error) {
    console.error(`   ❌ Erro ao atualizar: ${error.message}`);
    return false;
  }
  return true;
}

// Main
async function enrichBlocos() {
  console.log('🎭 ENRIQUECENDO DADOS DOS BLOCOS\n');
  console.log('='.repeat(60) + '\n');
  
  // 1. Carregar dados da API
  const apiData = await loadAPIData();
  
  // 2. Buscar blocos no Supabase
  console.log('📊 Buscando blocos no Supabase...\n');
  const { data: blocos, error } = await supabase
    .from('blocos')
    .select('id, nome, descricao, instagram_url, whatsapp_url')
    .order('nome');
  
  if (error) {
    console.error('❌ Erro ao buscar blocos:', error);
    return;
  }
  
  console.log(`✅ ${blocos.length} blocos encontrados no banco\n`);
  console.log('='.repeat(60) + '\n');
  
  // 3. Enriquecer cada bloco
  let enrichedCount = 0;
  let skippedCount = 0;
  
  for (const bloco of blocos.slice(0, 20)) { // Processar primeiros 20 (teste)
    console.log(`🔍 ${bloco.nome}`);
    
    const updates = {};
    let hasUpdates = false;
    
    // Buscar dados da API
    const apiBloco = apiData.get(bloco.nome.toUpperCase().trim());
    
    if (apiBloco) {
      // Adicionar descrição se não existe
      if (!bloco.descricao && apiBloco.descricao) {
        updates.descricao = apiBloco.descricao;
        hasUpdates = true;
        console.log(`   ✅ Descrição encontrada na API`);
      }
      
      // Adicionar photo_url se não existe
      if (apiBloco.photo_url) {
        updates.photo_url = apiBloco.photo_url;
        hasUpdates = true;
        console.log(`   ✅ Foto encontrada na API`);
      }
    }
    
    // Buscar Instagram se não existe
    if (!bloco.instagram_url) {
      console.log(`   🔎 Buscando Instagram...`);
      const instagram = await searchInstagram(bloco.nome);
      if (instagram) {
        updates.instagram_url = instagram;
        hasUpdates = true;
        console.log(`   ✅ Instagram encontrado: ${instagram}`);
      } else {
        console.log(`   ⏭️  Instagram não encontrado`);
      }
      
      // Delay para não sobrecarregar Google
      await new Promise(resolve => setTimeout(resolve, 2000));
    }
    
    // Atualizar se tem mudanças
    if (hasUpdates) {
      const success = await updateBloco(bloco.id, updates);
      if (success) {
        enrichedCount++;
        console.log(`   💾 Atualizado com sucesso!\n`);
      }
    } else {
      skippedCount++;
      console.log(`   ⏭️  Nada para atualizar\n`);
    }
  }
  
  console.log('='.repeat(60));
  console.log('✅ ENRIQUECIMENTO CONCLUÍDO!');
  console.log(`   Enriquecidos: ${enrichedCount}`);
  console.log(`   Pulados: ${skippedCount}`);
  console.log(`   Total processados: ${enrichedCount + skippedCount}`);
  console.log('='.repeat(60) + '\n');
}

// Executar
if (require.main === module) {
  enrichBlocos()
    .then(() => {
      console.log('🎉 Processo concluído!');
      process.exit(0);
    })
    .catch(err => {
      console.error('💥 Erro fatal:', err);
      process.exit(1);
    });
}

module.exports = { enrichBlocos };
