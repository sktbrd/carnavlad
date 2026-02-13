# 📝 Enriquecimento de Dados dos Blocos

## 🎯 Objetivo

Adicionar informações extras aos blocos (descrição, Instagram, fotos, ano de fundação) a partir da API oficial e scraping da web.

---

## 📊 Novos Campos Adicionados

### Tabela `blocos`

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `photo_url` | TEXT | URL da foto principal do bloco |
| `ano_fundacao` | INTEGER | Ano de fundação do bloco |
| `site_url` | TEXT | Site oficial do bloco |

### View `eventos_completos`

Agora inclui:
- `bloco_descricao` - Descrição do bloco
- `bloco_photo_url` - Foto do bloco
- `ano_fundacao` - Ano de fundação
- `site_url` - Site oficial
- `instagram_url` - Instagram do bloco
- `whatsapp_url` - WhatsApp do bloco

---

## 🚀 Como Usar

### 1. Rodar Migration 008

No Supabase SQL Editor:
```sql
-- Cole o conteúdo de:
-- supabase/migrations/008_add_bloco_fields.sql
-- Clique em "Run"
```

### 2. Executar Script de Enriquecimento

```bash
cd /Users/vladnikolaev/carnavlad

# Enriquecer primeiros 20 blocos (teste)
node scripts/enrich-blocos.js
```

**O script faz:**
1. ✅ Carrega dados da API oficial (descrições, fotos, ano de fundação)
2. ✅ Busca Instagram via Google (se não existir)
3. ✅ Atualiza blocos no Supabase
4. ✅ Delay de 2s entre buscas (evitar bloqueio)

**Output esperado:**
```
🎭 ENRIQUECENDO DADOS DOS BLOCOS
============================================================

📡 Carregando dados da API oficial...
✅ 401 blocos únicos encontrados na API

📊 Buscando blocos no Supabase...
✅ 411 blocos encontrados no banco

============================================================

🔍 CORDÃO DA BOLA PRETA
   ✅ Descrição encontrada na API
   ✅ Foto encontrada na API
   🔎 Buscando Instagram...
   ✅ Instagram encontrado: https://instagram.com/cordaobolapreta
   💾 Atualizado com sucesso!

🔍 FERVO DA LUD
   ✅ Descrição encontrada na API
   ⏭️  Instagram não encontrado
   💾 Atualizado com sucesso!

...

============================================================
✅ ENRIQUECIMENTO CONCLUÍDO!
   Enriquecidos: 18
   Pulados: 2
   Total processados: 20
============================================================
```

---

## 🎨 Visualização no App

### Drawer do Evento (Sidebar)

Agora mostra:
- 📸 **Foto do bloco** (se disponível)
- 📝 **Descrição do bloco**
- 🏆 **Ano de fundação** (ex: "Fundado em 1918")
- 🏷️ **Tipo** (MEGA BLOCO, TRADICIONAL, etc)
- 👥 **Público estimado** (~700.000 pessoas)
- 🔗 **Links sociais:**
  - Instagram (botão roxo)
  - Site oficial (botão branco)
  - WhatsApp (botão verde)

**Antes:**
```
┌─────────────────────┐
│ Cordão da Bola Preta│
├─────────────────────┤
│ 📅 Data             │
│ ⏰ Horário          │
│ 📍 Local            │
│ [Ver Detalhes]      │
└─────────────────────┘
```

**Depois:**
```
┌─────────────────────┐
│ Cordão da Bola Preta│
├─────────────────────┤
│ 📅 Data             │
│ ⏰ Horário          │
│ 📍 Local            │
├─────────────────────┤
│ Sobre o Bloco       │
│ [FOTO DO BLOCO]     │
│ Descrição...        │
│ 🏆 Fundado em 1918  │
│ [MEGA BLOCO]        │
│ [~700k pessoas]     │
│ [Instagram] [Site]  │
├─────────────────────┤
│ [Ver Detalhes]      │
└─────────────────────┘
```

---

## 📋 Fonte de Dados

