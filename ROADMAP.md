# 🗺️ Roadmap - Carnavlad

**Última atualização:** 13/02/2026 21:22 GMT-3

---

## ✅ O Que Já Funciona (100% Real Data)

### Core Features
- ✅ **Home Page** - Busca eventos reais do Supabase (`eventos_completos`)
- ✅ **Calendário** - React Big Calendar com dados reais
- ✅ **Mapa** - Mapbox com markers dos eventos
- ✅ **Lista de Eventos** - Agrupados por dia
- ✅ **Agenda View** - Timeline de eventos
- ✅ **Auth Google** - Login funcionando (dev + prod)
- ✅ **Sistema de Usuários:**
  - Diretório de usuários (`/usuarios`)
  - "Quem Vai" nos eventos
  - Sistema de follows (sem aprovação)
- ✅ **PWA** - Instalável, service worker, ícones
- ✅ **Notícias** - Sistema de scraping (Diário do Rio + G1)
- ✅ **Migrations** - 10 migrations SQL (blocos, eventos, usuários, amigos, notícias)

---

## ⚠️ O Que Ainda Tá Mockado

### 1. Página de Evento Individual (`/evento/[slug]`)

**Arquivo:** `app/evento/[slug]/page.tsx`

**Mock atual:**
```typescript
const MOCK_EVENTS: Record<string, any> = {
  'bloco-da-alegria': { ... },
  'cordao-do-boitata': { ... }
}
```

**Problema:**
- Se o evento NÃO existe no banco → Usa mock OU gera conteúdo com AI (Groq)
- Inconsistente com dados reais

**Solução:**
1. Remover fallback de mock
2. Se evento não existe → Mostrar 404 ou página de busca
3. Manter apenas geração AI como fallback opcional (ou remover)

**Prioridade:** 🔴 Alta (inconsistente com home)

---

### 2. Funcionalidades "TODO"

**Arquivo:** `components/evento-card.tsx`

```typescript
// TODO: Implementar salvar (linha 121)
// TODO: Implementar compartilhar (linha 134)
```

**Status:**
- "Confirmar Presença" → ✅ **JÁ FUNCIONA** (salva no banco)
- "Salvar" → ❌ Duplicado? (mesmo que confirmar presença?)
- "Compartilhar" → ❌ Web Share API não implementada

**Solução:**
1. Remover botão "Salvar" (duplicado de "Confirmar Presença")
2. Implementar Web Share API no botão "Compartilhar"

**Prioridade:** 🟡 Média (cosmético)

---

## 🚧 Features Incompletas

### 3. Sistema de Notícias

**Status:** 80% completo

**O que funciona:**
- ✅ Scraper configurado (Diário do Rio + G1)
- ✅ Tabela `noticias` criada
- ✅ UI de notícias (`NoticiasView`)
- ✅ Filtro de alertas
- ✅ Cron job documentado (`cron-scrape-noticias.md`)

**O que falta:**
- ❌ Scraper NÃO está rodando automaticamente
- ❌ Precisa configurar cron job real (ou Vercel Cron)
- ❌ Seed inicial de notícias

**Prioridade:** 🟢 Baixa (feature extra)

---

### 4. Sistema de Perfil Público

**Status:** 30% completo

**O que funciona:**
- ✅ Página `/perfil` existe
- ✅ Mostra dados do usuário logado
- ✅ Lista blocos confirmados
- ✅ Stats (blocos + amigos)

**O que falta:**
- ❌ Perfil público de outros usuários (`/usuario/[id]` ou `/u/[username]`)
- ❌ Ver blocos em comum
- ❌ Ver amigos em comum
- ❌ Editar perfil (bio, foto de capa, etc.)

**Prioridade:** 🟡 Média (UX importante)

---

### 5. Sistema de Amigos - Aprovação

**Status:** Atualmente = Follow Direto (sem aprovação)

**Configuração atual:**
```typescript
// queries.ts - linha 122
status: 'aceito', // Follow direto (estilo Instagram/Twitter)
```

**Opções:**

**A) Manter como está** (recomendado)
- ✅ Mais simples
- ✅ Igual Instagram/Twitter
- ✅ Menos fricção

**B) Adicionar sistema de aprovação**
- ❌ Mais complexo
- ❌ Precisa UI de pedidos pendentes
- ❌ Mais fricção

**Prioridade:** 🟢 Baixa (feature extra)

---

## 🎯 Próximas Features Prioritárias

### 1️⃣ Remover Mock Data (URGENTE)

**Tarefa:** Refatorar `/evento/[slug]` para usar apenas dados reais

**Passos:**
1. Remover `MOCK_EVENTS`
2. Buscar evento pelo slug: `WHERE blocos.slug = slug`
3. Se não encontrar → 404 ou busca
4. Remover geração AI (ou tornar opcional)

**Tempo estimado:** 30 min  
**Prioridade:** 🔴 Alta

---

### 2️⃣ Seed Inicial de Dados

**Status:** Migrations têm seed básico (10 blocos), mas falta:

- ❌ 250+ blocos completos do Rio 2026
- ❌ Eventos de todos os blocos (datas, horários, locais)
- ❌ Notícias iniciais

**Opções:**

**A) Importar dados da API oficial**
```bash
node scripts/import-api-oficial.js
```
- ✅ Dados reais e atualizados
- ✅ Script já existe (`ENRIQUECIMENTO_BLOCOS.md`)
- ❌ Depende da API estar online

