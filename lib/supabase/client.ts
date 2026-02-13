import { createBrowserClient } from '@supabase/ssr';

export function createClient() {
  const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

  // Valida se as variáveis existem E são válidas
  if (!supabaseUrl || !supabaseKey || supabaseUrl === '' || supabaseKey === '') {
    console.warn('⚠️ Supabase credentials not configured');
    return null;
  }

  // Valida se a URL é HTTP/HTTPS
  if (!supabaseUrl.startsWith('http://') && !supabaseUrl.startsWith('https://')) {
    console.error('❌ Invalid Supabase URL:', supabaseUrl);
    return null;
  }

  return createBrowserClient(supabaseUrl, supabaseKey);
}
