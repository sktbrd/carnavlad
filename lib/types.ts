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
  bloco_descricao?: string;
  instagram_url?: string;
  whatsapp_url?: string;
  bloco_photo_url?: string;
  ano_fundacao?: number;
  site_url?: string;
  descricao_detalhada?: string;
  bairro_nome?: string;
  regiao?: string;
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

export type ModoVisualizacao = 'agenda' | 'lista' | 'calendario' | 'mapa' | 'noticias';

export type Noticia = {
  id: string;
  titulo: string;
  resumo: string;
  url: string;
  fonte: 'diariodorio' | 'g1' | 'vejario' | 'twitter' | 'instagram' | 'riotur';
  imagem_url?: string;
  publicado_em: string;
  coletado_em: string;
  tags: string[];
  is_alerta: boolean; // cancelamento, mudança, etc
  bloco_relacionado?: string; // ID do bloco se aplicável
};

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
