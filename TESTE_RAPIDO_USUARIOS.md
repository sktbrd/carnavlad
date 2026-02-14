# 🧪 Teste Rápido - Sistema de Usuários

## ⚡ Quick Start (5 minutos)

### 1️⃣ Rodar Migrations (SE AINDA NÃO RODOU)

```bash
# Acesse Supabase Dashboard
https://supabase.com/dashboard/project/gsnrjesqmslmbykygzas/sql/new

# Cole e execute cada migration (NA ORDEM):
# 1. supabase/migrations/001_create_tables.sql
# 2. supabase/migrations/002_rls_policies.sql
# 3. supabase/migrations/003_seed_data.sql
```

**Verificar se funcionou:**
- Table Editor → `blocos` (10 registros)
- Table Editor → `usuarios` (vazio, será preenchido no login)
- Table Editor → `amigos` (vazio)

---

### 2️⃣ Iniciar App Local

```bash
cd blocos-carnaval
pnpm dev -p 3456
```

Abrir: http://localhost:3456

---

### 3️⃣ Testar Diretório de Usuários

**Cenário 1: Não logado**

1. Clicar em "Foliões" (👥) no header
2. **Deve redirecionar para `/login`**

**Cenário 2: Logado (primeira vez)**

1. Fazer login com Google
2. Clicar em "Foliões" no header
3. **Deve ver apenas mensagem "Nenhum folião encontrado"**
4. **Motivo:** Você é o único usuário!

**Cenário 3: Logado (segundo usuário)**

1. Abrir aba anônima
2. Logar com outro email Google
3. Agora ambas as abas devem ver 1 folião
4. Clicar em "Seguir"
5. Botão muda para "Seguindo" ✅

---

### 4️⃣ Testar "Quem Vai"

**Cenário 1: Bloco sem confirmações**

1. Home → Clicar em um bloco
2. Rolar até sidebar → Ver "Quem vai"
3. **Deve mostrar:** "Seja o primeiro a confirmar presença! 🎭"

**Cenário 2: Confirmar presença**

1. Clicar em "Confirmar Presença" (coração)
2. Recarregar página (F5)
3. Seção "Quem vai" deve mostrar:
   - Seu avatar
   - Seu nome
   - Seu email
   - **SEM botão de seguir** (você mesmo)

**Cenário 3: Ver outros confirmados**

1. Abrir aba anônima
2. Logar com outro email
3. Ir no mesmo bloco
4. Confirmar presença
5. Agora ambos os usuários aparecem em "Quem vai"
6. Cada um vê botão "Seguir" ao lado do outro

---

### 5️⃣ Testar Busca

**No diretório `/usuarios`:**

1. Digite parte de um nome → Filtra instantaneamente
2. Digite parte de um email → Filtra instantaneamente
3. Digite "xxx" → Mostra "Nenhum folião encontrado"
4. Limpar busca → Volta a mostrar todos

---

## ✅ Checklist de Funcionalidades

### Diretório de Usuários

- [ ] Redireciona para login se não autenticado
- [ ] Mostra todos os usuários (exceto você)
- [ ] Busca filtra por nome E email
- [ ] Contador "X foliões" correto
- [ ] Botão "Seguir" funciona
- [ ] Botão muda para "Seguindo" após clicar
- [ ] Clicar novamente desfaz o follow

### Quem Vai (Página de Evento)

- [ ] Mostra "Seja o primeiro" quando vazio
- [ ] Atualiza após confirmar presença (recarregar)
- [ ] Mostra avatar + nome + email
- [ ] Não mostra botão "Seguir" para você mesmo
- [ ] Mostra botão para outros usuários
- [ ] Scroll funciona quando muitos usuários
- [ ] Contador "Quem vai (X)" correto

### Botão de Seguir

- [ ] Mostra spinner enquanto carrega
- [ ] Estado "Seguir" correto
- [ ] Estado "Seguindo" correto
- [ ] Toggle funciona (seguir → seguindo → não seguir)
- [ ] Ícones corretos (UserPlus / UserMinus)

---

## 🐛 Problemas Comuns

### "relation blocos does not exist"
❌ **Causa:** Migrations não rodadas  
✅ **Solução:** Rodar migrations 001, 002, 003

### "Nenhum folião encontrado" (sempre)
❌ **Causa:** Tabela `usuarios` vazia  
✅ **Solução:** 
1. Fazer login com Google
2. Verificar Table Editor → `usuarios` → Deve ter seu registro
3. Se não tiver, verificar trigger da migration 002

### "Erro ao seguir usuário"
❌ **Causa:** Tabela `amigos` não existe  
✅ **Solução:** Rodar migration 002

### "Quem Vai" não aparece
❌ **Causa:** `eventoId` não é UUID válido (usando slug)  
✅ **Solução:** 
- Precisa de evento REAL do banco (não mock)
- Rodar migrations primeiro
- Verificar se `evento_id` é UUID

### Botão de seguir não muda estado
❌ **Causa:** Query `isSeguindo()` retornando erro  
✅ **Solução:** 
1. Abrir console do browser (F12)
2. Ver erro exato
3. Verificar se tabela `amigos` existe
4. Verificar RLS policies

---

## 🎯 Teste Completo (Fluxo Real)

**Simular 2 usuários combinando de ir no mesmo bloco:**

### Usuário A (você)

1. Login com seu Google
2. Home → Procurar "Cordão da Bola Preta"
3. Clicar no bloco → Ver detalhes
4. Confirmar presença (❤️)
5. Ver seu nome em "Quem vai (1)"

### Usuário B (aba anônima)

1. Login com outro Google
2. Home → Procurar "Cordão da Bola Preta"
3. Clicar no bloco → Ver detalhes
4. Ver "Quem vai (1)" → Ver Usuário A
5. Clicar em "Seguir" ao lado do nome
6. Confirmar presença (❤️)
7. Agora "Quem vai (2)"

### De volta no Usuário A

1. Recarregar página
2. Ver "Quem vai (2)"
3. Ver Usuário B na lista
4. Ver "Seguindo" (porque B te seguiu)
5. Clicar em "Foliões" no header
6. Ver Usuário B na lista
7. Verificar estado do botão (Seguindo ou Seguir)

---

## 📊 Verificar no Supabase

### Tabela `presencas_confirmadas`

Após confirmar presença, deve ter:

```sql
SELECT * FROM presencas_confirmadas;
```

| user_id | evento_id | created_at |
|---------|-----------|------------|
| uuid-A  | uuid-1    | 2026-02-13 |
| uuid-B  | uuid-1    | 2026-02-13 |

### Tabela `amigos`

Após seguir, deve ter:

```sql
SELECT * FROM amigos;
```

| user_id | amigo_id | status | created_at |
|---------|----------|--------|------------|
| uuid-B  | uuid-A   | aceito | 2026-02-13 |

---

## 🚀 Pronto para Produção?

Antes de fazer deploy:

- [ ] Todas as migrations rodadas no Supabase de produção
- [ ] Seed data carregado (10 blocos)
- [ ] Auth Google funcionando
- [ ] Env vars corretos no Vercel
- [ ] Testar localmente com dados reais
- [ ] Verificar RLS policies (segurança)

---

_Divirta-se testando! 🎭🎊_
