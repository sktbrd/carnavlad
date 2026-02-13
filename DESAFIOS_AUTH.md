# 🎭 Desafios de Autenticação - Carnavlad

## 📊 Contexto

Estamos implementando autenticação Google OAuth via Supabase no projeto Carnavlad (app de blocos de carnaval do Rio 2026).

---

## 🎯 O Que Queremos

✅ Usuário clica em "Continuar com Google"  
✅ Escolhe conta do Google  
✅ Autoriza o app  
✅ É redirecionado de volta logado  
✅ Pode favoritar blocos  

---

## ❌ O Que Está Acontecendo

**Fluxo atual:**
1. ✅ Usuário clica em "Continuar com Google"
2. ✅ Abre popup do Google
3. ✅ Escolhe conta e autoriza
4. ✅ Google redireciona para Supabase
5. ✅ Supabase redireciona para nosso app
6. ⚠️ Nosso app recebe o `code`
7. ❌ **Falha ao trocar `code` por sessão**
8. 🔴 Redireciona para página de erro

---

## 🔍 Problema Identificado

### Sintoma
```
GET /auth/callback?code=xxx [200/307]
→ Redirect para /auth/auth-code-error
```

### Causa Provável
O método `supabase.auth.exchangeCodeForSession(code)` está falhando, mas não conseguíamos ver o erro porque:
- Logs passavam muito rápido
- Redirecionamento imediato para página de erro
- Erro não era exibido ao usuário

### Solução Implementada
1. **Logs detalhados** em cada etapa do callback
2. **Modo debug** (`?debug=true`) que mostra erro em texto puro
3. **Página de erro melhorada** que mostra razão específica + mensagem
4. **Query params** na URL de erro com detalhes técnicos

---

## 🛠️ Stack Técnica

| Componente | Detalhes |
|------------|----------|
| **Framework** | Next.js 16.1.6 (App Router) |
| **Auth Provider** | Supabase Auth |
| **OAuth Provider** | Google Cloud Platform |
| **Deployment** | Vercel |
| **Local Dev** | Porta 3456 (3000-3005 ocupadas) |

---

## 🔧 Configurações Necessárias

### 1. Google Cloud Console
**URL:** https://console.cloud.google.com/apis/credentials

**OAuth Client:** Carnavlad  
**Client ID:** `253277908879-5g9h8mcphpei1g7rh4tq3mgbn3ctm459.apps.googleusercontent.com`

**Authorized JavaScript origins:**
```
https://carnavlad.vercel.app
http://localhost:3456
```

**Authorized redirect URIs:**
```
https://gsnrjesqmslmbykygzas.supabase.co/auth/v1/callback
http://localhost:3456/auth/callback
https://carnavlad.vercel.app/auth/callback
```

### 2. Supabase Dashboard
**URL:** https://supabase.com/dashboard/project/gsnrjesqmslmbykygzas

**Auth > URL Configuration:**
- Site URL: `https://carnavlad.vercel.app`
- Redirect URLs: `http://localhost:3456/**`, `https://carnavlad.vercel.app/**`

**Auth > Providers > Google:**
- ✅ Enabled
- Client ID: `253277908879-5g9h8mcphpei1g7rh4tq3mgbn3ctm459.apps.googleusercontent.com`
- Client Secret: `[configurado]`

### 3. Variáveis de Ambiente (`.env.local`)
```env
NEXT_PUBLIC_SUPABASE_URL=https://gsnrjesqmslmbykygzas.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
NEXT_PUBLIC_GOOGLE_CLIENT_ID=253277908879-5g9h8mcphpei1g7rh4tq3mgbn3ctm459.apps.googleusercontent.com
```

---

## 🧪 Como Testar Agora

### Teste Normal
1. Acesse: http://localhost:3456/login
2. Clique em "Continuar com Google"
3. Escolha conta
4. Veja a página de erro com **detalhes técnicos**

### Teste Debug
1. **Após o erro**, copie a URL do callback
2. Adicione `&debug=true` no final
3. Exemplo:
   ```
   http://localhost:3456/auth/callback?code=xxx&debug=true
   ```
4. Verá o **erro completo em texto puro**

### Ver Logs do Servidor
Procure no terminal onde rodou `pnpm dev`:
```
========== AUTH CALLBACK START ==========
[AUTH CALLBACK] Code received: xxx...
[AUTH CALLBACK] ✅ Supabase client created
[AUTH CALLBACK] Exchanging code for session...
[AUTH CALLBACK] ❌ Exchange failed!
[AUTH CALLBACK] Error message: [AQUI ESTÁ O ERRO!]
========== AUTH CALLBACK FAILED ==========
```

---

## 🎯 Próximos Passos

### 1. Capturar Erro Real
- [ ] Fazer login com `?debug=true`
- [ ] Copiar mensagem de erro completa
- [ ] Identificar causa raiz

### 2. Possíveis Causas + Soluções

| Erro Possível | Causa | Solução |
|---------------|-------|---------|
| `Invalid PKCE flow` | PKCE não configurado corretamente | Verificar config Supabase |
| `Invalid client` | Client Secret incorreto | Revalidar no Supabase Dashboard |
| `Invalid code` | Code expirado/já usado | Problema de timing, investigar |
| `Redirect URI mismatch` | URI não autorizada | Adicionar no Google Cloud |
| `Invalid request` | Config OAuth incompleta | Revisar todos os campos |

### 3. Quando Resolver
- [ ] Remover logs excessivos de produção
- [ ] Desabilitar modo debug por padrão
- [ ] Testar em produção (Vercel)
- [ ] Implementar favoritos com auth real

---

## 📚 Documentação de Referência

- [Supabase Auth with Google](https://supabase.com/docs/guides/auth/social-login/auth-google)
- [Next.js App Router + Supabase](https://supabase.com/docs/guides/auth/server-side/nextjs)
- [Google OAuth 2.0](https://developers.google.com/identity/protocols/oauth2)
- [Arquivo de Configuração](./CONFIGURACAO_GOOGLE_AUTH.md)

---

## 🎭 Filosofia

> "Porque todo bloco merece um site... e toda sessão merece debug!"

**Mantra:** Mostrar erro > Esconder erro  
**Meta:** Login funcionando até o Carnaval 2026! 🎉

---

_Última atualização: 2026-02-13 13:22 GMT-3_
