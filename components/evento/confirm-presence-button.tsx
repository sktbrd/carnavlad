'use client'

import { Heart, LogIn } from 'lucide-react'
import { createClient } from '@/lib/supabase/client'
import { useEffect, useState } from 'react'
import { useRouter } from 'next/navigation'

interface ConfirmPresenceButtonProps {
  eventSlug: string
  eventName: string
}

export function ConfirmPresenceButton({ eventSlug, eventName }: ConfirmPresenceButtonProps) {
  const [user, setUser] = useState<any>(null)
  const [loading, setLoading] = useState(true)
  const [isFavorited, setIsFavorited] = useState(false)
  const router = useRouter()
  const supabase = createClient()

  useEffect(() => {
    if (!supabase) {
      setLoading(false)
      return
    }

    // Check current user
    supabase.auth.getUser().then(({ data: { user } }) => {
      setUser(user)
      setLoading(false)
      
      // TODO: Check if event is favorited when database is connected
      // For now, check localStorage
      if (user) {
        const favorites = JSON.parse(localStorage.getItem('favorites') || '[]')
        setIsFavorited(favorites.includes(eventSlug))
      }
    })

    // Listen for auth changes
    const { data: { subscription } } = supabase.auth.onAuthStateChange((_event, session) => {
      setUser(session?.user ?? null)
    })

    return () => subscription.unsubscribe()
  }, [supabase, eventSlug])

  const handleClick = () => {
    if (!user) {
      // Redirect to login
      router.push('/login?next=' + window.location.pathname)
      return
    }

    // Toggle favorite
    const favorites = JSON.parse(localStorage.getItem('favorites') || '[]')
    
    if (isFavorited) {
      // Remove from favorites
      const newFavorites = favorites.filter((slug: string) => slug !== eventSlug)
      localStorage.setItem('favorites', JSON.stringify(newFavorites))
      setIsFavorited(false)
    } else {
      // Add to favorites
      const newFavorites = [...favorites, eventSlug]
      localStorage.setItem('favorites', JSON.stringify(newFavorites))
      setIsFavorited(true)
    }

    // TODO: Save to database when connected
  }

  if (loading) {
    return (
      <button
        disabled
        className="w-full mt-6 bg-gradient-to-r from-yellow-400 to-orange-500 text-purple-900 font-bold py-4 px-6 rounded-xl opacity-50 cursor-not-allowed"
      >
        Carregando...
      </button>
    )
  }

  if (!user) {
    return (
      <button
        onClick={handleClick}
        className="w-full mt-6 bg-gradient-to-r from-yellow-400 to-orange-500 text-purple-900 font-bold py-4 px-6 rounded-xl hover:scale-105 transition-transform shadow-lg flex items-center justify-center gap-2"
      >
        <LogIn className="w-5 h-5" />
        Entrar para Confirmar
      </button>
    )
  }

  return (
    <button
      onClick={handleClick}
      className={`w-full mt-6 font-bold py-4 px-6 rounded-xl hover:scale-105 transition-transform shadow-lg flex items-center justify-center gap-2 ${
        isFavorited
          ? 'bg-gradient-to-r from-pink-500 to-purple-600 text-white'
          : 'bg-gradient-to-r from-yellow-400 to-orange-500 text-purple-900'
      }`}
    >
      <Heart className={`w-5 h-5 ${isFavorited ? 'fill-current' : ''}`} />
      {isFavorited ? 'Presença Confirmada!' : 'Confirmar Presença'}
    </button>
  )
}
