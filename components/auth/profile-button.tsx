'use client'

import { createClient } from '@/lib/supabase/client'
import Link from 'next/link'
import { useEffect, useState } from 'react'
import type { User } from '@supabase/supabase-js'

export function ProfileButton() {
  const [user, setUser] = useState<User | null>(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    const supabase = createClient()
    
    if (!supabase) {
      setLoading(false)
      return
    }

    // Pegar usuário atual
    supabase.auth.getUser().then(({ data: { user } }) => {
      setUser(user)
      setLoading(false)
    })

    // Escutar mudanças de auth
    const {
      data: { subscription },
    } = supabase.auth.onAuthStateChange((_event, session) => {
      setUser(session?.user ?? null)
    })

    return () => subscription.unsubscribe()
  }, [])

  if (loading) {
    return (
      <div className="w-10 h-10 rounded-full bg-gray-200 animate-pulse" />
    )
  }

  if (!user) {
    return null
  }

  return (
    <Link
      href="/perfil"
      className="flex items-center gap-2 hover:opacity-80 transition-opacity"
    >
      <img
        src={user.user_metadata.avatar_url || `https://api.dicebear.com/7.x/avataaars/svg?seed=${user.email}`}
        alt={user.user_metadata.full_name || user.email || 'Avatar'}
        className="w-10 h-10 rounded-full border-2 border-yellow-400 shadow-md"
      />
      <span className="hidden sm:inline text-sm font-medium">
        {user.user_metadata.full_name?.split(' ')[0] || 'Perfil'}
      </span>
    </Link>
  )
}