**B) Criar seed manual (CSV/JSON)**
- ✅ Controle total
- ❌ Trabalhoso
- ❌ Pode ficar desatualizado

**Recomendação:** Usar script de importação da API oficial

**Tempo estimado:** 1-2 horas  
**Prioridade:** 🔴 Alta

---

### 3️⃣ Web Share API

**Feature:** Botão "Compartilhar" funcional

**Código:**
```typescript
// components/share-button.tsx (criar ou atualizar)
async function handleShare() {
  if (navigator.share) {
    await navigator.share({
      title: evento.bloco_nome,
      text: `Vou no ${evento.bloco_nome}! 🎭`,
      url: window.location.href,
    })
  } else {
    // Fallback: copiar link
    navigator.clipboard.writeText(window.location.href)
    toast.success('Link copiado!')
  }
}
```

**Tempo estimado:** 15 min  
**Prioridade:** 🟡 Média

---

### 4️⃣ Perfis Públicos

**Feature:** Ver perfil de outros usuários

**Estrutura:**
```
/usuario/[username]  ou  /u/[username]
```

**Mostra:**
- Nome, avatar, bio
- Blocos confirmados
- Amigos (seguindo/seguidores)
- Blocos em comum (se logado)
- Botão "Seguir"

**Tempo estimado:** 2-3 horas  
**Prioridade:** 🟡 Média

---

### 5️⃣ Sistema de Notificações

**Feature:** Notificar quando amigos confirmam blocos

**Opções:**

**A) Email (Resend/SendGrid)**
- ✅ Simples
- ✅ Confiável
- ❌ Menos engajamento

**B) Push Notifications (Web Push)**
- ✅ Mais engajamento
- ❌ Precisa service worker
- ❌ Permissão do usuário

**C) In-app (badge/número)**
- ✅ Não precisa permissão
- ❌ Só funciona quando app aberto

**Recomendação:** Começar com Email, depois adicionar Push

**Tempo estimado:** 4-6 horas  
**Prioridade:** 🟢 Baixa

---

## 📊 Estado Atual do Banco

### Tabelas Criadas (Migration 010)
- ✅ `blocos`
- ✅ `eventos`
- ✅ `usuarios`
- ✅ `presencas_confirmadas`
- ✅ `amigos`
- ✅ `bairros`
- ✅ `noticias`
- ✅ `contribuicoes` (fotos/relatos - não usado ainda)
- ✅ `comentarios` (não usado ainda)

### Views
- ✅ `eventos_completos` (eventos com dados do bloco)
- ✅ `eventos_contagem_presencas`
- ✅ `amigos_aceitos`

### Dados Atuais
- ✅ 10 blocos (seed)
- ✅ 10 eventos (seed)
- ⚠️ Poucos dados reais → Precisa importação

---

## 🎯 Plano de Ação (Próximas 2 Semanas)

### Semana 1: Dados Reais

**Dia 1-2:**
- [ ] Rodar migration 010 no Supabase (se ainda não rodou)
- [ ] Importar 250+ blocos da API oficial
- [ ] Importar eventos de todos os blocos

**Dia 3-4:**
- [ ] Remover mock data de `/evento/[slug]`
- [ ] Testar todas as páginas com dados reais
- [ ] Fix bugs de dados faltantes

**Dia 5-7:**
- [ ] Implementar Web Share API
- [ ] Limpar TODOs do código
- [ ] Documentação de API

---

### Semana 2: UX e Features

**Dia 8-10:**
- [ ] Perfis públicos (`/usuario/[username]`)
- [ ] Blocos em comum
- [ ] Amigos em comum

**Dia 11-12:**
- [ ] Sistema de notificações (email)
- [ ] Configurar cron de scraping de notícias

**Dia 13-14:**
- [ ] Testes finais
- [ ] Deploy em produção
- [ ] Monitoramento

---

## 🐛 Bugs Conhecidos

1. **Timezone UTC vs Local**
   - Status: ✅ **RESOLVIDO** (parseLocalDate)
   - Eventos agora mostram data/hora corretas

2. **"Quem Vai" vazio em eventos mock**
   - Status: ⚠️ **ESPERADO**
   - Só funciona com eventos reais (UUID)
   - Fix: Remover mock data

3. **Scraper de notícias não automático**
   - Status: ❌ **PENDENTE**
   - Precisa configurar cron

---

## 📈 Métricas de Completude

| Feature | Progresso | Status |
|---------|-----------|--------|
| **Core do App** | 95% | ✅ Completo |
| **Auth** | 100% | ✅ Completo |
| **Dados Reais (Home)** | 100% | ✅ Completo |
| **Dados Reais (Eventos)** | 60% | ⚠️ Mock fallback |
| **Sistema de Usuários** | 80% | ⚠️ Falta perfil público |
| **PWA** | 100% | ✅ Completo |
| **Notícias** | 60% | ⚠️ Scraper manual |
| **Notificações** | 0% | ❌ Não iniciado |

**Completude geral:** ~80%

---

## 🚀 Para Produção (MVP)

**Checklist mínimo:**
- [ ] Migration 010 rodada
- [ ] 250+ blocos importados
- [ ] Mock data removido
- [ ] Testes de auth funcionando
- [ ] Sistema de usuários testado
- [ ] Env vars corretos no Vercel

**Nice to have (pode vir depois):**
- Perfis públicos
- Notificações
- Scraper automático
- Comentários/fotos

---

_Vamos dominar! 🎭🚀_
