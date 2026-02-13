import { createClient } from '@/lib/supabase/server'
import { NextResponse } from 'next/server'

export async function POST(request: Request) {
  const supabase = await createClient()

  if (!supabase) {
    return NextResponse.redirect(new URL('/', request.url))
  }

  await supabase.auth.signOut()

  return NextResponse.redirect(new URL('/', request.url))
}
