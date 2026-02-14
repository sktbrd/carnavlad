# 👥 Sistema de Usuários - Carnavlad

## ✅ O Que Foi Implementado

### 1. **Diretório de Usuários** (`/usuarios`)

**Página:** `app/usuarios/page.tsx`  
**Componente:** `components/usuarios/diretorio-usuarios.tsx`

**Features:**
- ✅ Lista todos os usuários cadastrados
- ✅ Busca por nome ou email
- ✅ Botão de seguir/deixar de seguir ao lado de cada usuário
- ✅ Contador de foliões encontrados
- ✅ Design responsivo e acessível

**Como acessar:**
- Link no header: "Foliões" (👥)
- URL direta: `https://carnavlad.vercel.app/usuarios`

---

### 2. **"Quem Vai" nas Páginas de Evento**

**Componente:** `components/usuarios/quem-vai.tsx`

**Features:**
- ✅ Mostra usuários confirmados em cada bloco
- ✅ Avatar + nome + email
- ✅ Botão de seguir ao lado de cada pessoa
- ✅ Contador "Quem vai (X)"
- ✅ Scroll automático quando muitas pessoas
- ✅ Empty state bonito ("Seja o primeiro!")

**Onde aparece:**
- Na sidebar da página de detalhes do evento
- Logo abaixo do card de informações

---

### 3. **Botão de Seguir**

**Componente:** `components/usuarios/botao-seguir.tsx`

**Features:**
- ✅ Detecta automaticamente se já está seguindo
- ✅ Toggle: Seguir ↔ Seguindo
- ✅ Estados: Loading, Seguir, Seguindo
- ✅ Variantes: default, outline, ghost
- ✅ Tamanhos: sm, default, lg
- ✅ Com/sem label

**Uso:**
```tsx
<BotaoSeguir
  userId={currentUserId}
  targetUserId={targetUserId}
  variant="default"
  size="sm"
  showLabel={true}
/>
```

---

## 🗂️ Arquivos Criados/Modificados

### Novos Arquivos

```
app/
└── usuarios/
    └── page.tsx                          # Página de diretório

components/
└── usuarios/
    ├── diretorio-usuarios.tsx            # Lista com busca
    ├── quem-vai.tsx                      # Confirmados no evento
    └── botao-seguir.tsx                  # Botão de seguir/seguindo
```

### Arquivos Modificados

```
lib/supabase/queries.ts                   # +3 queries
  - getTodosUsuarios()
  - getUsuariosConfirmadosNoEvento()
  - isSeguindo()

app/evento/[slug]/page.tsx                # +QuemVai na sidebar

components/header.tsx                     # +Link para /usuarios
```

---

## 📊 Queries Adicionadas

### `getTodosUsuarios(supabase)`
Busca todos os usuários ordenados por nome.

**Retorna:**
```typescript
Array<{
  id: string
  nome: string
  email: string
  avatar_url?: string
}>
```

---

### `getUsuariosConfirmadosNoEvento(supabase, eventoId)`
Busca usuários que confirmaram presença em um evento específico.

**Retorna:**
```typescript
Array<{
  id: string
  nome: string
  email: string
  avatar_url?: string
}>
```

---

### `isSeguindo(supabase, userId, amigoId)`
Verifica se o usuário está seguindo outro.

**Retorna:** `boolean`

---

## 🎯 Como Testar

### 1. **Diretório de Usuários**

```bash
# Local
http://localhost:3456/usuarios

# Produção
https://carnavlad.vercel.app/usuarios
```

**Fluxo:**
1. Fazer login com Google
2. Clicar em "Foliões" (👥) no header
3. Ver lista de todos os usuários
4. Buscar por nome ou email
5. Clicar em "Seguir" em algum usuário
6. Botão muda para "Seguindo"

---

### 2. **Quem Vai nos Eventos**

**Fluxo:**
1. Ir na home
2. Clicar em um bloco
3. Na página de detalhes, rolar até a sidebar
4. Ver seção "Quem vai (X)"
5. Se ninguém confirmou, ver mensagem "Seja o primeiro!"
6. Clicar em "Confirmar Presença"
7. Seção "Quem vai" deve atualizar automaticamente
8. Ver seu nome/avatar na lista
9. Ver botão de seguir ao lado de outros usuários

---

### 3. **Botão de Seguir**

**Estados possíveis:**

| Estado | Ícone | Texto | Variante |
|--------|-------|-------|----------|
| Loading | Spinner | - | disabled |
| Não seguindo | UserPlus | "Seguir" | default |
| Seguindo | UserMinus | "Seguindo" | outline |

---

## 🗄️ Dependências do Banco

