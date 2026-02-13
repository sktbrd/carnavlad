# 🚀 Guia de Deploy - CarnaVlad

## Passo 1: Criar Repositório no GitHub

```bash
# No GitHub (github.com):
# 1. Clique em "+" → "New repository"
# 2. Nome: carnavlad (ou outro nome)
# 3. Descrição: Guia completo do Carnaval Rio 2026
# 4. Público ou Privado (sua escolha)
# 5. NÃO inicialize com README (já temos)
# 6. Clique "Create repository"
```

## Passo 2: Push para GitHub

Copie o repositório URL que aparece (exemplo: `https://github.com/seu-usuario/carnavlad.git`)

```bash
cd /Users/vladnikolaev/.openclaw/workspace-freelancer-carnaval/blocos-carnaval

# Adicionar remote (substituir URL)
git remote add origin https://github.com/SEU-USUARIO/carnavlad.git

# Verificar
git remote -v

# Push
git push -u origin main
```

## Passo 3: Deploy no Vercel

### Opção A: Interface Web (Mais Fácil)

1. **Acesse:** [vercel.com](https://vercel.com)

2. **Login:**
   - Clique "Sign Up" ou "Login"
   - Conecte com GitHub

3. **Novo Projeto:**
   - Clique "Add New..." → "Project"
   - Vercel lista seus repositórios GitHub
   - Procure "carnavlad" (ou nome que você deu)
   - Clique "Import"

4. **Configuração:**
   - **Framework Preset:** Next.js (detecta automaticamente)
   - **Root Directory:** `./` (padrão)
   - **Build Command:** `pnpm build` (detecta automaticamente)
   - **Output Directory:** `.next` (padrão)
   - **Install Command:** `pnpm install` (detecta automaticamente)

5. **Environment Variables (OPCIONAL - site funciona sem):**
   - Se quiser ativar Supabase:
     - Clique "Add" em Environment Variables
     - `NEXT_PUBLIC_SUPABASE_URL` = `https://seu-projeto.supabase.co`
     - `NEXT_PUBLIC_SUPABASE_ANON_KEY` = `sua-chave`
   - Se NÃO quiser Supabase: pule esta etapa

6. **Deploy:**
   - Clique "Deploy"
   - Aguarde 2-3 minutos
   - 🎉 Site no ar!

7. **URL:**
   - Vercel gera URL automática: `https://carnavlad.vercel.app`
   - Você pode customizar depois

### Opção B: CLI Vercel (Avançado)

```bash
# Instalar CLI
pnpm install -g vercel

# Fazer login
vercel login

# Deploy em preview
vercel

# Deploy em produção
vercel --prod
```

## Passo 4: Configurar Domínio Customizado (OPCIONAL)

1. **No Vercel:**
   - Projeto → Settings → Domains
   - Add Domain
   - Digite seu domínio (ex: `carnavlad.com.br`)

2. **No seu provedor DNS:**
   - Adicionar registro CNAME:
     - Nome: `www` (ou `@`)
     - Valor: `cname.vercel-dns.com`
   - Ou seguir instruções específicas do Vercel

## Passo 5: Configurar Banco de Dados (OPCIONAL)

Se quiser ativar Supabase:

1. **Criar projeto Supabase:**
   - [supabase.com](https://supabase.com) → New Project
   - Nome: carnavlad-db
   - Região: South America (São Paulo)
   - Senha do banco: (salvar em lugar seguro)

2. **Executar Schema:**
   - SQL Editor → New Query
   - Copiar conteúdo de `supabase/schema.sql`
   - Run

3. **Popular dados:**
   - SQL Editor → New Query
   - Copiar conteúdo de `supabase/seed.sql`
   - Run

4. **Copiar credenciais:**
   - Settings → API
   - Copiar:
     - Project URL
     - anon/public key

5. **Adicionar no Vercel:**
   - Projeto → Settings → Environment Variables
   - Add:
     - `NEXT_PUBLIC_SUPABASE_URL` = URL copiada
     - `NEXT_PUBLIC_SUPABASE_ANON_KEY` = Key copiada
   - Save

6. **Redeploy:**
   - Deployments → Mais recente → "..." → Redeploy

## Atualizações Futuras

Sempre que fizer mudanças:

```bash
# 1. Commit
git add .
git commit -m "feat: descrição da mudança"

# 2. Push
git push

# 3. Vercel deploya automaticamente!
```

## Troubleshooting

### Build falhou?

**Erro comum: pnpm não encontrado**

Solução:
- Vercel → Settings → General
- Node.js Version: 18.x ou superior
- Package Manager: pnpm
- Save

**Erro: módulo não encontrado**

Solução:
```bash
# Localmente
pnpm install
pnpm build

# Se funcionar, fazer commit do package.json/pnpm-lock.yaml
git add package.json pnpm-lock.yaml
git commit -m "fix: update dependencies"
git push
```

### Site lento?

- Vercel free tier: 100 GB bandwidth/mês
- Se passar, considerar Pro ($20/mês)

### Supabase não conecta?

- Verificar variáveis de ambiente no Vercel
- Verificar se as keys estão corretas
- Verificar se o schema foi executado

## 📊 Monitoramento

- **Analytics:** Vercel → Projeto → Analytics
- **Logs:** Vercel → Projeto → Deployments → View Function Logs
- **Performance:** Vercel → Projeto → Speed Insights

## 🎯 Checklist de Deploy

- [ ] Repositório criado no GitHub
- [ ] Código enviado (`git push`)
- [ ] Projeto importado no Vercel
- [ ] Build bem-sucedido
- [ ] Site acessível via URL
- [ ] Testar todas as tabs (Calendário, Agenda, Lista, Mapa)
- [ ] Testar exportação de calendário
- [ ] Testar responsividade mobile
- [ ] (Opcional) Supabase configurado
- [ ] (Opcional) Domínio customizado

---

**🎉 Pronto! Seu site está no ar!**

URL padrão: `https://seu-projeto.vercel.app`
