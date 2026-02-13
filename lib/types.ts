export type Bloco = {
  id: string;
  nome: string;
  descricao?: string;
  instagram_url?: string;
  whatsapp_url?: string;
  slug: string;
  created_at: string;
  updated_at: string;
};

export type Evento = {
  id: string;
  bloco_id: string;
  data: string; // YYYY-MM-DD
  horario?: string; // HH:MM
  horario_confirmado: boolean;
  local_nome: string;
  local_endereco: string;
  local_lat?: number;
  local_lng?: number;
  local_confirmado: boolean;
  observacoes?: string;
  created_at: string;
};

export type EventoCompleto = Evento & {
  bloco_nome: string;
  bloco_slug: string;
  instagram_url?: string;
  whatsapp_url?: string;
  ano_fundacao?: string;
  descricao_detalhada?: string;
  bairro_nome?: string;
  bairro_regiao?: string;
  tipo?: string;
  publico_estimado?: number;
  hora_fim?: string;
  api_id?: number;
};

export type Contribuicao = {
  id: string;
  evento_id: string;
  user_id: string;
  tipo: 'foto' | 'relato';
  conteudo: string;
  legenda?: string;
  aprovado: boolean;
  created_at: string;
};

export type Comentario = {
  id: string;
  evento_id: string;
  user_id: string;
  texto: string;
  aprovado: boolean;
  created_at: string;
};

export type ModoVisualizacao = 'agenda' | 'lista' | 'calendario' | 'mapa';

export type PresencaConfirmada = {
  id: string;
  user_id: string;
  evento_id: string;
  created_at: string;
};

export type Amigo = {
  id: string;
  user_id: string;
  amigo_id: string;
  status: 'pendente' | 'aceito';
  created_at: string;
};

export type Usuario = {
  id: string;
  email: string;
  nome?: string;
  avatar_url?: string;
  created_at: string;
};
