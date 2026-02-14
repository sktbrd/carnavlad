import { createClient } from '@/lib/supabase/server'
import { getTodosUsuarios } from '@/lib/supabase/queries'
import { DiretorioUsuarios } from '@/components/usuarios/diretorio-usuarios'
import { redirect } from 'next/navigation'

export const metadata = {
  title: 'Usuários - Carnavlad',
  description: 'Encontre outros foliões e veja quem vai nos blocos',
}

export default async function UsuariosPage() {
  const supabase = await createClient()

  if (!supabase) {
    redirect('/login')
  }

  // Verificar se está logado
  const {
    data: { user },
  } = await supabase.auth.getUser()

  if (!user) {
    redirect('/login')
  }

  // Buscar todos os usuários
  const usuarios = await getTodosUsuarios(supabase)

  return (
    <div className="container mx-auto px-4 py-8 max-w-4xl">
      <div className="mb-6">
        <h1 className="text-3xl font-bold mb-2">🎭 Foliões</h1>
        <p className="text-muted-foreground">
          Encontre outros foliões e veja quem vai nos mesmos blocos que você
        </p>
      </div>

      <DiretorioUsuarios usuarios={usuarios} currentUserId={user.id} />
    </div>
  )
}
