# 🎭 CarnaVlad - Carnaval Rio 2026

**Seu guia completo dos blocos de carnaval do Rio de Janeiro**

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https://github.com/seu-usuario/carnavlad)

## 🚀 Demo

[Ver site ao vivo](https://carnavlad.vercel.app) (após deploy)

## ✨ Funcionalidades

### 🎯 Implementado
- ✅ **4 Modos de Visualização:**
  - 📅 **Calendário** - Big Calendar estilo Google Calendar (semana/mês/dia)
  - 🗓️ **Agenda** - Timeline por dia com cards visuais
  - 📋 **Lista** - Busca e filtros avançados
  - 🗺️ **Mapa** - Visualização geográfica dos blocos

- ✅ **Hero Section Vibrante:**
  - Contagem regressiva dinâmica para o próximo bloco
  - Título com efeito de texto colorido animado
  - Stats do evento (250+ blocos)
  - CTAs para calendário e navegação

- ✅ **Exportação de Calendário:**
  - Google Calendar (adicionar direto ou .ics)
  - Apple Calendar / iCal
  - Outlook Calendar
  - Arquivo .ics universal

- ✅ **Cards de Eventos Interativos:**
  - Botões de salvar (❤️) e compartilhar (📤)
  - Hover effects profissionais
  - Variantes: default e compact
  - Informações completas (local, horário, observações)

- ✅ **Design System:**
  - shadcn/ui components
  - Tailwind CSS
  - Paleta de cores de carnaval (amarelo, verde, azul, vermelho, roxo)
  - Totalmente responsivo (mobile-first)

### 🔜 Próximas Fases

**Fase 2 - Social:**
- [ ] Autenticação (Google/Email)
- [ ] Upload de fotos por bloco
- [ ] Comentários
- [ ] Sistema de moderação

**Fase 3 - Avançado:**
- [ ] Sugestão de novos blocos (crowdsourcing)
- [ ] Notificações push
- [ ] Favoritos e personalização
- [ ] Integração com redes sociais

## 📦 Stack

- **Framework:** Next.js 14 (App Router)
- **Linguagem:** TypeScript
- **Estilo:** Tailwind CSS + shadcn/ui
- **Calendário:** React Big Calendar
- **Mapas:** Leaflet + React Leaflet
- **Animações:** Framer Motion
- **Banco de dados:** Supabase (PostgreSQL) - opcional
- **Deploy:** Vercel

## 🛠️ Instalação

```bash
# Clonar repositório
git clone https://github.com/seu-usuario/carnavlad.git
cd carnavlad

# Instalar dependências
pnpm install

# Rodar em desenvolvimento
pnpm dev
```

Abra [http://localhost:3000](http://localhost:3000)

## 🌐 Deploy no Vercel

### Opção 1: Via GitHub (Recomendado)

1. **Push para GitHub:**
   ```bash
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin https://github.com/seu-usuario/carnavlad.git
   git push -u origin main
   ```

2. **Conectar no Vercel:**
   - Acesse [vercel.com](https://vercel.com)
   - Clique em "Add New Project"
   - Importe seu repositório GitHub
   - Vercel detecta Next.js automaticamente
   - Clique "Deploy"

### Opção 2: CLI Vercel

```bash
# Instalar Vercel CLI
pnpm install -g vercel

# Deploy
vercel

# Deploy em produção
vercel --prod
```

## 🗄️ Banco de Dados (Opcional)

O site funciona 100% sem banco de dados (usa mock data). Para ativar Supabase:

1. **Criar projeto no Supabase:**
   - Acesse [supabase.com](https://supabase.com)
   - Criar novo projeto
   - Copiar URL e API Key

2. **Executar schema:**
   - SQL Editor → copiar `supabase/schema.sql`
   - Executar

3. **Popular dados:**
   - SQL Editor → copiar `supabase/seed.sql`
   - Executar

4. **Configurar variáveis:**
   ```bash
   # Criar .env.local
   NEXT_PUBLIC_SUPABASE_URL=https://seu-projeto.supabase.co
   NEXT_PUBLIC_SUPABASE_ANON_KEY=sua-chave-anon
   ```

5. **No Vercel:**
   - Settings → Environment Variables
   - Adicionar as 2 variáveis
   - Redeploy

## 📁 Estrutura do Projeto

```
app/
├── page.tsx              # Página principal (tabs + hero)
├── layout.tsx            # Layout raiz
├── globals.css           # Estilos globais

components/
├── ui/                   # shadcn components
├── views/                # Views das tabs
│   ├── calendario-view.tsx  # Big Calendar
│   ├── agenda-view.tsx      # Timeline
│   ├── lista-view.tsx       # Lista com filtros
│   └── mapa-view.tsx        # Mapa interativo
├── hero-section.tsx      # Hero com countdown
├── evento-card.tsx       # Cards de blocos
├── export-calendar-button.tsx  # Exportação
├── colourful-text.tsx    # Texto animado
├── big-calendar-view.tsx # Componente do calendário
├── footer.tsx            # Footer
└── shadcn-big-calendar.css  # Estilos do calendário

lib/
├── types.ts              # TypeScript types
├── hooks/
│   └── use-blocos.ts     # Hook de dados
└── export-calendar.ts    # Funções de exportação

supabase/
├── schema.sql            # Schema do banco
└── seed.sql              # Dados iniciais
```

## 🎨 Cores do Tema

```css
Amarelo:  #FBBF24 (rgb(251, 191, 36))
Verde:    #10B981 (rgb(16, 185, 129))
Azul:     #3B82F6 (rgb(59, 130, 246))
Vermelho: #EF4444 (rgb(239, 68, 68))
Roxo:     #A855F7 (rgb(168, 85, 247))
Laranja:  #FF6B35 (rgb(255, 107, 53))
Rosa:     #EC4899 (rgb(236, 72, 153))
```

## 📊 Dados

Atualmente com **24 blocos de exemplo** (14-18/fev/2026).

Para adicionar todos os ~250 blocos:
- Editar `lib/hooks/use-blocos.ts` (MOCK_EVENTOS)
- Ou conectar Supabase e popular `supabase/seed.sql`

## 🤝 Contribuindo

Contribuições são bem-vindas! Para features maiores, abra uma issue primeiro.

## 📝 Licença

MIT © 2026 CarnaVlad

## 🙏 Créditos

- Design: shadcn/ui
- Calendário: React Big Calendar
- Mapas: Leaflet
- Ícones: Lucide React

---

**Feito com 🎭 para o Carnaval Rio 2026**
