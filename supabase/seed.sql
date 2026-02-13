-- Seed gerado automaticamente
-- Total: 17 blocos, 19 eventos

BEGIN;

-- Inserir blocos
INSERT INTO blocos (id, nome, slug, created_at, updated_at) VALUES
  ('bloco-1', 'Cordão Da Bola Preta', 'cordao-da-bola-preta', NOW(), NOW()),
  ('bloco-2', 'Multibloco', 'multibloco', NOW(), NOW()),
  ('bloco-3', 'Bloco Amigos Da Onça', 'bloco-amigos-da-onca', NOW(), NOW()),
  ('bloco-4', 'Bloco Exagerado', 'bloco-exagerado', NOW(), NOW()),
  ('bloco-5', 'Blocobuster', 'blocobuster', NOW(), NOW()),
  ('bloco-6', 'Ceu Na Terra', 'ceu-na-terra', NOW(), NOW()),
  ('bloco-7', 'Bloco Do Forró Da Taylor', 'bloco-do-forro-da-taylor', NOW(), NOW()),
  ('bloco-8', 'Bloco Escangalha', 'bloco-escangalha', NOW(), NOW()),
  ('bloco-9', 'Banda De Ipanema', 'banda-de-ipanema', NOW(), NOW()),
  ('bloco-10', 'Boi Tolo', 'boi-tolo', NOW(), NOW()),
  ('bloco-11', 'Bloco Areia', 'bloco-areia', NOW(), NOW()),
  ('bloco-12', 'Simpatia É Quase Amor', 'simpatia-e-quase-amor', NOW(), NOW()),
  ('bloco-13', 'Que Pena Amor', 'que-pena-amor', NOW(), NOW()),
  ('bloco-14', 'Bloco Corre Atrás', 'bloco-corre-atras', NOW(), NOW()),
  ('bloco-15', 'Carrossel De Emoções', 'carrossel-de-emocoes', NOW(), NOW()),
  ('bloco-16', 'Orquestra Voadora', 'orquestra-voadora', NOW(), NOW()),
  ('bloco-17', 'Cordão Do Me Enterra Na Quarta', 'cordao-do-me-enterra-na-quarta', NOW(), NOW())
ON CONFLICT (slug) DO NOTHING;

-- Inserir eventos
INSERT INTO eventos (id, bloco_id, data, horario, horario_confirmado, local_nome, local_endereco, local_lat, local_lng, local_confirmado, observacoes) VALUES

    ('evento-1', 'bloco-1', '2026-02-14', '07:00', true, 'R. Primeiro De Março', 'R. Primeiro De Março, Centro', NULL, NULL, true, NULL),

    ('evento-2', 'bloco-2', '2026-02-14', '07:00', true, 'Av. Henrique Valadares', 'Av. Henrique Valadares, Centro', NULL, NULL, true, NULL),

    ('evento-3', 'bloco-3', '2026-02-14', '07:00', true, 'Calçadão Da Praia Do Flamengo', 'Calçadão Da Praia Do Flamengo, Flamengo', NULL, NULL, true, NULL),

    ('evento-4', 'bloco-4', '2026-02-14', '07:00', true, 'Praça Tiradentes', 'Praça Tiradentes, Centro', NULL, NULL, true, NULL),

    ('evento-5', 'bloco-5', '2026-02-14', '07:00', true, 'Praça Alm. Júlio De Noronha', 'Praça Alm. Júlio De Noronha, Leme', NULL, NULL, true, NULL),

    ('evento-6', 'bloco-6', '2026-02-14', '07:00', true, 'R. Alm. Alexandrino', 'R. Alm. Alexandrino, Santa Teresa', NULL, NULL, true, NULL),

    ('evento-7', 'bloco-7', '2026-02-14', '07:00', true, 'Largo São Francisco De Paula', 'Largo São Francisco De Paula, Centro', NULL, NULL, true, NULL),

    ('evento-8', 'bloco-8', '2026-02-14', '08:00', true, 'R. Pacheco Leão', 'R. Pacheco Leão, Jardim Botânico', NULL, NULL, true, NULL),

    ('evento-9', 'bloco-9', '2026-02-14', '15:00', true, 'R. Gomes Carneiro', 'R. Gomes Carneiro, Ipanema', NULL, NULL, true, NULL),

    ('evento-10', 'bloco-10', '2026-02-15', '07:00', true, 'Sai de alguns pontos do centro da cidade e se encontram no Aterro', 'Sai de alguns pontos do centro da cidade e se encontram no Aterro, em direção ao Leme', NULL, NULL, true, 'Múltiplos pontos de saída'),

    ('evento-11', 'bloco-11', '2026-02-15', '07:00', true, 'Av. Delfim Moreira', 'Av. Delfim Moreira, Leblon', NULL, NULL, true, NULL),

    ('evento-12', 'bloco-12', '2026-02-15', '14:00', true, 'R. Teixeira De Melo', 'R. Teixeira De Melo, Ipanema', NULL, NULL, true, NULL),

    ('evento-13', 'bloco-9', '2026-02-15', '15:00', true, 'R. Gomes Carneiro', 'R. Gomes Carneiro, Ipanema', NULL, NULL, true, NULL),

    ('evento-14', 'bloco-13', '2026-02-16', '07:00', true, 'Praça Tiradentes', 'Praça Tiradentes, Centro', NULL, NULL, true, NULL),

    ('evento-15', 'bloco-14', '2026-02-16', '07:00', true, 'Av. Delfim Moreira', 'Av. Delfim Moreira, Leblon', NULL, NULL, true, NULL),

    ('evento-16', 'bloco-15', '2026-02-16', '14:00', true, 'Av. Infante Dom Henrique', 'Av. Infante Dom Henrique, Glória', NULL, NULL, true, NULL),

    ('evento-17', 'bloco-16', '2026-02-17', '15:00', true, 'Av. Infante Dom Henrique', 'Av. Infante Dom Henrique, Glória', NULL, NULL, true, NULL),

    ('evento-18', 'bloco-9', '2026-02-17', '15:00', true, 'R. Gomes Carneiro', 'R. Gomes Carneiro, Ipanema', NULL, NULL, true, NULL),

    ('evento-19', 'bloco-17', '2026-02-18', '13:00', true, 'Av. Augusto Severo', 'Av. Augusto Severo, Centro', NULL, NULL, true, NULL)
ON CONFLICT DO NOTHING;

COMMIT;

