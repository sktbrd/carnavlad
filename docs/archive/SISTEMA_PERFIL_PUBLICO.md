# 👤 Sistema de Perfil Público e Follow

## 🎯 Overview

Sistema completo de perfis públicos com username único, sistema de follow/unfollow e compartilhamento de blocos confirmados.

---

## ✨ Features

### 1. **Username Único**
- ✅ Gerado automaticamente a partir do email
- ✅ Formato: letras minúsculas + números
- ✅ Único em toda a plataforma
- ✅ Usado na URL pública: `/u/[username]`

### 2. **Perfil Público**
- ✅ Acessível via `/u/[username]`
- ✅ Mostra blocos confirmados
- ✅ Estatísticas (blocos + amigos)
- ✅ Botão de seguir/deixar de seguir
- ✅ Compartilhamento via link ou Web Share API

### 3. **Sistema de Follow**
- ✅ Seguir usuários diretamente (sem aprovação)
- ✅ Deixar de seguir
- ✅ Ver amigos no perfil privado
- ✅ Contagem de seguidores/seguindo

### 4. **Perfil Privado** (`/perfil`)
- ✅ Username visível
- ✅ Botão "Compartilhar Perfil"
- ✅ Link público copiado
- ✅ Web Share API (mobile)

---

## 🗄️ Estrutura do Banco

### Migration 009: Username

```sql
-- Novo campo
ALTER TABLE usuarios ADD COLUMN username TEXT UNIQUE;

-- Índice para busca rápida
CREATE INDEX idx_usuarios_username ON usuarios(username);

-- Função para gerar username
CREATE FUNCTION generate_username_from_email(email TEXT) RETURNS TEXT;

-- Trigger atualizado
CREATE FUNCTION handle_new_user() -- inclui username
```

### Tabela `usuarios` (atualizada)

| Campo | Tipo | Descrição |
|-------|------|-----------|
| id | UUID | ID único (auth.users) |
| email | TEXT | Email do usuário |
| nome | TEXT | Nome completo |
| avatar_url | TEXT | URL do avatar (Google) |
| **username** | **TEXT** | **Username único** |
| created_at | TIMESTAMPTZ | Data de criação |
| updated_at | TIMESTAMPTZ | Última atualização |

### Tabela `amigos` (já existente)

| Campo | Tipo | Descrição |
|-------|------|-----------|
| id | UUID | ID único |
| user_id | UUID | Quem está seguindo |
| amigo_id | UUID | Quem está sendo seguido |
| status | TEXT | 'aceito' (follow direto) |
| created_at | TIMESTAMPTZ | Data do follow |

---

## 🚀 Como Usar

### 1. Rodar Migration 009

No Supabase SQL Editor:
```sql
-- Cole o conteúdo de:
-- supabase/migrations/009_add_username.sql
-- Clique em "Run"
```

**Resultado:**
- Campo `username` criado
- Usernames gerados para usuários existentes
- Trigger atualizado para novos usuários

### 2. Acessar Perfil Público

**URL:**
```
https://carnavlad.vercel.app/u/[username]
```

**Exemplos:**
```
/u/joaosilva
/u/maria123
/u/vlad
```

### 3. Compartilhar Perfil

**No perfil privado (`/perfil`):**
1. Clique em **"Compartilhar Perfil"**
2. Link copiado automaticamente!
3. Cole onde quiser (WhatsApp, Instagram, etc)

**Mobile (Web Share API):**
- Abre menu nativo de compartilhamento
- Compartilha via apps instalados

### 4. Seguir Usuários

**No perfil público:**
1. Acesse `/u/[username]`
2. Clique em **"Seguir"**
3. Agora você segue esse usuário!
4. Veja blocos confirmados dele

**Deixar de seguir:**
1. Clique em **"Deixar de Seguir"**
2. Confirmação instantânea

---

## 🎨 Páginas

### `/perfil` (Privado)

**Acesso:** Apenas usuário logado  
**Features:**
- Avatar + nome + email + @username
- Botão "Compartilhar Perfil"
- Estatísticas (blocos, amigos)
- Lista de blocos confirmados (atualiza em tempo real)
- Lista de amigos

### `/u/[username]` (Público)

**Acesso:** Qualquer pessoa (até não logados)  
**Features:**
- Avatar + nome + @username
- Estatísticas públicas
- Botão "Seguir" (se logado e não for próprio perfil)
- Lista de blocos confirmados
- Botão "Compartilhar" (copia link)

---

## 🔧 Componentes

### `components/perfil/follow-button.tsx`

**Props:**
```typescript
{
  currentUserId: string;    // Usuário logado
  targetUserId: string;     // Usuário a seguir
  targetUsername: string;   // Username do target
}
```

**Estados:**
1. ⏳ Loading - Verificando status
2. ➕ Não Seguindo - Botão amarelo "Seguir"
3. ➖ Seguindo - Botão branco "Deixar de Seguir"

**Logs:**
```javascript
[follow-button] Seguindo: joaosilva
[follow-button] ✅ Agora está seguindo

[follow-button] Deixando de seguir: joaosilva
[follow-button] ✅ Deixou de seguir
```

### `components/perfil/share-profile-button.tsx`

