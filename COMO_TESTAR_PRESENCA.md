# 🧪 Como Testar Sistema de Presença Confirmada

**Problema relatado:** "Mesmo confirmando, avatar não aparece - fica 'ninguém confirmou ainda'"

**Fix implementado:** Sistema de atualização em tempo real + logs de debug

---

## 🚀 Passo 1: Deploy do Fix

**O Vercel já deve ter deployado automaticamente.**

Verificar: https://carnavlad.vercel.app

Se não deployou:
```bash
# Forçar redeploy no dashboard do Vercel
# OU
git commit --allow-empty -m "trigger deploy"
git push
```

---

## 🔍 Passo 2: Testar no Browser (COM Console Aberto)

### Abrir Console do Browser

**Chrome/Edge:**
- Apertar `F12` ou `Cmd+Opt+I` (Mac) ou `Ctrl+Shift+I` (Windows)
- Ir na aba "Console"

### Teste Passo a Passo

1. **Ir para o site:** https://carnavlad.vercel.app

2. **Clicar em "Entrar com Google"** (se não estiver logado)

3. **Clicar em qualquer evento no calendário**
   - Drawer deve abrir na lateral

4. **Scrollar até "Quem Vai"**
   - Deve mostrar spinner OU "Ninguém confirmou ainda"

5. **Scrollar mais até ver botão "Confirmar Presença"**
   - Botão amarelo/laranja

6. **Clicar em "Confirmar Presença"**

7. **OBSERVAR O CONSOLE:**
   ```
   [use-presenca] Toggle iniciado: { confirmado: false, ... }
   [use-presenca] Adicionando presença...
   [use-presenca] ✅ Presença confirmada! { id: "...", ... }
   [use-presenca] Disparando evento presenca-updated
   [QuemVai] Evento presenca-updated recebido: { eventoId: "...", ... }
   [QuemVai] Atualizando lista de usuários...
   [getUsuariosConfirmadosNoEvento] Buscando para evento: ...
   [getUsuariosConfirmadosNoEvento] Raw data: [...]
   [QuemVai] Total de usuários: 1
   ```

8. **VER O AVATAR APARECER IMEDIATAMENTE**
   - Antes do reload da página
   - Seu avatar + nome + email

9. **Página recarrega após 500ms**
   - Avatar continua lá

---

## ❌ Se NÃO Funcionar (Diagnóstico)

### Verificar no Console:

#### Caso 1: Erro de INSERT
```
[use-presenca] ❌ Error adding: { code: "...", ... }
```

**Causas possíveis:**
- RLS bloqueando INSERT
- Tabela presencas_confirmadas não existe
- Foreign key inválida (user_id ou evento_id)

**Solução:**
Rodar migration de debug (passo 3)

---

#### Caso 2: Query retorna vazio
```
[getUsuariosConfirmadosNoEvento] Total registros: 0
```

**Causas possíveis:**
- Tabela usuarios vazia (perfis não criados)
- Join falhando (usuario não existe)

**Solução:**
Rodar migration 012 (sync usuarios)

---

#### Caso 3: Erro na query
```
[getUsuariosConfirmadosNoEvento] ❌ Erro: { code: "...", ... }
```

**Causas possíveis:**
- RLS bloqueando SELECT
- Tabela não existe

**Solução:**
Rodar migrations 001 e 002

---

## 🛠️ Passo 3: Rodar Migration de Debug (Se Não Funcionar)

### No Supabase SQL Editor:

1. **Acessar:** https://supabase.com/dashboard/project/gsnrjesqmslmbykygzas/sql/new

2. **Copiar TODO conteúdo de:**
   ```
   blocos-carnaval/supabase/migrations/DEBUG_presencas.sql
   ```

3. **Colar no SQL Editor**

4. **Executar (RUN)**

5. **Verificar output:**
   ```
   === RESUMO DO DEBUG ===
   Presenças confirmadas: 0 (ou mais)
   Usuários autenticados (auth.users): 3
   Perfis públicos (usuarios): 3
   Eventos cadastrados: 429
   ```

6. **Se aparecer warning:**
   ```
   ⚠️  Há X usuários sem perfil público! Rodar migration 012.
   ```
   
   **Então rodar migration 012:**
   - Copiar `supabase/migrations/012_sync_usuarios.sql`
   - Colar no SQL Editor
   - Executar

---

## 📊 Passo 4: Verificar Dados no Supabase

### Table Editor → presencas_confirmadas

**Deve ter:**
- `id` (UUID)
- `user_id` (seu ID de auth.users)
- `evento_id` (ID do evento que clicou)
- `created_at` (timestamp)

**Se estiver vazio:**
- INSERT falhou
- Ver console para erro exato
- Verificar RLS policies

---

## ✅ Como Saber Se Funcionou?

### Checklist de Sucesso:

- [ ] Console mostra logs de debug
- [ ] Console mostra "✅ Presença confirmada!"
- [ ] Console mostra "QuemVai] Total de usuários: 1"
- [ ] Avatar aparece em "Quem Vai" ANTES do reload
- [ ] Página recarrega e avatar continua lá
- [ ] Table Editor mostra registro em presencas_confirmadas

---

## 🐛 Problemas Comuns & Soluções

### "Loading infinito no QuemVai"
**Causa:** Query falhando
**Solução:** Ver console, provavelmente RLS ou tabela vazia

### "Botão não aparece"
**Causa:** Componente não renderizando
**Solução:** Scrollar até o fim do drawer

### "Erro ao confirmar"
**Causa:** RLS ou foreign key
**Solução:** Rodar DEBUG_presencas.sql e ler output

### "Avatar não aparece mesmo com INSERT ok"
**Causa:** Tabela usuarios vazia (perfil não criado)
**Solução:** Rodar migration 012

---

## 📹 Video de Como Deve Funcionar

1. Abrir evento → Drawer abre
2. Ver "Ninguém confirmou ainda"
3. Clicar "Confirmar Presença"
4. **IMEDIATAMENTE** ver seu avatar aparecer
5. Nome + email aparecem
6. Página recarrega (500ms depois)
7. Avatar continua lá

**Tempo total:** < 1 segundo

---

## 🆘 Se Nada Funcionar

**Compartilhe:**
1. Screenshot do console (logs completos)
2. Screenshot do Table Editor (presencas_confirmadas)
3. Output do DEBUG_presencas.sql
4. Seu user_id (primeiro UUID em auth.users)

---

_Fix implementado em: 13/02/2026 22:00_  
_Commit: cd8344d_  
_Branch: main_
