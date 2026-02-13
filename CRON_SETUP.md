# ⏰ Setup de Cron Local - OpenClaw

## 🎯 Objetivo

Executar scrapers localmente via OpenClaw Cron ao invés de depender do Vercel.

**Vantagens:**
- ✅ Zero dependência de Vercel Pro
- ✅ Controle total sobre schedule
- ✅ Execução local (mais rápido)
- ✅ Logs locais
- ✅ Notificações via OpenClaw

---

## 📋 Pré-requisitos

### 1. OpenClaw Gateway Rodando
```bash
openclaw gateway status
# Se não estiver rodando:
openclaw gateway start
```

### 2. Tabela `noticias` Criada
**No Supabase SQL Editor:**
```sql
-- Cole o conteúdo de:
-- supabase/migrations/007_create_noticias.sql
-- Clique em "Run"
```

### 3. Env Vars Configuradas
**Arquivo `.env.local`:**
```env
NEXT_PUBLIC_SUPABASE_URL=https://gsnrjesqmslmbykygzas.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbG...
```

---

## 🚀 Instalação

### Passo 1: Testar Script Manualmente

```bash
cd /Users/vladnikolaev/carnavlad

# Testar Diário do Rio
node scripts/import-to-supabase.js diariodorio

# Testar G1
node scripts/import-to-supabase.js g1

# Testar todas as fontes
node scripts/import-to-supabase.js all
```

**Output esperado:**
```
✅ IMPORTAÇÃO CONCLUÍDA!
   Inseridas: 5
   Duplicadas (puladas): 2
   Erros: 0
```

### Passo 2: Configurar Cron Job

**Opção A - Via Script (Recomendado):**
```bash
cd /Users/vladnikolaev/carnavlad
chmod +x scripts/setup-cron.sh
./scripts/setup-cron.sh
```

**Opção B - Manualmente via OpenClaw CLI:**
```bash
# Criar arquivo de config
cat > /tmp/scrape-cron.json <<EOF
{
  "name": "Scrape Notícias - Carnavlad",
  "schedule": {
    "kind": "cron",
    "expr": "0 */2 * * *",
    "tz": "America/Sao_Paulo"
  },
  "payload": {
    "kind": "systemEvent",
    "text": "cd /Users/vladnikolaev/carnavlad && node scripts/import-to-supabase.js all"
  },
  "sessionTarget": "main",
  "enabled": true
}
EOF

# Adicionar ao OpenClaw
openclaw cron add < /tmp/scrape-cron.json
```

### Passo 3: Verificar Job

```bash
# Listar jobs
openclaw cron list

# Ver histórico de execuções
openclaw cron runs <job-id>

# Rodar manualmente
openclaw cron run <job-id>
```

---

## 📅 Schedules Sugeridos

### 1. A Cada 2 Horas (Recomendado)
```json
{
  "kind": "cron",
  "expr": "0 */2 * * *",
  "tz": "America/Sao_Paulo"
}
```

### 2. Apenas Durante o Dia (8h-22h)
```json
{
  "kind": "cron",
  "expr": "0 8,10,12,14,16,18,20,22 * * *",
  "tz": "America/Sao_Paulo"
}
```

### 3. A Cada 6 Horas
```json
{
  "kind": "cron",
  "expr": "0 */6 * * *",
  "tz": "America/Sao_Paulo"
}
```

### 4. Uma Vez Por Dia (Meio-dia)
```json
{
  "kind": "cron",
  "expr": "0 12 * * *",
  "tz": "America/Sao_Paulo"
}
```

---

## 🔔 Notificações de Alerta

### Setup de Notificação para Alertas Urgentes

**Criar script wrapper:**

```bash
# scripts/scrape-with-alerts.sh
#!/bin/bash

cd /Users/vladnikolaev/carnavlad

# Executar scrape
OUTPUT=$(node scripts/import-to-supabase.js all 2>&1)
EXIT_CODE=$?

echo "$OUTPUT"

# Verificar se tem alertas
if echo "$OUTPUT" | grep -q "🚨"; then
  # Enviar notificação via OpenClaw
  echo "🚨 ALERTA: Nova notícia urgente sobre blocos de carnaval!" | \
    openclaw message send --channel telegram --to "@gnarlyvlad"
fi

# Verificar se teve erro
if [ $EXIT_CODE -ne 0 ]; then
  echo "❌ Erro no scraping!" | \
    openclaw message send --channel telegram --to "@gnarlyvlad"
fi

exit $EXIT_CODE
```

