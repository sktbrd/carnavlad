-- Habilitar extensão UUID
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Tabela de blocos
CREATE TABLE IF NOT EXISTS blocos (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  nome VARCHAR NOT NULL,
  descricao TEXT,
  instagram_url VARCHAR,
  whatsapp_url VARCHAR,
  slug VARCHAR UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Tabela de eventos
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
  created_at TIMESTAMP DEFAULT NOW()
);

-- Tabela de usuários (perfil público)
CREATE TABLE IF NOT EXISTS usuarios (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  email VARCHAR UNIQUE NOT NULL,
  nome VARCHAR,
  avatar_url VARCHAR,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Tabela de presenças confirmadas
CREATE TABLE IF NOT EXISTS presencas_confirmadas (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  evento_id UUID REFERENCES eventos(id) ON DELETE CASCADE,
  created_at TIMESTAMP DEFAULT NOW(),
  UNIQUE(user_id, evento_id)
);

-- Tabela de amigos (follow/unfollow)
CREATE TABLE IF NOT EXISTS amigos (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  amigo_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  status VARCHAR(20) DEFAULT 'pendente', -- 'pendente' | 'aceito' | 'rejeitado'
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW(),
  UNIQUE(user_id, amigo_id),
  CHECK (user_id != amigo_id) -- Não pode seguir a si mesmo
);

-- Tabela de contribuições (fotos/relatos)
CREATE TABLE IF NOT EXISTS contribuicoes (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  evento_id UUID REFERENCES eventos(id) ON DELETE CASCADE,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  tipo VARCHAR(20) NOT NULL, -- 'foto' | 'relato'
  conteudo TEXT NOT NULL,
  legenda TEXT,
  aprovado BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Tabela de comentários
CREATE TABLE IF NOT EXISTS comentarios (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  evento_id UUID REFERENCES eventos(id) ON DELETE CASCADE,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  texto TEXT NOT NULL,
  aprovado BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Índices para performance
CREATE INDEX idx_eventos_data ON eventos(data);
CREATE INDEX idx_eventos_bloco_id ON eventos(bloco_id);
CREATE INDEX idx_presencas_user_id ON presencas_confirmadas(user_id);
CREATE INDEX idx_presencas_evento_id ON presencas_confirmadas(evento_id);
CREATE INDEX idx_amigos_user_id ON amigos(user_id);
CREATE INDEX idx_amigos_amigo_id ON amigos(amigo_id);
CREATE INDEX idx_amigos_status ON amigos(status);

-- Trigger para atualizar updated_at
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_blocos_updated_at
  BEFORE UPDATE ON blocos
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_usuarios_updated_at
  BEFORE UPDATE ON usuarios
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_amigos_updated_at
  BEFORE UPDATE ON amigos
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- Comentários nas tabelas
COMMENT ON TABLE blocos IS 'Blocos de carnaval do Rio 2026';
COMMENT ON TABLE eventos IS 'Eventos/saídas dos blocos';
COMMENT ON TABLE usuarios IS 'Perfis públicos dos usuários';
COMMENT ON TABLE presencas_confirmadas IS 'Blocos que o usuário confirmou presença';
COMMENT ON TABLE amigos IS 'Relacionamento de amizade entre usuários';
COMMENT ON TABLE contribuicoes IS 'Fotos e relatos enviados pelos usuários';
COMMENT ON TABLE comentarios IS 'Comentários nos eventos';
