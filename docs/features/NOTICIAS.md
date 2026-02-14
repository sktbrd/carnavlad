# 📰 Sistema de Notícias - Carnavlad

## 🎯 Overview

Sistema completo de scraping e exibição de notícias sobre blocos de carnaval do Rio 2026.

---

## ✨ Features

### 1. **Aba de Notícias**
- 5ª tab na home page (ícone Newspaper)
- Grid responsivo de cards
- Filtros por fonte
- Toggle "Apenas Alertas"
- Atualização em tempo real

### 2. **Detecção Automática de Alertas**
Sistema identifica palavras-chave em títulos/resumos:
- **Cancelamento:** cancelado, cancelamento, cancela
- **Adiamento:** adiado, adiamento, adia
- **Mudanças:** mudança, alteração, muda, alterado
- **Avisos:** atenção, aviso, importante
- **Alterações:** novo local, novo horário, nova data

### 3. **Scrapers Implementados**
| Fonte | URL | Status |
|-------|-----|--------|
| Diário do Rio | diariodorio.com | ✅ Implementado |
| G1 Carnaval | g1.globo.com/rj/carnaval | ✅ Implementado |
| Veja Rio | vejario.abril.com.br | ⏳ A fazer |
| Twitter | x.com/riodejaneiro | ⏳ A fazer |
| Instagram | instagram.com/blocosderuario | ⏳ A fazer |

---

## 🗄️ Estrutura do Banco

### Tabela `noticias`

```sql
CREATE TABLE noticias (
  id UUID PRIMARY KEY,
  titulo TEXT NOT NULL,
  resumo TEXT,
  url TEXT UNIQUE NOT NULL,
  fonte TEXT CHECK (fonte IN ('diariodorio', 'g1', 'vejario', 'twitter', 'instagram', 'riotur')),
  imagem_url TEXT,
  publicado_em TIMESTAMPTZ,
  coletado_em TIMESTAMPTZ DEFAULT NOW(),
  tags TEXT[] DEFAULT '{}',
  is_alerta BOOLEAN DEFAULT FALSE,
  bloco_relacionado UUID REFERENCES blocos(id)
);
```

### Índices
- `idx_noticias_fonte` - Filtro por fonte
- `idx_noticias_publicado` - Ordenação por data
- `idx_noticias_alerta` - Busca de alertas
- `idx_noticias_tags` - Busca por tags (GIN)

### RLS Policies
- ✅ Leitura pública
- ❌ Escrita apenas via API route

---

## 🚀 Como Usar

### 1. **Rodar Migration**

No Supabase SQL Editor:
```sql
-- Cole o conteúdo de:
-- supabase/migrations/007_create_noticias.sql
-- Clique em "Run"
```

### 2. **Testar Scrapers Manualmente**

```bash
# Diário do Rio
node scripts/scrape-diariodorio.js

# G1
node scripts/scrape-g1.js
```

**Saída:**
```
✅ Encontradas 5 notícias
1. 📰 Carnaval 2026: Confira programação...
2. 🚨 ALERTA: Bloco X cancelado...
💾 Salvo em: data/noticias-diariodorio.json
```

### 3. **Importar para o Supabase**

```bash
# Via script direto (OpenClaw Cron local)
node scripts/import-to-supabase.js all

# Ou fonte específica
node scripts/import-to-supabase.js diariodorio
node scripts/import-to-supabase.js g1
```

**Resposta:**
```
✅ IMPORTAÇÃO CONCLUÍDA!
   Inseridas: 5
   Duplicadas (puladas): 2
   Erros: 0
   Total coletado: 7
```

### 4. **Ver Notícias no App**

1. Acesse: http://localhost:3456
2. Clique na aba **"Notícias"**
3. Veja as notícias coletadas!

---

## 📊 Componente NoticiasView

### Props
Nenhuma (auto-fetch do Supabase)

