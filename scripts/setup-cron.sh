#!/bin/bash

# Setup OpenClaw Cron Job para Scraping de Notícias
# Executa a cada 2 horas durante o dia (8h-22h)

echo "🔧 Configurando cron job para scraping de notícias..."

# Verificar se OpenClaw está rodando
if ! command -v openclaw &> /dev/null; then
    echo "❌ Erro: OpenClaw CLI não encontrado"
    echo "   Instale com: npm install -g openclaw"
    exit 1
fi

# Path do script
SCRIPT_PATH="/Users/vladnikolaev/carnavlad/scripts/import-to-supabase.js"

# Verificar se script existe
if [ ! -f "$SCRIPT_PATH" ]; then
    echo "❌ Erro: Script não encontrado em $SCRIPT_PATH"
    exit 1
fi

# Criar cron job
# Schedule: A cada 2 horas de 8h às 22h (8,10,12,14,16,18,20,22)
cat <<EOF | tee /tmp/scrape-noticias-cron.json
{
  "name": "Scrape Notícias - Carnavlad",
  "schedule": {
    "kind": "cron",
    "expr": "0 8,10,12,14,16,18,20,22 * * *",
    "tz": "America/Sao_Paulo"
  },
  "payload": {
    "kind": "systemEvent",
    "text": "Executar scraping de notícias: cd /Users/vladnikolaev/carnavlad && node scripts/import-to-supabase.js all && echo 'Scraping concluído' || echo 'Scraping falhou'"
  },
  "sessionTarget": "main",
  "enabled": true
}
EOF

echo ""
echo "📝 Cron job configurado:"
cat /tmp/scrape-noticias-cron.json

echo ""
echo "✅ Para adicionar ao OpenClaw, execute:"
echo "   openclaw cron add < /tmp/scrape-noticias-cron.json"
echo ""
echo "📊 Para ver jobs ativos:"
echo "   openclaw cron list"
echo ""
echo "🔄 Para rodar manualmente agora:"
echo "   cd /Users/vladnikolaev/carnavlad && node scripts/import-to-supabase.js all"
