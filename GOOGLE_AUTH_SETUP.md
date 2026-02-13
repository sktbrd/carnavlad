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
