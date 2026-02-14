# 🔐 Google Auth Setup - Carnavlad

## ✅ Passo-a-Passo Completo

### 1. Google Cloud Console

#### 1.1 Criar/Configurar Projeto
1. Acesse: https://console.cloud.google.com/home/dashboard
2. Crie um novo projeto ou selecione existente

#### 1.2 Configurar Auth Platform
1. Acesse: https://console.cloud.google.com/auth/overview
2. Configure **Audience** (quem pode logar)
3. Configure **Scopes** necessários:
   - ✅ `openid` (adicionar manualmente)
   - ✅ `.../auth/userinfo.email` (padrão)
   - ✅ `.../auth/userinfo.profile` (padrão)

#### 1.3 Criar OAuth Client
1. Acesse: https://console.cloud.google.com/auth/clients/create
2. Escolha: **Web application**
3. **Authorized JavaScript origins:**
   - `https://carnavlad.vercel.app`
   - `http://localhost:3000` (dev)
4. **Authorized redirect URIs:**
   - Production: `https://[seu-projeto].supabase.co/auth/v1/callback`
   - Local: `http://127.0.0.1:54321/auth/v1/callback`
5. Salve o **Client ID** e **Client Secret** ⚠️

---

### 2. Supabase Dashboard

#### 2.1 Configurar Provider
1. Acesse: https://supabase.com/dashboard/project/[seu-projeto]/auth/providers
2. Selecione **Google**
3. **Enable Google provider**
4. Cole:
   - **Client ID** (do passo 1.3)
   - **Client Secret** (do passo 1.3)
5. Copie a **Callback URL** (use no passo 1.3)
6. Salve as alterações

---

### 3. Variáveis de Ambiente Vercel

Adicione em **Vercel → Settings → Environment Variables:**

```bash
# Já configuradas:
NEXT_PUBLIC_SUPABASE_URL=https://[seu-projeto].supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=[sua-anon-key]
GROQ_API_KEY=[sua-groq-key]

# Adicionar (opcional, só se usar One-Tap):
NEXT_PUBLIC_GOOGLE_CLIENT_ID=[seu-client-id]
```

---

### 4. Local Development

#### 4.1 Arquivo `.env.local`
```bash
NEXT_PUBLIC_SUPABASE_URL=https://[seu-projeto].supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=[sua-anon-key]
NEXT_PUBLIC_GOOGLE_CLIENT_ID=[seu-client-id]
```

---

## 🧪 Testar

1. Acesse: `http://localhost:3000`
2. Clique em "Entrar com Google"
3. Autorize o app
4. Deve redirecionar autenticado ✅

---

## 🔍 Debug

### Verificar Logs
```bash
# Supabase Dashboard → Logs → Auth
# Vercel → Deployments → Function Logs
```

### Erros Comuns

**"redirect_uri_mismatch"**
- ✅ Confira as URIs no Google Cloud Console
- ✅ Use exatamente a callback do Supabase

**"Invalid client"**
- ✅ Client ID/Secret corretos no Supabase
- ✅ Espere ~5min após salvar no Google

**"Access denied"**
- ✅ Scopes corretos configurados
- ✅ Usuário tem permissão no projeto

---

## 📌 Links Úteis

