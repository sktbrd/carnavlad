import { useState, useEffect, useMemo } from 'react';
import type { EventoCompleto } from '@/lib/types';

// Mock data - será substituído por Supabase depois
const MOCK_EVENTOS: EventoCompleto[] = [
  // Sábado 14/02
  { id: '1', bloco_id: '1', bloco_nome: 'Cordão da Bola Preta', bloco_slug: 'cordao-da-bola-preta', data: '2026-02-14', horario: '07:00', horario_confirmado: true, local_nome: 'R. Primeiro de Março', local_endereco: 'R. Primeiro de Março, Centro', local_lat: -22.9035, local_lng: -43.1755, local_confirmado: true, created_at: new Date().toISOString() },
  { id: '2', bloco_id: '2', bloco_nome: 'Multibloco', bloco_slug: 'multibloco', data: '2026-02-14', horario: '07:00', horario_confirmado: true, local_nome: 'Av. Henrique Valadares', local_endereco: 'Av. Henrique Valadares, Centro', local_lat: -22.9133, local_lng: -43.1804, local_confirmado: true, created_at: new Date().toISOString() },
  { id: '3', bloco_id: '3', bloco_nome: 'Bloco Amigos da Onça', bloco_slug: 'amigos-da-onca', data: '2026-02-14', horario: '07:00', horario_confirmado: true, local_nome: 'Calçadão da Praia do Flamengo', local_endereco: 'Calçadão da Praia do Flamengo, Flamengo', local_lat: -22.9379, local_lng: -43.1726, local_confirmado: true, created_at: new Date().toISOString() },
  { id: '4', bloco_id: '4', bloco_nome: 'Bloco Exagerado', bloco_slug: 'bloco-exagerado', data: '2026-02-14', horario: '07:00', horario_confirmado: true, local_nome: 'Praça Tiradentes', local_endereco: 'Praça Tiradentes, Centro', local_lat: -22.9092, local_lng: -43.1848, local_confirmado: true, created_at: new Date().toISOString() },
  { id: '5', bloco_id: '5', bloco_nome: 'Blocobuster', bloco_slug: 'blocobuster', data: '2026-02-14', horario: '07:00', horario_confirmado: true, local_nome: 'Praça Alm. Júlio de Noronha', local_endereco: 'Praça Alm. Júlio de Noronha, Leme', local_lat: -22.9658, local_lng: -43.1670, local_confirmado: true, created_at: new Date().toISOString() },
  { id: '6', bloco_id: '6', bloco_nome: 'Céu na Terra', bloco_slug: 'ceu-na-terra', data: '2026-02-14', horario: '07:00', horario_confirmado: true, local_nome: 'R. Alm. Alexandrino', local_endereco: 'R. Alm. Alexandrino, Santa Teresa', local_lat: -22.9162, local_lng: -43.1856, local_confirmado: true, created_at: new Date().toISOString() },
  { id: '7', bloco_id: '7', bloco_nome: 'Bloco Escangalha', bloco_slug: 'bloco-escangalha', data: '2026-02-14', horario: '08:00', horario_confirmado: true, local_nome: 'R. Pacheco Leão', local_endereco: 'R. Pacheco Leão, Jardim Botânico', local_lat: -22.9674, local_lng: -43.2224, local_confirmado: true, created_at: new Date().toISOString() },
  { id: '8', bloco_id: '8', bloco_nome: 'Bloco do Barbas', bloco_slug: 'bloco-do-barbas', data: '2026-02-14', horario: '11:00', horario_confirmado: true, local_nome: 'R. Arnaldo Quintela', local_endereco: 'R. Arnaldo Quintela, Botafogo', local_lat: -22.9502, local_lng: -43.1834, local_confirmado: true, created_at: new Date().toISOString() },
  { id: '9', bloco_id: '9', bloco_nome: 'Fogo na Cueca', bloco_slug: 'fogo-na-cueca', data: '2026-02-14', horario: '12:00', horario_confirmado: true, local_nome: 'Praça Edmundo Bitencourt', local_endereco: 'Praça Edmundo Bitencourt, Copacabana', local_lat: -22.9690, local_lng: -43.1821, local_confirmado: true, created_at: new Date().toISOString() },
  { id: '10', bloco_id: '10', bloco_nome: 'Banda de Ipanema', bloco_slug: 'banda-de-ipanema', data: '2026-02-14', horario: '15:00', horario_confirmado: true, local_nome: 'R. Gomes Carneiro', local_endereco: 'R. Gomes Carneiro, Ipanema', local_lat: -22.9844, local_lng: -43.2004, local_confirmado: true, created_at: new Date().toISOString() },
  { id: '11', bloco_id: '11', bloco_nome: 'Carioca da Gema', bloco_slug: 'carioca-da-gema', data: '2026-02-14', horario: '15:00', horario_confirmado: true, local_nome: 'R. dos Arcos', local_endereco: 'R. dos Arcos, Lapa', local_lat: -22.9133, local_lng: -43.1797, local_confirmado: true, created_at: new Date().toISOString() },
  
  // Domingo 15/02
  { id: '12', bloco_id: '12', bloco_nome: 'Boi Tolo', bloco_slug: 'boi-tolo', data: '2026-02-15', horario: '07:00', horario_confirmado: true, local_nome: 'Diversos pontos do Centro', local_endereco: 'Sai de diversos pontos e se encontram no Aterro', local_confirmado: true, observacoes: 'Múltiplos pontos de saída', created_at: new Date().toISOString() },
  { id: '13', bloco_id: '13', bloco_nome: 'Bloco Areia', bloco_slug: 'bloco-areia', data: '2026-02-15', horario: '07:00', horario_confirmado: true, local_nome: 'Av. Delfim Moreira', local_endereco: 'Av. Delfim Moreira, Leblon', local_lat: -22.9844, local_lng: -43.2265, local_confirmado: true, created_at: new Date().toISOString() },
  { id: '14', bloco_id: '14', bloco_nome: 'Bangalafumenga', bloco_slug: 'bangalafumenga', data: '2026-02-15', horario: '09:00', horario_confirmado: true, local_nome: 'Av. Infante Dom Henrique', local_endereco: 'Av. Infante Dom Henrique, Glória', local_lat: -22.9229, local_lng: -43.1722, local_confirmado: true, created_at: new Date().toISOString() },
  { id: '15', bloco_id: '15', bloco_nome: 'Simpatia É Quase Amor', bloco_slug: 'simpatia-e-quase-amor', data: '2026-02-15', horario: '14:00', horario_confirmado: true, local_nome: 'R. Teixeira de Melo', local_endereco: 'R. Teixeira de Melo, Ipanema', local_lat: -22.9854, local_lng: -43.2014, local_confirmado: true, created_at: new Date().toISOString() },
  { id: '16', bloco_id: '16', bloco_nome: 'Banda de Ipanema', bloco_slug: 'banda-de-ipanema-dom', data: '2026-02-15', horario: '15:00', horario_confirmado: true, local_nome: 'R. Gomes Carneiro', local_endereco: 'R. Gomes Carneiro, Ipanema', local_lat: -22.9844, local_lng: -43.2004, local_confirmado: true, created_at: new Date().toISOString() },
  { id: '17', bloco_id: '17', bloco_nome: 'Cordão da Tia Juca', bloco_slug: 'cordao-da-tia-juca', data: '2026-02-15', horario: '18:00', horario_confirmado: true, local_nome: 'Praça Saens Peña', local_endereco: 'Praça Saens Peña, Tijuca', local_lat: -22.9264, local_lng: -43.2311, local_confirmado: true, created_at: new Date().toISOString() },
  
  // Segunda 16/02
  { id: '18', bloco_id: '18', bloco_nome: 'Que Pena Amor', bloco_slug: 'que-pena-amor', data: '2026-02-16', horario: '07:00', horario_confirmado: true, local_nome: 'Praça Tiradentes', local_endereco: 'Praça Tiradentes, Centro', local_lat: -22.9092, local_lng: -43.1848, local_confirmado: true, created_at: new Date().toISOString() },
  { id: '19', bloco_id: '19', bloco_nome: 'Bloco Corre Atrás', bloco_slug: 'bloco-corre-atras', data: '2026-02-16', horario: '07:00', horario_confirmado: true, local_nome: 'Av. Delfim Moreira', local_endereco: 'Av. Delfim Moreira, Leblon', local_lat: -22.9844, local_lng: -43.2265, local_confirmado: true, created_at: new Date().toISOString() },
  { id: '20', bloco_id: '20', bloco_nome: 'Bloco do Sargento Pimenta', bloco_slug: 'sargento-pimenta', data: '2026-02-16', horario: '08:00', horario_confirmado: true, local_nome: 'Av. Infante Dom Henrique', local_endereco: 'Av. Infante Dom Henrique, Glória', local_lat: -22.9229, local_lng: -43.1722, local_confirmado: true, created_at: new Date().toISOString() },
  { id: '21', bloco_id: '21', bloco_nome: 'Carrossel de Emoções', bloco_slug: 'carrossel-de-emocoes', data: '2026-02-16', horario: '14:00', horario_confirmado: true, local_nome: 'Av. Infante Dom Henrique', local_endereco: 'Av. Infante Dom Henrique, Glória', local_lat: -22.9229, local_lng: -43.1722, local_confirmado: true, created_at: new Date().toISOString() },
  
  // Terça 17/02
  { id: '22', bloco_id: '22', bloco_nome: 'Orquestra Voadora', bloco_slug: 'orquestra-voadora', data: '2026-02-17', horario: '15:00', horario_confirmado: true, local_nome: 'Av. Infante Dom Henrique', local_endereco: 'Av. Infante Dom Henrique, Glória', local_lat: -22.9229, local_lng: -43.1722, local_confirmado: true, created_at: new Date().toISOString() },
  { id: '23', bloco_id: '23', bloco_nome: 'Banda de Ipanema', bloco_slug: 'banda-de-ipanema-ter', data: '2026-02-17', horario: '15:00', horario_confirmado: true, local_nome: 'R. Gomes Carneiro', local_endereco: 'R. Gomes Carneiro, Ipanema', local_lat: -22.9844, local_lng: -43.2004, local_confirmado: true, created_at: new Date().toISOString() },
  
  // Quarta 18/02
  { id: '24', bloco_id: '24', bloco_nome: 'Cordão do Me Enterra na Quarta', bloco_slug: 'me-enterra-na-quarta', data: '2026-02-18', horario: '13:00', horario_confirmado: true, local_nome: 'Av. Augusto Severo', local_endereco: 'Av. Augusto Severo, Centro', local_lat: -22.9167, local_lng: -43.1755, local_confirmado: true, created_at: new Date().toISOString() },
];

export function useBlocos() {
  const [eventos, setEventos] = useState<EventoCompleto[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    // Simula fetch
    setTimeout(() => {
      setEventos(MOCK_EVENTOS);
      setLoading(false);
    }, 500);
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
