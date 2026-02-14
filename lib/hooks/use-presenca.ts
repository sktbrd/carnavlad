'use client';

import { useState, useEffect } from 'react';
import { createClient } from '@/lib/supabase/client';
import type { SupabaseClient } from '@supabase/supabase-js';

export function usePresenca(eventoId: string) {
  const [confirmado, setConfirmado] = useState(false);
  const [loading, setLoading] = useState(true);
  const [userId, setUserId] = useState<string | null>(null);
  const [supabase, setSupabase] = useState<SupabaseClient | null>(null);

  useEffect(() => {
    const client = createClient();
    setSupabase(client);
  }, []);

  useEffect(() => {
    async function checkPresenca() {
      if (!supabase) {
        setLoading(false);
        return;
      }

      try {
        // Verificar se usuário está autenticado
        const { data: { user } } = await supabase.auth.getUser();
        
        if (!user) {
          setLoading(false);
          return;
        }

        setUserId(user.id);

        // Verificar se já confirmou presença
        const { data, error } = await supabase
          .from('presencas_confirmadas')
          .select('id')
          .eq('user_id', user.id)
          .eq('evento_id', eventoId)
          .maybeSingle(); // Mudei de .single() para .maybeSingle() para evitar erro quando não existe

        console.log('[use-presenca] Check result:', { data, error, eventoId, userId: user.id });

        if (data) {
          setConfirmado(true);
          console.log('[use-presenca] ✅ Presença confirmada!');
        } else {
          console.log('[use-presenca] ❌ Presença não confirmada');
        }
      } catch (err) {
        console.error('[use-presenca] Error:', err);
      } finally {
        setLoading(false);
      }
    }

    if (supabase) {
      checkPresenca();
    }
  }, [eventoId, supabase]);

  const togglePresenca = async () => {
    if (!supabase || !userId) {
      // Redirecionar para login
      window.location.href = '/login?redirect=' + encodeURIComponent(window.location.pathname);
      return;
    }

    setLoading(true);
    console.log('[use-presenca] Toggle iniciado:', { confirmado, eventoId, userId });

    try {
      if (confirmado) {
        // Remover presença
        console.log('[use-presenca] Removendo presença...');
        const { error } = await supabase
          .from('presencas_confirmadas')
          .delete()
          .eq('user_id', userId)
          .eq('evento_id', eventoId);

        if (error) {
          console.error('[use-presenca] ❌ Error removing:', error);
          return;
        }

        console.log('[use-presenca] ✅ Presença removida!');
        setConfirmado(false);
      } else {
        // Adicionar presença
        console.log('[use-presenca] Adicionando presença...');
        const { data, error } = await supabase
          .from('presencas_confirmadas')
          .insert({
            user_id: userId,
            evento_id: eventoId,
          })
          .select()
          .single();

        if (error) {
          console.error('[use-presenca] ❌ Error adding:', error);
          console.error('[use-presenca] Error details:', JSON.stringify(error, null, 2));
          return;
        }

        console.log('[use-presenca] ✅ Presença confirmada!', data);
        setConfirmado(true);
      }

      // Forçar atualização da página para refletir mudanças (avatares, etc)
      window.location.reload();
    } catch (err) {
      console.error('[use-presenca] Unexpected error:', err);
    } finally {
      setLoading(false);
    }
  };

  return {
    confirmado,
    loading,
    isAuthenticated: !!userId,
    togglePresenca,
  };
}
