-- Migration 010: Garantir que todas as tabelas essenciais existem
-- Fix para tabelas que podem não ter sido criadas na migration 001

-- Verificar e criar extensão UUID
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Garantir que tabela blocos existe
CREATE TABLE IF NOT EXISTS blocos (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  nome VARCHAR NOT NULL,
  descricao TEXT,
  instagram_url VARCHAR,
  whatsapp_url VARCHAR,
  slug VARCHAR UNIQUE NOT NULL,
  photo_url TEXT,
  ano_fundacao INTEGER,
  site_url TEXT,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Garantir que tabela eventos existe
CREATE TABLE IF NOT EXISTS eventos (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  bloco_id UUID REFERENCES blocos(id) ON DELETE CASCADE,
  data DATE NOT NULL,
  horario TIME,
  horario_confirmado BOOLEAN DEFAULT FALSE,
  local_nome VARCHAR NOT NULL,
  local_endereco VARCHAR NOT NULL,
  local_lat DECIMAL(10, 8),
  local_lng DECIMAL(11, 8),
  local_confirmado BOOLEAN DEFAULT FALSE,
  observacoes TEXT,
  tipo VARCHAR(50),
  publico_estimado INTEGER,
  bairro_id INTEGER,
  hora_fim TIME,
  api_id INTEGER,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Garantir que tabela usuarios existe
CREATE TABLE IF NOT EXISTS usuarios (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  email VARCHAR UNIQUE NOT NULL,
  nome VARCHAR,
  avatar_url VARCHAR,
  username TEXT UNIQUE,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- GARANTIR QUE PRESENCAS_CONFIRMADAS EXISTE (principal problema)
CREATE TABLE IF NOT EXISTS presencas_confirmadas (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  evento_id UUID REFERENCES eventos(id) ON DELETE CASCADE,
  created_at TIMESTAMP DEFAULT NOW(),
  UNIQUE(user_id, evento_id)
);

-- Garantir que tabela amigos existe
CREATE TABLE IF NOT EXISTS amigos (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  amigo_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  status VARCHAR(20) DEFAULT 'pendente',
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW(),
  UNIQUE(user_id, amigo_id),
  CHECK (user_id != amigo_id)
);

-- Garantir que tabela bairros existe
CREATE TABLE IF NOT EXISTS bairros (
  id SERIAL PRIMARY KEY,
  nome VARCHAR NOT NULL,
  regiao VARCHAR,
  slug VARCHAR UNIQUE
);

-- Garantir que tabela noticias existe
CREATE TABLE IF NOT EXISTS noticias (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  titulo TEXT NOT NULL,
  resumo TEXT,
  url TEXT UNIQUE NOT NULL,
  fonte TEXT NOT NULL CHECK (fonte IN ('diariodorio', 'g1', 'vejario', 'twitter', 'instagram', 'riotur')),
  imagem_url TEXT,
  publicado_em TIMESTAMPTZ,
  coletado_em TIMESTAMPTZ DEFAULT NOW(),
  tags TEXT[] DEFAULT '{}',
  is_alerta BOOLEAN DEFAULT FALSE,
  bloco_relacionado UUID REFERENCES blocos(id) ON DELETE SET NULL,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Índices importantes (se não existirem)
CREATE INDEX IF NOT EXISTS idx_presencas_user ON presencas_confirmadas(user_id);
CREATE INDEX IF NOT EXISTS idx_presencas_evento ON presencas_confirmadas(evento_id);
CREATE INDEX IF NOT EXISTS idx_amigos_user ON amigos(user_id);
CREATE INDEX IF NOT EXISTS idx_amigos_status ON amigos(status);
CREATE INDEX IF NOT EXISTS idx_eventos_data ON eventos(data);
CREATE INDEX IF NOT EXISTS idx_eventos_bloco ON eventos(bloco_id);
CREATE INDEX IF NOT EXISTS idx_usuarios_username ON usuarios(username);
CREATE INDEX IF NOT EXISTS idx_noticias_fonte ON noticias(fonte);

-- Comentários para documentação
COMMENT ON TABLE presencas_confirmadas IS 'Blocos que o usuário confirmou presença (favoritos)';
COMMENT ON TABLE amigos IS 'Sistema de follow/amigos entre usuários';
COMMENT ON TABLE usuarios IS 'Perfis públicos dos usuários';
COMMENT ON TABLE noticias IS 'Notícias e alertas sobre blocos de carnaval';

-- Verificar e mostrar quais tabelas foram criadas
DO $$
BEGIN
  RAISE NOTICE '✅ Migration 010 concluída - Tabelas verificadas/criadas';
  RAISE NOTICE '   - blocos';
  RAISE NOTICE '   - eventos';
  RAISE NOTICE '   - usuarios';
  RAISE NOTICE '   - presencas_confirmadas ✅';
  RAISE NOTICE '   - amigos';
  RAISE NOTICE '   - bairros';
  RAISE NOTICE '   - noticias';
END $$;
