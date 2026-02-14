# 🎭 Carnavlad

**Seu guia completo dos blocos de carnaval do Rio de Janeiro 2026**

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https://github.com/sktbrd/carnavlad)

---

## 🚀 Demo

**[carnavlad.vercel.app](https://carnavlad.vercel.app)**

---

## ✨ Features

### Core
- 📅 **Calendário Interativo** - React Big Calendar (semana/mês/dia)
- 🗺️ **Mapa** - Mapbox com markers dos blocos
- 📋 **Lista** - Busca e filtros
- 🗓️ **Agenda** - Timeline por dia

### Social
- 👥 **Diretório de Usuários** - Encontre foliões
- ❤️ **Confirmar Presença** - "Quem vai" em cada bloco
- 🤝 **Sistema de Follows** - Siga outros foliões
- 🔐 **Auth Google** - Login simples e seguro

### PWA
- 📱 **Instalável** - App na tela inicial
- 🔔 **Service Worker** - Funciona offline
- 🎨 **Ícones Customizados** - Máscara de carnaval

### Dados
- 🎪 **400+ Blocos** - API Oficial do Rio 2026
- 📰 **Notícias** - Scraping automático (Diário do Rio + G1)
- 🔄 **Sync Automático** - Dados sempre atualizados

---

## 📦 Stack

| Categoria | Tecnologia |
|-----------|------------|
| **Framework** | Next.js 16 (App Router) |
| **Linguagem** | TypeScript |
| **UI** | Tailwind CSS + shadcn/ui |
| **Database** | Supabase (PostgreSQL) |
| **Auth** | Supabase Auth (Google OAuth) |
| **Maps** | Mapbox GL |
| **Calendar** | React Big Calendar |
| **Deploy** | Vercel |

---

## 🛠️ Setup Rápido

```bash
# Clonar
git clone https://github.com/sktbrd/carnavlad.git
cd carnavlad

# Instalar (usa pnpm)
pnpm install

# Configurar env
cp .env.example .env.local
# Editar .env.local com suas chaves

# Rodar
pnpm dev -p 3456
```

**Abrir:** http://localhost:3456

---

## 📚 Documentação

### 🚀 Quick Start
- **[Roadmap](ROADMAP.md)** - Plano de desenvolvimento
- **[Deploy Guide](DEPLOY.md)** - Como fazer deploy

### 📖 Setup
- **[Supabase](docs/setup/SUPABASE.md)** - Banco de dados
- **[Auth Google](docs/setup/AUTH.md)** - Login
- **[PWA](docs/setup/PWA.md)** - Progressive Web App
- **[Cron Jobs](docs/setup/CRON.md)** - Tarefas automáticas

### 🎯 Features
- **[Usuários](docs/features/USUARIOS.md)** - Sistema social
- **[Notícias](docs/features/NOTICIAS.md)** - Scraping
- **[API Oficial](docs/features/API_OFICIAL.md)** - Dados do Rio

### 🧹 Código
- **[Clean Code](CLEAN_CODE.md)** - Padrões
- **[Troubleshooting](TROUBLESHOOTING.md)** - Problemas comuns

**[📚 Ver toda documentação](docs/README.md)**

---

## 🗄️ Database

### Migrations (Ordem)

1. `001_create_tables.sql` - Tabelas base
2. `002_rls_policies.sql` - Segurança
3. `003_seed_data.sql` - Dados iniciais
4. `004_add_extra_fields.sql` - Campos extras
5. `005_import_bairros.sql` - 84 bairros
6. `006_import_blocos_eventos.sql` - 400 blocos
7-10. Outras features

**Como rodar:**
1. Acesse Supabase SQL Editor
2. Copie e cole cada migration (NA ORDEM)
3. Execute

---

## 🚀 Deploy

### Vercel (Recomendado)

```bash
git push origin main
# Deploy automático no Vercel
```

**Env vars necessárias:**
- `NEXT_PUBLIC_SUPABASE_URL`
- `NEXT_PUBLIC_SUPABASE_ANON_KEY`
- `NEXT_PUBLIC_GOOGLE_CLIENT_ID`

**[Ver guia completo de deploy](DEPLOY.md)**

---

## 📊 Status

| Feature | Status |
|---------|--------|
| Core App | ✅ 100% |
| Auth | ✅ 100% |
| Usuários | ✅ 100% |
| PWA | ✅ 100% |
| Dados Reais | ✅ 100% |
| Notícias | ⚠️ 80% |
| Cron Jobs | ⚠️ 60% |

**Completude geral:** ~90%

**[Ver roadmap completo](ROADMAP.md)**

---

## 🤝 Contribuindo

Contribuições são bem-vindas!

1. Fork o projeto
2. Crie sua branch (`git checkout -b feature/amazing`)
3. Commit suas mudanças (`git commit -m 'Add amazing feature'`)
4. Push para branch (`git push origin feature/amazing`)
5. Abra um Pull Request

---

## 📝 Licença

MIT © 2026 Carnavlad

---

## 🎨 Screenshots

### Home
![Calendário](docs/screenshots/calendario.png)

### Mapa
![Mapa](docs/screenshots/mapa.png)

### Mobile
![Mobile](docs/screenshots/mobile.png)

---

## 🙏 Créditos

- **UI Components:** [shadcn/ui](https://ui.shadcn.com)
- **Icons:** [Lucide](https://lucide.dev)
- **Calendar:** [React Big Calendar](https://github.com/jquense/react-big-calendar)
- **Maps:** [Mapbox](https://www.mapbox.com)
- **Database:** [Supabase](https://supabase.com)

---

**Feito com 🎭 para o Carnaval Rio 2026**

**[sktbrd.com](https://sktbrd.com) | [GitHub](https://github.com/sktbrd)**