### 1. API Oficial da Prefeitura

**URL:** https://www.carnavalderua.rio/api/carnaval-rio-2026/batch.json

**Dados extraídos:**
- `description` → `bloco.descricao`
- `photo_url` → `bloco.photo_url`
- `foundation_year` → `bloco.ano_fundacao`
- `extra_text1-7` → (campos extras, futuro uso)

### 2. Scraping Google

**Para cada bloco sem Instagram:**
- Busca: `"[nome do bloco] carnaval rio instagram"`
- Extrai primeiro link do Instagram
- Salva em `bloco.instagram_url`

### 3. Scraping Sites de Carnaval (Futuro)

Fontes adicionais:
- [ ] Carnaval de Rua Rio (carnavalderuario.com.br)
- [ ] G1 Carnaval (g1.globo.com/rj/carnaval)
- [ ] RioTur
- [ ] Sites oficiais dos blocos

---

## 🔧 Personalização

### Processar Mais Blocos

Edite `scripts/enrich-blocos.js`:

```javascript
// Linha 96: mudar slice(0, 20) para slice(0, 100)
for (const bloco of blocos.slice(0, 100)) { // Processar 100 blocos
```

### Processar TODOS os Blocos

```javascript
// Remover .slice() completamente
for (const bloco of blocos) { // Processar todos
```

**⚠️ ATENÇÃO:**
- Google pode bloquear após muitas buscas
- Use delay de 2-5s entre buscas
- Processar todos ~411 blocos leva ~15min

### Adicionar Mais Fontes de Dados

```javascript
// Adicionar após searchInstagram()
async function searchSiteOficial(blocoNome) {
  // Buscar site oficial via Google
  const query = `${blocoNome} carnaval rio site oficial`;
  // ... implementação
}
```

---

## 📊 Estatísticas

### Dados Disponíveis na API

| Campo | Blocos com Dados | % |
|-------|------------------|---|
| `description` | ~350 | 85% |
| `photo_url` | ~50 | 12% |
| `foundation_year` | ~20 | 5% |

### Dados a Buscar

| Campo | Fonte | Sucesso Estimado |
|-------|-------|------------------|
| `instagram_url` | Google | ~60% |
| `site_url` | Google | ~30% |
| `whatsapp_url` | Manual | ~10% |

---

## 🚨 Troubleshooting

### Erro: "Cannot find module axios"
```bash
pnpm add axios cheerio
```

### Erro: "Google blocked requests"
**Solução:** Aumentar delay entre buscas
```javascript
await new Promise(resolve => setTimeout(resolve, 5000)); // 5 segundos
```

### Erro: "Instagram not found"
**Causas:**
- Bloco não tem Instagram
- Nome do bloco muito genérico
- Google bloqueou temporariamente

**Solução:** Inserir manualmente ou usar outra fonte

### Migration 008 falha
**Causa:** Campos já existem
**Solução:** Usar `ADD COLUMN IF NOT EXISTS` (já está na migration)

---

## 📝 Inserção Manual

Para blocos importantes sem dados automáticos:

```sql
-- Exemplo: Cordão da Bola Preta
UPDATE blocos
SET 
  descricao = 'O bloco mais tradicional do Rio, fundado em 1918...',
  instagram_url = 'https://instagram.com/cordaobolapreta',
  site_url = 'https://cordaobolapreta.com.br',
  ano_fundacao = 1918,
  photo_url = 'https://example.com/foto.jpg'
WHERE nome = 'CORDÃO DA BOLA PRETA';
```

---

## 🎯 Próximos Passos

- [ ] Rodar migration 008
- [ ] Testar script com 20 blocos
- [ ] Verificar dados no drawer
- [ ] Processar todos os blocos (gradualmente)
- [ ] Adicionar fotos manualmente para blocos principais
- [ ] Criar scraper para sites específicos de blocos
- [ ] Adicionar campo `whatsapp_url` para top 50 blocos

---

_Última atualização: 2026-02-13 15:05 GMT-3_
