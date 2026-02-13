import { useState, useEffect, useMemo } from 'react';
import { createClient } from '@/lib/supabase/client';
import type { EventoCompleto } from '@/lib/types';

export function useBlocos() {
  const [eventos, setEventos] = useState<EventoCompleto[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function fetchEventos() {
      const supabase = createClient();
      
      if (!supabase) {
        console.error('[use-blocos] Supabase client not available');
        setLoading(false);
        return;
      }

      try {
        const { data, error } = await supabase
          .from('eventos_completos')
          .select('*')
          .order('data', { ascending: true })
          .order('horario', { ascending: true });

        if (error) {
          console.error('[use-blocos] Error fetching eventos:', error);
          setEventos([]);
        } else {
          console.log(`[use-blocos] ✅ Loaded ${data.length} eventos from Supabase`);
          setEventos(data as any);
        }
      } catch (err) {
        console.error('[use-blocos] Unexpected error:', err);
        setEventos([]);
      } finally {
        setLoading(false);
      }
    }

    fetchEventos();
  }, []);

  // Agrupar eventos por dia
  const eventosPorDia = useMemo(() => {
    const grupos: Record<string, EventoCompleto[]> = {};
    
    eventos.forEach(evento => {
      if (!grupos[evento.data]) {
        grupos[evento.data] = [];
      }
      grupos[evento.data].push(evento);
    });

    // Ordenar eventos dentro de cada dia por horário
    Object.keys(grupos).forEach(data => {
      grupos[data].sort((a, b) => {
        if (!a.horario) return 1;
        if (!b.horario) return -1;
        return a.horario.localeCompare(b.horario);
      });
    });

    return grupos;
  }, [eventos]);

  return {
    eventos,
    eventosPorDia,
    loading,
  };
}
