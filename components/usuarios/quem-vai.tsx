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
  const supabase = createClient()

  useEffect(() => {
    async function fetchUsuarios() {
      const data = await getUsuariosConfirmadosNoEvento(supabase, eventoId)
      setUsuarios(data as Usuario[])
      setLoading(false)
    }
    fetchUsuarios()
  }, [eventoId, supabase])

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
      <div className="text-center py-8 text-muted-foreground">
        <Users className="h-12 w-12 mx-auto mb-2 opacity-20" />
        <p className="text-sm">Seja o primeiro a confirmar presença! 🎭</p>
      </div>
    )
  }

  return (
    <div className="space-y-3">
      <div className="flex items-center gap-2 text-sm font-semibold">
        <Users className="h-4 w-4" />
        <span>Quem vai ({usuarios.length})</span>
      </div>

      <div className="space-y-2 max-h-96 overflow-y-auto">
        {usuarios.map((usuario) => (
          <div
            key={usuario.id}
            className="flex items-center justify-between gap-3 p-3 rounded-lg bg-muted/30 hover:bg-muted/50 transition-colors"
          >
            <div className="flex items-center gap-3 min-w-0">
              <Avatar className="h-10 w-10">
                <AvatarImage src={usuario.avatar_url} alt={usuario.nome} />
                <AvatarFallback>
                  {usuario.nome?.charAt(0).toUpperCase() || '?'}
                </AvatarFallback>
              </Avatar>

              <div className="min-w-0 flex-1">
                <p className="font-medium text-sm truncate">{usuario.nome}</p>
                <p className="text-xs text-muted-foreground truncate">
                  {usuario.email}
                </p>
              </div>
            </div>

            {currentUserId && (
              <BotaoSeguir
                userId={currentUserId}
                targetUserId={usuario.id}
                variant="ghost"
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