### Features
- ✅ Grid responsivo (1-3 colunas)
- ✅ Cards com imagem, título, resumo
- ✅ Badge de fonte (cores diferentes)
- ✅ Badge "ALERTA" em vermelho
- ✅ Tags extraídas (#cancelamento, #mudanca)
- ✅ Filtro por fonte (dropdown)
- ✅ Toggle "Apenas Alertas"
- ✅ Botão "Atualizar"
- ✅ Link externo para fonte original
- ✅ Data formatada (PT-BR)

### Badge de Cores
```typescript
diariodorio → bg-blue-500
g1 → bg-red-500
vejario → bg-green-500
twitter → bg-sky-500
instagram → bg-pink-500
riotur → bg-purple-500
```

---

## 🤖 Automação (OpenClaw Cron Local)

**Estratégia:** Usar OpenClaw Cron local ao invés de Vercel Cron.

**Vantagens:**
- ✅ Zero dependência de Vercel Pro
- ✅ Controle total sobre schedule
- ✅ Execução local (mais rápido)
- ✅ Notificações integradas

### Setup Completo

Ver: **[CRON_SETUP.md](./CRON_SETUP.md)**

### Quick Start

```bash
# 1. Testar script
cd /Users/vladnikolaev/carnavlad
node scripts/import-to-supabase.js all

# 2. Configurar cron
chmod +x scripts/setup-cron.sh
./scripts/setup-cron.sh

# 3. Adicionar ao OpenClaw
openclaw cron add < /tmp/scrape-noticias-cron.json

# 4. Verificar
openclaw cron list
```

**Schedule Recomendado:**
```
A cada 2 horas: 0 */2 * * *
Timezone: America/Sao_Paulo
```

---

## 🕷️ Como os Scrapers Funcionam

### 1. **scrape-diariodorio.js**

**Estratégia 1:** Busca artigos estruturados
```javascript
$('article, .post').each((i, elem) => {
  const titulo = $(elem).find('h1, h2, h3').text()
  const resumo = $(elem).find('p').first().text()
  const imagem = $(elem).find('img').attr('src')
  const url = $(elem).find('a').attr('href')
  // ...
})
```

**Estratégia 2:** Fallback para links
```javascript
$('a').each((i, elem) => {
  if (titulo.includes('bloco') || titulo.includes('carnaval')) {
    // Adiciona como notícia
  }
})
```

### 2. **scrape-g1.js**

**Estrutura G1:**
- `.feed-post` - Container de notícias
- `.feed-post-link` - Título
- `.feed-post-body` - Resumo
- `time, .feed-post-datetime` - Data

**Parse de Data Relativa:**
```javascript
if (dataText.includes('hora')) {
  const horasAtras = parseInt(dataText.match(/\d+/)?.[0])
  publicado_em = new Date(Date.now() - horasAtras * 3600000)
}
```

---

## 📝 Adicionar Novo Scraper

### Template

```javascript
#!/usr/bin/env node
const axios = require('axios');
const cheerio = require('cheerio');

const TARGET_URL = 'https://site.com.br/carnaval';

async function scrapeNewSource() {
  const { data: html } = await axios.get(TARGET_URL);
  const $ = cheerio.load(html);
  const noticias = [];

  // Extrair notícias
  $('.noticia-selector').each((i, elem) => {
    noticias.push({
      titulo: $(elem).find('.titulo').text(),
      resumo: $(elem).find('.resumo').text(),
      url: $(elem).find('a').attr('href'),
      fonte: 'novaFonte',
      imagem_url: $(elem).find('img').attr('src'),
      publicado_em: new Date().toISOString(),
      coletado_em: new Date().toISOString(),
      tags: extractTags(titulo),
      is_alerta: isAlerta(titulo)
    });
  });

  return noticias;
}

module.exports = { scrapeNewSource };
```

### Integrar no Script de Importação

```javascript
// scripts/import-to-supabase.js
const { scrapeNewSource } = require('./scrape-newsource.js');

// No importToSupabase():
if (source === 'all' || source === 'newsource') {
  console.log('📰 Coletando Nova Fonte...');
  const noticias = await scrapeNewSource();
  allNoticias.push(...noticias);
  console.log(`✅ Nova Fonte: ${noticias.length} notícias\n`);
}
```

---

## 🚨 Troubleshooting

### Erro: "relation noticias does not exist"
**Causa:** Migration não foi rodada  
**Solução:** Rode `007_create_noticias.sql` no Supabase

### Erro: "permission denied for table noticias"
**Causa:** RLS está bloqueando  
**Solução:** Certifique-se de que está usando a API route (não client-side)

### Scraper retorna array vazio
**Causa:** Site mudou estrutura HTML  
**Solução:** 
1. Inspecione o HTML do site
2. Atualize os seletores no scraper
3. Teste manualmente com `node scripts/scrape-xxx.js`

### CORS error ao fazer scrape
**Causa:** Site bloqueia scrapers  
**Solução:** Use user-agent no axios:
```javascript
headers: {
  'User-Agent': 'Mozilla/5.0 ...'
}
```

---

## 📈 Métricas

### Performance
- **Tempo de scrape:** ~2-5s por fonte
- **Notícias por fonte:** 5-20 em média
- **Duplicados:** ~30% (já existentes)

### Armazenamento
- **1 notícia:** ~1-2 KB
- **100 notícias:** ~100-200 KB
- **Imagens:** Armazenadas como URLs (não download)

---

## 🎯 Roadmap

### ✅ Implementado
- [x] Tabela noticias
- [x] Type Noticia
- [x] Scraper Diário do Rio
- [x] Scraper G1
- [x] API Route /api/scrape
- [x] Componente NoticiasView
- [x] Aba Notícias na home
- [x] Detecção de alertas
- [x] Filtros por fonte

### 🚧 Próximos Passos
- [ ] Scraper Veja Rio
- [ ] Scraper Twitter/X
- [ ] Scraper Instagram
- [ ] Vercel Cron auto-scrape
- [ ] Push notifications para alertas
- [ ] Relacionar notícias com blocos específicos
- [ ] Dashboard admin para aprovar/rejeitar
- [ ] Scraper de comentários (redes sociais)

---

## 🤝 Contribuindo

### Adicionar Nova Fonte

1. Crie scraper em `scripts/scrape-novafonte.js`
2. Adicione fonte no enum do type `Noticia`
3. Adicione check constraint na migration
4. Integre na API route
5. Adicione cor do badge no componente
6. Teste e envie PR!

---

_Última atualização: 2026-02-13 14:21 GMT-3_
