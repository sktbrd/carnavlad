# 🚀 Deploy - Sistema de Usuários

## ✅ O Que Está Pronto

Código completo implementado:
- ✅ Diretório de usuários (`/usuarios`)
- ✅ "Quem Vai" nas páginas de evento  
- ✅ Botão de seguir/deixar de seguir
- ✅ 3 queries novas (getTodosUsuarios, getUsuariosConfirmadosNoEvento, isSeguindo)
- ✅ Link "Foliões" (👥) no header
- ✅ Servidor local rodando: http://localhost:3456

---

## 📋 Passo a Passo para Deploy

### 1️⃣ Verificar/Rodar Migration 010 no Supabase

A migration 010 já tem TUDO que você precisa (incluindo tabela `amigos`).

**URL:** https://supabase.com/dashboard/project/gsnrjesqmslmbykygzas/sql/new

**Verificar se já foi rodada:**

```sql
SELECT COUNT(*) FROM amigos;
```

**Se der erro "relation amigos does not exist":**

1. Abrir: `blocos-carnaval/supabase/migrations/010_fix_missing_tables.sql`
2. Copiar TODO o conteúdo
3. Colar no SQL Editor
4. Clicar em "Run"
5. Aguardar ~10 segundos

**Resultado esperado:**

```
✅ Migration 010 concluída - Tabelas verificadas/criadas
   - blocos
   - eventos
   - usuarios
   - presencas_confirmadas ✅
   - amigos
   - bairros
   - noticias
```

---

### 2️⃣ Testar Local (no seu browser)

**Abra:** http://localhost:3456

#### Teste 1: Link "Foliões"
1. Ver se aparece "👥 Foliões" no header (desktop)
2. Clicar nele
3. **Deve redirecionar para /login** (se não estiver logado)

#### Teste 2: Login
1. Fazer login com Google
2. Deve voltar pra home
3. Clicar novamente em "Foliões"
4. **Deve mostrar página de diretório**
5. Se você for o único usuário → "Nenhum folião encontrado"

#### Teste 3: "Quem Vai"
1. Home → Clicar em um bloco qualquer
2. Página de detalhes → Rolar até sidebar (direita)
3. Deve ver seção "Quem vai"
4. Se ninguém confirmou → "Seja o primeiro a confirmar presença! 🎭"
5. Clicar em "Confirmar Presença" (❤️)
6. Recarregar página (F5)
7. **Deve ver seu nome em "Quem vai (1)"**

#### Teste 4: Seguir (com 2 usuários)
1. Abrir aba anônima
2. Login com outro Google
3. Ir no mesmo bloco
4. Confirmar presença
5. Ver "Quem vai (2)" → Ver o outro usuário
6. Clicar em "Seguir" ao lado do nome
7. **Botão muda para "Seguindo" ✅**

---

### 3️⃣ Deploy para Produção

**Commit e push:**

```bash
cd blocos-carnaval

git add -A

git commit -m "feat: sistema de usuários completo

- Diretório de usuários (/usuarios) com busca
- Quem vai nos eventos (sidebar)
- Sistema de follows (follow direto, sem aprovação)
- Link Foliões no header
- 3 queries novas
- Componentes: DiretorioUsuarios, QuemVai, BotaoSeguir"

git push origin main
```

**Aguardar deploy no Vercel:**
- Vercel detecta push automaticamente
- Build leva ~2-3 minutos
- URL: https://carnavlad.vercel.app

---

### 4️⃣ Testar em Produção

**URL:** https://carnavlad.vercel.app

Repetir os testes 1-4 acima na URL de produção.

**Importante:** 
- Se a migration 010 NÃO foi rodada no Supabase, vai dar erro
- Rodar migration ANTES de testar em produção

---

## 🐛 Troubleshooting

### "relation amigos does not exist"

**Causa:** Migration 010 não foi rodada.  
**Solução:** Rodar migration 010 no Supabase (passo 1 acima).

### "Quem Vai" não aparece

**Causa:** `eventoId` não é UUID válido (está usando slug).  
**Explicação:** "Quem Vai" só aparece quando o evento vem do banco (UUID válido). Mock data não funciona.  
**Solução:** Rodar migrations 001-010 para ter eventos reais no banco.

### Diretório sempre vazio

**Causa:** Você é o único usuário.  
**Solução:** Fazer login com outro Google (aba anônima).

### Botão de seguir não funciona

**Verificar:**
1. Console do browser (F12) → Ver erros
2. Tabela `amigos` existe no Supabase
3. RLS policies corretas (migration 002)

---

## 📊 Verificar no Supabase Após Testar

### Tabela `usuarios`

```sql
SELECT * FROM usuarios;
```

Deve ter pelo menos 1 registro (você).

### Tabela `presencas_confirmadas`

```sql
SELECT 
  pc.id,
  u.nome as usuario,
  e.bloco_id,
  pc.created_at
FROM presencas_confirmadas pc
JOIN usuarios u ON pc.user_id = u.id
JOIN eventos e ON pc.evento_id = e.id
ORDER BY pc.created_at DESC
LIMIT 10;
```

Deve mostrar suas confirmações.

### Tabela `amigos`

```sql
SELECT 
  a.id,
  u1.nome as seguidor,
  u2.nome as seguindo,
  a.status,
  a.created_at
FROM amigos a
JOIN usuarios u1 ON a.user_id = u1.id
JOIN usuarios u2 ON a.amigo_id = u2.id
ORDER BY a.created_at DESC;
```

Deve mostrar os follows (status='aceito').

---

## ✨ Features Implementadas

| Feature | Status | Arquivo |
|---------|--------|---------|
| Diretório de usuários | ✅ | `app/usuarios/page.tsx` |
| Busca de usuários | ✅ | `components/usuarios/diretorio-usuarios.tsx` |
| "Quem Vai" nos eventos | ✅ | `components/usuarios/quem-vai.tsx` |
| Botão de seguir | ✅ | `components/usuarios/botao-seguir.tsx` |
| Link no header | ✅ | `components/header.tsx` |
| Queries | ✅ | `lib/supabase/queries.ts` (+3) |

---

## 📝 Próximas Features (Futuro)

- [ ] Perfil de usuário público
- [ ] Sistema de aprovação de amizade (opcional)
- [ ] Notificações quando amigos confirmam blocos
- [ ] Feed social ("Vlad confirmou presença em...")
- [ ] Blocos em comum entre amigos
- [ ] Chat/Mensagens

---

_Bora deployar! 🎭🚀_
