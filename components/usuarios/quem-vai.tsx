'use client'

import { useEffect, useState } from 'react'
import { createClient } from '@/lib/supabase/client'
import { getUsuariosConfirmadosNoEvento } from '@/lib/supabase/queries'
import { BotaoSeguir } from './botao-seguir'
import { Avatar, AvatarFallback, AvatarImage } from '@/components/ui/avatar'
import { Users } from 'lucide-react'

interface Usuario {
  id: string
  nome: string
  email: string
  avatar_url?: string
}

interface QuemVaiProps {
  eventoId: string
  currentUserId?: string
}

export function QuemVai({ eventoId, currentUserId }: QuemVaiProps) {
  const [usuarios, setUsuarios] = useState<Usuario[]>([])
  const [loading, setLoading] = useState(true)
  useEffect(() => {
    async function fetchUsuarios() {
      const supabase = createClient()
      if (!supabase) {
        setLoading(false)
        return
      }
      const data = await getUsuariosConfirmadosNoEvento(supabase, eventoId)
      setUsuarios((data ?? []).flat() as Usuario[])
      setLoading(false)
    }
    fetchUsuarios()
  }, [eventoId])

  if (loading) {
    return (
      <div className="animate-pulse space-y-2">
        <div className="h-4 w-32 bg-muted rounded" />
        <div className="h-12 bg-muted rounded" />
      </div>
    )
  }

  if (usuarios.length === 0) {
    return (
      <div className="text-center py-12">
        <div className="bg-gradient-to-br from-primary/10 to-primary/5 rounded-full h-24 w-24 mx-auto mb-4 flex items-center justify-center">
          <Users className="h-12 w-12 text-primary/40" />
        </div>
        <p className="text-lg font-semibold mb-1">Ninguém confirmou ainda</p>
        <p className="text-sm text-muted-foreground">Seja o primeiro a confirmar presença! 🎭</p>
      </div>
    )
  }

  return (
    <div className="space-y-4">
      <div className="flex items-center justify-between">
        <div className="flex items-center gap-2 text-sm font-semibold">
          <Users className="h-5 w-5 text-primary" />
          <span className="text-lg">Quem vai</span>
        </div>
        <span className="text-2xl font-bold text-primary">{usuarios.length}</span>
      </div>

      <div className="space-y-2 max-h-96 overflow-y-auto">
        {usuarios.map((usuario) => (
          <div
            key={usuario.id}
            className="flex items-center justify-between gap-3 p-3 rounded-xl bg-gradient-to-r from-primary/5 to-primary/10 hover:from-primary/10 hover:to-primary/15 border border-primary/20 transition-all hover:shadow-md"
          >
            <div className="flex items-center gap-3 min-w-0 flex-1">
              <Avatar className="h-12 w-12 border-2 border-primary/30">
                <AvatarImage src={usuario.avatar_url} alt={usuario.nome} />
                <AvatarFallback className="bg-primary text-primary-foreground font-bold">
                  {usuario.nome?.charAt(0).toUpperCase() || '?'}
                </AvatarFallback>
              </Avatar>

              <div className="min-w-0 flex-1">
                <p className="font-semibold truncate">{usuario.nome}</p>
                <p className="text-xs text-muted-foreground truncate">
                  {usuario.email}
                </p>
              </div>
            </div>

            {currentUserId && (
              <BotaoSeguir
                userId={currentUserId}
                targetUserId={usuario.id}
                variant="outline"
                size="sm"
                showLabel={false}
              />
            )}
          </div>
        ))}
      </div>
    </div>
  )
}
