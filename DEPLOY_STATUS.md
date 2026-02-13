# 🚀 Deploy Status - Carnavlad

**Data:** 2026-02-13 05:28 GMT-3  
**Commit:** `44c96e3`

---

## ✅ Completado (Automaticamente)

### 1. Código de Autenticação
- [x] Route handler `/auth/callback` (OAuth flow)
- [x] Página de login `/login` (design carnival)
- [x] Página de erro `/auth/auth-code-error`
- [x] Componente `GoogleLoginButton` (SVG icon)
- [x] Atualizado `LoginButton` (redireciona para /login)

### 2. OpenGraph & Metadata
- [x] **OG Image gerada:** `public/og-image.jpg` (1200x630)
  - Baseada no GIF `carna-nicole.gif`
  - Gradiente rosa → dourado
  - Título "CARNAVLAD 2026"
  - Slogan "🎭 Porque todo bloco merece um site"
- [x] Metadata completa no `layout.tsx`:
  - OpenGraph (Facebook, LinkedIn)
  - Twitter Card
  - Keywords SEO
  - PWA config

### 3. Documentação
- [x] `GOOGLE_AUTH_SETUP.md` - Guia passo-a-passo completo
- [x] Script `scripts/generate-og.js` (regenerar OG image)

### 4. Deploy
- [x] Código commitado e pushed
- [x] Vercel fará auto-deploy

---

## ⏳ Pendente (MANUAL - Requer Dashboard)

### Google Cloud Console

**URL:** https://console.cloud.google.com/auth/overview

1. **Criar/Selecionar Projeto**
   - [ ] Ir para https://console.cloud.google.com/home/dashboard
   - [ ] Criar novo projeto ou selecionar existente

2. **Configurar Scopes**
   - [ ] Ir para https://console.cloud.google.com/auth/scopes
   - [ ] Adicionar manualmente: `openid`
   - [ ] Verificar que estão ativos:
     - `.../auth/userinfo.email`
     - `.../auth/userinfo.profile`

3. **Criar OAuth Client**
   - [ ] Ir para https://console.cloud.google.com/auth/clients/create
   - [ ] **Application type:** Web application
   - [ ] **Name:** Carnavlad
   - [ ] **Authorized JavaScript origins:**
     ```
     https://carnavlad.vercel.app
     http://localhost:3000
     ```
   - [ ] **Authorized redirect URIs:**
     ```
     https://[SEU-PROJETO].supabase.co/auth/v1/callback
     http://127.0.0.1:54321/auth/v1/callback
     ```
   - [ ] Clicar "Create"
   - [ ] **SALVAR:** Client ID e Client Secret

---

### Supabase Dashboard

**URL:** https://supabase.com/dashboard/project/[seu-projeto]/auth/providers

1. **Ativar Google Provider**
   - [ ] Clicar em "Google"
   - [ ] Toggle "Enable Google provider"
   - [ ] **Google Client ID:** (colar do passo anterior)
   - [ ] **Google Client Secret:** (colar do passo anterior)
   - [ ] **COPIAR:** Callback URL mostrada
   - [ ] Salvar

2. **Adicionar Callback URL no Google**
   - [ ] Voltar no Google Cloud Console
   - [ ] Editar o OAuth Client criado
   - [ ] Adicionar a Callback URL copiada do Supabase
   - [ ] Salvar

---

### Vercel (Opcional)

**URL:** https://vercel.com/sktbrds-projects/carnavlad/settings/environment-variables

Se quiser usar Google One-Tap (futuro):
- [ ] Adicionar variável:
  ```
  NEXT_PUBLIC_GOOGLE_CLIENT_ID=[seu-client-id]
  ```

---

## 🧪 Testar Após Configurar

### Local Development
1. [ ] `pnpm dev`
2. [ ] Acessar `http://localhost:3000/login`
3. [ ] Clicar "Continuar com Google"
4. [ ] Autorizar app
5. [ ] Verificar redirecionamento e login ✅

### Production
1. [ ] Acessar `https://carnavlad.vercel.app/login`
2. [ ] Clicar "Continuar com Google"
3. [ ] Autorizar app
4. [ ] Verificar redirecionamento e login ✅
5. [ ] Verificar OpenGraph:
   - Compartilhar link no Telegram/WhatsApp
   - Ver preview com imagem e metadata ✅

---

## 📝 Notas Importantes

1. **Callback URL do Supabase:**
   - Formato: `https://[projeto-id].supabase.co/auth/v1/callback`
   - Encontre em: Dashboard → Auth → Providers → Google

2. **Aguardar Propagação:**
   - Após salvar no Google, aguarde ~5min
   - Mudanças podem levar tempo para propagar

3. **Erros Comuns:**
   - `redirect_uri_mismatch` → Checar URIs no Google
   - `Invalid client` → Client ID/Secret incorretos
   - `Access denied` → Scopes não configurados

---

## 📊 Checklist Completo

### Google Cloud
- [ ] Projeto criado/selecionado
- [ ] Scopes configurados (openid, email, profile)
- [ ] OAuth Client criado (Web)
- [ ] JavaScript origins adicionadas
- [ ] Redirect URIs adicionadas
- [ ] Client ID + Secret salvos

### Supabase
- [ ] Provider Google ativado
- [ ] Client ID configurado
- [ ] Client Secret configurado
- [ ] Callback URL copiada para Google

### Código
- [x] Route callback implementada
- [x] Página de login criada
- [x] OG image gerada
- [x] Metadata configurada
- [x] Documentação completa

### Deploy
- [x] Código commitado
- [x] Push para GitHub
- [ ] Vercel auto-deploy completado
- [ ] Teste em produção OK

---

## 🎯 Próximos Passos (Futuro)

1. **Google One-Tap:**
   - Implementar sign-in automático
   - Melhor UX em mobile

2. **Personalização:**
   - Salvar blocos favoritos
   - Criar programação personalizada
   - Notificações push

3. **Analytics:**
   - Rastrear logins
   - Popular blocos mais acessados

---

**Documentação completa:** Ver `GOOGLE_AUTH_SETUP.md`

**Dúvidas?** Todos os passos estão documentados. Qualquer erro, checar a seção de Debug no guia.

---

🎭 **Porque todo bloco merece um site!** ✨
