'use client';

import { createClient } from '@/lib/supabase/client';
import { Button } from '@/components/ui/button';
import { LogIn, User } from 'lucide-react';
import { useEffect, useState } from 'react';
import type { User as SupabaseUser } from '@supabase/supabase-js';

export default function LoginButton() {
  const [user, setUser] = useState<SupabaseUser | null>(null);
  const [loading, setLoading] = useState(true);
  const [supabase] = useState(() => createClient());

  useEffect(() => {
    if (!supabase) {
      setLoading(false);
      return;
    }

    // Verificar usuário atual
    supabase.auth.getUser().then(({ data: { user } }) => {
      setUser(user);
      setLoading(false);
    });

    // Escutar mudanças de auth
    const {
      data: { subscription },
    } = supabase.auth.onAuthStateChange((_event, session) => {
      setUser(session?.user ?? null);
    });

    return () => subscription.unsubscribe();
  }, [supabase]);

  const handleLogin = () => {
    // Redireciona para página de login dedicada
    window.location.href = '/login';
  };

  if (loading) {
    return (
      <Button variant="ghost" size="sm" disabled>
        <User className="w-4 h-4" />
      </Button>
    );
  }

  // Se não tiver Supabase configurado, mostra botão desabilitado
  if (!supabase) {
    return (
      <Button 
        variant="outline" 
        size="sm" 
        className="gap-2 opacity-50 cursor-not-allowed" 
        disabled
        title="Configure as variáveis de ambiente do Supabase"
      >
        <LogIn className="w-4 h-4" />
        <span className="hidden sm:inline">Login (não configurado)</span>
        <span className="sm:hidden">Login</span>
      </Button>
    );
  }

  if (user) {
    // Se usuário estiver logado, não mostra nada (ProfileButton vai aparecer)
    return null;
  }

  return (
    <Button onClick={handleLogin} variant="outline" size="sm" className="gap-2">
      <LogIn className="w-4 h-4" />
      <span className="hidden sm:inline">Entrar com Google</span>
      <span className="sm:hidden">Entrar</span>
    </Button>
  );
}
