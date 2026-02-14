'use client'

import { useState, useMemo } from 'react'
import { Input } from '@/components/ui/input'
import { Avatar, AvatarFallback, AvatarImage } from '@/components/ui/avatar'
import { BotaoSeguir } from './botao-seguir'
import { Search, Users } from 'lucide-react'

interface Usuario {
  id: string
  nome: string
  email: string
  avatar_url?: string
}

interface DiretorioUsuariosProps {
  usuarios: Usuario[]
  currentUserId: string
}

export function DiretorioUsuarios({
  usuarios,
  currentUserId,
}: DiretorioUsuariosProps) {
  const [busca, setBusca] = useState('')

  // Filtrar usuários baseado na busca
  const usuariosFiltrados = useMemo(() => {
    if (!busca.trim()) return usuarios

    const query = busca.toLowerCase()
    return usuarios.filter(
      (u) =>
        u.nome?.toLowerCase().includes(query) ||
        u.email?.toLowerCase().includes(query)
    )
  }, [usuarios, busca])

  // Remover o próprio usuário da lista
  const outrosUsuarios = usuariosFiltrados.filter(
    (u) => u.id !== currentUserId
  )

  return (
    <div className="space-y-4">
      {/* Busca */}
      <div className="relative">
        <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
        <Input
          type="text"
          placeholder="Buscar por nome ou email..."
          aria-label="Buscar usuários por nome ou email"
          value={busca}
          onChange={(e) => setBusca(e.target.value)}
          className="pl-10"
        />
      </div>

      {/* Stats */}
      <div className="flex items-center gap-2 text-sm text-muted-foreground">
        <Users className="h-4 w-4" />
        <span>
          {outrosUsuarios.length}{' '}
          {outrosUsuarios.length === 1 ? 'folião' : 'foliões'}
          {busca && ' encontrado(s)'}
        </span>
      </div>

      {/* Lista de usuários */}
      {outrosUsuarios.length === 0 ? (
        <div className="text-center py-12 text-muted-foreground">
          <Users className="h-16 w-16 mx-auto mb-3 opacity-20" />
          <p className="text-lg font-medium mb-1">Nenhum folião encontrado</p>
          {busca && (
            <p className="text-sm">Tente buscar por outro nome ou email</p>
          )}
        </div>
      ) : (
        <div className="grid gap-3">
          {outrosUsuarios.map((usuario) => (
            <div
              key={usuario.id}
              className="flex items-center justify-between gap-4 p-4 rounded-lg border bg-card hover:bg-muted/30 transition-colors"
            >
              <div className="flex items-center gap-3 min-w-0 flex-1">
                <Avatar className="h-12 w-12">
                  <AvatarImage src={usuario.avatar_url} alt={usuario.nome} />
                  <AvatarFallback>
                    {usuario.nome?.charAt(0).toUpperCase() || '?'}
                  </AvatarFallback>
                </Avatar>

                <div className="min-w-0 flex-1">
                  <p className="font-semibold truncate">{usuario.nome}</p>
                  <p className="text-sm text-muted-foreground truncate">
                    {usuario.email}
                  </p>
                </div>
              </div>

              <BotaoSeguir
                userId={currentUserId}
                targetUserId={usuario.id}
                variant="default"
                size="default"
                showLabel={true}
              />
            </div>
          ))}
        </div>
      )}
    </div>
  )
}
