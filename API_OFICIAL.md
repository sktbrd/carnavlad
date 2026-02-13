# 🎭 API Oficial do Carnaval de Rua Rio 2026

## 📡 Fonte de Dados

**URL:** https://www.carnavalderua.rio/api/carnaval-rio-2026/batch.json

**Última atualização:** 2026-02-13 10:51 GMT-3

---

## 📊 Estatísticas

| Métrica | Valor |
|---------|-------|
| **Total de blocos** | 430 eventos |
| **Blocos únicos** | 401 |
| **Bairros** | 84 |
| **Regiões** | 7 |

### Tipos de Blocos
- **TRADICIONAL:** 395 blocos (92%)
- **INFANTIL:** 16 blocos (4%)
- **MEGA BLOCO:** 11 blocos (3%)
- **RELIGIOSO:** 5 blocos (1%)
- **LGBTQIAPN+:** 3 blocos (1%)

### Distribuição Temporal
- **Janeiro 2026:** 34 blocos
- **Fevereiro 2026:** 396 blocos

---

## 🏆 Top 10 Maiores Blocos

| # | Bloco | Público Estimado | Data |
|---|-------|------------------|------|
| 1 | Cordão da Bola Preta | 700.000 | 14/02 |
| 2 | Fervo da Lud | 600.000 | 17/02 |
| 3 | Bloco da Gold | 150.000 | 31/01 |
| 4 | Seraqabre? | 150.000 | 01/02 |
| 5 | Bloco Areia | 120.000 | 15/02 |
| 6 | Bloco da Anitta | 100.000 | 21/02 |
| 7 | Sargento Pimenta | 80.000 | 16/02 |
| 8 | Monobloco | 80.000 | 22/02 |
| 9 | Chá da Alice | 50.000 | 24/01 |
| 10 | Bloco da Lexa | 50.000 | 25/01 |

---

## 🗺️ Regiões da Cidade

| Região | Bairros |
|--------|---------|
| Zona Norte | 21 |
| Zona Sul | 14 |
| Barra da Tijuca e Jacarepaguá | 11 |
| Zona Oeste | 11 |
| Centro | 11 |
| Ilha do Governador e Leopoldina | 10 |
| Grande Tijuca | 6 |

---

## 📋 Estrutura dos Dados da API

### Objeto `street_attractions` (430 blocos)

```json
{
  "id": 26370,
  "attraction_type": "TRADICIONAL",
  "title": "BLOCO DA ALEGRIA",
  "date": "2026-01-17T16:00:00",
  "description": "Endereço completo",
  "lat": "-22.8549671",
  "lng": "-43.3613111",
  "address": "Rua Fulano, 123",
  "neighborhood_id": 1187,
  "estimated_audience": 5000,
  "end_time": "22:00",
  "parade_time": "18:00",
  "foundation_year": "2017",
  "extra_text1": "Contexto do evento",
  "extra_text2": "Ponto de dispersão",
  "extra_text3": "PARADO / COM DESLOCAMENTO",
  "extra_text4": "Descrição em português",
  "extra_text5": "Description in English",
  "extra_text6": "Descripción en español",
  "extra_text7": "",
  "fire_count": 0,
  "save_count": 0,
  "photo_url": null
}
```

### Objeto `neighborhoods` (84 bairros)

```json
{
  "id": 1165,
  "name": "Centro",
  "region": "Centro",
  "created_at": "2026-01-07T18:20:45.552-03:00",
  "updated_at": "2026-01-07T18:20:45.552-03:00",
  "app_id": 18
}
```

---

## 🔄 Mapeamento para Nosso Schema

| Campo da API | Nossa DB | Tipo | Observações |
|--------------|----------|------|-------------|
| `id` | `api_id` | INTEGER | Referência única |
| `title` | `nome` (bloco) | VARCHAR | Nome do bloco |
| `attraction_type` | `tipo` | VARCHAR | TRADICIONAL, MEGA BLOCO, etc |
| `date` | `data` | DATE | Extrair YYYY-MM-DD |
| `parade_time` | `horario` | TIME | HH:MM |
| `end_time` | `hora_fim` | TIME | HH:MM (novo campo) |
| `lat` / `lng` | `local_lat` / `local_lng` | DECIMAL | Coordenadas |
| `address` | `local_endereco` | VARCHAR | Endereço completo |
| `neighborhood_id` | `bairro_id` | INTEGER FK | Referência bairros |
| `estimated_audience` | `publico_estimado` | INTEGER | Estimativa de público |
| `foundation_year` | `ano_fundacao` | VARCHAR | Ano de fundação |
| `extra_text4` | `descricao_detalhada` | TEXT | Descrição PT-BR |
| `extra_text1/2/3` | `extra_info` | JSONB | Informações extras |
| `description` | `descricao` (bloco) | TEXT | Descrição curta |