### Tabelas Necessárias

1. **`usuarios`** (já existe)
   - id, nome, email, avatar_url

2. **`eventos`** (já existe)
   - id, bloco_id, data, horario, local_id

3. **`presencas_confirmadas`** (já existe)
   - user_id, evento_id

4. **`amigos`** (precisa rodar migration)
   - user_id, amigo_id, status

### ⚠️ IMPORTANTE: Rodar Migrations

Antes de testar, **RODE AS MIGRATIONS**:

```sql
-- Ver arquivo: supabase/migrations/002_rls_policies.sql
```

Especificamente a tabela `amigos`:

```sql
CREATE TABLE IF NOT EXISTS amigos (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES usuarios(id) ON DELETE CASCADE,
  amigo_id UUID NOT NULL REFERENCES usuarios(id) ON DELETE CASCADE,
  status VARCHAR(20) NOT NULL DEFAULT 'aceito', -- 'pendente' ou 'aceito'
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(user_id, amigo_id)
);
```

**Nota:** O sistema atual usa `status='aceito'` por padrão (follow direto, sem aprovação).

Se quiser sistema de aprovação, trocar em `queries.ts`:

```typescript
// De:
status: 'pendente'

// Para:
status: 'aceito'
```

---

## 🚀 Próximos Passos

### Features Futuras

1. **Sistema de Aprovação de Amizade**
   - Pedidos pendentes
   - Aceitar/Rejeitar
   - Notificações

2. **Perfil de Usuário**
   - Ver perfil de outros foliões
   - Blocos em comum
   - Amigos em comum
   - Fotos e relatos

3. **Badges e Gamificação**
   - "Maratonista" (10+ blocos)
   - "Socialite" (50+ amigos)
   - "Pioneiro" (primeiro a confirmar)

4. **Feed Social**
   - Ver updates de amigos
   - "Vlad confirmou presença no Cordão da Bola Preta"
   - Comentários e reações

5. **Chat/Mensagens**
   - Combinar encontros
   - Grupos de bloco
   - Chat ao vivo durante o evento

6. **Recomendações Inteligentes**
   - "Amigos que você talvez conheça"
   - Baseado em blocos em comum
   - Baseado em localização

---

## 🎨 Componentes UI

### Design System

**Cores:**
- Primary: Purple/Pink/Orange gradient
- Accent: Yellow (#fbbf24)
- Background: White/Muted
- Text: Foreground/Muted-foreground

**Componentes Shadcn/UI:**
- Button
- Input
- Avatar
- Card
- Badge

---

## 📱 Responsividade

### Breakpoints

- **Mobile:** < 768px
  - Stack vertical
  - Botões full-width
  - Busca abaixo do header

- **Tablet:** 768px - 1024px
  - Grid 2 colunas
  - Sidebar sticky

- **Desktop:** > 1024px
  - Grid 3 colunas (eventos)
  - Sidebar fixa
  - Link "Foliões" visível no header

---

## 🐛 Troubleshooting

### "Erro ao buscar usuários"

**Causa:** Tabela `usuarios` não existe ou RLS bloqueando.  
**Solução:** Rodar migration 001 e 002.

### "Erro ao seguir usuário"

**Causa:** Tabela `amigos` não existe.  
**Solução:** Rodar migration 002.

### "Quem Vai" vazio mesmo com confirmações

**Causa:** Query retornando vazio ou eventoId incorreto.  
**Solução:** 
1. Verificar console do browser (F12)
2. Verificar se `eventoId` é UUID válido
3. Verificar se join `usuarios` está correto

### Botão de seguir não muda estado

**Causa:** Query `isSeguindo()` falhando.  
**Solução:** Verificar console e tabela `amigos`.

---

## 📊 Métricas a Trackear

### Engajamento

- **Taxa de follow:** % de usuários que seguem pelo menos 1 pessoa
- **Média de follows por usuário**
- **Blocos com mais confirmações**
- **Usuários mais seguidos**

### Conversão

- **Diretório → Follow:** Taxa de conversão na página /usuarios
- **Evento → Follow:** Taxa de follow na seção "Quem Vai"

---

## 🎉 Resultado Final

**Agora o Carnavlad tem:**

✅ Diretório de usuários com busca  
✅ "Quem vai" em cada bloco  
✅ Sistema de follows simples  
✅ UI bonita e responsiva  
✅ Integração completa com Supabase  

**Próximo grande milestone:**
- 🔔 Notificações quando amigos confirmam blocos
- 💬 Sistema de mensagens
- 🎯 Recomendações inteligentes

---

_Última atualização: 2026-02-13 21:15 GMT-3_
