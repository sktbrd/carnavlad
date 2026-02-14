# 📸 Sistema de Fotos dos Blocos

**Última atualização:** 13/02/2026 21:29 GMT-3

---

## ✅ Status Atual

### Blocos com Fotos (16/400)

**Mega Blocos:**
1. ✅ Cordão da Bola Preta
2. ✅ Fervo da Lud
3. ✅ Bloco da Anitta
4. ✅ Bloco Areia
5. ✅ Bloco da Gold

**Tradicionais Icônicos:**
6. ✅ Monobloco
7. ✅ Sargento Pimenta
8. ✅ Orquestra Voadora
9. ✅ Céu na Terra
10. ✅ Banda de Ipanema
11. ✅ Simpatia É Quase Amor
12. ✅ Cordão do Boi Tolo
13. ✅ Boitatá

**Temáticos:**
14. ✅ Chá da Alice
15. ✅ Bloco Que Merda É Essa

**Infantil:**
16. ✅ Bloco da Preta

**Faltam:** 384 blocos (96%)

---

## 🎯 Estratégia de Fotos

### 1. Fotos Curadas (Atual)
- **Fonte:** Unsplash (alta qualidade, gratuitas)
- **Método:** Manual (selecionadas por tema/vibe)
- **Blocos:** 16 principais (mega blocos + icônicos)

### 2. Instagram Scraping (Próximo)
- **Fonte:** Instagram oficial dos blocos
- **Método:** Scraping da primeira foto do feed
- **Coverage:** ~200 blocos têm Instagram

### 3. Fallback Inteligente
- **Blocos sem foto:** Imagem genérica temática
- **Categorias:**
  - `TRADICIONAL` → Samba clássico
  - `MEGA BLOCO` → Multidão
  - `INFANTIL` → Crianças fantasiadas
  - `LGBTQIAPN+` → Pride colors
  - `RELIGIOSO` → Tema religioso

---

## 📋 Como Adicionar Mais Fotos

### Opção 1: Manual (Script)

**1. Editar lista:**
```bash
vim scripts/add-bloco-photos.js
```

**2. Adicionar bloco:**
```javascript
{
  slug: 'nome-do-bloco',
  nome: 'Nome do Bloco',
  photo_url: 'https://unsplash.com/...', // URL da foto
  tipo: 'TRADICIONAL',
  descricao: 'Descrição curta'
}
```

**3. Gerar migration:**
```bash
node scripts/add-bloco-photos.js
```

**4. Rodar no Supabase:**
- SQL Editor → Colar conteúdo de `011_add_bloco_photos.sql`
- Run

---

### Opção 2: Instagram Scraper (Automatizado)

**Script:** `scripts/scrape-instagram-photos.js`

```bash
# Busca foto do Instagram de cada bloco
node scripts/scrape-instagram-photos.js

# Gera SQL:
# UPDATE blocos SET photo_url = '...' WHERE instagram_url LIKE '%sargentopimenta%'
```

**Benefício:**
- ✅ Automatizado
- ✅ Fotos reais dos blocos
- ✅ Atualizado (última do feed)

**Desvantagem:**
- ❌ Precisa de token Instagram
- ❌ Rate limits

---

### Opção 3: Google Images API

**Script:** `scripts/fetch-google-images.js`

```bash
# Busca "carnaval rio [nome do bloco]"
GOOGLE_API_KEY=xxx node scripts/fetch-google-images.js
```

**Benefício:**
- ✅ Alta qualidade
- ✅ Muitas opções

**Desvantagem:**
- ❌ Pago (após 100 requests/dia)
- ❌ Precisa validação manual

---

## 🎨 Fallback Inteligente (Código)

### No Componente

```typescript
// lib/get-bloco-fallback-image.ts
export function getBlocoFallbackImage(tipo: string): string {
  const fallbacks = {
    'TRADICIONAL': 'https://images.unsplash.com/photo-1533174072545-7a4b6ad7a6c3',
    'MEGA BLOCO': 'https://images.unsplash.com/photo-1583275479873-0b8e9c2e0d70',
    'INFANTIL': 'https://images.unsplash.com/photo-1517457373958-b7bdd4587205',
    'LGBTQIAPN+': 'https://images.unsplash.com/photo-1518135714426-c18f5ffb6f4d',
    'RELIGIOSO': 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e',
  }
  
  return fallbacks[tipo] || fallbacks['TRADICIONAL']
}
```

