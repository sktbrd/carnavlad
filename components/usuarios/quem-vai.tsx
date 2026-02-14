'use client'

import { useEffect, useState } from 'react'
import { createClient } from '@/lib/supabase/client'
import { getUsuariosConfirmadosNoEvento } from '@/lib/supabase/queries'
import { BotaoSeguir } from './botao-seguir'
import { Avatar, AvatarFallback, AvatarImage } from '@/components/ui/avatar'
import { Users } from 'lucide-react'
import Link from 'next/link'

interface Usuario {
  id: string
  nome: string
  email: string
  username?: string
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
      console.log('[QuemVai] Iniciando fetch para evento:', eventoId)
      setLoading(true)
      
      const supabase = createClient()
      if (!supabase) {
        console.error('[QuemVai] ❌ Supabase client não disponível')
        setLoading(false)
        return
      }
      
      const data = await getUsuariosConfirmadosNoEvento(supabase, eventoId)
      console.log('[QuemVai] Dados retornados:', data)
      console.log('[QuemVai] Total de usuários:', data?.length || 0)
      
      setUsuarios((data ?? []).flat() as Usuario[])
      setLoading(false)
    }
    
    fetchUsuarios()
    
    // Escutar evento de atualização de presença
    const handlePresencaUpdate = (e: any) => {
      console.log('[QuemVai] Evento presenca-updated recebido:', e.detail)
      if (e.detail?.eventoId === eventoId) {
        console.log('[QuemVai] Atualizando lista de usuários...')
        fetchUsuarios()
      }
    }
    
    window.addEventListener('presenca-updated', handlePresencaUpdate)
    
    return () => {
      window.removeEventListener('presenca-updated', handlePresencaUpdate)
    }
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
            className="flex items-center justify-between gap-3 p-3 rounded-xl bg-gradient-to-r from-primary/5 to-primary/10 hover:from-primary/10 hover:to-primary/15 border border-primary/20 transition-all hover:shadow-md group"
          >
            <Link 
              href={`/u/${usuario.username || usuario.id}`}
              className="flex items-center gap-3 min-w-0 flex-1 cursor-pointer"
            >
              <Avatar className="h-12 w-12 border-2 border-primary/30 group-hover:border-primary transition-all">
                <AvatarImage src={usuario.avatar_url} alt={usuario.nome} />
                <AvatarFallback className="bg-primary text-primary-foreground font-bold">
                  {usuario.nome?.charAt(0).toUpperCase() || '?'}
                </AvatarFallback>
              </Avatar>

              <div className="min-w-0 flex-1">
                <p className="font-semibold truncate group-hover:text-primary transition-colors">
                  {usuario.nome}
                </p>
                <p className="text-xs text-muted-foreground truncate">
                  @{usuario.username || usuario.email}
                </p>
              </div>
            </Link>

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
