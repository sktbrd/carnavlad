'use client';

import { useState, useEffect } from 'react';
import { createClient } from '@/lib/supabase/client';
import { Calendar, MapPin, Loader2 } from 'lucide-react';
import Link from 'next/link';
import { parseLocalDate } from '@/lib/date-utils';
import type { EventoCompleto } from '@/lib/types';

export default function BlocosConfirmadosList({ userId }: { userId: string }) {
  const [eventos, setEventos] = useState<EventoCompleto[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadEventos();
  }, [userId]);

  async function loadEventos() {
    setLoading(true);
    const supabase = createClient();

    if (!supabase) {
      setLoading(false);
      return;
    }

    try {
      // Buscar presenças confirmadas
      const { data: presencas, error: presencasError } = await supabase
        .from('presencas_confirmadas')
        .select('evento_id, created_at')
        .eq('user_id', userId)
        .order('created_at', { ascending: false });

      if (presencasError || !presencas || presencas.length === 0) {
        setEventos([]);
        setLoading(false);
        return;
      }


      // Buscar detalhes dos eventos
      const eventoIds = presencas.map(p => p.evento_id);

      const { data: eventosData, error: eventosError } = await supabase
        .from('eventos_completos')
        .select('*')
        .in('id', eventoIds);

      if (eventosError) {
        console.error('[blocos-confirmados] Erro ao buscar eventos:', eventosError);
        setEventos([]);
      } else {
        setEventos(eventosData as EventoCompleto[]);
      }
    } catch (err) {
      console.error('[blocos-confirmados] Erro inesperado:', err);
      setEventos([]);
    } finally {
      setLoading(false);
    }
  }

  if (loading) {
    return (
      <div className="flex items-center justify-center py-12">
        <Loader2 className="w-8 h-8 animate-spin text-white/50" />
      </div>
    );
  }

  if (eventos.length === 0) {
    return (
      <div className="text-center py-12">
        <div className="text-6xl mb-4">🎭</div>
        <p className="text-white/70 text-lg mb-2">Nenhum bloco confirmado ainda</p>
        <p className="text-white/50 text-sm">
          Explore os blocos e confirme sua presença!
        </p>
        <Link
          href="/"
          className="inline-block mt-6 bg-gradient-to-r from-yellow-400 to-orange-500 text-purple-900 font-bold py-3 px-6 rounded-xl hover:scale-105 transition-transform"
        >
          Explorar Blocos
        </Link>
      </div>
    );
  }

  return (
    <div className="space-y-4">
      {eventos.map((evento) => {
        const dataObj = parseLocalDate(evento.data);
        const dia = dataObj.getDate();
        const mes = dataObj.toLocaleDateString('pt-BR', { month: 'short' });

        return (
          <Link
            key={evento.id}
            href={`/evento/${evento.bloco_slug}`}
            className="block bg-white/10 hover:bg-white/20 rounded-2xl p-4 border border-white/20 transition-all group"
          >
            <div className="flex gap-4">
              {/* Data Badge */}
              <div className="flex-shrink-0 bg-gradient-to-br from-yellow-400 to-orange-500 rounded-xl w-16 h-16 flex flex-col items-center justify-center text-purple-900">
                <div className="text-2xl font-bold leading-none">{dia}</div>
                <div className="text-xs uppercase font-semibold">{mes}</div>
              </div>

              {/* Info */}
              <div className="flex-1 min-w-0">
                <h3 className="font-bold text-white text-lg mb-2 group-hover:text-yellow-300 transition-colors truncate">
                  {evento.bloco_nome}
                </h3>

                <div className="space-y-1 text-sm">
                  {evento.horario && (
                    <div className="flex items-center gap-2 text-white/70">
                      <Calendar className="w-4 h-4 flex-shrink-0" />
                      <span>{evento.horario}</span>
                    </div>
                  )}

                  {evento.local_nome && (
                    <div className="flex items-center gap-2 text-white/70">
                      <MapPin className="w-4 h-4 flex-shrink-0" />
                      <span className="truncate">{evento.local_nome}</span>
                    </div>
                  )}
                </div>
              </div>
            </div>
          </Link>
        );
      })}
    </div>
  );
}
