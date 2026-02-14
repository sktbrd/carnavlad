'use client'

import { useEffect, useState } from 'react'
import { createClient } from '@/lib/supabase/client'
import { getUsuariosConfirmadosNoEvento } from '@/lib/supabase/queries'
import { Avatar, AvatarFallback, AvatarImage } from '@/components/ui/avatar'
import { Users } from 'lucide-react'

interface Usuario {
  id: string
  nome: string
  email: string
  avatar_url?: string
}

interface AvatarConfirmadosProps {
  eventoId: string
  maxVisible?: number // Quantos avatares mostrar antes do "+X"
  size?: 'sm' | 'md' | 'lg'
}

const sizeClasses = {
  sm: 'h-6 w-6 text-xs',
  md: 'h-8 w-8 text-sm',
  lg: 'h-10 w-10 text-base'
}

const marginClasses = {
  sm: '-ml-2',
  md: '-ml-3',
  lg: '-ml-4'
}

export function AvatarConfirmados({ 
  eventoId, 
  maxVisible = 3,
  size = 'sm'
}: AvatarConfirmadosProps) {
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
      <div className="flex items-center gap-1">
        <div className={`${sizeClasses[size]} rounded-full bg-muted animate-pulse`} />
        <span className="text-xs text-muted-foreground">...</span>
      </div>
    )
  }

  if (usuarios.length === 0) {
    return (
      <div className="flex items-center gap-1.5 text-muted-foreground">
        <Users className="h-3.5 w-3.5" />
        <span className="text-xs">Ninguém ainda</span>
      </div>
    )
  }

  const visibleUsers = usuarios.slice(0, maxVisible)
  const remainingCount = usuarios.length - maxVisible

  return (
    <div className="flex items-center">
      {/* Avatares Empilhados */}
      <div className="flex items-center">
        {visibleUsers.map((usuario, index) => (
          <Avatar
            key={usuario.id}
            className={`${sizeClasses[size]} border-2 border-background ${index > 0 ? marginClasses[size] : ''}`}
            title={usuario.nome}
          >
            <AvatarImage src={usuario.avatar_url} alt={usuario.nome} />
            <AvatarFallback className="text-[10px]">
              {usuario.nome?.charAt(0).toUpperCase() || '?'}
            </AvatarFallback>
          </Avatar>
        ))}
      </div>

      {/* Contador */}
      {remainingCount > 0 && (
        <div 
          className={`${sizeClasses[size]} ${marginClasses[size]} rounded-full bg-muted border-2 border-background flex items-center justify-center`}
        >
          <span className="text-[10px] font-semibold text-muted-foreground">
            +{remainingCount}
          </span>
        </div>
      )}

      {/* Total */}
      <span className="ml-2 text-xs text-muted-foreground">
        {usuarios.length === 1 ? '1 pessoa' : `${usuarios.length} pessoas`}
      </span>
    </div>
  )
}
