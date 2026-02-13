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
          .single();

        if (!error && data) {
          setConfirmado(true);
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

    try {
      if (confirmado) {
        // Remover presença
        console.log('[use-presenca] Removendo presença:', { userId, eventoId });
        const { error } = await supabase
          .from('presencas_confirmadas')
          .delete()
          .eq('user_id', userId)
          .eq('evento_id', eventoId);

        if (error) {
          console.error('[use-presenca] Error removing:', error);
          return;
        }

        console.log('[use-presenca] ✅ Presença removida com sucesso');
        setConfirmado(false);
      } else {
        // Adicionar presença
        console.log('[use-presenca] Adicionando presença:', { userId, eventoId });
        const { data, error } = await supabase
          .from('presencas_confirmadas')
          .insert({
            user_id: userId,
            evento_id: eventoId,
          })
          .select();

        if (error) {
          console.error('[use-presenca] Error adding:', error);
          return;
        }

        console.log('[use-presenca] ✅ Presença confirmada com sucesso:', data);
        setConfirmado(true);
      }
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