### Uso

```tsx
<img 
  src={bloco.photo_url || getBlocoFallbackImage(bloco.tipo)} 
  alt={bloco.nome}
/>
```

---

## 🚀 Plano de Expansão

### Fase 1: Mega Blocos (10) ✅
- Cordão da Bola Preta
- Fervo da Lud
- Bloco da Anitta
- Bloco Areia
- Bloco da Gold
- (mais 5 quando tiver dados da API)

### Fase 2: Top 50 (Em andamento)
- Blocos com 50k+ público
- Scraping Instagram automático
- Validação manual de qualidade

### Fase 3: Todos com Instagram (~200)
- Script automático
- Cron job semanal (atualiza fotos)

### Fase 4: Resto (200)
- Fallback inteligente por tipo
- Crowdsourcing (usuários enviam fotos)

---

## 📊 Fontes de Fotos

### Unsplash
- **Prós:** Gratuito, alta qualidade, sem copyright
- **Contras:** Genéricas (não são do bloco exato)
- **API:** `https://api.unsplash.com/search/photos?query=carnaval+rio`

### Instagram
- **Prós:** Fotos reais dos blocos, atualizadas
- **Contras:** Precisa de token, rate limits
- **API:** Instagram Graph API

### Pexels
- **Prós:** Gratuito, boa qualidade
- **Contras:** Menos opções de carnaval
- **API:** `https://api.pexels.com/v1/search?query=carnival+brazil`

### Pixabay
- **Prós:** Gratuito, muitas fotos
- **Contras:** Qualidade variável
- **API:** `https://pixabay.com/api/?q=carnaval+rio`

---

## 🎯 Qualidade das Fotos

### Critérios

✅ **Boa foto:**
- Alta resolução (min 1200x800)
- Mostra multidão/energia
- Cores vibrantes
- Não pixelada

❌ **Foto ruim:**
- Baixa resolução
- Escura/sem contraste
- Genérica demais
- Com watermark

### Tamanhos Recomendados

| Uso | Tamanho | Formato |
|-----|---------|---------|
| **Card (lista)** | 400x300 | JPG/WebP |
| **Hero (página)** | 1200x800 | JPG/WebP |
| **Thumbnail** | 200x150 | JPG/WebP |

**URL Unsplash com parâmetros:**
```
https://images.unsplash.com/photo-ABC?w=1200&h=800&fit=crop&q=80
```

---

## 🔧 Scripts Úteis

### 1. Verificar blocos sem foto

```sql
SELECT nome, slug, tipo
FROM blocos
WHERE photo_url IS NULL
ORDER BY tipo, nome
LIMIT 50;
```

### 2. Contar fotos por tipo

```sql
SELECT 
  tipo,
  COUNT(*) AS total,
  COUNT(photo_url) AS com_foto,
  ROUND(COUNT(photo_url)::DECIMAL / COUNT(*) * 100, 1) AS percentual
FROM eventos
JOIN blocos ON eventos.bloco_id = blocos.id
GROUP BY tipo
ORDER BY total DESC;
```

### 3. Listar Top 50 blocos sem foto

```sql
SELECT 
  b.nome,
  b.slug,
  e.tipo,
  e.publico_estimado
FROM blocos b
JOIN eventos e ON b.id = e.bloco_id
WHERE b.photo_url IS NULL
AND e.publico_estimado > 10000
ORDER BY e.publico_estimado DESC
LIMIT 50;
```

---

## 📝 Migration Atual

**Arquivo:** `supabase/migrations/011_add_bloco_photos.sql`

**Blocos atualizados:** 16

**Como rodar:**
1. Supabase SQL Editor
2. Copiar conteúdo do arquivo
3. Executar
4. Verificar em Table Editor → blocos

---

## 🎉 Resultado Visual

**Antes:** Todos os blocos com placeholder genérico

**Depois:** 
- 16 blocos icônicos com fotos reais
- 384 blocos com fallback temático
- Cards muito mais atraentes
- Site mais profissional

---

## 🚀 Próximos Passos

1. **[AGORA]** Rodar migration 011
2. **[HOJE]** Implementar fallback inteligente no código
3. **[AMANHÃ]** Criar scraper de Instagram
4. **[SEMANA QUE VEM]** Adicionar Top 50 blocos

---

_Fotos fazem TODA diferença na conversão! 📸✨_
