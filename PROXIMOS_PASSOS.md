# 🎯 Próximos Passos - Conectar Supabase

## ✅ O Que Já Temos

- ✅ Auth Google funcionando (dev + produção)
- ✅ Página de perfil criada (usando mock data)
- ✅ Migrations SQL prontas (3 arquivos)
- ✅ Queries helper criadas (`lib/supabase/queries.ts`)
- ✅ Types TypeScript atualizados

---

## 📋 PASSO 1: Rodar Migrations no Supabase

### 1.1. Acesse o SQL Editor
https://supabase.com/dashboard/project/gsnrjesqmslmbykygzas/sql/new

### 1.2. Copie e cole cada migration (NA ORDEM):

#### **Migration 001:** Criar Tabelas
- Abra: `supabase/migrations/001_create_tables.sql`
- Copie TODO o conteúdo
- Cole no SQL Editor
- Clique em **"Run"**
- **Aguarde:** ~5-10 segundos

#### **Migration 002:** RLS Policies
- Abra: `supabase/migrations/002_rls_policies.sql`
- Copie TODO o conteúdo
- Cole no SQL Editor
- Clique em **"Run"**
- **Aguarde:** ~5-10 segundos

#### **Migration 003:** Seed Data
- Abra: `supabase/migrations/003_seed_data.sql`
- Copie TODO o conteúdo
- Cole no SQL Editor
- Clique em **"Run"**
- **Aguarde:** ~5-10 segundos

### 1.3. Verificar se funcionou
1. Vá em **"Table Editor"** (barra lateral)
2. Você deve ver essas tabelas:
   - ✅ `blocos` (10 registros)
   - ✅ `eventos` (10 registros)
   - ✅ `usuarios` (0 registros - será preenchido no login)
   - ✅ `presencas_confirmadas` (0 registros)
   - ✅ `amigos` (0 registros)
   - ✅ `contribuicoes` (0 registros)
   - ✅ `comentarios` (0 registros)

3. Abra `blocos` → Deve ter 10 blocos:
   - Bloco da Alegria
   - Cordão da Bola Preta
   - Monobloco
   - Sargento Pimenta
   - Simpatia é Quase Amor
   - Céu na Terra
   - Orquestra Voadora
   - Boitatá
   - Banda de Ipanema
   - Cordão do Boi Tolo

4. Abra `eventos` → Deve ter 10 eventos (fevereiro 2026)

---

## 📋 PASSO 2: Atualizar App para Usar Dados Reais

### 2.1. Atualizar Home Page
**Arquivo:** `app/page.tsx`

**Trocar:**
```typescript
// Mock data
const MOCK_EVENTOS = [...]
```

**Por:**
```typescript
import { getEventosCompletos } from '@/lib/supabase/queries'

// Dentro da função
const eventos = await getEventosCompletos(supabase)
```

### 2.2. Atualizar Confirm Presence Button
**Arquivo:** `components/evento/confirm-presence-button.tsx`

**Adicionar:**
```typescript
import { confirmarPresenca, removerPresenca, isPresencaConfirmada } from '@/lib/supabase/queries'

// No handleClick:
if (isConfirmed) {
  await removerPresenca(supabase, user.id, eventoId)
} else {
  await confirmarPresenca(supabase, user.id, eventoId)
}
```

### 2.3. Atualizar Página de Evento Individual
**Arquivo:** `app/evento/[slug]/page.tsx`

**Trocar mock data por:**
```typescript
import { getEventosCompletos } from '@/lib/supabase/queries'

const eventos = await getEventosCompletos(supabase)
const evento = eventos.find(e => e.bloco_slug === slug)
```

---

## 📋 PASSO 3: Testar Fluxo Completo

### 3.1. Fazer Login
1. Acesse: http://localhost:3456/login
2. Clique em "Continuar com Google"
3. Escolha sua conta
4. **Resultado esperado:** Logado com sucesso

### 3.2. Verificar se usuário foi criado
1. Vá no Supabase Dashboard
2. Table Editor → `usuarios`
3. **Deve aparecer seu usuário** com:
   - email do Google
   - nome do Google
   - avatar_url do Google

### 3.3. Ver Home Page com dados reais
1. Acesse: http://localhost:3456
2. **Deve mostrar 10 blocos** (seed data)
3. Clique em um bloco → Ver detalhes

### 3.4. Confirmar presença em bloco
1. Na página de detalhes do bloco
2. Clique em **"Confirmar Presença"** ❤️
3. **Resultado esperado:** Botão fica vermelho (favorito)

### 3.5. Verificar no banco
1. Supabase Dashboard → Table Editor → `presencas_confirmadas`
2. **Deve ter 1 registro** com:
   - `user_id` = seu ID
   - `evento_id` = ID do evento

