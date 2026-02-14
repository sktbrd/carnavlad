'use client'

import { useEffect } from 'react'
import { useRouter, useSearchParams } from 'next/navigation'
import { createClient } from '@/lib/supabase/client'

export default function AuthHandler() {
  const router = useRouter()
  const searchParams = useSearchParams()
  const supabase = createClient()

  useEffect(() => {
    const code = searchParams.get('code')
    
    if (!code) return
    
    if (!supabase) {
      console.error('Supabase client not available')
      router.push('/auth/auth-code-error')
      return
    }
    
    // Exchange code for session
    supabase.auth.exchangeCodeForSession(code).then(({ data, error }) => {
      if (error) {
        console.error('Erro ao trocar código:', error)
        router.push('/auth/auth-code-error')
        return
      }
      
      // Sucesso! Redireciona para home
      router.push('/')
    })
  }, [searchParams, router, supabase])

  return null
}