**Props:**
```typescript
{
  username: string;  // Username do usuário
}
```

**Features:**
- Web Share API (mobile)
- Clipboard API (desktop)
- Feedback visual (✓ Link Copiado!)
- 2s timeout para voltar ao normal

### `components/perfil/blocos-confirmados-list.tsx`

**Props:**
```typescript
{
  userId: string;  // ID do usuário
}
```

**Features:**
- Client-side (auto-reload)
- Loading state
- Empty state com CTA
- Cards de eventos

---

## 📊 Geração de Username

### Algoritmo

```typescript
// Entrada: email@exemplo.com
// Saída: email

1. Pega parte antes do @
2. Remove caracteres especiais
3. Limita a 20 caracteres
4. Se já existe, adiciona número (email1, email2, etc)
```

**Exemplos:**
```
joao.silva@gmail.com    → joaosilva
maria+carnaval@mail.com → maria
user123@test.com        → user123
vlad@mail.com           → vlad
vlad@outro.com          → vlad1 (segundo usuário)
```

### Regras

- ✅ Apenas letras minúsculas e números
- ✅ Máximo 20 caracteres
- ✅ Único na plataforma
- ✅ Gerado automaticamente no primeiro login
- ❌ Não pode ser alterado (futuro: permitir edição)

---

## 🔐 Privacidade

### Informações Públicas

**Visível em `/u/[username]`:**
- ✅ Nome
- ✅ Username
- ✅ Avatar
- ✅ Blocos confirmados
- ✅ Contagem de amigos/blocos

**NÃO visível:**
- ❌ Email
- ❌ Lista de amigos (apenas contagem)

### Controle

**Futuro:**
- [ ] Toggle "Perfil Privado" (esconde blocos confirmados)
- [ ] Toggle "Aceitar Seguidores" (aprovação manual)
- [ ] Bloquear usuários
- [ ] Esconder blocos específicos

---

## 🚨 Troubleshooting

### Erro: "Username already exists"
**Causa:** Username já foi usado  
**Solução:** Sistema adiciona número automaticamente (username1, username2)

### Perfil público não aparece
**Causa:** Migration 009 não foi rodada  
**Solução:** Rode migration no Supabase

### Botão "Seguir" não funciona
**Causa:** Usuário não está logado  
**Solução:** Login primeiro

### Username não foi gerado
**Causa:** Trigger não rodou  
**Solução:**
```sql
UPDATE usuarios 
SET username = generate_username_from_email(email)
WHERE username IS NULL;
```

---

## 📝 Rotas

| Rota | Tipo | Descrição |
|------|------|-----------|
| `/perfil` | Privado | Perfil do usuário logado |
| `/u/[username]` | Público | Perfil público de qualquer usuário |
| `/login` | Público | Login via Google |

---

## 🎯 Fluxo Completo: Compartilhar Perfil

```
1. Usuário vai em /perfil
   ↓
2. Clica em "Compartilhar Perfil"
   ↓
3. ShareProfileButton:
   - Mobile → Web Share API (apps nativos)
   - Desktop → Copia link para clipboard
   ↓
4. Link copiado: https://carnavlad.vercel.app/u/joaosilva
   ↓
5. Usuário cola onde quiser
   ↓
6. Outra pessoa acessa /u/joaosilva
   ↓
7. Vê blocos confirmados + estatísticas
   ↓
8. Clica "Seguir" (se logado)
   ↓
9. INSERT na tabela amigos
   ↓
10. Agora segue esse usuário!
```

---

## 🔄 Fluxo Completo: Seguir Usuário

```
1. Acessa /u/[username]
   ↓
2. FollowButton verifica status:
   - SELECT amigos WHERE user_id = X AND amigo_id = Y
   ↓
3. Se não está seguindo:
   - Botão amarelo "Seguir"
   ↓
4. Clica "Seguir"
   ↓
5. INSERT amigos (status: 'aceito')
   ↓
6. Botão muda para branco "Deixar de Seguir"
   ↓
7. Vai em /perfil (próprio)
   ↓
8. Vê usuário na lista de amigos
```

---

## 📈 Estatísticas

### Queries

**Contar blocos confirmados:**
```sql
SELECT COUNT(*) FROM presencas_confirmadas WHERE user_id = X;
```

**Contar amigos:**
```sql
SELECT COUNT(*) FROM amigos 
WHERE user_id = X AND status = 'aceito';
```

**Buscar amigos:**
```sql
SELECT * FROM amigos_aceitos WHERE user_id = X;
```

---

## 🎯 Próximos Passos

- [ ] Rodar migration 009
- [ ] Testar geração de username
- [ ] Acessar /u/[seu-username]
- [ ] Compartilhar perfil
- [ ] Seguir outro usuário
- [ ] Ver amigos no perfil

---

## 🚀 Futuras Melhorias

- [ ] Editar username (uma vez)
- [ ] Perfil privado (toggle)
- [ ] Aprovação manual de seguidores
- [ ] Notificações de novos seguidores
- [ ] Feed de blocos dos amigos
- [ ] Blocos em comum com amigos
- [ ] Sugestões de amigos (amigos em comum)
- [ ] Badge de verificado (blocos famosos)

---

_Última atualização: 2026-02-13 15:19 GMT-3_
