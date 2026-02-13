-- Adicionar campos extras na tabela blocos

-- Foto do bloco
ALTER TABLE blocos ADD COLUMN IF NOT EXISTS photo_url TEXT;

-- Ano de fundação
ALTER TABLE blocos ADD COLUMN IF NOT EXISTS ano_fundacao INTEGER;

-- Site oficial
ALTER TABLE blocos ADD COLUMN IF NOT EXISTS site_url TEXT;

-- Comentário
COMMENT ON COLUMN blocos.photo_url IS 'URL da foto principal do bloco';
COMMENT ON COLUMN blocos.ano_fundacao IS 'Ano de fundação do bloco';
COMMENT ON COLUMN blocos.site_url IS 'Site oficial do bloco';

-- Recriar view eventos_completos para incluir novos campos
DROP VIEW IF EXISTS eventos_completos;

CREATE OR REPLACE VIEW eventos_completos AS
SELECT 
  e.*,
  b.nome AS bloco_nome,
  b.slug AS bloco_slug,
  b.descricao AS bloco_descricao,
  b.instagram_url,
  b.whatsapp_url,
  b.photo_url AS bloco_photo_url,
  b.ano_fundacao,
  b.site_url,
  bairro.nome AS bairro_nome,
  bairro.regiao
FROM eventos e
JOIN blocos b ON e.bloco_id = b.id
LEFT JOIN bairros bairro ON e.bairro_id = bairro.id;

COMMENT ON VIEW eventos_completos IS 'View completa com dados de eventos + blocos + bairros';
