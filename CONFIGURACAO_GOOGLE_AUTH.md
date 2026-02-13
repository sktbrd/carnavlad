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
