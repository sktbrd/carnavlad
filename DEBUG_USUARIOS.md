# 🐛 Debug: "0 foliões" com 3 usuários no banco

**Problema:** Página `/usuarios` mostra "0 foliões" mesmo com 3 usuários logados.

---

## 🔍 Causas Possíveis

### 1. Tabela `usuarios` está vazia ❌
**Sintoma:** 3 usuários fizeram login com Google, mas a tabela `usuarios` está vazia.

**Causa:** Trigger `handle_new_user()` não foi criado (migration 002 não rodada).

**Verificar:**
```sql
-- Supabase SQL Editor
SELECT * FROM usuarios;
-- Se retornar 0 linhas → PROBLEMA AQUI
```

**Solução:**
```sql
-- 1. Rodar migration 002 (se não foi rodada)
-- Copiar TODO conteúdo de: supabase/migrations/002_rls_policies.sql
-- Colar no SQL Editor
-- Executar

-- 2. Criar perfis manualmente para os 3 usuários existentes
-- Primeiro, buscar IDs dos usuários autenticados:
SELECT id, email, raw_user_meta_data->>'full_name' as nome
FROM auth.users;

-- Depois, inserir na tabela usuarios:
INSERT INTO public.usuarios (id, email, nome, avatar_url)
SELECT 
  id, 
  email, 
  raw_user_meta_data->>'full_name',
  raw_user_meta_data->>'avatar_url'
FROM auth.users
WHERE id NOT IN (SELECT id FROM public.usuarios);
```

---

### 2. Usuários foram criados MAS todos têm mesmo ID ❌
**Sintoma:** 3 logins diferentes, mas apenas 1 registro na tabela.

**Verificar:**
```sql
SELECT COUNT(*) FROM auth.users;  -- Deve retornar 3
SELECT COUNT(*) FROM usuarios;     -- Deve retornar 3 também

-- Se auth.users = 3 mas usuarios = 1 → Trigger não funcionou pra todos
```

**Solução:** Rodar query de sync acima (passo 2).

---

### 3. Query está filtrando tudo ❌
**Sintoma:** Usuários existem, mas query retorna vazio.

**Verificar:**
```sql
-- Buscar diretamente (igual a query do app)
SELECT * FROM usuarios ORDER BY nome;

-- Verificar RLS
SELECT * FROM usuarios WHERE true;  -- Força bypass (se for admin)
```

**Solução:** Se RLS estiver bloqueando, verificar policy em migration 002:
```sql
-- Deve existir esta policy:
CREATE POLICY "Usuários são públicos para leitura"
  ON usuarios FOR SELECT
  USING (true);  -- PERMITE TODOS lerem
```

---

### 4. Código está removendo você mesmo da lista ✅
**Sintoma:** 3 usuários no banco, mas mostra 2 (ou 0 se você for único).

**Código atual:**
```typescript
// components/usuarios/diretorio-usuarios.tsx linha 41
const outrosUsuarios = usuariosFiltrados.filter(
  (u) => u.id !== currentUserId  // Remove VOCÊ da lista
)
```

**Cenário:**
- 3 usuários no banco
- 1 é você
- Mostra: 2 foliões ✅ (correto)

**Se mostra 0:** Problema é outro (acima).

---

## 🧪 Checklist de Debug

Execute nesta ordem:

**Passo 1: Verificar auth.users**
```sql
SELECT COUNT(*) as total_auth FROM auth.users;
-- Esperado: 3
```

**Passo 2: Verificar usuarios**
```sql
SELECT COUNT(*) as total_usuarios FROM usuarios;
-- Esperado: 3
-- Se = 0 → PROBLEMA: Trigger não existe ou não rodou
-- Se < 3 → PROBLEMA: Alguns usuários sem perfil
```

**Passo 3: Ver dados**
```sql
SELECT 
  u.id,
  u.email,
  u.nome,
  u.avatar_url,
  au.created_at as login_em
FROM auth.users au
LEFT JOIN usuarios u ON au.id = u.id
ORDER BY au.created_at DESC;

-- Se tiver linhas com usuarios.* NULL → Perfil não foi criado
```

**Passo 4: Verificar trigger**
```sql
-- Ver se trigger existe
SELECT 
  trigger_name, 
  event_manipulation, 
  action_statement
FROM information_schema.triggers
WHERE trigger_name = 'on_auth_user_created';

-- Se retornar 0 linhas → Trigger NÃO EXISTE (rodar migration 002)
```

**Passo 5: Testar trigger manualmente**
```sql
-- Criar usuário de teste no auth (não faça isso se não souber o que está fazendo)
-- OU fazer logout e login novamente
-- OU rodar a query de sync manual (passo 1, solução acima)
```

---

## ✅ Solução Rápida (Recomendada)

**Se a tabela usuarios estiver vazia:**

```sql
-- 1. Criar perfis para todos os usuários existentes
INSERT INTO public.usuarios (id, email, nome, avatar_url)
SELECT 
  id, 
  email, 
  COALESCE(raw_user_meta_data->>'full_name', raw_user_meta_data->>'name', split_part(email, '@', 1)),
  raw_user_meta_data->>'avatar_url'
FROM auth.users
WHERE id NOT IN (SELECT id FROM public.usuarios);

-- 2. Verificar se funcionou
SELECT * FROM usuarios;
-- Deve retornar 3 linhas agora
```

**Se o trigger não existir:**

```bash
# Rodar migration 002
# 1. Acesse: https://supabase.com/dashboard/project/SEU_PROJECT/sql/new
# 2. Copie TODO conteúdo de: supabase/migrations/002_rls_policies.sql
# 3. Cole e Execute
```

---

## 🔧 Fix Permanente

**Para que novos logins criem perfil automaticamente:**

1. ✅ Garantir que migration 002 foi rodada
2. ✅ Verificar que trigger existe e está ativo
3. ✅ Testar: fazer logout → login novamente → verificar se criou registro

---

## 📊 Depois do Fix

**Deve mostrar:**
- `/usuarios` → "2 foliões" (você + 2 outros)
- Ou "0 foliões" se só você existir no banco

**Console do servidor deve mostrar:**
```
[/usuarios] Total de usuários no banco: 3
[/usuarios] Usuário logado: abc-123-...
```

---

## 🚨 Se Ainda Não Funcionar

**Compartilhe:**
1. Resultado de `SELECT COUNT(*) FROM usuarios;`
2. Resultado de `SELECT COUNT(*) FROM auth.users;`
3. Screenshot da página `/usuarios`
4. Logs do console (F12 → Console)

---

_Debug adicionado em: 13/02/2026 21:40_
