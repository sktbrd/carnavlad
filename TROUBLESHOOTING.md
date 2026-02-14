# 🔧 Troubleshooting: Tabelas Faltando

## 🚨 Erro Comum

```
ERROR: 42P01: relation "presencas_confirmadas" does not exist
```

**Causa:** A tabela `presencas_confirmadas` não foi criada. Isso significa que a migration 001 não rodou completamente ou teve erro.

---

## ✅ SOLUÇÃO RÁPIDA

### Passo 1: Verificar Quais Tabelas Existem

No Supabase SQL Editor, rode:

```sql
-- Cole o conteúdo de:
-- supabase/check-tables.sql
```

**Output esperado:**
```
✅ blocos
✅ eventos
✅ usuarios
❌ presencas_confirmadas 🎯  ← FALTANDO!
✅ amigos
✅ bairros
✅ noticias
```

### Passo 2: Rodar Migration de Fix

No Supabase SQL Editor, rode:

```sql
-- Cole o conteúdo de:
-- supabase/migrations/010_fix_missing_tables.sql
-- Clique em "Run"
```

**Resultado:**
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

### Passo 3: Verificar Novamente

Rode `check-tables.sql` de novo. Agora tudo deve estar ✅

---

## 📋 ORDEM CORRETA DAS MIGRATIONS

Se você está começando do zero, rode nesta ordem:

```
1. 001_create_tables.sql          ← Tabelas principais
2. 002_rls_policies.sql            ← Políticas de segurança
3. 003_seed_data.sql               ← Dados de teste (opcional)
4. 004_add_extra_fields.sql        ← Campos extras (tipo, publico, etc)
5. 005_import_bairros.sql          ← 84 bairros
6. 006_import_blocos_eventos.sql   ← 430 blocos da API
7. 007_create_noticias.sql         ← Tabela de notícias
8. 008_add_bloco_fields.sql        ← Campos foto, ano, site
9. 009_add_username.sql            ← Username único
10. 010_fix_missing_tables.sql     ← Fix de tabelas faltando (se necessário)
```

**Nota:** Se 001 rodou corretamente, você NÃO precisa rodar 010.

---

## 🔍 DIAGNÓSTICO COMPLETO

### Verificar Todas as Migrations Rodadas

```sql
-- Verificar histórico de migrations (se Supabase CLI local)
SELECT * FROM supabase_migrations.schema_migrations;

-- Ou verificar tabelas manualmente
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public' 
ORDER BY table_name;
```

### Verificar RLS (Row Level Security)

```sql
-- Ver políticas de presencas_confirmadas
SELECT tablename, policyname, permissive, roles, cmd 
FROM pg_policies 
WHERE tablename = 'presencas_confirmadas';
```

---

## 🚧 PROBLEMAS COMUNS

### 1. "relation does not exist"
**Causa:** Tabela não foi criada  
**Solução:** Rodar migration 010_fix_missing_tables.sql

### 2. "permission denied for table"
**Causa:** RLS bloqueando acesso  
**Solução:** Verificar migration 002_rls_policies.sql

### 3. "duplicate key value violates unique constraint"
**Causa:** Tentando inserir registro duplicado  
**Solução:** Normal - constraint funcionando

### 4. "foreign key constraint violation"
**Causa:** Tabela referenciada não existe ou ID inválido  
**Solução:** Verificar se tabelas blocos/eventos/usuarios existem

---

## 📊 VERIFICAR DADOS

### Contar Registros

```sql
-- Blocos
SELECT COUNT(*) FROM blocos;
-- Esperado: ~411 (se rodou migration 006)

-- Eventos
SELECT COUNT(*) FROM eventos;
-- Esperado: ~440 (se rodou migration 006)

-- Usuários
SELECT COUNT(*) FROM usuarios;
-- Esperado: 1+ (usuários que fizeram login)

-- Presenças Confirmadas
SELECT COUNT(*) FROM presencas_confirmadas;
-- Esperado: 0+ (depende de uso)
```

### Ver Estrutura da Tabela

```sql
-- Ver colunas de presencas_confirmadas
SELECT 
  column_name, 
  data_type, 
  is_nullable,
  column_default
FROM information_schema.columns 
WHERE table_name = 'presencas_confirmadas';
```

**Esperado:**
```
id            | uuid      | NO  | uuid_generate_v4()
user_id       | uuid      | YES | NULL
evento_id     | uuid      | YES | NULL
created_at    | timestamp | YES | now()
```

---

## 🔄 RESETAR TUDO (Último Recurso)

**⚠️ ATENÇÃO: Isso apaga TODOS os dados!**

```sql
-- Apagar todas as tabelas
DROP TABLE IF EXISTS comentarios CASCADE;
DROP TABLE IF EXISTS contribuicoes CASCADE;
DROP TABLE IF EXISTS amigos CASCADE;
DROP TABLE IF EXISTS presencas_confirmadas CASCADE;
DROP TABLE IF EXISTS noticias CASCADE;
DROP TABLE IF EXISTS eventos CASCADE;
DROP TABLE IF EXISTS blocos CASCADE;
DROP TABLE IF EXISTS bairros CASCADE;
DROP TABLE IF EXISTS usuarios CASCADE;

-- Agora rode as migrations de novo, em ordem (001-010)
```

---

## ✅ CHECKLIST PÓS-FIX

Após rodar migration 010, verificar:

- [ ] `check-tables.sql` mostra todas ✅
- [ ] `SELECT * FROM presencas_confirmadas` funciona (pode estar vazia)
- [ ] App não dá erro 42P01
- [ ] Consegue confirmar presença em bloco
- [ ] Bloco aparece em /perfil

---

## 📝 LOGS ÚTEIS

### No Browser Console (F12)

```javascript
// Confirmar presença
[use-presenca] Adicionando presença: { userId: "...", eventoId: "..." }
[use-presenca] ✅ Presença confirmada com sucesso

// Ver blocos confirmados
[blocos-confirmados] Presenças encontradas: 1
[blocos-confirmados] ✅ Eventos carregados: 1
```

### No Supabase Logs (Dashboard → Logs)

Procure por:
- `INSERT INTO presencas_confirmadas`
- `SELECT FROM presencas_confirmadas`
- Erros 42P01

---

## 🎯 RESUMO

**Erro:** `relation "presencas_confirmadas" does not exist`

**Fix em 3 passos:**
1. Rode `check-tables.sql` → Veja o que falta
2. Rode `010_fix_missing_tables.sql` → Cria tabelas faltando
3. Rode `check-tables.sql` de novo → Confirma que tudo está ✅

**Pronto!** ✅

---

_Criado: 2026-02-13 15:20 GMT-3_
