'use client';

import { useMemo, useState } from 'react';
import dynamic from 'next/dynamic';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '@/components/ui/select';
import { Button } from '@/components/ui/button';
import { Clock, MapPin, Zap } from 'lucide-react';
import { format } from 'date-fns';
import { ptBR } from 'date-fns/locale';
import { useBlocos } from '@/lib/hooks/use-blocos';
import EventoDrawer from '@/components/evento-drawer';
import type { EventoCompleto } from '@/lib/types';
import { parseLocalDate } from '@/lib/date-utils';

// Importar componentes de mapa dinamicamente (client-side only)
const Map = dynamic(
  () => import('@/components/ui/map').then((mod) => mod.Map),
  { ssr: false, loading: () => <div className="w-full h-full bg-muted animate-pulse rounded-lg" /> }
);

const MapTileLayer = dynamic(
  () => import('@/components/ui/map').then((mod) => mod.MapTileLayer),
  { ssr: false }
);

const MapMarker = dynamic(
  () => import('@/components/ui/map').then((mod) => mod.MapMarker),
  { ssr: false }
);

const MapPopup = dynamic(
  () => import('@/components/ui/map').then((mod) => mod.MapPopup),
  { ssr: false }
);

const MapZoomControl = dynamic(
  () => import('@/components/ui/map').then((mod) => mod.MapZoomControl),
  { ssr: false }
);

// Centro do Rio de Janeiro (Praça XV)
const RIO_CENTER: [number, number] = [-22.9035, -43.1955];

export default function MapaView() {
  const { eventos, loading } = useBlocos();
  const [filtroData, setFiltroData] = useState<string>('todas');
  const [mostrarAcontecendoAgora, setMostrarAcontecendoAgora] = useState(false);
  const [selectedEvento, setSelectedEvento] = useState<EventoCompleto | null>(null);
  const [drawerOpen, setDrawerOpen] = useState(false);

  // Extrair datas únicas
  const datasDisponiveis = useMemo(() => {
    const datas = new Set(eventos.map(e => e.data));
    return Array.from(datas).sort();
  }, [eventos]);

  // Filtrar eventos com coordenadas
  const eventosNoMapa = useMemo(() => {
    return eventos.filter(evento => {
      const temCoordenadas = evento.local_lat && evento.local_lng;
      
      // Se filtro "Acontecendo Agora" estiver ativo
      if (mostrarAcontecendoAgora) {
        const agora = new Date();
        const [hours, minutes] = (evento.horario || '00:00').split(':');
        const eventoDate = parseLocalDate(evento.data);
        eventoDate.setHours(parseInt(hours) || 0, parseInt(minutes) || 0, 0);
        
        // Considera "acontecendo agora" se começou há menos de 6 horas
        const horasDecorridas = (agora.getTime() - eventoDate.getTime()) / (1000 * 60 * 60);
        const estaAcontecendo = horasDecorridas >= 0 && horasDecorridas <= 6;
        
        return temCoordenadas && estaAcontecendo;
      }
      
      // Filtro normal por data
      const matchData = filtroData === 'todas' || evento.data === filtroData;
      return temCoordenadas && matchData;
    });
  }, [eventos, filtroData, mostrarAcontecendoAgora]);

  if (loading) {
    return (
      <div className="flex items-center justify-center h-64">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-pink-600" />
      </div>
    );
  }

  return (
    <div className="space-y-4">
      {/* Filtro */}
      <Card>
        <CardHeader>
          <CardTitle className="text-lg">Filtros</CardTitle>
        </CardHeader>
        <CardContent className="space-y-4">
          {/* Botão Acontecendo Agora */}
          <Button
            variant={mostrarAcontecendoAgora ? "default" : "outline"}
            className={`w-full justify-start gap-2 ${
              mostrarAcontecendoAgora 
                ? 'bg-gradient-to-r from-orange-500 to-pink-600 text-white hover:from-orange-600 hover:to-pink-700' 
                : ''
            }`}
            onClick={() => {
              setMostrarAcontecendoAgora(!mostrarAcontecendoAgora);
              if (!mostrarAcontecendoAgora) {
                setFiltroData('todas'); // Reset filtro de data quando ativar "Acontecendo Agora"
              }
            }}
          >
            <Zap className="w-4 h-4" />
            {mostrarAcontecendoAgora ? '🔥 Acontecendo Agora!' : 'Ver Acontecendo Agora'}
          </Button>

          {/* Filtro por Data (desabilitado se "Acontecendo Agora" estiver ativo) */}
          <div className={mostrarAcontecendoAgora ? 'opacity-50 pointer-events-none' : ''}>
            <label className="text-sm font-medium mb-2 block">Filtrar por data</label>
            <Select 
              value={filtroData} 
              onValueChange={setFiltroData}
              disabled={mostrarAcontecendoAgora}
            >
              <SelectTrigger>
                <SelectValue placeholder="Selecione uma data" />
              </SelectTrigger>
              <SelectContent>
                <SelectItem value="todas">Todas as datas</SelectItem>
                {datasDisponiveis.map(data => (
                  <SelectItem key={data} value={data}>
                    {format(parseLocalDate(data), "EEEE, dd/MM", { locale: ptBR })}
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
          </div>

          <p className="text-sm text-muted-foreground pt-2 border-t">
            {mostrarAcontecendoAgora ? (
              <>
                <Zap className="w-3 h-3 inline mr-1" />
                <strong>{eventosNoMapa.length}</strong> blocos acontecendo agora
              </>
            ) : (
              <>
                <MapPin className="w-3 h-3 inline mr-1" />
                {eventosNoMapa.length} blocos no mapa
              </>
            )}
          </p>
        </CardContent>
      </Card>

      {/* Mapa */}
      <Card className="overflow-hidden">
        <div className="h-[600px]">
          {eventosNoMapa.length === 0 ? (
            <div className="flex items-center justify-center h-full bg-muted">
              <p className="text-muted-foreground">
                {eventos.length > 0 
                  ? 'Nenhum bloco com localização disponível para esta data'
                  : 'Carregando blocos...'
                }
              </p>
            </div>
          ) : (
            <Map center={RIO_CENTER} zoom={12}>
              <MapTileLayer />
              <MapZoomControl />
              {eventosNoMapa.map((evento) => (
                <MapMarker
                  key={evento.id}
                  position={[evento.local_lat!, evento.local_lng!]}
                  eventHandlers={{
                    click: () => {
                      setSelectedEvento(evento);
                      setDrawerOpen(true);
                    },
                  }}
                >
                  <MapPopup>
                    <div className="space-y-2 min-w-[200px] cursor-pointer">
                      <h3 className="font-bold">{evento.bloco_nome}</h3>
                      <div className="space-y-1 text-sm">
                        <div className="flex items-center gap-1">
                          <Badge variant="secondary" className="text-xs">
                            {format(parseLocalDate(evento.data), "dd/MM", { locale: ptBR })}
                          </Badge>
                          <Badge variant="outline" className="text-xs">
                            <Clock className="w-3 h-3 mr-1" />
                            {evento.horario || 'A confirmar'}
                          </Badge>
                        </div>
                        <p className="text-xs text-muted-foreground mt-2">Clique para ver detalhes</p>
                      </div>
                    </div>
                  </MapPopup>
                </MapMarker>
              ))}
            </Map>
          )}
        </div>
      </Card>
      
      <EventoDrawer
        evento={selectedEvento}
        isOpen={drawerOpen}
        onClose={() => setDrawerOpen(false)}
      />
    </div>
  );
}