- [Google Cloud Console](https://console.cloud.google.com/auth/overview)
- [Supabase Auth Providers](https://supabase.com/dashboard/project/_/auth/providers)
- [Documentação Oficial](https://supabase.com/docs/guides/auth/social-login/auth-google)

---

## ✅ Checklist Final

- [ ] Projeto Google Cloud criado
- [ ] Scopes configurados (openid, email, profile)
- [ ] OAuth Client criado (Web)
- [ ] JavaScript origins configuradas
- [ ] Redirect URIs configuradas
- [ ] Client ID + Secret salvos no Supabase
- [ ] Provider Google ativado no Supabase
- [ ] Variáveis de ambiente no Vercel
- [ ] Código de login implementado
- [ ] Teste local funcionando
- [ ] Deploy em produção testado

---

**Próximos passos:** Implementar componente de login no app! 🚀
# 🔐 Configuração Google Auth - PASSO A PASSO

## ✅ STATUS ATUAL

| Item | Status |
|------|--------|
| `.env.local` criado | ✅ |
| Callback route implementada | ✅ |
| Client ID | ✅ `253277908879-5g9h8mcphpei1g7rh4tq3mgbn3ctm459.apps.googleusercontent.com` |
| Supabase URL | ✅ `https://gsnrjesqmslmbykygzas.supabase.co` |

---

## 🎯 CONFIGURAÇÕES NECESSÁRIAS

### 1. GOOGLE CLOUD CONSOLE

**URL:** https://console.cloud.google.com/apis/credentials

#### A. Authorized JavaScript origins

Clique em EDITAR no OAuth Client "Carnavlad", adicione:

```
https://carnavlad.vercel.app
http://localhost:3000
http://localhost:3001
http://localhost:3002
http://localhost:3003
```

#### B. Authorized redirect URIs

Adicione TODOS esses:

```
https://gsnrjesqmslmbykygzas.supabase.co/auth/v1/callback
http://127.0.0.1:54321/auth/v1/callback
http://localhost:3000/auth/callback
http://localhost:3001/auth/callback
http://localhost:3002/auth/callback
http://localhost:3003/auth/callback
https://carnavlad.vercel.app/auth/callback
```

**⚠️ IMPORTANTE:** 
- Sem `/` no final
- Copia/cola EXATAMENTE como está
- Salva e aguarda 2-5min

---

### 2. SUPABASE DASHBOARD

**URL:** https://supabase.com/dashboard/project/gsnrjesqmslmbykygzas/auth/url-configuration

#### A. Site URL

```
https://carnavlad.vercel.app
```

#### B. Redirect URLs (Allow List)

Adicione cada uma dessas linhas:

```
http://localhost:3000/**
http://localhost:3001/**
http://localhost:3002/**
http://localhost:3003/**
http://localhost:3000/auth/callback
http://localhost:3001/auth/callback
http://localhost:3002/auth/callback
http://localhost:3003/auth/callback
https://carnavlad.vercel.app/**
https://carnavlad.vercel.app/auth/callback
```

O `**` permite qualquer subpágina!

---

### 3. SUPABASE - GOOGLE PROVIDER

**URL:** https://supabase.com/dashboard/project/gsnrjesqmslmbykygzas/auth/providers

#### A. Habilitar Google

- [x] Enable Google provider

#### B. Credenciais

**Google Client ID:**
```
253277908879-5g9h8mcphpei1g7rh4tq3mgbn3ctm459.apps.googleusercontent.com
```

**Google Client Secret:**
```
[Cole aqui o Client Secret do Google Cloud Console]
```

**⚠️ ONDE ACHAR O SECRET:**
1. Google Cloud Console → Credentials
2. Clique no OAuth Client "Carnavlad"
3. Clique no ícone de "Mostrar" ao lado do Client Secret
4. Copia e cola no Supabase

---

## 🧪 TESTAR

### Local

1. **Matar processos pendentes:**
   ```bash
   lsof -ti:3000,3001,3002,3003 | xargs kill -9
   ```

2. **Rodar servidor:**
   ```bash
   pnpm dev -p 3000
   ```

3. **Acessar:**
   ```
   http://localhost:3000/login
   ```

4. **Clicar em "Continuar com Google"**

5. **Escolher conta**

6. **Deve funcionar!** ✅

---

### Produção

1. **Acessar:**
   ```
   https://carnavlad.vercel.app/login
   ```

2. **Clicar em "Continuar com Google"**

3. **Deve funcionar!** ✅

---

## 🐛 PROBLEMAS COMUNS

### Erro: redirect_uri_mismatch

**Causa:** URI não está na lista do Google

**Solução:** 
1. Verifique se a URI EXATA está no Google Cloud
2. Aguarde 2-5min após adicionar
3. Limpe cache do navegador

---

### Erro: 503 Service Unavailable

**Causa:** Servidor local não está rodando

**Solução:**
```bash
# Matar processos
lsof -ti:3000 | xargs kill -9

# Reiniciar
pnpm dev -p 3000
```

---

### Erro: Invalid client

**Causa:** Client ID ou Secret incorretos no Supabase

**Solução:**
1. Copie novamente do Google Cloud
2. Cole no Supabase
3. Salve
4. Aguarde 2min

---

### Login funciona mas não salva sessão

**Causa:** ANON_KEY incorreto

**Solução:**
1. Vá em Supabase Dashboard → Settings → API
2. Copie **anon public** key
3. Cole em `.env.local`
4. Reinicie servidor

---

## 📊 CHECKLIST FINAL

- [ ] Google Cloud: JavaScript origins configuradas
- [ ] Google Cloud: Redirect URIs configuradas  
- [ ] Google Cloud: Client Secret copiado
- [ ] Supabase: Site URL configurada
- [ ] Supabase: Redirect URLs configuradas
- [ ] Supabase: Google Provider habilitado
- [ ] Supabase: Client ID + Secret colados
- [ ] `.env.local` existe e está correto
- [ ] Servidor rodando sem erros
- [ ] Teste local funcionando
- [ ] Teste produção funcionando

---

## 🎯 PRÓXIMOS PASSOS

Após configurar TUDO acima:

1. **Teste local:** http://localhost:3000/login
2. **Teste produção:** https://carnavlad.vercel.app/login
3. **Verifique:** Header mostra seu nome/foto
4. **Confirme:** Favoritos funcionam

---

**Dúvidas?** Todos os passos estão aqui! 🎭✨
# 🔐 Configuração de Login com Google

## Passo 1: Criar Projeto Supabase

1. Acesse [supabase.com](https://supabase.com)
2. Clique "New Project"
3. Preencha:
   - **Name:** carnavlad-db
   - **Database Password:** (escolha uma senha forte e salve)
   - **Region:** South America (São Paulo)
4. Clique "Create new project"
5. Aguarde ~2 minutos

## Passo 2: Configurar Schema do Banco

1. No Supabase, vá em **SQL Editor**
2. Clique "New Query"
3. Copie TODO o conteúdo de `supabase/schema.sql`
4. Cole no editor
5. Clique "Run" (ou Ctrl+Enter)
6. Aguarde confirmação de sucesso

## Passo 3: Criar OAuth App no Google Cloud

### 3.1 Acessar Google Cloud Console

1. Acesse [console.cloud.google.com](https://console.cloud.google.com)
2. Se não tiver projeto, clique **"Select a project"** → **"New Project"**
   - Nome: CarnaVlad
   - Clique "Create"

### 3.2 Configurar Tela de Consentimento

1. No menu lateral: **APIs & Services** → **OAuth consent screen**
2. User Type: **External**
3. Clique "Create"
4. Preencha:
   - **App name:** CarnaVlad
   - **User support email:** seu-email@gmail.com
   - **Developer contact:** seu-email@gmail.com
5. Clique "Save and Continue"
6. **Scopes:** pule (não precisa adicionar)
7. **Test users:** adicione seu email (para testar)
8. Clique "Save and Continue" até o final

### 3.3 Criar Credenciais OAuth

1. No menu lateral: **APIs & Services** → **Credentials**
2. Clique **"Create Credentials"** → **"OAuth client ID"**
3. Preencha:
   - **Application type:** Web application
   - **Name:** CarnaVlad OAuth
   
4. **Authorized JavaScript origins:**
   - Adicione: `http://localhost:3030` (para desenvolvimento local)
   - Adicione: `https://SEU_DOMINIO.vercel.app` (para produção)
   
5. **Authorized redirect URIs:**
   - Copie a URL do Supabase (próximo passo)

### 3.4 Obter Redirect URI do Supabase

1. No Supabase, vá em **Authentication** → **Providers**
2. Encontre **Google** na lista
3. Expanda clicando na seta
4. Copie a **Callback URL** (algo como: `https://xxx.supabase.co/auth/v1/callback`)

5. **VOLTE ao Google Cloud Console:**
   - Cole essa URL em **Authorized redirect URIs**
   - Clique "Create"

6. **Copie as credenciais:**
   - **Client ID:** (copie)
   - **Client Secret:** (copie)
   - **⚠️ Salve em lugar seguro!**

## Passo 4: Configurar Google Provider no Supabase

1. No Supabase: **Authentication** → **Providers**
2. Encontre **Google** e clique
3. Habilite: **"Enable Sign in with Google"** → ON
4. Cole:
   - **Client ID:** (do Google Cloud)
   - **Client Secret:** (do Google Cloud)
5. Clique "Save"

## Passo 5: Configurar Variáveis de Ambiente

### 5.1 Obter Credenciais do Supabase

1. No Supabase: **Settings** → **API**
2. Copie:
   - **Project URL** (exemplo: `https://xxx.supabase.co`)
   - **anon public** key (clique em "Reveal" se necessário)

### 5.2 Ambiente Local

Crie arquivo `.env.local` na raiz do projeto:

```bash
NEXT_PUBLIC_SUPABASE_URL=https://SEU_PROJETO.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=sua_chave_anon_aqui
```

**⚠️ Substitua pelos valores reais!**

### 5.3 Ambiente Vercel (Produção)

1. No Vercel: **Projeto** → **Settings** → **Environment Variables**
2. Adicione as 2 variáveis:
   - `NEXT_PUBLIC_SUPABASE_URL` = `https://xxx.supabase.co`
   - `NEXT_PUBLIC_SUPABASE_ANON_KEY` = `sua_chave_anon`
3. Selecione **Production, Preview, Development**
4. Clique "Save"
5. **Redeploy** o projeto

## Passo 6: Testar Login

### 6.1 Local (Development)

```bash
pnpm dev
```

1. Abra http://localhost:3030
2. Clique "Entrar com Google" no header
3. Faça login com sua conta Google
4. Deve redirecionar de volta e mostrar seu nome/avatar

### 6.2 Produção (Vercel)

1. Acesse seu site em produção
2. Clique "Entrar com Google"
3. Faça login
4. Pronto!

## 🔍 Troubleshooting

### Erro: "redirect_uri_mismatch"

**Causa:** Redirect URI não está configurada corretamente no Google Cloud.

**Solução:**
1. Vá no Google Cloud → Credentials
2. Edite seu OAuth Client ID
3. Adicione EXATAMENTE a Callback URL do Supabase
4. Salve e aguarde ~5 minutos

### Erro: "Invalid login credentials"

**Causa:** Email não está em Test Users ou app não publicado.

**Solução:**
1. Google Cloud → OAuth consent screen → Test users
2. Adicione seu email
3. OU publique o app (clique "Publish App")

### Perfil não criado automaticamente

**Causa:** Trigger não foi executado no schema.

**Solução:**
1. Supabase → SQL Editor
2. Execute novamente a parte do schema com `handle_new_user()`
3. Teste criar novo usuário

### Login funciona mas não mostra avatar

**Causa:** Supabase storage ou permissões.

**Solução:**
1. Avatar vem do Google diretamente (não é storage)
2. Verifique console do navegador (F12) por erros
3. Verifique se `user_metadata` tem `avatar_url`

## 📋 Checklist Final

- [ ] Projeto Supabase criado
- [ ] Schema executado (tabela profiles criada)
- [ ] Google Cloud OAuth configurado
- [ ] Redirect URI adicionada no Google Cloud
- [ ] Client ID/Secret copiados
- [ ] Google Provider ativado no Supabase
- [ ] Variáveis de ambiente configuradas (.env.local)
- [ ] Variáveis de ambiente configuradas no Vercel
- [ ] Redeploy feito no Vercel
- [ ] Login testado e funcionando

## 🎯 Próximos Passos

Após login funcionando:
1. Implementar página de perfil (`/perfil`)
2. Permitir editar bio e username
3. Adicionar funcionalidade "Blocos Favoritos"
4. Sistema de check-in ("Fui nesse bloco!")
5. Upload de fotos por bloco
6. Comentários e avaliações

---

**Dúvidas?** Verifique o console do navegador (F12) e logs do Supabase.
