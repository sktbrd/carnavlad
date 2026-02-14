'use client';

import Link from 'next/link';
import { Card, CardContent } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import { Clock, MapPin, ChevronRight } from 'lucide-react';
import { format } from 'date-fns';
import { ptBR } from 'date-fns/locale';
import type { EventoCompleto } from '@/lib/types';
import { parseLocalDate } from '@/lib/date-utils';

type EventoCardProps = {
  evento: EventoCompleto;
  variant?: 'default' | 'compact';
};

// Helper para criar slug a partir do nome do bloco
function createSlug(name: string): string {
  return name
    .toLowerCase()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-|-$/g, '');
}

export default function EventoCard({ evento, variant = 'default' }: EventoCardProps) {
  const getRandomColor = () => {
    const colors = ['bg-yellow-500', 'bg-green-500', 'bg-blue-500', 'bg-red-500', 'bg-purple-500'];
    return colors[Math.floor(Math.random() * colors.length)];
  };

  const slug = createSlug(evento.bloco_nome);

  if (variant === 'compact') {
    return (
      <Link href={`/evento/${slug}`}>
        <Card className="group hover:shadow-lg transition-all duration-300 hover:-translate-y-1 border-l-4 border-l-yellow-500 cursor-pointer">
          <CardContent className="p-4">
            <div className="flex items-start justify-between gap-3">
              <div className="flex-1 space-y-2">
                <h3 className="font-semibold text-base leading-tight group-hover:text-purple-600 transition-colors">
                  {evento.bloco_nome}
                </h3>
                <div className="flex flex-wrap gap-2">
                  <Badge variant="secondary" className="text-xs">
                    <Clock className="w-3 h-3 mr-1" />
                    {evento.horario || 'A confirmar'}
                  </Badge>
                </div>
                <div className="flex items-start gap-2 text-sm text-muted-foreground">
                  <MapPin className="w-4 h-4 mt-0.5 flex-shrink-0" />
                  <span className="line-clamp-1">{evento.local_endereco}</span>
                </div>
              </div>
              <ChevronRight className="w-4 h-4 text-muted-foreground group-hover:text-purple-600 group-hover:translate-x-1 transition-all" />
            </div>
          </CardContent>
        </Card>
      </Link>
    );
  }

  return (
    <Link href={`/evento/${slug}`}>
      <Card className="group hover:shadow-2xl transition-all duration-300 hover:-translate-y-2 overflow-hidden cursor-pointer">
        {/* Header colorido */}
        <div className={`h-2 ${getRandomColor()}`} />
        
        <CardContent className="p-6 space-y-4">
          {/* Nome e Badge */}
          <div className="space-y-2">
            <div className="flex items-start justify-between gap-3">
              <h3 className="font-bold text-xl leading-tight group-hover:text-purple-600 transition-colors">
                {evento.bloco_nome}
              </h3>
              <Badge variant="secondary" className="shrink-0">
                {format(parseLocalDate(evento.data), 'dd/MM', { locale: ptBR })}
              </Badge>
            </div>
            
            <div className="flex items-center gap-2">
              <Badge className="bg-yellow-500 hover:bg-yellow-600 text-black">
                <Clock className="w-3 h-3 mr-1" />
                {evento.horario || 'A confirmar'}
              </Badge>
              {!evento.horario_confirmado && (
                <Badge variant="outline" className="text-xs">Provisório</Badge>
              )}
            </div>
          </div>

          {/* Local */}
          <div className="bg-muted/50 rounded-lg p-3 space-y-1">
            <div className="flex items-start gap-2">
              <MapPin className="w-4 h-4 mt-0.5 text-purple-600 flex-shrink-0" />
              <div className="flex-1">
                <p className="font-medium text-sm">{evento.local_nome}</p>
                <p className="text-xs text-muted-foreground">{evento.local_endereco}</p>
              </div>
            </div>
          </div>

          {/* Observações */}
          {evento.observacoes && (
            <p className="text-sm text-muted-foreground italic border-l-2 border-yellow-400 pl-3">
              {evento.observacoes}
            </p>
          )}

          {/* Ver Detalhes - Aparece no hover */}
          <div className="w-full opacity-0 group-hover:opacity-100 transition-all duration-300 bg-gradient-to-r from-yellow-500 to-red-500 hover:from-yellow-600 hover:to-red-600 text-white rounded-md py-2 px-4 flex items-center justify-center gap-2 font-medium">
            Ver Detalhes
            <ChevronRight className="w-4 h-4" />
          </div>
        </CardContent>
      </Card>
    </Link>
  );
}
