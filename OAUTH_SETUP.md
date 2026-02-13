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
