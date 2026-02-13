# 🗄️ Supabase Setup Guide

## 1. Criar Projeto

1. Acesse [supabase.com](https://supabase.com)
2. Clique em "New Project"
3. Preencha:
   - **Name:** blocos-carnaval-rio
   - **Database Password:** (salve em lugar seguro)
   - **Region:** South America (São Paulo) - mais próximo do Rio
4. Aguarde ~2min

## 2. Executar Schema

1. No dashboard do projeto, vá em **SQL Editor** (ícone 📝 na sidebar)
2. Clique em "New Query"
3. Cole o conteúdo do arquivo `supabase/schema.sql`
4. Clique em **RUN** (ou Cmd/Ctrl + Enter)
5. Deve aparecer "Success. No rows returned"

## 3. Executar Seed

1. Ainda no SQL Editor, crie outra "New Query"
2. Cole o conteúdo de `supabase/seed.sql`
3. RUN
4. Deve aparecer "Success" com os blocos inseridos

## 4. Verificar Dados

1. Vá em **Table Editor** (ícone 📊)
2. Você deve ver as tabelas:
   - `blocos` (17 blocos de exemplo)
   - `eventos` (19 eventos de exemplo)
   - `contribuicoes` (vazio)
   - `comentarios` (vazio)

## 5. Copiar Env Vars

1. Vá em **Project Settings** (ícone ⚙️) → **API**
2. Copie as duas chaves:
   - **Project URL** → `NEXT_PUBLIC_SUPABASE_URL`
   - **anon/public key** → `NEXT_PUBLIC_SUPABASE_ANON_KEY`

## 6. Configurar .env.local

Crie `.env.local` na raiz do projeto:

```env
NEXT_PUBLIC_SUPABASE_URL=https://seu-projeto.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=sua-chave-anon-aqui
```

## 7. Instalar Supabase Client

```bash
pnpm add @supabase/supabase-js
```

## 8. Criar Cliente Supabase

Já está pronto em `lib/supabase.ts` (será criado no próximo passo).

## 9. Conectar no Hook

Atualizar `lib/hooks/use-blocos.ts` para buscar do Supabase ao invés de mock.

---

## Próximos Passos (Depois do MVP)

### Storage (Fotos)

1. **Storage** → Create bucket
2. Nome: `blocos-fotos`
3. Public: ✅
4. File size limit: 5MB

### Auth (Google Login)

1. **Authentication** → Providers
2. Ativar Google
3. Configurar OAuth credentials no Google Cloud Console
4. Copiar Client ID/Secret

---

## Custos (Free Tier)

✅ 500MB Database
✅ 1GB Storage
✅ 50MB File Uploads
✅ 2GB Bandwidth/mês
✅ 50,000 MAU (Monthly Active Users)

**Conclusão:** Perfeito pro MVP e primeiros meses! 🎉
