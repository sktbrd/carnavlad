-- Adicionar campos extras para dados da API oficial

-- Adicionar campos em blocos
ALTER TABLE blocos
  ADD COLUMN IF NOT EXISTS ano_fundacao VARCHAR,
  ADD COLUMN IF NOT EXISTS descricao_detalhada TEXT;

-- Adicionar campos em eventos
ALTER TABLE eventos
  ADD COLUMN IF NOT EXISTS api_id INTEGER UNIQUE, -- ID da API oficial
  ADD COLUMN IF NOT EXISTS tipo VARCHAR, -- TRADICIONAL, MEGA BLOCO, INFANTIL, etc
  ADD COLUMN IF NOT EXISTS publico_estimado INTEGER,
  ADD COLUMN IF NOT EXISTS hora_fim TIME,
  ADD COLUMN IF NOT EXISTS extra_info JSONB; -- Para campos extras da API

-- Adicionar tabela de bairros
CREATE TABLE IF NOT EXISTS bairros (
  id INTEGER PRIMARY KEY, -- ID da API
  nome VARCHAR NOT NULL,
  regiao VARCHAR NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Adicionar referência de bairro em eventos
ALTER TABLE eventos
  ADD COLUMN IF NOT EXISTS bairro_id INTEGER REFERENCES bairros(id);

-- Índices
CREATE INDEX IF NOT EXISTS idx_eventos_api_id ON eventos(api_id);
CREATE INDEX IF NOT EXISTS idx_eventos_tipo ON eventos(tipo);
CREATE INDEX IF NOT EXISTS idx_eventos_bairro_id ON eventos(bairro_id);
CREATE INDEX IF NOT EXISTS idx_bairros_regiao ON bairros(regiao);

-- Atualizar views
DROP VIEW IF EXISTS eventos_completos;

CREATE OR REPLACE VIEW eventos_completos AS
SELECT 
  e.*,
  b.nome AS bloco_nome,
  b.slug AS bloco_slug,
  b.instagram_url,
  b.whatsapp_url,
  b.ano_fundacao,
  b.descricao_detalhada,
  br.nome AS bairro_nome,
  br.regiao AS bairro_regiao
FROM eventos e
JOIN blocos b ON e.bloco_id = b.id
LEFT JOIN bairros br ON e.bairro_id = br.id;

-- Comentários
COMMENT ON COLUMN eventos.api_id IS 'ID da API oficial do Carnaval de Rua Rio';
COMMENT ON COLUMN eventos.tipo IS 'TRADICIONAL | MEGA BLOCO | INFANTIL | RELIGIOSO | LGBTQIAPN+';
COMMENT ON COLUMN eventos.publico_estimado IS 'Estimativa de público do evento';
COMMENT ON TABLE bairros IS 'Bairros do Rio de Janeiro (da API oficial)';
