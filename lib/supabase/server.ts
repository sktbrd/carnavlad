import { createServerClient } from '@supabase/ssr';
import { cookies } from 'next/headers';

export async function createClient() {
  const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

  // Valida se as variáveis existem E são válidas
  if (!supabaseUrl || !supabaseKey || supabaseUrl === '' || supabaseKey === '') {
    console.warn('⚠️ Supabase credentials not configured (server)');
    return null;
  }

  // Valida se a URL é HTTP/HTTPS
  if (!supabaseUrl.startsWith('http://') && !supabaseUrl.startsWith('https://')) {
    console.error('❌ Invalid Supabase URL (server):', supabaseUrl);
    return null;
  }

  const cookieStore = await cookies();

  return createServerClient(supabaseUrl, supabaseKey, {
    cookies: {
      getAll() {
        return cookieStore.getAll();
      },
      setAll(cookiesToSet) {
        try {
          cookiesToSet.forEach(({ name, value, options }) =>
            cookieStore.set(name, value, options)
          );
        } catch {
          // Em Server Components não podemos setar cookies
        }
      },
    },
  });
}
