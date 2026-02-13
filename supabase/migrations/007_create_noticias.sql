-- Criar tabela de notícias
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

-- Índices para performance
CREATE INDEX IF NOT EXISTS idx_noticias_fonte ON noticias(fonte);
CREATE INDEX IF NOT EXISTS idx_noticias_publicado ON noticias(publicado_em DESC);
CREATE INDEX IF NOT EXISTS idx_noticias_coletado ON noticias(coletado_em DESC);
CREATE INDEX IF NOT EXISTS idx_noticias_alerta ON noticias(is_alerta) WHERE is_alerta = TRUE;
CREATE INDEX IF NOT EXISTS idx_noticias_bloco ON noticias(bloco_relacionado) WHERE bloco_relacionado IS NOT NULL;
CREATE INDEX IF NOT EXISTS idx_noticias_tags ON noticias USING GIN(tags);

-- RLS Policies
ALTER TABLE noticias ENABLE ROW LEVEL SECURITY;

-- Qualquer um pode ler notícias
CREATE POLICY "Notícias são públicas para leitura"
  ON noticias FOR SELECT
  USING (true);

-- Permitir inserção via service key (scripts de scraping)
-- NOTA: Em produção, trocar por auth check específico
CREATE POLICY "Scripts podem inserir notícias"
  ON noticias FOR INSERT
  WITH CHECK (true);

CREATE POLICY "Scripts podem atualizar notícias"
  ON noticias FOR UPDATE
  USING (true);

-- Função para atualizar updated_at automaticamente
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger para atualizar updated_at
CREATE TRIGGER update_noticias_updated_at
  BEFORE UPDATE ON noticias
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- Comentários
COMMENT ON TABLE noticias IS 'Notícias e alertas sobre blocos de carnaval (scraping)';
COMMENT ON COLUMN noticias.is_alerta IS 'TRUE se for cancelamento, mudança de horário/local, etc';
COMMENT ON COLUMN noticias.tags IS 'Tags extraídas do conteúdo (cancelamento, mudança, novo horário, etc)';
COMMENT ON COLUMN noticias.bloco_relacionado IS 'FK para blocos se a notícia menciona um bloco específico';