**Usar no cron:**
```json
{
  "payload": {
    "kind": "systemEvent",
    "text": "bash /Users/vladnikolaev/carnavlad/scripts/scrape-with-alerts.sh"
  }
}
```

---

## 📊 Monitoramento

### Ver Últimas Execuções
```bash
openclaw cron runs <job-id> --limit 10
```

### Ver Logs
```bash
# Logs do OpenClaw Gateway
tail -f ~/.openclaw/logs/gateway.log | grep "scrape"

# Logs do script (se redirecionado)
tail -f /Users/vladnikolaev/carnavlad/logs/scrape-*.log
```

### Verificar Notícias no Supabase
```sql
-- Ver últimas notícias coletadas
SELECT 
  titulo,
  fonte,
  is_alerta,
  coletado_em
FROM noticias
ORDER BY coletado_em DESC
LIMIT 10;

-- Ver alertas urgentes
SELECT COUNT(*) as total_alertas
FROM noticias
WHERE is_alerta = true
  AND coletado_em > NOW() - INTERVAL '24 hours';
```

---

## 🚨 Troubleshooting

### Erro: "Could not find the table 'public.noticias'"
**Causa:** Migration 007 não foi rodada  
**Solução:** Execute migration no Supabase SQL Editor

### Erro: "NEXT_PUBLIC_SUPABASE_URL não configuradas"
**Causa:** `.env.local` não existe ou incompleto  
**Solução:** Crie `.env.local` com as variáveis corretas

### Cron job não executa
**Causa:** OpenClaw Gateway parado ou job desabilitado  
**Solução:**
```bash
openclaw gateway status
openclaw cron list
openclaw cron update <job-id> --enabled true
```

### Scrapers retornam array vazio
**Causa:** Site mudou estrutura HTML  
**Solução:** Atualizar seletores nos scripts `scrape-*.js`

---

## 🔄 Atualizar Schedule

```bash
# Ver job ID
openclaw cron list

# Atualizar schedule
openclaw cron update <job-id> --schedule '{"kind":"cron","expr":"0 */4 * * *"}'

# Desabilitar temporariamente
openclaw cron update <job-id> --enabled false

# Reativar
openclaw cron update <job-id> --enabled true
```

---

## 📝 Comandos Úteis

```bash
# Ver todos os jobs
openclaw cron list

# Ver job específico
openclaw cron get <job-id>

# Rodar job agora (manual)
openclaw cron run <job-id>

# Ver histórico de execuções
openclaw cron runs <job-id>

# Remover job
openclaw cron remove <job-id>

# Status do gateway
openclaw gateway status
```

---

## 🎯 Fluxo Completo

```
┌─────────────────┐
│  OpenClaw Cron  │ (A cada 2 horas)
└────────┬────────┘
         │
         ▼
┌─────────────────────────────┐
│ scripts/import-to-supabase.js│
└────────┬────────────────────┘
         │
         ├─► scrape-diariodorio.js ──┐
         │                           │
         └─► scrape-g1.js ───────────┤
                                     │
                                     ▼
                            ┌────────────────┐
                            │ Supabase       │
                            │ (tabela        │
                            │  noticias)     │
                            └────────────────┘
                                     │
                                     ▼
                            ┌────────────────┐
                            │ NoticiasView   │
                            │ (app)          │
                            └────────────────┘
```

---

## ✅ Checklist de Setup

- [ ] OpenClaw Gateway rodando
- [ ] Migration 007 executada no Supabase
- [ ] `.env.local` configurado
- [ ] Script `import-to-supabase.js` testado manualmente
- [ ] Cron job adicionado ao OpenClaw
- [ ] Primeira execução bem-sucedida
- [ ] Notícias aparecendo na aba do app
- [ ] Notificações de alerta configuradas (opcional)

---

_Última atualização: 2026-02-13 14:28 GMT-3_
