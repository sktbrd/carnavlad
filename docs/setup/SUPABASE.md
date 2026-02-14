# 🗄️ Supabase Database Setup

## 📋 Overview

Este guia mostra como rodar as migrations no Supabase para criar as tabelas e políticas RLS.

---

## 🎯 Migrations Criadas

| Arquivo | Descrição |
|---------|-----------|
| `001_create_tables.sql` | Cria tabelas principais (blocos, eventos, usuários, presenças, amigos) |
| `002_rls_policies.sql` | Configura Row Level Security e permissões |
| `003_seed_data.sql` | Popula banco com 10 blocos e 10 eventos de teste |

---

## 🚀 Como Rodar as Migrations

### Opção 1: Supabase Dashboard (Recomendado)

1. **Acesse o SQL Editor:**
   https://supabase.com/dashboard/project/gsnrjesqmslmbykygzas/sql/new

2. **Copie e cole cada migration na ordem:**
   - `001_create_tables.sql`
   - `002_rls_policies.sql`
   - `003_seed_data.sql`

3. **Clique em "Run" para cada uma**

4. **Verifique se deu certo:**
   - Vá em "Table Editor"
   - Você deve ver: `blocos`, `eventos`, `usuarios`, `presencas_confirmadas`, `amigos`
   - Abra `blocos` → deve ter 10 registros

---

### Opção 2: Supabase CLI (Avançado)

```bash
# Instalar CLI
npm install -g supabase

# Login
supabase login

# Linkar projeto
supabase link --project-ref gsnrjesqmslmbykygzas

# Rodar migrations
supabase db push
```

---

## 📊 Estrutura das Tabelas

### `blocos`
Blocos de carnaval (10 registros seed).

**Colunas:**
- `id` (UUID) - Primary key
- `nome` (VARCHAR) - Nome do bloco
- `descricao` (TEXT) - Descrição
- `instagram_url` (VARCHAR) - Link do Instagram
- `whatsapp_url` (VARCHAR) - Link do WhatsApp
- `slug` (VARCHAR UNIQUE) - URL-friendly slug
- `created_at`, `updated_at` (TIMESTAMP)

---

### `eventos`
Saídas dos blocos (10 eventos seed).

**Colunas:**
- `id` (UUID) - Primary key
- `bloco_id` (UUID FK) → `blocos.id`
- `data` (DATE) - Data do evento
- `horario` (TIME) - Horário de concentração
- `horario_confirmado` (BOOLEAN)
- `local_nome` (VARCHAR) - Nome do local
- `local_endereco` (VARCHAR) - Endereço completo
- `local_lat`, `local_lng` (DECIMAL) - Coordenadas
- `local_confirmado` (BOOLEAN)
- `observacoes` (TEXT)
- `created_at` (TIMESTAMP)

---

### `usuarios`
Perfis públicos dos usuários.

**Colunas:**
- `id` (UUID FK) → `auth.users.id`
- `email` (VARCHAR UNIQUE)
- `nome` (VARCHAR) - Nome do Google
- `avatar_url` (VARCHAR) - Avatar do Google
- `created_at`, `updated_at` (TIMESTAMP)

**Auto-criado:** Quando usuário faz login pela primeira vez (trigger).

---

### `presencas_confirmadas`
Blocos que o usuário confirmou presença (favoritos).

**Colunas:**
- `id` (UUID) - Primary key
- `user_id` (UUID FK) → `auth.users.id`
- `evento_id` (UUID FK) → `eventos.id`
- `created_at` (TIMESTAMP)

**Unique constraint:** `(user_id, evento_id)` - Não pode favoritar duas vezes.

---

### `amigos`
Sistema de follow/unfollow entre usuários.

**Colunas:**
- `id` (UUID) - Primary key
- `user_id` (UUID FK) → `auth.users.id` (quem segue)
- `amigo_id` (UUID FK) → `auth.users.id` (quem é seguido)
- `status` (VARCHAR) - `'pendente'` | `'aceito'` | `'rejeitado'`
- `created_at`, `updated_at` (TIMESTAMP)

**Unique constraint:** `(user_id, amigo_id)`  
**Check constraint:** `user_id != amigo_id` (não pode seguir a si mesmo)

---

## 🔒 Row Level Security (RLS)

Todas as tabelas têm RLS habilitado.

### Políticas Principais:

