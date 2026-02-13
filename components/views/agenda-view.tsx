'use client';

import { format } from 'date-fns';
import { ptBR } from 'date-fns/locale';
import { useBlocos } from '@/lib/hooks/use-blocos';
import EventoCard from '@/components/evento-card';

export default function AgendaView() {
  const { eventosPorDia, loading } = useBlocos();

  if (loading) {
    return (
      <div className="flex items-center justify-center h-64">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-pink-600" />
      </div>
    );
  }

  return (
    <div className="space-y-8">
      {Object.entries(eventosPorDia).map(([data, eventos]) => (
        <div key={data} className="space-y-4">
          {/* Cabeçalho do dia */}
          <div className="sticky top-20 z-40 bg-background/95 backdrop-blur border-b pb-3 mb-3">
            <h2 className="text-xl font-semibold">
              {format(new Date(data), "EEEE, dd 'de' MMMM", { locale: ptBR })}
            </h2>
            <p className="text-sm text-muted-foreground">{eventos.length} blocos</p>
          </div>

          {/* Timeline do dia */}
          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-4">
            {eventos.map((evento) => (
              <EventoCard key={evento.id} evento={evento} />
            ))}
          </div>
        </div>
      ))}
    </div>
  );
}
