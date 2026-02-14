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
  const isSelf = userId === targetUserId

  useEffect(() => {
    if (isSelf) return
    async function checkSeguindo() {
      const supabase = createClient()
      if (!supabase) return
      const result = await isSeguindo(supabase, userId, targetUserId)
      setSeguindo(result)
      setLoading(false)
    }
    checkSeguindo()
  }, [userId, targetUserId, isSelf])

  // Não pode seguir a si mesmo
  if (isSelf) {
    return null
  }

  async function handleToggle() {
    const supabase = createClient()
    if (!supabase) return
    try {
      setLoading(true)

      if (seguindo) {
        const result = await deixarDeSeguir(supabase, userId, targetUserId)
        if (result.success) {
          setSeguindo(false)
        } else {
          console.error('Failed to unfollow')
        }
      } else {
        const result = await seguirUsuario(supabase, userId, targetUserId)
        if (result.success) {
          setSeguindo(true)
        } else {
          console.error('Failed to follow')
        }
      }

      setLoading(false)
    } catch (error) {
      console.error('Error toggling follow state:', error)
      setLoading(false)
    }
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
