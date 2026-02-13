import { NextResponse } from 'next/server'
import { createClient } from '@/lib/supabase/server'

export async function GET(request: Request) {
  const { searchParams, origin } = new URL(request.url)
  const code = searchParams.get('code')
  // Se "next" está nos params, use como redirect URL
  let next = searchParams.get('next') ?? '/'
  if (!next.startsWith('/')) {
    // Se "next" não é URL relativa, use default
    next = '/'
  }

  if (code) {
    console.log('[AUTH CALLBACK] Code received:', code.substring(0, 20) + '...')
    
    const supabase = await createClient()
    
    if (!supabase) {
      console.error('[AUTH CALLBACK] ❌ Supabase client not available')
      return NextResponse.redirect(`${origin}/auth/auth-code-error`)
    }
    
    console.log('[AUTH CALLBACK] ✅ Supabase client created')
    console.log('[AUTH CALLBACK] Exchanging code for session...')
    
    const { data, error } = await supabase.auth.exchangeCodeForSession(code)
    
    if (error) {
      console.error('[AUTH CALLBACK] ❌ Exchange failed:', error)
      console.error('[AUTH CALLBACK] Error details:', JSON.stringify(error, null, 2))
      return NextResponse.redirect(`${origin}/auth/auth-code-error`)
    }
    
    console.log('[AUTH CALLBACK] ✅ Exchange successful!')
    console.log('[AUTH CALLBACK] User:', data.user?.email)
    
    if (!error) {
      const forwardedHost = request.headers.get('x-forwarded-host') // origem antes do load balancer
      const isLocalEnv = process.env.NODE_ENV === 'development'
      if (isLocalEnv) {
        // Sem load balancer em dev, não precisa checar X-Forwarded-Host
        return NextResponse.redirect(`${origin}${next}`)
      } else if (forwardedHost) {
        return NextResponse.redirect(`https://${forwardedHost}${next}`)
      } else {
        return NextResponse.redirect(`${origin}${next}`)
      }
    }
  }

  // Redireciona para página de erro com instruções
  return NextResponse.redirect(`${origin}/auth/auth-code-error`)
}