### ⚠️ Campos NÃO disponíveis na API

Estes campos precisarão ser preenchidos manualmente ou buscados de outras fontes:

- `instagram_url` - Não está na API
- `whatsapp_url` - Não está na API
- `photo_url` - Sempre `null` na API

---

## 🛠️ Scripts Criados

### 1. **analyze-api.js**
Analisa a estrutura da API e gera estatísticas.

```bash
node scripts/analyze-api.js
```

**Saída:**
- Estatísticas gerais
- Top 10 blocos
- Distribuição por tipo
- Mapeamento de campos
- `api-analysis.json` (resumo exportado)

### 2. **import-from-api.js**
Gera arquivos SQL para importação no Supabase.

```bash
node scripts/import-from-api.js
```

**Saída:**
- `005_import_bairros.sql` - 84 bairros
- `006_import_blocos_eventos.sql` - 401 blocos + 430 eventos

---

## 🗄️ Migrations Criadas

| # | Arquivo | Descrição |
|---|---------|-----------|
| 004 | `add_extra_fields.sql` | Adiciona campos novos (tipo, publico_estimado, bairro_id) |
| 005 | `import_bairros.sql` | Importa 84 bairros da API |
| 006 | `import_blocos_eventos.sql` | Importa 401 blocos e 430 eventos |

---

## 🚀 Como Importar

### Passo 1: Rodar migration 004 (campos novos)
```sql
-- No Supabase SQL Editor
-- Cole o conteúdo de: supabase/migrations/004_add_extra_fields.sql
-- Clique em "Run"
```

### Passo 2: Rodar migration 005 (bairros)
```sql
-- Cole o conteúdo de: supabase/migrations/005_import_bairros.sql
-- Clique em "Run"
-- ⏱️ ~5 segundos
```

### Passo 3: Rodar migration 006 (blocos + eventos)
```sql
-- Cole o conteúdo de: supabase/migrations/006_import_blocos_eventos.sql
-- Clique em "Run"
-- ⏱️ ~30-60 segundos (muitos INSERTs)
```

### Passo 4: Verificar
```sql
SELECT COUNT(*) FROM blocos;      -- Deve ter ~401
SELECT COUNT(*) FROM eventos;     -- Deve ter ~430
SELECT COUNT(*) FROM bairros;     -- Deve ter 84

-- Ver eventos completos
SELECT 
  bloco_nome,
  data,
  horario,
  bairro_nome,
  publico_estimado,
  tipo
FROM eventos_completos
ORDER BY data, horario
LIMIT 10;
```

---

## 🔄 Atualização Automática

### Opção 1: Cronjob Manual
```bash
# Baixar JSON atualizado
curl -s "https://www.carnavalderua.rio/api/carnaval-rio-2026/batch.json" -o /tmp/carnaval_api.json

# Gerar SQLs
node scripts/import-from-api.js

# Rodar no Supabase Dashboard (manual)
```

### Opção 2: Supabase Edge Function (futuro)
- Criar edge function que roda diariamente
- Busca API oficial
- Atualiza blocos/eventos automaticamente

---

## ✅ Vantagens da API Oficial

1. **430 blocos reais** (vs. 10 seed data)
2. **Dados oficiais** da Prefeitura do Rio
3. **Atualização contínua** (última: 13/02/2026)
4. **Público estimado** para cada bloco
5. **Coordenadas precisas** (lat/lng)
6. **Bairros e regiões** estruturados
7. **Tipos de blocos** (Tradicional, Mega, Infantil, etc)
8. **Horários confirmados**

---

## ⚠️ Limitações da API

1. **Sem fotos** (`photo_url` sempre `null`)
2. **Sem Instagram/WhatsApp** (links de redes sociais)
3. **Descrições genéricas** (alguns blocos sem `extra_text4`)
4. **Alguns blocos duplicados** (múltiplos eventos do mesmo bloco)

---

## 🎯 Próximos Passos

1. ✅ Importar todos os 430 blocos
2. ✅ Atualizar home page para mostrar blocos reais
3. ⚠️ Adicionar fotos manualmente (ou scraping)
4. ⚠️ Adicionar Instagram/WhatsApp de blocos famosos
5. ⚠️ Implementar busca por bairro/região
6. ⚠️ Filtros por tipo de bloco
7. ⚠️ Sync automática diária com API

---

## 📝 Observações

- A API não tem autenticação
- Dados são públicos
- JSON tem ~1MB (rápido de baixar)
- API parece ser atualizada manualmente pela prefeitura
- Alguns blocos têm múltiplos eventos (saídas diferentes)

---

_Última análise: 2026-02-13 14:07 GMT-3_
