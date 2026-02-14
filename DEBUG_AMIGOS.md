# 🐛 Debug: Amigos não aparecem no perfil

**Problema:** Quando você segue alguém, a pessoa não aparece no card "Amigos" do seu perfil.

---

## 🔍 Causas Possíveis

### 1. View `amigos_aceitos` não existe ❌
**Sintoma:** Query falha silenciosamente, retorna array vazio.

**Causa:** Migration 002 não foi rodada (view não foi criada).

**Verificar:**
```sql
-- Supabase SQL Editor
SELECT * FROM information_schema.views 
WHERE table_name = 'amigos_aceitos';

-- Se retornar 0 linhas → VIEW NÃO EXISTE
```

**Solução:**
```sql
-- Rodar migration 002 completa OU criar view manualmente:

CREATE OR REPLACE VIEW amigos_aceitos AS
SELECT 
  a.user_id,
  a.amigo_id,
  u.nome AS amigo_nome,
  u.avatar_url AS amigo_avatar,
  a.created_at
FROM amigos a
JOIN usuarios u ON a.amigo_id = u.id
WHERE a.status = 'aceito';

-- Verificar se funcionou:
SELECT * FROM amigos_aceitos LIMIT 5;
```

---

### 2. Tabela `usuarios` vazia ❌
**Sintoma:** View existe, mas JOIN não retorna nada.

**Causa:** Mesmo problema do "0 foliões" - perfis não foram criados.

**Verificar:**
```sql
-- Ver se existem usuários
SELECT COUNT(*) FROM usuarios;
-- Se = 0 → PROBLEMA (rodar migration 012)

-- Ver se existem relacionamentos
SELECT COUNT(*) FROM amigos;
-- Se = 0 → Ninguém seguiu ninguém ainda (normal)
```

**Solução:**
```sql
-- Rodar migration 012 (sync usuarios)
-- Ver: DEBUG_USUARIOS.md ou supabase/migrations/012_sync_usuarios.sql
```

---

### 3. Ninguém foi seguido ainda ✅
**Sintoma:** Tudo funciona, mas card mostra "0 amigos".

**Verificar:**
```sql
-- Ver seus follows
SELECT * FROM amigos WHERE user_id = 'SEU_USER_ID';
-- Se retornar 0 linhas → você não seguiu ninguém ainda (normal)

-- Testar view diretamente
SELECT * FROM amigos_aceitos WHERE user_id = 'SEU_USER_ID';
-- Deve retornar mesma coisa (0 linhas se não seguiu ninguém)
```

**Solução:** Não é bug! Só seguir alguém:
1. Ir em `/usuarios`
2. Clicar em "Seguir" em algum usuário
3. Voltar em `/perfil` → deve aparecer no card

---

### 4. Follow foi criado MAS status não é 'aceito' ❌
**Sintoma:** Você clicou em "Seguir", mas não aparece no perfil.

**Verificar:**
```sql
-- Ver status dos seus follows
SELECT amigo_id, status, created_at 
FROM amigos 
WHERE user_id = 'SEU_USER_ID';

-- Se status = 'pendente' → PROBLEMA
-- Deveria ser 'aceito' (follow direto)
```

**Solução:**
```sql
-- Atualizar follows existentes para 'aceito'
UPDATE amigos 
SET status = 'aceito' 
WHERE user_id = 'SEU_USER_ID' AND status = 'pendente';

-- Verificar:
SELECT * FROM amigos_aceitos WHERE user_id = 'SEU_USER_ID';
-- Agora deve aparecer!
```

---

## 🧪 Checklist de Debug (nesta ordem)

**Passo 1: View existe?**
```sql
SELECT COUNT(*) FROM information_schema.views 
WHERE table_name = 'amigos_aceitos';
-- Esperado: 1
-- Se 0 → Criar view (solução acima)
```

**Passo 2: Usuários existem?**
```sql
SELECT COUNT(*) FROM usuarios;
-- Esperado: >= 1
-- Se 0 → Rodar migration 012
```

**Passo 3: Você seguiu alguém?**
```sql
SELECT * FROM amigos WHERE user_id = 'SEU_USER_ID';
-- Se vazio → Seguir alguém em /usuarios
```

**Passo 4: Status está correto?**
```sql
SELECT status, COUNT(*) 
FROM amigos 
WHERE user_id = 'SEU_USER_ID' 
GROUP BY status;
-- Todos devem ser 'aceito'
-- Se tiver 'pendente' → Atualizar (solução acima)
```

**Passo 5: View retorna dados?**
```sql
SELECT * FROM amigos_aceitos WHERE user_id = 'SEU_USER_ID';
-- Deve retornar lista de amigos
-- Se vazio mas tabela amigos tem dados → problema no JOIN
```

---

## ✅ Solução Completa (All-in-One)

**Se nada estiver funcionando, rode isso:**

```sql
-- 1. Garantir que view existe
CREATE OR REPLACE VIEW amigos_aceitos AS
SELECT 
  a.user_id,
  a.amigo_id,
  u.nome AS amigo_nome,
  u.avatar_url AS amigo_avatar,
  a.created_at
FROM amigos a
JOIN usuarios u ON a.amigo_id = u.id
WHERE a.status = 'aceito';

-- 2. Garantir que usuários existem (rodar migration 012 se precisar)
INSERT INTO public.usuarios (id, email, nome, avatar_url)
SELECT 
  id, 
  email, 
  COALESCE(raw_user_meta_data->>'full_name', split_part(email, '@', 1)),
  raw_user_meta_data->>'avatar_url'
FROM auth.users
WHERE id NOT IN (SELECT id FROM public.usuarios)
ON CONFLICT (id) DO NOTHING;

-- 3. Garantir que follows são 'aceito'
UPDATE amigos SET status = 'aceito' WHERE status = 'pendente';

-- 4. Testar
SELECT * FROM amigos_aceitos WHERE user_id = 'SEU_USER_ID';
-- Deve retornar seus amigos agora!
```

---

## 🎯 Fluxo Esperado (Funcionando)

**1. Usuário A segue Usuário B:**
```
/usuarios → Clicar "Seguir" no card de B
```

**2. Sistema insere na tabela amigos:**
```sql
INSERT INTO amigos (user_id, amigo_id, status)
VALUES ('A_ID', 'B_ID', 'aceito');  -- Follow direto!
```

**3. View retorna o relacionamento:**
```sql
SELECT * FROM amigos_aceitos WHERE user_id = 'A_ID';
-- Retorna: B_ID, nome de B, avatar de B
```

**4. Perfil mostra amigo:**
```
/perfil → Card "Amigos" → Mostra B com avatar e blocos
```

---

## 📊 Debugging Real-Time

**Console do servidor (app/perfil/page.tsx):**
```
[/perfil] Amigos retornados: 2
[/perfil] Dados dos amigos: [
  {
    "user_id": "abc-123",
    "amigo_id": "def-456",
    "amigo_nome": "João",
    "amigo_avatar": "https://...",
    "created_at": "2026-02-13..."
  },
  ...
]
```

**Se mostra "Amigos retornados: 0":**
- Ver Passo 1-5 acima
- Problema é na query OU na view OU nos dados

---

## 🚨 Se Ainda Não Funcionar

**Compartilhe:**
1. Resultado de `SELECT * FROM amigos WHERE user_id = 'SEU_ID';`
2. Resultado de `SELECT * FROM amigos_aceitos WHERE user_id = 'SEU_ID';`
3. Resultado de `SELECT COUNT(*) FROM usuarios;`
4. Screenshot do perfil (/perfil)
5. Logs do console do servidor

---

_Debug criado em: 13/02/2026 21:45_
