'use client';

import { useMemo, useState } from 'react';
import dynamic from 'next/dynamic';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '@/components/ui/select';
import { Clock, MapPin } from 'lucide-react';
import { format } from 'date-fns';
import { ptBR } from 'date-fns/locale';
import { useBlocos } from '@/lib/hooks/use-blocos';

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

  // Extrair datas únicas
  const datasDisponiveis = useMemo(() => {
    const datas = new Set(eventos.map(e => e.data));
    return Array.from(datas).sort();
  }, [eventos]);

  // Filtrar eventos com coordenadas
  const eventosNoMapa = useMemo(() => {
    return eventos.filter(evento => {
      const temCoordenadas = evento.local_lat && evento.local_lng;
      const matchData = filtroData === 'todas' || evento.data === filtroData;
      return temCoordenadas && matchData;
    });
  }, [eventos, filtroData]);

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
          <CardTitle className="text-lg">Filtrar por data</CardTitle>
        </CardHeader>
        <CardContent>
          <Select value={filtroData} onValueChange={setFiltroData}>
            <SelectTrigger>
              <SelectValue placeholder="Selecione uma data" />
            </SelectTrigger>
            <SelectContent>
              <SelectItem value="todas">Todas as datas</SelectItem>
              {datasDisponiveis.map(data => (
                <SelectItem key={data} value={data}>
                  {format(new Date(data), "EEEE, dd/MM", { locale: ptBR })}
                </SelectItem>
              ))}
            </SelectContent>
          </Select>
          <p className="text-sm text-muted-foreground mt-2">
            {eventosNoMapa.length} blocos no mapa
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
                >
                  <MapPopup>
                    <div className="space-y-2 min-w-[200px]">
                      <h3 className="font-bold">{evento.bloco_nome}</h3>
                      <div className="space-y-1 text-sm">
                        <div className="flex items-center gap-1">
                          <Badge variant="secondary" className="text-xs">
                            {format(new Date(evento.data), "dd/MM", { locale: ptBR })}
                          </Badge>
                          <Badge variant="outline" className="text-xs">
                            <Clock className="w-3 h-3 mr-1" />
                            {evento.horario || 'A confirmar'}
                          </Badge>
                        </div>
                        <div className="flex items-start gap-1">
                          <MapPin className="w-3 h-3 mt-0.5 flex-shrink-0" />
                          <div>
                            <p className="font-medium">{evento.local_nome}</p>
                            <p className="text-muted-foreground text-xs">{evento.local_endereco}</p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </MapPopup>
                </MapMarker>
              ))}
            </Map>
          )}
        </div>
      </Card>
    </div>
  );
}
