'use client';

import { Card, CardContent } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import { Clock, MapPin, Heart, Share2, ChevronRight } from 'lucide-react';
import { format } from 'date-fns';
import { ptBR } from 'date-fns/locale';
import type { EventoCompleto } from '@/lib/types';

type EventoCardProps = {
  evento: EventoCompleto;
  variant?: 'default' | 'compact';
};

export default function EventoCard({ evento, variant = 'default' }: EventoCardProps) {
  const getRandomColor = () => {
    const colors = ['bg-yellow-500', 'bg-green-500', 'bg-blue-500', 'bg-red-500', 'bg-purple-500'];
    return colors[Math.floor(Math.random() * colors.length)];
  };

  if (variant === 'compact') {
    return (
      <Card className="group hover:shadow-lg transition-all duration-300 hover:-translate-y-1 border-l-4 border-l-yellow-500">
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
            <Button size="sm" variant="ghost" className="opacity-0 group-hover:opacity-100 transition-opacity">
              <ChevronRight className="w-4 h-4" />
            </Button>
          </div>
        </CardContent>
      </Card>
    );
  }

  return (
    <Card className="group hover:shadow-2xl transition-all duration-300 hover:-translate-y-2 overflow-hidden">
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
              {format(new Date(evento.data), 'dd/MM', { locale: ptBR })}
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

        {/* Ações */}
        <div className="flex gap-2 pt-2">
          <Button variant="outline" size="sm" className="flex-1 group/btn hover:bg-red-500 hover:text-white hover:border-red-500 transition-colors">
            <Heart className="w-4 h-4 mr-2 group-hover/btn:fill-current" />
            Salvar
          </Button>
          <Button variant="outline" size="sm" className="flex-1 hover:bg-blue-500 hover:text-white hover:border-blue-500 transition-colors">
            <Share2 className="w-4 h-4 mr-2" />
            Compartilhar
          </Button>
        </div>

        {/* Ver Detalhes - Aparece no hover */}
        <Button 
          className="w-full opacity-0 group-hover:opacity-100 transition-all duration-300 bg-gradient-to-r from-yellow-500 to-red-500 hover:from-yellow-600 hover:to-red-600 text-white"
          size="sm"
        >
          Ver Detalhes
          <ChevronRight className="w-4 h-4 ml-2" />
        </Button>
      </CardContent>
    </Card>
  );
}
