import { NextResponse } from 'next/server'
import { createClient } from '@/lib/supabase/server'

export async function GET(request: Request) {
  const { searchParams, origin } = new URL(request.url)
  const code = searchParams.get('code')
  const debugMode = searchParams.get('debug') === 'true'
  
  // Se "next" está nos params, use como redirect URL
  let next = searchParams.get('next') ?? '/'
  if (!next.startsWith('/')) {
    next = '/'
  }

  if (!code) {
    console.error('[AUTH CALLBACK] No code provided')
    if (debugMode) {
      return new NextResponse(
        `ERROR: No authorization code received\n\nURL: ${request.url}`,
        { status: 400, headers: { 'Content-Type': 'text/plain' } }
      )
    }
    return NextResponse.redirect(`${origin}/auth/auth-code-error?reason=no_code`)
  }

  try {
    const supabase = await createClient()
    
    if (!supabase) {
      console.error('[AUTH CALLBACK] Supabase client not available - check env vars')
      
      if (debugMode) {
        return new NextResponse(
          `ERROR: Supabase client not available\n\nCheck environment variables:\n- NEXT_PUBLIC_SUPABASE_URL: ${process.env.NEXT_PUBLIC_SUPABASE_URL ? 'SET' : 'MISSING'}\n- NEXT_PUBLIC_SUPABASE_ANON_KEY: ${process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY ? 'SET' : 'MISSING'}`,
          { status: 500, headers: { 'Content-Type': 'text/plain' } }
        )
      }
      return NextResponse.redirect(`${origin}/auth/auth-code-error?reason=no_client`)
    }
    
    const { data, error } = await supabase.auth.exchangeCodeForSession(code)
    
    if (error) {
      console.error('[AUTH CALLBACK] Exchange failed:', error.message)
      
      if (debugMode) {
        return new NextResponse(
          `ERROR: Failed to exchange code for session\n\n` +
          `Message: ${error.message}\n` +
          `Name: ${error.name}\n` +
          `Status: ${error.status}\n\n` +
          `Full error:\n${JSON.stringify(error, null, 2)}`,
          { status: 401, headers: { 'Content-Type': 'text/plain' } }
        )
      }
      return NextResponse.redirect(`${origin}/auth/auth-code-error?reason=exchange_failed&msg=${encodeURIComponent(error.message)}`)
    }
    
    // Redireciona para a página de destino
    const forwardedHost = request.headers.get('x-forwarded-host')
    const isLocalEnv = process.env.NODE_ENV === 'development'
    
    if (isLocalEnv) {
      return NextResponse.redirect(`${origin}${next}`)
    } else if (forwardedHost) {
      return NextResponse.redirect(`https://${forwardedHost}${next}`)
    } else {
      return NextResponse.redirect(`${origin}${next}`)
    }
    
  } catch (err) {
    console.error('[AUTH CALLBACK] Unexpected error:', err)
    
    if (debugMode) {
      return new NextResponse(
        `UNEXPECTED ERROR:\n\n${err instanceof Error ? err.message : String(err)}\n\nStack:\n${err instanceof Error ? err.stack : 'N/A'}`,
        { status: 500, headers: { 'Content-Type': 'text/plain' } }
      )
    }
    return NextResponse.redirect(`${origin}/auth/auth-code-error?reason=unexpected`)
  }
}
