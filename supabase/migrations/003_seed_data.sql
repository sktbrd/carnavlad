-- Seed data: Blocos e Eventos do Carnaval 2026

-- Inserir blocos famosos do Rio
INSERT INTO blocos (nome, descricao, instagram_url, slug) VALUES
('Bloco da Alegria', 'Um dos blocos mais tradicionais do Rio, conhecido por suas músicas animadas e fantasias coloridas.', 'https://instagram.com/blocoalegria', 'bloco-da-alegria'),
('Cordão da Bola Preta', 'O bloco mais antigo do Rio, fundado em 1918. Tradicional ponto de encontro na Cinelândia.', 'https://instagram.com/bolapreta', 'cordao-da-bola-preta'),
('Monobloco', 'Bloco instrumental com músicos profissionais, conhecido por seus arranjos sofisticados.', 'https://instagram.com/monobloco', 'monobloco'),
('Sargento Pimenta', 'Tributo aos Beatles com muita irreverência carioca.', 'https://instagram.com/sargentopimenta', 'sargento-pimenta'),
('Simpatia é Quase Amor', 'Um dos maiores blocos do Rio, com público de milhares de foliões.', 'https://instagram.com/simpatiaequaseamor', 'simpatia-e-quase-amor'),
('Céu na Terra', 'Bloco democrático e inclusivo, com foco na diversidade.', 'https://instagram.com/ceunaterra', 'ceu-na-terra'),
('Orquestra Voadora', 'Bloco instrumental de rua com repertório eclético.', 'https://instagram.com/orquestravoadora', 'orquestra-voadora'),
('Boitatá', 'Bloco de samba de raiz com referências à cultura popular brasileira.', 'https://instagram.com/blocoboitata', 'boitata'),
('Banda de Ipanema', 'Bloco tradicional de Ipanema, um dos mais famosos do Rio.', 'https://instagram.com/bandadeipanema', 'banda-de-ipanema'),
('Cordão do Boi Tolo', 'Bloco de Santa Teresa com músicas de Chico Buarque e MPB.', 'https://instagram.com/cordaodoboitolo', 'cordao-do-boi-tolo');

-- Pegar IDs dos blocos recém-inseridos
DO $$
DECLARE
  bloco_alegria_id UUID;
  bloco_bolapreta_id UUID;
  bloco_monobloco_id UUID;
  bloco_sargento_id UUID;
  bloco_simpatia_id UUID;
  bloco_ceu_id UUID;
  bloco_voadora_id UUID;
  bloco_boitata_id UUID;
  bloco_ipanema_id UUID;
  bloco_boitolo_id UUID;
BEGIN
  -- Buscar IDs
  SELECT id INTO bloco_alegria_id FROM blocos WHERE slug = 'bloco-da-alegria';
  SELECT id INTO bloco_bolapreta_id FROM blocos WHERE slug = 'cordao-da-bola-preta';
  SELECT id INTO bloco_monobloco_id FROM blocos WHERE slug = 'monobloco';
  SELECT id INTO bloco_sargento_id FROM blocos WHERE slug = 'sargento-pimenta';
  SELECT id INTO bloco_simpatia_id FROM blocos WHERE slug = 'simpatia-e-quase-amor';
  SELECT id INTO bloco_ceu_id FROM blocos WHERE slug = 'ceu-na-terra';
  SELECT id INTO bloco_voadora_id FROM blocos WHERE slug = 'orquestra-voadora';
  SELECT id INTO bloco_boitata_id FROM blocos WHERE slug = 'boitata';
  SELECT id INTO bloco_ipanema_id FROM blocos WHERE slug = 'banda-de-ipanema';
  SELECT id INTO bloco_boitolo_id FROM blocos WHERE slug = 'cordao-do-boi-tolo';

  -- Inserir eventos
  INSERT INTO eventos (bloco_id, data, horario, horario_confirmado, local_nome, local_endereco, local_lat, local_lng, local_confirmado) VALUES
  -- Sábado 14/02
  (bloco_alegria_id, '2026-02-14', '14:00', true, 'Praça XV', 'Praça XV de Novembro, Centro', -22.9035, -43.1755, true),
  (bloco_ipanema_id, '2026-02-14', '16:00', true, 'Praça General Osório', 'Praça General Osório, Ipanema', -22.9868, -43.1901, true),
  
  -- Domingo 15/02
  (bloco_sargento_id, '2026-02-15', '10:00', true, 'Jardim Botânico', 'Rua Pacheco Leão, Jardim Botânico', -22.9656, -43.2248, true),
  (bloco_ceu_id, '2026-02-15', '15:00', true, 'Largo do Machado', 'Largo do Machado, Catete', -22.9340, -43.1766, true),
  
  -- Sexta 20/02
  (bloco_voadora_id, '2026-02-20', '18:00', true, 'Lapa', 'Rua Mem de Sá, Lapa', -22.9133, -43.1802, true),
  
  -- Sábado 21/02
  (bloco_bolapreta_id, '2026-02-21', '10:00', true, 'Cinelândia', 'Praça Floriano, Centro', -22.9091, -43.1762, true),
  (bloco_simpatia_id, '2026-02-21', '14:00', true, 'Ipanema', 'Rua Visconde de Pirajá, Ipanema', -22.9847, -43.1990, true),
  
  -- Domingo 22/02
  (bloco_boitata_id, '2026-02-22', '12:00', true, 'Botafogo', 'Rua Voluntários da Pátria, Botafogo', -22.9509, -43.1862, true),
  
  -- Terça 24/02 (Carnaval)
  (bloco_boitolo_id, '2026-02-24', '11:00', true, 'Santa Teresa', 'Largo das Neves, Santa Teresa', -22.9197, -43.1882, true),
  
  -- Sábado 28/02
  (bloco_monobloco_id, '2026-02-28', '16:00', true, 'Aterro do Flamengo', 'Av. Infante Dom Henrique, Flamengo', -22.9272, -43.1728, true);

END $$;

-- Comentários
COMMENT ON TABLE blocos IS 'Dados de seed: 10 blocos famosos do Rio';
COMMENT ON TABLE eventos IS 'Dados de seed: 10 eventos de fevereiro 2026';