| Tabela | SELECT | INSERT | UPDATE | DELETE |
|--------|--------|--------|--------|--------|
| `blocos` | ✅ Público | ❌ Admin only | ❌ Admin only | ❌ Admin only |
| `eventos` | ✅ Público | ❌ Admin only | ❌ Admin only | ❌ Admin only |
| `usuarios` | ✅ Público | ✅ Próprio perfil | ✅ Próprio perfil | ❌ |
| `presencas_confirmadas` | ✅ Público | ✅ Próprio user_id | ❌ | ✅ Próprio user_id |
| `amigos` | ✅ Próprios relacionamentos | ✅ Seguir outros | ✅ Aceitar/rejeitar | ✅ Unfollow |

---

## 🎯 Views Criadas

### `eventos_completos`
Join entre `eventos` e `blocos` (usado no app).

**Uso:**
```sql
SELECT * FROM eventos_completos WHERE data >= CURRENT_DATE ORDER BY data;
```

### `eventos_contagem_presencas`
Contagem de presenças por evento.

**Uso:**
```sql
SELECT e.*, ecp.total_presencas 
FROM eventos e
LEFT JOIN eventos_contagem_presencas ecp ON e.id = ecp.evento_id;
```

### `amigos_aceitos`
Amigos com status `'aceito'`.

**Uso:**
```sql
SELECT * FROM amigos_aceitos WHERE user_id = 'xxx';
```

---

## 🧪 Testar Após Migrations

### 1. Ver blocos:
```sql
SELECT * FROM blocos;
```

**Esperado:** 10 blocos (Bloco da Alegria, Cordão da Bola Preta, etc)

### 2. Ver eventos:
```sql
SELECT * FROM eventos_completos ORDER BY data;
```

**Esperado:** 10 eventos de fevereiro 2026

### 3. Criar usuário (fake):
```sql
INSERT INTO usuarios (id, email, nome)
VALUES ('00000000-0000-0000-0000-000000000001', 'test@test.com', 'Test User');
```

### 4. Confirmar presença:
```sql
INSERT INTO presencas_confirmadas (user_id, evento_id)
VALUES (
  '00000000-0000-0000-0000-000000000001',
  (SELECT id FROM eventos LIMIT 1)
);
```

### 5. Ver presenças:
```sql
SELECT u.nome, e.bloco_nome, e.data
FROM presencas_confirmadas pc
JOIN usuarios u ON pc.user_id = u.id
JOIN eventos_completos e ON pc.evento_id = e.id;
```

---

## 🔧 Troubleshooting

### Erro: "relation blocos already exists"
**Causa:** Tabela já existe.  
**Solução:** Drop todas as tabelas primeiro (ou rode apenas as que faltam).

```sql
DROP TABLE IF EXISTS comentarios CASCADE;
DROP TABLE IF EXISTS contribuicoes CASCADE;
DROP TABLE IF EXISTS amigos CASCADE;
DROP TABLE IF EXISTS presencas_confirmadas CASCADE;
DROP TABLE IF EXISTS eventos CASCADE;
DROP TABLE IF EXISTS blocos CASCADE;
DROP TABLE IF EXISTS usuarios CASCADE;
```

### Erro: "permission denied for table blocos"
**Causa:** RLS está bloqueando.  
**Solução:** Use o SQL Editor do dashboard (tem permissões de admin).

### Seed data não aparece
**Causa:** Migration 003 usa `DO $$` (PL/pgSQL).  
**Solução:** Copie e cole direto no SQL Editor (não no Supabase CLI).

---

## 📝 Próximos Passos

Após rodar as migrations:

1. ✅ Atualizar queries no app para usar dados reais
2. ✅ Remover mock data
3. ✅ Testar favoritos
4. ✅ Testar follow/unfollow
5. ✅ Deploy em produção

---

## 🎭 Dados de Seed

### Blocos criados:
1. Bloco da Alegria
2. Cordão da Bola Preta
3. Monobloco
4. Sargento Pimenta
5. Simpatia é Quase Amor
6. Céu na Terra
7. Orquestra Voadora
8. Boitatá
9. Banda de Ipanema
10. Cordão do Boi Tolo

### Eventos:
- 14/02 (Sáb): Bloco da Alegria, Banda de Ipanema
- 15/02 (Dom): Sargento Pimenta, Céu na Terra
- 20/02 (Sex): Orquestra Voadora
- 21/02 (Sáb): Cordão da Bola Preta, Simpatia é Quase Amor
- 22/02 (Dom): Boitatá
- 24/02 (Ter): Cordão do Boi Tolo
- 28/02 (Sáb): Monobloco

---

_Última atualização: 2026-02-13_
