# 🐛 Bugs Encontrados - Navegação Browser

**Data:** 13/02/2026 21:53  
**Método:** Browser tools + inspeção visual

---

## 🔴 CRÍTICO: Botão de Confirmação de Presença NÃO APARECE

**Local:** Drawer do evento (sidebar ao clicar em evento)

**O que deveria ter:**
- ✅ Botão "Confirmar Presença" (amarelo/laranja)
- ✅ Seção "Quem Vai" mostrando usuários confirmados

**O que aparece:**
- ❌ NADA! Drawer só mostra info básica do bloco

**Screenshot:** `/Users/vladnikolaev/.openclaw/media/browser/5448cc67-837f-4e41-a27c-e52628c99895.jpg`

**Causa provável:**
- Componentes ConfirmPresenceButton e QuemVai não estão sendo renderizados
- OU estão fora da tela (precisa scroll)
- OU condicionais erradas

**Onde investigar:**
- `components/evento-drawer.tsx` (linha ~190-210)

---

## 🟡 MÉDIO: Mocked Data no Hero (Stats)

**Local:** Hero section (topo da home)

**O que aparece:**
```
250+ Blocos       ← HARDCODED
8 Dias de Festa   ← HARDCODED
100+ Bairros      ← HARDCODED
```

**O que deveria aparecer:**
```
429 Blocos        ← Dados reais dos eventos
X Dias de Festa   ← Count de datas únicas
Y Bairros         ← Count de bairros únicos
```

**Causa:**
- Deploy ainda tem versão antiga do `hero-section.tsx`
- Commit 769a4f3 não foi aplicado no Vercel

**Fix:**
1. Verificar se Vercel deployou
2. OU forçar redeploy
3. OU verificar se código está correto

---

## ✅ FUNCIONANDO: Logo Colorido no Header

**Status:** ✅ OK!  
**Evidência:** Vejo os divs separados (C a r n a V l a d) com cores diferentes no snapshot

---

## 📋 Outros Bugs Menores (Observados)

### 1. PWA Install Prompt Aparece Sempre
- Toast "Instalar Carnavlad" aparece mesmo já tendo visto
- Deveria lembrar que usuário fechou

### 2. Footer Links Inativos
- Todos os links do footer vão para "#"
- Deveriam ir para páginas reais OU ser removidos

### 3. Botões do Hero Não Funcionam
- "Ver Agenda Completa" → Não faz nada
- "Explorar Mapa" → Não faz nada
- Deveriam scrollar para as tabs OU mudar de view

---

## 🎯 Prioridade de Fixes

1. **URGENTE:** Botão de confirmação de presença (quebra feature principal)
2. **ALTO:** Mocked data no hero (faz site parecer fake)
3. **MÉDIO:** Botões do hero funcionarem
4. **BAIXO:** PWA prompt, footer links

---

## 🔧 Próximos Passos

1. ✅ Investigar evento-drawer.tsx
2. ✅ Verificar por que ConfirmPresenceButton não renderiza
3. ✅ Verificar deploy do Vercel
4. ✅ Testar confirmação de presença após fix
5. ✅ Verificar se "Quem Vai" aparece após confirmar

---

_Bugs documentados via browser automation 🤖_
