'use client'

import { useState } from 'react'
import { Button } from '@/components/ui/button'
import { createClient } from '@/lib/supabase/client'
import { seguirUsuario, deixarDeSeguir, isSeguindo } from '@/lib/supabase/queries'
import { UserPlus, UserMinus, Loader2 } from 'lucide-react'
import { useEffect } from 'react'

interface BotaoSeguirProps {
  userId: string // ID do usuário logado
  targetUserId: string // ID do usuário a seguir
  variant?: 'default' | 'outline' | 'ghost'
  size?: 'default' | 'sm' | 'lg'
  showLabel?: boolean
}

export function BotaoSeguir({
  userId,
  targetUserId,
  variant = 'default',
  size = 'sm',
  showLabel = true,
}: BotaoSeguirProps) {
  const [seguindo, setSeguindo] = useState(false)
  const [loading, setLoading] = useState(true)
  const supabase = createClient()

  // Não pode seguir a si mesmo
  if (userId === targetUserId) {
    return null
  }

  useEffect(() => {
    async function checkSeguindo() {
      const result = await isSeguindo(supabase, userId, targetUserId)
      setSeguindo(result)
      setLoading(false)
    }
    checkSeguindo()
  }, [userId, targetUserId, supabase])

  async function handleToggle() {
    setLoading(true)

    if (seguindo) {
      const result = await deixarDeSeguir(supabase, userId, targetUserId)
      if (result.success) {
        setSeguindo(false)
      }
    } else {
      // Follow direto (sem aprovação)
      const result = await seguirUsuario(supabase, userId, targetUserId)
      if (result.success) {
        setSeguindo(true)
      }
    }

    setLoading(false)
  }

  if (loading) {
    return (
      <Button variant={variant} size={size} disabled>
        <Loader2 className="h-4 w-4 animate-spin" />
      </Button>
    )
  }

  return (
    <Button
      variant={seguindo ? 'outline' : variant}
      size={size}
      onClick={handleToggle}
      className="gap-2"
    >
      {seguindo ? (
        <>
          <UserMinus className="h-4 w-4" />
          {showLabel && 'Seguindo'}
        </>
      ) : (
        <>
          <UserPlus className="h-4 w-4" />
          {showLabel && 'Seguir'}
        </>
      )}
    </Button>
  )
}
