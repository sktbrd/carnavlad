'use client';

import { useState, useMemo } from 'react';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Input } from '@/components/ui/input';
import { Badge } from '@/components/ui/badge';
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '@/components/ui/select';
import { Clock, MapPin, Search, Filter } from 'lucide-react';
import { format } from 'date-fns';
import { ptBR } from 'date-fns/locale';
import { useBlocos } from '@/lib/hooks/use-blocos';

export default function ListaView() {
  const { eventos, loading } = useBlocos();
  const [busca, setBusca] = useState('');
  const [filtroData, setFiltroData] = useState<string>('todas');

  // Extrair datas únicas
  const datasDisponiveis = useMemo(() => {
    const datas = new Set(eventos.map(e => e.data));
    return Array.from(datas).sort();
  }, [eventos]);

  // Filtrar eventos
  const eventosFiltrados = useMemo(() => {
    return eventos.filter(evento => {
      const matchBusca = busca === '' || 
        evento.bloco_nome.toLowerCase().includes(busca.toLowerCase()) ||
        evento.local_nome.toLowerCase().includes(busca.toLowerCase()) ||
        evento.local_endereco.toLowerCase().includes(busca.toLowerCase());
      
      const matchData = filtroData === 'todas' || evento.data === filtroData;

      return matchBusca && matchData;
    });
  }, [eventos, busca, filtroData]);

  if (loading) {
    return (
      <div className="flex items-center justify-center h-64">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-pink-600" />
      </div>
    );
  }

  return (
    <div className="space-y-6">
      {/* Filtros */}
      <Card>
        <CardHeader>
          <CardTitle className="flex items-center gap-2">
            <Filter className="w-5 h-5" />
            Filtros
          </CardTitle>
        </CardHeader>
        <CardContent className="space-y-4">
          <div className="relative">
            <Search className="absolute left-3 top-3 h-4 w-4 text-muted-foreground" />
            <Input
              placeholder="Buscar bloco, local ou endereço..."
              value={busca}
              onChange={(e) => setBusca(e.target.value)}
              className="pl-10"
            />
          </div>
          <Select value={filtroData} onValueChange={setFiltroData}>
            <SelectTrigger>
              <SelectValue placeholder="Filtrar por data" />
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
        </CardContent>
      </Card>

      {/* Resultados */}
      <div className="space-y-2">
        <p className="text-sm text-muted-foreground">
          {eventosFiltrados.length} {eventosFiltrados.length === 1 ? 'bloco encontrado' : 'blocos encontrados'}
        </p>
        
        <div className="grid gap-3">
          {eventosFiltrados.map((evento) => (
            <Card key={evento.id} className="hover:shadow-md transition-shadow">
              <CardContent className="p-4">
                <div className="flex items-start justify-between gap-4">
                  <div className="flex-1 space-y-2">
                    <div>
                      <h3 className="font-bold text-lg">{evento.bloco_nome}</h3>
                      <div className="flex flex-wrap gap-2 mt-1">
                        <Badge variant="secondary">
                          {format(new Date(evento.data), "dd/MM", { locale: ptBR })}
                        </Badge>
                        <Badge variant="outline" className="flex items-center gap-1">
                          <Clock className="w-3 h-3" />
                          {evento.horario || 'A confirmar'}
                        </Badge>
                      </div>
                    </div>
                    <div className="flex items-start gap-2 text-sm">
                      <MapPin className="w-4 h-4 mt-0.5 text-muted-foreground flex-shrink-0" />
                      <div>
                        <p className="font-medium">{evento.local_nome}</p>
                        <p className="text-muted-foreground">{evento.local_endereco}</p>
                      </div>
                    </div>
                  </div>
                </div>
              </CardContent>
            </Card>
          ))}
        </div>
      </div>
    </div>
  );
}