### 3.6. Ver Perfil com dados reais
1. Clique no avatar (header)
2. **Deve mostrar:**
   - ✅ Seu nome do Google
   - ✅ Seu email
   - ✅ **1 bloco confirmado** (o que você favoritou)
   - ✅ 0 amigos (ainda não seguiu ninguém)

---

## 📋 PASSO 4: Implementar Sistema de Amigos

### 4.1. Criar componente de busca
**Arquivo:** `components/amigos/buscar-amigos.tsx`

**Features:**
- Input de busca (email ou nome)
- Lista de resultados
- Botão "Seguir" ao lado de cada usuário

### 4.2. Criar componente de lista de amigos
**Arquivo:** `components/amigos/lista-amigos.tsx`

**Features:**
- Lista de amigos aceitos
- Botão "Deixar de seguir"
- Link para perfil do amigo

### 4.3. Atualizar página de perfil
**Adicionar:**
- Modal de "Adicionar Amigos" (com busca)
- Lista de pedidos pendentes
- Botões "Aceitar" e "Rejeitar"

---

## 📋 PASSO 5: Deploy em Produção

### 5.1. Rodar migrations no Supabase (já feito acima)
✅ Já foi feito no Passo 1

### 5.2. Verificar env vars no Vercel
https://vercel.com/sktbrd/carnavlad/settings/environment-variables

**Verificar se tem:**
- ✅ `NEXT_PUBLIC_SUPABASE_URL`
- ✅ `NEXT_PUBLIC_SUPABASE_ANON_KEY`
- ✅ `NEXT_PUBLIC_GOOGLE_CLIENT_ID`

### 5.3. Fazer deploy
```bash
git add -A
git commit -m "feat: conectado com Supabase real"
git push origin main
```

### 5.4. Testar em produção
1. https://carnavlad.vercel.app
2. Fazer login
3. Confirmar presença em blocos
4. Ver perfil com dados reais

---

## 🎯 Checklist de Teste

### ✅ Autenticação
- [ ] Login com Google funciona
- [ ] Logout funciona
- [ ] Perfil de usuário criado automaticamente no banco
- [ ] Avatar e nome aparecem no header

### ✅ Blocos e Eventos
- [ ] Home mostra 10 blocos (seed data)
- [ ] Calendário mostra eventos nas datas corretas
- [ ] Mapa mostra markers nos locais
- [ ] Drawer lateral abre ao clicar em evento

### ✅ Favoritos (Presenças Confirmadas)
- [ ] Botão "Confirmar Presença" funciona
- [ ] Botão fica vermelho quando favoritado
- [ ] Desfavoritar funciona
- [ ] Registro salvo na tabela `presencas_confirmadas`

### ✅ Perfil
- [ ] Página de perfil mostra dados do usuário
- [ ] Lista de blocos confirmados vem do banco
- [ ] Stats (blocos + amigos) corretos
- [ ] Botão "Sair" funciona

### ✅ Amigos (Quando implementado)
- [ ] Buscar usuários por email/nome
- [ ] Seguir usuário
- [ ] Deixar de seguir
- [ ] Ver blocos em comum

---

## 🚨 Troubleshooting

### Erro: "relation blocos does not exist"
**Causa:** Migrations não foram rodadas.  
**Solução:** Volte ao Passo 1.

### Erro: "permission denied for table blocos"
**Causa:** RLS está bloqueando.  
**Solução:** Use SQL Editor do dashboard (tem permissões de admin).

### Usuário não aparece na tabela `usuarios`
**Causa:** Trigger não foi criado ou deu erro.  
**Solução:** 
1. Verifique se migration 002 foi rodada
2. Faça logout e login novamente
3. Verifique no Table Editor se apareceu

### Blocos não aparecem na home
**Causa:** Query falhou ou seed data não foi inserido.  
**Solução:**
1. Abra Table Editor → `blocos` → Deve ter 10 registros
2. Se não tiver, rode migration 003 novamente
3. Verifique console do navegador (F12) por erros

---

## 📝 Arquivos a Atualizar (Resumo)

| Arquivo | O Que Fazer |
|---------|-------------|
| `app/page.tsx` | Substituir mock por `getEventosCompletos()` |
| `app/evento/[slug]/page.tsx` | Buscar evento do banco |
| `components/evento/confirm-presence-button.tsx` | Chamar `confirmarPresenca()` / `removerPresenca()` |
| `components/views/*.tsx` | Usar dados reais ao invés de mock |

---

## 🎉 Quando Tudo Funcionar

**Você terá:**
- ✅ Auth Google completa
- ✅ 10 blocos reais no banco
- ✅ Favoritos salvos no banco
- ✅ Perfil com dados reais
- ✅ Sistema de amigos (quando implementar)

**Próximo grande milestone:**
- 🚀 Adicionar todos os 250+ blocos do Rio 2026
- 📸 Sistema de fotos/relatos
- 🔔 Notificações de blocos favoritos
- 📍 Navegação até o bloco (Google Maps)

---

_Última atualização: 2026-02-13 14:00 GMT-3_
