-- Inserir blocos
DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('CARNAVAL E BLOCO FOLIA DO LARGO DO SAPÊ', 'carnaval-e-bloco-folia-do-largo-do-sape', 'Pelas ruas de Bento Ribeiro, a pedida carnavalesca é o Folia do Largo do Sapê. Por lá, não há quem fique parado quando o Folia passa na região!', '2017')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-01-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26370,
    '2026-01-17',
    '18:00',
    true,
    'Rua Nuassu',
    'Rua Nuassu, 49 - Honório Gurgel, Rio de Janeiro - RJ, 21555-190, Brasil',
    -22.8549671,
    -43.3613111,
    true,
    'TRADICIONAL',
    500,
    '22:00',
    1187
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO TA CHEGANDO A HORA', 'bloco-ta-chegando-a-hora', 'Rua Barros de Alarcão, 464 - Pedra de Guaratiba, Rio de Janeiro - RJ, 23027-340, Brasil', '2020')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-01-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26837,
    '2026-01-17',
    '19:00',
    true,
    'Rua Barros de Alarcão',
    'Rua Barros de Alarcão, 464 - Pedra de Guaratiba, Rio de Janeiro - RJ, 23027-340, Brasil',
    -23.0026844,
    -43.6411632,
    true,
    'TRADICIONAL',
    300,
    '22:00',
    1215
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

  -- Evento do dia 2026-01-31
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26387,
    '2026-01-31',
    '19:00',
    true,
    'Rua Barros de Alarcão',
    'Rua Barros de Alarcão, 464 - Pedra de Guaratiba, Rio de Janeiro - RJ, 23027-340, Brasil',
    -23.0026844,
    -43.6411632,
    true,
    'TRADICIONAL',
    300,
    '22:00',
    1215
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO - ABERTURA DO PRÉ CARNAVAL DE MADUREIRA COM AS ÁGUAS DE CHEIRO', 'bloco-abertura-do-pre-carnaval-de-madureira-com-as-aguas-de-cheiro', 'R. Soares Caldeira, 115 - Madureira, Rio de Janeiro - RJ, 21351-080, Brasil
R. Soares Caldeira, 237 - Madureira, Rio de Janeiro - RJ, 21351-080, Brasil', '2026')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-01-18
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26838,
    '2026-01-18',
    '16:00',
    true,
    'R. Soares Caldeira',
    'R. Soares Caldeira, 115 - Madureira, Rio de Janeiro - RJ, 21351-080, Brasil',
    -22.8698081,
    -43.3398574,
    true,
    'RELIGIOSO',
    300,
    '20:00',
    1203
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('UNIDOS DE SANTA BÁRBARA', 'unidos-de-santa-barbara', 'R. Dona Teresa, 160 - Engenho de Dentro, Rio de Janeiro - RJ, 20770-110, Brasil
Condomínio do Edifício Solar Piaui - R. Piauí, 290 - Todos os Santos, Rio de Janeiro - RJ, 20770-130, Brasil
R. Cel. Cunha Leal, 32 - Engenho de Dentro, Rio de Janeiro - RJ, 20770-090, Brasil
R. Sales Guimarães, 17 - Engenho de Dentro, Rio de Janeiro - RJ, 20770-070, Brasil', '2025')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-01-18
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26724,
    '2026-01-18',
    '17:00',
    true,
    'R. Dona Teresa',
    'R. Dona Teresa, 160 - Engenho de Dentro, Rio de Janeiro - RJ, 20770-110, Brasil',
    -22.8929686,
    -43.2878503,
    true,
    'TRADICIONAL',
    500,
    '20:00',
    1175
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CHÁ DA ALICE', 'bloco-cha-da-alice', 'R. Primeiro de Março, 33 - Centro, Rio de Janeiro - RJ, 20010-000, Brasil
Av. Pres. Antônio Carlos, 375 - Centro, Rio de Janeiro - RJ, 20020-010, Brasil', '2013')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-01-24
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26376,
    '2026-01-24',
    '08:00',
    true,
    'R. Primeiro de Março',
    'R. Primeiro de Março, 33 - Centro, Rio de Janeiro - RJ, 20010-000, Brasil',
    -22.9023308,
    -43.17607,
    true,
    'MEGA BLOCO',
    50000,
    '12:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('CHAME GENTE', 'chame-gente', 'O Chame Gente é inspirado na malandragem carioca e na profanidade baiana. Uma mistura de ritmos e culturas de dois povos que adoram festa e que sabem receber turistas como ninguém. Há de tudo um pouco no repertório: Filhos de Ghandi, Dodô & Osmar, Noel Rosa e Moreira da Silva. ', '2006')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-01-24
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26374,
    '2026-01-24',
    '10:00',
    true,
    'Av. Pref. Mendes de Morais',
    'Av. Pref. Mendes de Morais, 808 - São Conrado, Rio de Janeiro - RJ, 22610-095, Brasil',
    -22.9992412,
    -43.264919,
    true,
    'TRADICIONAL',
    4500,
    '15:00',
    1240
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('SORVETADA GIGANTES DA LIRA', 'sorvetada-gigantes-da-lira', ' Fundado em 1999, o bloco infantil contagia todas as famílias de maneira lúdica e divertida, se tornando referência no calendário de blocos da cidade.', '1999')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-01-24
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26373,
    '2026-01-24',
    '11:00',
    true,
    'PRAÇA JARDIM LARANJEIRAS',
    'PRAÇA JARDIM LARANJEIRAS',
    -22.9406852,
    -43.1916611,
    true,
    'INFANTIL',
    200,
    '14:00',
    1199
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('20 DE OURO DO MESTRE ODILON', '20-de-ouro-do-mestre-odilon', 'Estr. do Rio Jequiá, 518 - Zumbi, Rio de Janeiro - RJ, 21930-185, Brasil
R. Maldonado, 229 - Ribeira, Rio de Janeiro - RJ, 21930-130, Brasil
Praça Iaiá García, SN - Ribeira, Rio de Janeiro - RJ, 21930-040, Brasil', '2007')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-01-24
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26829,
    '2026-01-24',
    '15:00',
    true,
    'Estr. do Rio Jequiá',
    'Estr. do Rio Jequiá, 518 - Zumbi, Rio de Janeiro - RJ, 21930-185, Brasil',
    -22.8204662,
    -43.1783656,
    true,
    'TRADICIONAL',
    2000,
    '17:00',
    1256
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('B. C INDEPENDENTE DO MORRO DO PINTO', 'b-c-independente-do-morro-do-pinto', 'R. Farnese, 93 - Santo Cristo, Rio de Janeiro - RJ, 20220-640, Brasil
R. Saldanha Marinho, 1 - Santo Cristo, Rio de Janeiro - RJ, 20220-210, Brasil
R. Sara, 199 - Santo Cristo, Rio de Janeiro - RJ, 20220-090, Brasil
R. Carlos Gomes, 16 - Santo Cristo, Rio de Janeiro - RJ, 20220-050, Brasil
R. Deolinda, 1 - Santo Cristo, Rio de Janeiro - RJ, 20220-150, Brasil
Rua António José, 2 - Santo Cristo, Rio de Janeiro - RJ, 20220-100, Brasil
R. Mont Alverne, 100 - Santo Cristo, Rio de Janeiro - RJ, 20220-180, Brasil
R. Mariano Procópio, 61a - Santo Cristo, Rio de Janeiro - RJ, 20220-170, Brasil
R. Farnese, 93 - Santo Cristo, Rio de Janeiro - RJ, 20220-640, Brasil', '1972')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-01-24
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26377,
    '2026-01-24',
    '18:00',
    true,
    'R. Farnese',
    'R. Farnese, 93 - Santo Cristo, Rio de Janeiro - RJ, 20220-640, Brasil',
    -22.9039603,
    -43.2029216,
    true,
    'TRADICIONAL',
    400,
    '22:00',
    1239
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DA PRAIA', 'bloco-da-praia', 'Bloco parado de Pedra de Guaratiba, na Zona Oeste, o Bloco da Praia é um evento que acontece na Rua Barros de Alarcão em sábados que antecedem o Carnaval. Os músicos se posicionam em frente ao número do evento: 464! ', '2020')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-01-24
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26375,
    '2026-01-24',
    '19:00',
    true,
    'Rua Barros de Alarcão',
    'Rua Barros de Alarcão, 464 - Pedra de Guaratiba, Rio de Janeiro - RJ, 23027-340, Brasil',
    -23.0026844,
    -43.6411632,
    true,
    'TRADICIONAL',
    300,
    '22:00',
    1215
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26442,
    '2026-02-07',
    '19:00',
    true,
    'Rua Barros de Alarcão',
    'Rua Barros de Alarcão, 464 - Pedra de Guaratiba, Rio de Janeiro - RJ, 23027-340, Brasil',
    -23.0026844,
    -43.6411632,
    true,
    'TRADICIONAL',
    600,
    '22:00',
    1215
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DA LEXA', 'bloco-da-lexa', 'R. Primeiro de Março, 33 - Centro, Rio de Janeiro - RJ, 20010-000, Brasil
Av. Pres. Antônio Carlos, 375 - Centro, Rio de Janeiro - RJ, 20020-010, Brasil', '2023')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-01-25
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26379,
    '2026-01-25',
    '08:00',
    true,
    'R. Primeiro de Março',
    'R. Primeiro de Março, 33 - Centro, Rio de Janeiro - RJ, 20010-000, Brasil',
    -22.9023308,
    -43.17607,
    true,
    'MEGA BLOCO',
    50000,
    '12:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('CALA A BOCA & DANÇA', 'cala-a-boca-danca', 'Rua Xingú, 307 - Freguesia (Jacarepaguá), Rio de Janeiro - RJ, 22760-070, Brasil
Shopping Main Street, Bloco 1 - Estr. dos Três Rios, 200 - Loja 103 - Freguesia (Jacarepaguá), Rio de Janeiro - RJ, 22755-002, Brasil', '2026')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-01-25
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26726,
    '2026-01-25',
    '10:00',
    true,
    'Rua Xingú',
    'Rua Xingú, 307 - Freguesia (Jacarepaguá), Rio de Janeiro - RJ, 22760-070, Brasil',
    -22.9393563,
    -43.3404336,
    true,
    'TRADICIONAL',
    200,
    '14:00',
    1265
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO SÓ CAMINHA', 'bloco-so-caminha', 'O Só Caminha surgiu em 2009 e sua bateria fica por conta do Mestre Faísca, diversas vezes premiado com o estandarte de ouro pelo GRES Império Serrano. Uma das grandes vantagens do bloco é sua localização, ao lado da Cobal do Humaitá, que costuma encher após a dispersão. ', '2010')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-01-25
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26381,
    '2026-01-25',
    '14:00',
    true,
    'Largo dos Leões - Largo dos Leões - Humaitá',
    'Largo dos Leões - Largo dos Leões - Humaitá, Rio de Janeiro - RJ, 22260-210, Brasil',
    -22.9533896,
    -43.1968018,
    true,
    'TRADICIONAL',
    999,
    '18:00',
    1188
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('FOLIA DO TINOCO', 'folia-do-tinoco', 'R. Gen. Espírito Santo Cardoso, 41 - Tijuca, Rio de Janeiro - RJ, 20530-500, Brasil', '2026')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-01-25
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26728,
    '2026-01-25',
    '14:00',
    true,
    'R. Gen. Espírito Santo Cardoso',
    'R. Gen. Espírito Santo Cardoso, 41 - Tijuca, Rio de Janeiro - RJ, 20530-500, Brasil',
    -22.930033,
    -43.2431281,
    true,
    'TRADICIONAL',
    300,
    '19:00',
    1247
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('CORDÃO DA TIA JUCA', 'cordao-da-tia-juca', 'Bloco de Carnaval fundado em 2023, com um grande repertório de músicas carnavalescas para animar os foliões da Tijuca.', '2024')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-01-25
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26729,
    '2026-01-25',
    '16:00',
    true,
    'Av. Maracanã',
    'Av. Maracanã, 6396 - Tijuca, Rio de Janeiro - RJ, 20530-231, Brasil',
    -22.9357157,
    -43.2455835,
    true,
    'TRADICIONAL',
    499,
    '20:00',
    1247
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26803,
    '2026-02-15',
    '19:00',
    true,
    'Saens Peña - -Praça Saens Pena',
    'Saens Peña - -Praça Saens Pena, Rua Conde de Bonfim - Tijuca, Rio de Janeiro - RJ, 20520-090, Brasil',
    -22.9241366,
    -43.2325859,
    true,
    'TRADICIONAL',
    499,
    '22:00',
    1247
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DA GOLD VEM COM O GIGANTE', 'bloco-da-gold-vem-com-o-gigante', 'Utilize o transporte público por Metrô! Priorize a estação CARIOCA para ir e voltar do bloco.', '2024')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-01-31
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26736,
    '2026-01-31',
    '08:00',
    true,
    'R. Primeiro de Março',
    'R. Primeiro de Março, 33 - Centro, Rio de Janeiro - RJ, 20010-000, Brasil',
    -22.9023308,
    -43.17607,
    true,
    'MEGA BLOCO',
    150000,
    '12:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('DESLIGA DA JUSTIÇA', 'desliga-da-justica', 'Parece filme ou quadrinho repleto de heróis e vilões. Mas é uma reunião de foliões e batuqueiros que entram no clima das fantasias elaboradas, representando o melhor do universo infantil ou fantástico, na Praça Tiradentes, no Centro da cidade.. ', '2010')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-01-31
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26396,
    '2026-01-31',
    '10:00',
    true,
    'PRAÇA TIRADENTES',
    'PRAÇA TIRADENTES',
    -22.9072348,
    -43.182463,
    true,
    'TRADICIONAL',
    7000,
    '14:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('NOSSOBLOQUINHO OFICIAL', 'nossobloquinho-oficial', 'Bloco infantil que atrai mini foliões para a Praça Comandante Xavier de Brito, também conhecida como Praça dos Cavalinhos, na Tijuca, Zona Norte do Rio', '2025')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-01-31
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26731,
    '2026-01-31',
    '10:00',
    true,
    'Praça Cmte. Xavier de Brito',
    'Praça Cmte. Xavier de Brito, 14 - Tijuca, Rio de Janeiro - RJ, 20511-400, Brasil',
    -22.9313938,
    -43.2436087,
    true,
    'INFANTIL',
    100,
    '12:00',
    1247
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('S.P.D. - SAMBA PRA DEUS', 's-p-d-samba-pra-deus', 'Av. Lúcio Costa, 3360 - Barra da Tijuca, Rio de Janeiro - RJ, 22630-010, Brasil
Av. Lúcio Costa, 2390 - Barra da Tijuca, Rio de Janeiro - RJ, 22620-172, Brasil', '2026')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-01-31
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26734,
    '2026-01-31',
    '11:00',
    true,
    'Av. Lúcio Costa',
    'Av. Lúcio Costa, 3360 - Barra da Tijuca, Rio de Janeiro - RJ, 22630-010, Brasil',
    -23.0083432,
    -43.3290473,
    true,
    'RELIGIOSO',
    900,
    '15:00',
    1155
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('SPANTA NENÉM', 'spanta-nenem', 'O bloco foi criado a partir da vontade de celebrar dois importantes patrimônios da cidade: o carnaval de rua e a beleza da Lagoa Rodrigo de Freitas. Desde 2003, o Spanta é conhecido por aliar descontração com organização, boa música, gente bonita e uma vista de dar orgulho a qualquer carioca. ', '2003')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-01-31
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26388,
    '2026-01-31',
    '12:00',
    true,
    'Av. Epitácio Pessoa',
    'Av. Epitácio Pessoa, 1005 - Lagoa, Rio de Janeiro - RJ, 22410-090, Brasil',
    -22.9763483,
    -43.1998298,
    true,
    'TRADICIONAL',
    4500,
    '16:00',
    1197
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO FOLIÕES DO RIO', 'bloco-folioes-do-rio', 'Praça Jerusalém, 39 - Jardim Guanabara, Rio de Janeiro - RJ, 21940-460, Brasil
Praia da Bica, 792 - Jardim Guanabara, Rio de Janeiro - RJ, 21931-076, Brasil', '2014')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-01-31
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26391,
    '2026-01-31',
    '13:00',
    true,
    'Praça Jerusalém',
    'Praça Jerusalém, 39 - Jardim Guanabara, Rio de Janeiro - RJ, 21940-460, Brasil',
    -22.8188694,
    -43.201324,
    true,
    'TRADICIONAL',
    900,
    '17:00',
    1196
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DO MORENO', 'bloco-do-moreno', 'R. Urbano Duarte, 30 - Tijuca, Rio de Janeiro - RJ, 20550-028, Brasil', '2019')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-01-31
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26392,
    '2026-01-31',
    '13:00',
    true,
    'R. Urbano Duarte',
    'R. Urbano Duarte, 30 - Tijuca, Rio de Janeiro - RJ, 20550-028, Brasil',
    -22.921227,
    -43.2242373,
    true,
    'TRADICIONAL',
    200,
    '18:00',
    1247
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('VOU TREINAR E VOLTO JÁ', 'vou-treinar-e-volto-ja', 'Movimentando mais de 500 pessoas, o bloco não quer deixar ninguém parado durante a folia, com início na Praça Castilhos França 33, Tijuca. ', '2010')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-01-31
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26384,
    '2026-01-31',
    '15:00',
    true,
    'Praça Castilhos França',
    'Praça Castilhos França, 33 - Tijuca, Rio de Janeiro - RJ, 20270-250, Brasil',
    -22.9175611,
    -43.2187094,
    true,
    'TRADICIONAL',
    900,
    '19:00',
    1247
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('ATABLOCO', 'atabloco', 'R. Barão de São Félix, 8 - Gamboa, Rio de Janeiro - RJ, 20221-423, Brasil', '2026')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-01-31
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26735,
    '2026-01-31',
    '16:00',
    true,
    'R. Barão de São Félix',
    'R. Barão de São Félix, 8 - Gamboa, Rio de Janeiro - RJ, 20221-423, Brasil',
    -22.8990467,
    -43.1877916,
    true,
    'RELIGIOSO',
    100,
    '20:00',
    1181
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO GORDELICIA', 'bloco-gordelicia', 'Rua Bernardino de Campos, 93 - Piedade, Rio de Janeiro - RJ, 20756-150, Brasil
R. Teresa Cavalcante, 28 - Piedade, Rio de Janeiro - RJ, 20756-170, Brasil
R. João Pinheiro, 325 - Piedade, Rio de Janeiro - RJ, 20756-100, Brasil
R. João Pinheiro, 184 - Piedade, Rio de Janeiro - RJ, 20756-100, Brasil', '2022')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-01-31
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26382,
    '2026-01-31',
    '16:00',
    true,
    'Rua Bernardino de Campos',
    'Rua Bernardino de Campos, 93 - Piedade, Rio de Janeiro - RJ, 20756-150, Brasil',
    -22.8875558,
    -43.307779,
    true,
    'TRADICIONAL',
    300,
    '20:00',
    1218
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('PEGA REX!', 'pega-rex', 'R. do Mercado, 37 - Centro, Rio de Janeiro - RJ, 20010-120, Brasil
R. do Ouvidor, 1 - Centro, Rio de Janeiro - RJ, 20010-150, Brasil', '2008')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-01-31
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26383,
    '2026-01-31',
    '15:00',
    true,
    'R. do Mercado',
    'R. do Mercado, 37 - Centro, Rio de Janeiro - RJ, 20010-120, Brasil',
    -22.9016599,
    -43.175227,
    true,
    'TRADICIONAL',
    300,
    '20:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('FALA MEU LOURO.', 'fala-meu-louro', 'R. Waldemar Dutra, 19 - Santo Cristo, Rio de Janeiro - RJ, 20220-780, Brasil
R. da América, 10 - Santo Cristo, Rio de Janeiro - RJ, 21010-680, Brasil
R. Waldemar Dutra, 19 - Santo Cristo, Rio de Janeiro - RJ, 20220-780, Brasil', '2026')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-01-31
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26733,
    '2026-01-31',
    '17:00',
    true,
    'R. Waldemar Dutra',
    'R. Waldemar Dutra, 19 - Santo Cristo, Rio de Janeiro - RJ, 20220-780, Brasil',
    -22.8998655,
    -43.200966,
    true,
    'TRADICIONAL',
    900,
    '20:00',
    1239
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('PIRANHAS DO BDS', 'piranhas-do-bds', 'Um grupo de amigos, moradores do Morro do Pinto, sai nas ruas da região desde 2013, com a intenção de se divertir e aproveitar o carnaval. E está todo mundo chamado para se juntar a eles!', '2024')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-01-31
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26737,
    '2026-01-31',
    '16:00',
    true,
    'Tv. Silva Baião',
    'Tv. Silva Baião, 8 - Santo Cristo, Rio de Janeiro - RJ, 20220-680, Brasil',
    -22.9047018,
    -43.2028782,
    true,
    'TRADICIONAL',
    500,
    '21:00',
    1239
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('ACADÊMICOS DO ENGENHO DE DENTRO', 'academicos-do-engenho-de-dentro', 'Fundado em 2010, o bloco GRBC Acadêmicos do Engenho de Dentro desfila mais uma vez no Carnaval carioca, atraindo todos os foliões com sua própria bateria e outros convidados!', '2010')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-01-31
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26389,
    '2026-01-31',
    '18:00',
    true,
    'R. Venâncio Ribeiro',
    'R. Venâncio Ribeiro, 290 - Engenho de Dentro, Rio de Janeiro - RJ, 20730-440, Brasil',
    -22.9071022,
    -43.2997075,
    true,
    'TRADICIONAL',
    200,
    '22:00',
    1175
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CALMA AMOR', 'bloco-calma-amor', 'Tradicional bloco parado de Irajá, o Calma Amor é um dos mais populares da Zona Norte e sai nos dois sábados anteriores ao Carnaval. A concentração, na Fernandes Gusmão.', '2010')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-01-31
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26395,
    '2026-01-31',
    '17:00',
    true,
    'Av. Monsenhor Félix',
    'Av. Monsenhor Félix, 710 - Irajá, Rio de Janeiro - RJ, 21235-110, Brasil',
    -22.8426457,
    -43.3233017,
    true,
    'TRADICIONAL',
    4000,
    '22:00',
    1191
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26419,
    '2026-02-07',
    '17:00',
    true,
    'Av. Monsenhor Félix',
    'Av. Monsenhor Félix, 710 - Irajá, Rio de Janeiro - RJ, 21235-110, Brasil',
    -22.8426457,
    -43.3233017,
    true,
    'TRADICIONAL',
    4000,
    '22:00',
    1191
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CARNAVALESCO NEM MUDA NEM SAI DE CIMA', 'bloco-carnavalesco-nem-muda-nem-sai-de-cima', 'Bloco parado da Rua Garibaldi, na Tijuca, o Nem Muda Nem Sai de Cima foi criado em 1995 pelos frequentadores das mesas do tradicional Bar da Dona Maria, na Tijuca, tendo como padrinhos os compositores Aldir Blanc e Moacyr Luz, e como madrinha Beth Carvalho. O Nem Muda Nem Saia de Cima tem por tradição homenagear em seus enredos tijucanos que contribuíram para o fortalecimento da cultura brasileira. O público estimado é de 400 pessoas.', '1995')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-01-31
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26390,
    '2026-01-31',
    '18:00',
    true,
    'Av. Maracanã',
    'Av. Maracanã, 838 - Tijuca, Rio de Janeiro - RJ, 20540-103, Brasil',
    -22.9208944,
    -43.2358171,
    true,
    'TRADICIONAL',
    900,
    '22:00',
    1247
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO TECNOMACUMBA', 'bloco-tecnomacumba', 'Comandado pela cantora Rita Beneditto, o bloco exalta a religiosidade e cultura afro-brasileira, com repertório formado por sambas de terreiro e afoxés, entre outros ritmos.', '2023')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-01-31
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26385,
    '2026-01-31',
    '17:00',
    true,
    'Av. Barão de Tefé',
    'Av. Barão de Tefé, 74 - Saúde, Rio de Janeiro - RJ, 20220-460, Brasil',
    -22.8958998,
    -43.1868569,
    true,
    'TRADICIONAL',
    900,
    '21:00',
    1241
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('MISTURA DE SANTA', 'mistura-de-santa', 'O bloco Mistura de Santa anima o Carnaval de rua no bairro de Santa Teresa, no Rio de Janeiro, com uma estimativa de público de 700 pessoas. Rua Aprazível 85.', '2014')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-01-31
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26386,
    '2026-01-31',
    '18:00',
    true,
    'R. Aprazível',
    'R. Aprazível, 85 - Santa Teresa, Rio de Janeiro - RJ, 20241-270, Brasil',
    -22.9232693,
    -43.1868775,
    true,
    'TRADICIONAL',
    500,
    '21:00',
    1237
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('MINI SERES DO MAR', 'mini-seres-do-mar', 'Criado em 2016, o bloco integra musicalização e recreação lúdica a um repertório que dialoga com as crianças e os pais.', '2016')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-01
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26400,
    '2026-02-01',
    '09:00',
    true,
    'R. Gen. Glicério',
    'R. Gen. Glicério, 326 - sala 101 - Laranjeiras, Rio de Janeiro - RJ, 22245-120, Brasil',
    -22.9414782,
    -43.1919576,
    true,
    'INFANTIL',
    2500,
    '13:00',
    1199
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('SERAQABRE?', 'seraqabre', 'O mais novo megabloco do Carnaval de Rua do rio desfila pela primeira vez no circuito da rua Primeiro de Março. Com expectativa de atrair um público de 50000 pessoas, o SeraQAbre traz uma proposta inusitada: celebrar o amor livre e sem rótulos.', '2025')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-01
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26739,
    '2026-02-01',
    '08:00',
    true,
    'R. Primeiro de Março',
    'R. Primeiro de Março, 33 - Centro, Rio de Janeiro - RJ, 20010-000, Brasil',
    -22.9023308,
    -43.17607,
    true,
    'MEGA BLOCO',
    150000,
    '12:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO KIDS2GETHER', 'bloco-kids2gether', 'Praça Pio XI, 174 - Jardim Botânico, Rio de Janeiro - RJ, 22461-080, Brasil', '2026')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-01
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26745,
    '2026-02-01',
    '09:00',
    true,
    'Praça Pio XI',
    'Praça Pio XI, 174 - Jardim Botânico, Rio de Janeiro - RJ, 22461-080, Brasil',
    -22.9618621,
    -43.2172232,
    true,
    'INFANTIL',
    2000,
    '13:00',
    1194
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO MARAVILHOSAS', 'bloco-maravilhosas', 'Av. Vieira Souto, 594 - Ipanema, Rio de Janeiro - RJ, 22420-008, Brasil', '2026')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-01
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26741,
    '2026-02-01',
    '09:00',
    true,
    'Av. Vieira Souto',
    'Av. Vieira Souto, 594 - Ipanema, Rio de Janeiro - RJ, 22420-008, Brasil',
    -22.9859109,
    -43.211169,
    true,
    'TRADICIONAL',
    3000,
    '12:00',
    1190
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('ENSAIO TÉCNICO DO MULTIBLOCO', 'ensaio-tecnico-do-multibloco', 'Surgido como bloco carnavalesco em 2008, desde então se consagra como “o mais eclético da Lapa”. Para isso, há um caldeirão de instrumentação: baterias das escolas de samba, trios nordestinos de forró e as nações de baque virado. Os ritmos nordestinos baião, maracatu e samba-reggae (olodum) ganham versão carioca, misturando-se ao funk e à marchinha, trazendo ainda uma versão da valsa dos grandes salões.', '2009')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-01
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26404,
    '2026-02-01',
    '09:00',
    true,
    'R. do Senado',
    'R. do Senado, 88 - Loja A - Centro, Rio de Janeiro - RJ, 20231-000, Brasil',
    -22.9094727,
    -43.1855647,
    true,
    'TRADICIONAL',
    1000,
    '12:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO ME ESQUECE', 'bloco-me-esquece', 'Do encontro com amigos percussionistas em bares do Rio, em 2004 nasce o Me Esquece. Dali em diante, a reunião de colegas ganhou cada vez mais adeptos, fazendo a folia deixar de ser só na sexta, para se ter a liberdade de desfilar nos fins de semana. Assim o bloco se tornou um dos mais famosos da Zona Sul e promete agitar o circuito folião na cidade. ', '2011')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-01
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26399,
    '2026-02-01',
    '10:00',
    true,
    'Rua Pacheco Leão',
    'Rua Pacheco Leão, 20 - Jardim Botânico, Rio de Janeiro - RJ, 22460-030, Brasil',
    -22.9662872,
    -43.219697,
    true,
    'TRADICIONAL',
    6000,
    '14:00',
    1194
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO VIRA LATA', 'bloco-vira-lata', 'O cortejo surgiu para transformar a orla de São Conrado numa festa e hoje vai além. Com uma banda que agita todos os foliões com música baiana, a ideia é fazer com que todos sintam a energia que emana do carnaval de Salvador.', '2009')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-01
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26407,
    '2026-02-01',
    '10:00',
    true,
    'Av. Pref. Mendes de Morais',
    'Av. Pref. Mendes de Morais, 808 - São Conrado, Rio de Janeiro - RJ, 22610-095, Brasil',
    -22.9992412,
    -43.264919,
    true,
    'TRADICIONAL',
    5100,
    '15:00',
    1240
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('PIRATAS', 'piratas', 'Bloco organizado pelas ruas do Rio e que chega para navegar por todos os sons da Bahia.', '2020')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-01
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26405,
    '2026-02-01',
    '10:00',
    true,
    'LARGO DE SÃO FRANCISCO DA PRAINHA',
    'LARGO DE SÃO FRANCISCO DA PRAINHA, S/N',
    -22.8978013,
    -43.1842954,
    true,
    'TRADICIONAL',
    200,
    '15:00',
    1241
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('FANFARRA FESTIVA TRICOLOR', 'fanfarra-festiva-tricolor', 'Formado por torcedores do Fluminense, o Fanfarra Festiva Tricolor nasceu em Laranjeiras, bairro da Zona Sul do Rio. Com 50 componentes, uma bateria e equipe de sopros com 10 pessoas, o bloco traz uma mistura de gêneros musicais como funk, MPB, marchinhas clássicas, ijexá e maracatu.', '2025')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-01
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26742,
    '2026-02-01',
    '11:00',
    true,
    'Praça Duque Costa',
    'Praça Duque Costa, 20 - Laranjeiras, Rio de Janeiro - RJ, 22231-210, Brasil',
    -22.9345857,
    -43.1847318,
    true,
    'TRADICIONAL',
    950,
    '16:00',
    1199
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('SE CAIR EU COMO', 'se-cair-eu-como', 'O bloco desfila na Freguesia, bairro da Ilha do Governador, com público estimado de 900 animados foliões', '2011')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-01
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26403,
    '2026-02-01',
    '11:00',
    true,
    'Av. Paranapuã',
    'Av. Paranapuã, 35 - Freguesia (Ilha), Rio de Janeiro - RJ, 21910-002, Brasil',
    -22.7934779,
    -43.1705438,
    true,
    'TRADICIONAL',
    2000,
    '16:00',
    1179
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('MORENA DO DOM', 'morena-do-dom', 'Desfilando pelas ruas do Centro, o Morena do Dom faz a animação do público uma semana antes da festa oficial.', '2017')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-01
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26401,
    '2026-02-01',
    '14:00',
    true,
    'RUA ANDRÉ CAVALCANTI 44 -  CENTRO',
    'RUA ANDRÉ CAVALCANTI 44 -  CENTRO',
    -22.9145826,
    -43.1868826,
    true,
    'TRADICIONAL',
    900,
    '18:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26471,
    '2026-02-08',
    '14:00',
    true,
    'RUA ANDRÉ CAVALCANTI 44 - CENTRO',
    'RUA ANDRÉ CAVALCANTI 44 - CENTRO',
    -22.9145826,
    -43.1868826,
    true,
    'TRADICIONAL',
    900,
    '18:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('AMIGOS DA BARRA', 'amigos-da-barra', 'Um dos mais representativos da cidade, o Bloco dos Amigos da Barra arrasta uma multidão pela Avenida Lúcio Costa. Criado em 2016, o cortejo promove um encontro de ritmos, mesclando funk e samba em cima do trio, nas ruas mais concorridas do bairro. O intuito é um só: unir crianças, adolescentes, adultos e idosos, animando na pista e também nas areias todo o público presente. ', '2017')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-01
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26397,
    '2026-02-01',
    '15:00',
    true,
    'Av. Lúcio Costa',
    'Av. Lúcio Costa, 3800 - Barra da Tijuca, Rio de Janeiro - RJ, 22630-011, Brasil',
    -23.0100845,
    -43.3344004,
    true,
    'TRADICIONAL',
    10000,
    '18:00',
    1155
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('ASSOCIAÇÃO BLOCO CARNAVALESCO CORAÇÃO DAS MENINAS', 'associacao-bloco-carnavalesco-coracao-das-meninas', 'Paz, samba e carnaval nas ruas do Rio de Janeiro. É com este propósito que o bloco Coração das Meninas contagia famílias e foliões do bairro da Gamboa, Zona Central da cidade. A concentração acontece sempre na tradicional Praça da Harmonia, de onde a associação parte, pedindo passagem com sua festa original, que exalta a resistência cultural na região da Pequena África. ', '1964')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-01
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26406,
    '2026-02-01',
    '15:00',
    true,
    'GAMBOA',
    'GAMBOA, RIO DE JANEIRO - RJ, 20220-510, BRASI',
    -22.8948235,
    -43.1930882,
    true,
    'TRADICIONAL',
    700,
    '19:00',
    1181
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BANDA CULTURAL DO JILÓ', 'banda-cultural-do-jilo', 'A Banda Cultural do Jiló faz seu Carnaval pelas ruas da Tijuca, num dos desfiles mais alegres e envolventes do Carnaval. ', '2004')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-01
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26398,
    '2026-02-01',
    '15:00',
    true,
    'R. Pinto de Figueiredo',
    'R. Pinto de Figueiredo, 26a - Tijuca, Rio de Janeiro - RJ, 20511-240, Brasil',
    -22.9254821,
    -43.2350899,
    true,
    'TRADICIONAL',
    500,
    '20:00',
    1247
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

  -- Evento do dia 2026-02-13
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26517,
    '2026-02-13',
    '17:00',
    true,
    'R. Pinto de Figueiredo',
    'R. Pinto de Figueiredo, 26a - Tijuca, Rio de Janeiro - RJ, 20511-240, Brasil',
    -22.9254821,
    -43.2350899,
    true,
    'TRADICIONAL',
    900,
    '22:00',
    1247
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DAS GAMBAS', 'bloco-das-gambas', 'Esquentando os tamborins para a grande festa, o Bloco das Gambas é uma das atrações carnavalescas. Coloque na agenda!', '2018')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-01
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26402,
    '2026-02-01',
    '16:00',
    true,
    'R. Aristídes Lôbo',
    'R. Aristídes Lôbo, 217 - Rio Comprido, Rio de Janeiro - RJ, 20250-490, Brasil',
    -22.9230714,
    -43.208514,
    true,
    'TRADICIONAL',
    1000,
    '20:00',
    1232
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CARNAVALESCO XODÓ DA PIEDADE', 'bloco-carnavalesco-xodo-da-piedade', 'Há quase 50 anos, o bloco desfila pelas ruas do bairro Piedade, na Zona Norte da cidade, animando foliões de todas as idades em uma programação extensa.', '1976')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-01
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26408,
    '2026-02-01',
    '17:00',
    true,
    'R. Leopoldina',
    'R. Leopoldina, 213 - Piedade, Rio de Janeiro - RJ, 20756-110, Brasil',
    -22.8899708,
    -43.3072075,
    true,
    'TRADICIONAL',
    300,
    '22:00',
    1218
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26475,
    '2026-02-08',
    '17:00',
    true,
    'R. Leopoldina',
    'R. Leopoldina, 213 - Piedade, Rio de Janeiro - RJ, 20756-110, Brasil',
    -22.8899708,
    -43.3072075,
    true,
    'TRADICIONAL',
    600,
    '22:00',
    1218
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('FESTIVAL PORTO FOLIA', 'festival-porto-folia', 'R. do Livramento, 36 - Gamboa, Rio de Janeiro - RJ, 20221-193, Brasil', '2026')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-01
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26740,
    '2026-02-01',
    '17:00',
    true,
    'R. do Livramento',
    'R. do Livramento, 36 - Gamboa, Rio de Janeiro - RJ, 20221-193, Brasil',
    -22.8966273,
    -43.1907448,
    true,
    'TRADICIONAL',
    1000,
    '22:00',
    1181
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('G.R.B.C TURMA DO GATO FUTEBOL E SAMBA', 'g-r-b-c-turma-do-gato-futebol-e-samba', 'O Bloco Turma do Gato Futebol e Samba foi fundado em 1950 e tem o objetivo de resgatar e manter o carnaval tradicional do bairro de Pilares, seu endereço. ', '1950')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-01
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26409,
    '2026-02-01',
    '17:00',
    true,
    'R. Djalma Dutra',
    'R. Djalma Dutra, 262 - Pilares, Rio de Janeiro - RJ, 20755-000, Brasil',
    -22.883506,
    -43.294994,
    true,
    'TRADICIONAL',
    800,
    '22:00',
    1219
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26523,
    '2026-02-14',
    '15:00',
    true,
    'R. Djalma Dutra',
    'R. Djalma Dutra, 262 - Pilares, Rio de Janeiro - RJ, 20755-000, Brasil',
    -22.883506,
    -43.294994,
    true,
    'TRADICIONAL',
    900,
    '20:00',
    1219
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('MARABLOCO', 'marabloco', 'Av. Prof. Pereira Reis, 76 - Santo Cristo, Rio de Janeiro - RJ, 20220-800, Brasil', '2025')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-06
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26747,
    '2026-02-06',
    '17:00',
    true,
    'Av. Prof. Pereira Reis',
    'Av. Prof. Pereira Reis, 76 - Santo Cristo, Rio de Janeiro - RJ, 20220-800, Brasil',
    -22.8977454,
    -43.20339,
    true,
    'TRADICIONAL',
    950,
    '22:00',
    1239
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('ZONA MENTAL', 'zona-mental', 'Iniciativa de usuários, parentes e profissionais da saúde mental em Bangu, na Zona Oeste, o bloco Zona Mental desfila pelas ruas do bairro com expectativa de atrair centenas de foliões.', '2016')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-06
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26410,
    '2026-02-06',
    '17:00',
    true,
    'R. Sidnei',
    'R. Sidnei, 96 - Bangu, Rio de Janeiro - RJ, 21875-030, Brasil',
    -22.8742234,
    -43.4557276,
    true,
    'TRADICIONAL',
    300,
    '19:00',
    1154
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('VILA MIMOSA- EU TAMBÉM  TENHO C*', 'vila-mimosa-eu-tambem-tenho-c', 'Agitando a Praça da Bandeira, o ‘Vila Mimosa’ anima os foliões, com previsão de público de 500 pessoas', '2019')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-06
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26412,
    '2026-02-06',
    '19:00',
    true,
    'R. Sotero dos Reis',
    'R. Sotero dos Reis, 66 - Praça da Bandeira, Rio de Janeiro - RJ, 20270-200, Brasil',
    -22.9083477,
    -43.2153214,
    true,
    'TRADICIONAL',
    500,
    '22:00',
    1222
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CARNAVALESCO MOLHA O PÉ DAS OITO', 'bloco-carnavalesco-molha-o-pe-das-oito', 'Criado a partir de uma roda de samba animada, o bloco Molha o Pé das Oito faz a festa dos foliões no Carnaval carioca, com ruas do Rio Antigo, como a São José, no percurso.', '2010')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-06
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26414,
    '2026-02-06',
    '20:00',
    true,
    'R. São José - Centro',
    'R. São José - Centro, Rio de Janeiro - RJ, Brasil',
    -22.9048074,
    -43.1747765,
    true,
    'TRADICIONAL',
    900,
    '22:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO ROLADO', 'bloco-rolado', 'Pelas ruas do Maracanã, o Bloco Rolado faz a festa dos foliões. Com concentração na Praça Niterói, a expectativa é atrair 300 pessoas.', '2022')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-06
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26411,
    '2026-02-06',
    '20:00',
    true,
    'Praça Niterói',
    'Praça Niterói, 17 - Maracanã, Rio de Janeiro - RJ, 20550-158, Brasil',
    -22.9160497,
    -43.2346932,
    true,
    'TRADICIONAL',
    300,
    '22:00',
    1207
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO VIRTUAL', 'bloco-virtual', 'Praça Alm. Júlio de Noronha, 86 - Leme, Rio de Janeiro - RJ, 22010-020, Brasil', '2025')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-06
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26746,
    '2026-02-06',
    '19:00',
    true,
    'Praça Alm. Júlio de Noronha',
    'Praça Alm. Júlio de Noronha, 86 - Leme, Rio de Janeiro - RJ, 22010-020, Brasil',
    -22.9623025,
    -43.1653886,
    true,
    'TRADICIONAL',
    300,
    '22:00',
    1201
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26811,
    '2026-02-16',
    '09:00',
    true,
    'Av. Atlântica',
    'Av. Atlântica, 656 - Copacabana, Rio de Janeiro - RJ, 22010-000, Brasil',
    -22.962993,
    -43.1697762,
    true,
    'TRADICIONAL',
    900,
    '14:00',
    1168
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('CHROMA AQUI NA MINHA MÃO', 'chroma-aqui-na-minha-mao', 'Bloco leva o nome de “Chroma” por ser, basicamente, formado por profissionais de TV e Rádio. A folia nasceu em 2013 e até hoje leva a sua bateria para alegrar a multidão.', '2014')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-06
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26416,
    '2026-02-06',
    '19:00',
    true,
    'R. do Rezende',
    'R. do Rezende, 10 - Centro, Rio de Janeiro - RJ, 20230-010, Brasil',
    -22.911903,
    -43.1826588,
    true,
    'TRADICIONAL',
    200,
    '22:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('INOVA QUE EU GOSTO', 'inova-que-eu-gosto', 'O bloco foi fundado por um grupo de funcionários da FINEP em 2008. A turma promove e populariza a ciência, tecnologia e inovação por meio do carnaval, incentivando o espírito carnavalesco dos trabalhadores, amigos, instituições parceiras e foliões do bairro.', '2008')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-06
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26417,
    '2026-02-06',
    '19:00',
    true,
    'R. Barão do Flamengo',
    'R. Barão do Flamengo, 4 - Flamengo, Rio de Janeiro - RJ, 22220-080, Brasil',
    -22.9330857,
    -43.1751322,
    true,
    'TRADICIONAL',
    1500,
    '22:00',
    1178
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('EDUCA QUE LIBERTA OU CORDÃO DO PAULO FREIRE E ÔH! DARCY', 'educa-que-liberta-ou-cordao-do-paulo-freire-e-oh-darcy', 'É o bloco da Educação! Foi criado em 2018 e reúne os profissionais de ensino do Rio de Janeiro.', '2017')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-06
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26413,
    '2026-02-06',
    '20:00',
    true,
    'R. Pedro Lessa',
    'R. Pedro Lessa, 35 - sala 1003 - Centro, Rio de Janeiro - RJ, 20030-030, Brasil',
    -22.9101949,
    -43.1743854,
    true,
    'TRADICIONAL',
    300,
    '22:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DA FAVORITA', 'bloco-da-favorita', 'Utilize o transporte público por Metrô! Priorize a estação CARIOCA para ir e voltar do bloco.

O baile funk a céu aberto comandado pelo Bloco da Favorita acontece desde 2013, sempre com convidados especiais. Já passaram pelo palco, MCs de diferentes gerações e artistas estrelados da música brasileira. O som do funk carioca vai dominar o circuito dos megablocos do Carnaval de Rua do Rio mais uma vez! ', '2013')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26446,
    '2026-02-07',
    '08:00',
    true,
    'R. Primeiro de Março',
    'R. Primeiro de Março, 33 - Centro, Rio de Janeiro - RJ, 20010-000, Brasil',
    -22.9023308,
    -43.17607,
    true,
    'MEGA BLOCO',
    50000,
    '12:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('CEU NA TERRA', 'ceu-na-terra', 'Quando o ‘Bloco Céu na Terra’ sai pelas charmosas ruas do bairro de Santa Teresa, um clima dos antigos carnavais invade as centenárias casas. Fundado em 2001, reúne milhares de foliões fantasiados, embalados pelas marchinhas já tradicionais do carnaval carioca. Embalados pela Orquestra Popular Céu na Terra, formada em 2004, apresenta um repertório popular variado com arranjos originais para sopros, percussões, vozes e harmonias.', '2001')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26433,
    '2026-02-07',
    '08:00',
    true,
    'R. Alm. Alexandrino',
    'R. Alm. Alexandrino, 89 - Santa Teresa, Rio de Janeiro - RJ, 20241-260, Brasil',
    -22.9215461,
    -43.186043,
    true,
    'TRADICIONAL',
    4000,
    '13:00',
    1237
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26538,
    '2026-02-14',
    '08:00',
    true,
    'R. Alm. Alexandrino',
    'R. Alm. Alexandrino, 89 - Santa Teresa, Rio de Janeiro - RJ, 20241-260, Brasil',
    -22.9215461,
    -43.186043,
    true,
    'TRADICIONAL',
    5000,
    '13:00',
    1237
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('O BAILE TODO', 'o-baile-todo', 'Praça Mal. Âncora, 184 - Centro, Rio de Janeiro - RJ, 20021-200, Brasil', '2026')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26757,
    '2026-02-07',
    '08:00',
    true,
    'Praça Mal. Âncora',
    'Praça Mal. Âncora, 184 - Centro, Rio de Janeiro - RJ, 20021-200, Brasil',
    -22.9042538,
    -43.1701219,
    true,
    'TRADICIONAL',
    1500,
    '13:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO ESTRATÉGIA', 'bloco-estrategia', 'Do suingue dos bailes black ao batuque dos terreiros, passando pelas rodas de coco, samba, xote e maculelê, o Bloco Estratégia foi criado em 2012 para amplificar a boa energia da música preta brasileira. Com repertório brasileiro, leva ao Largo São Francisco de Paula músicas de Tim Maia, Jorge Ben, Bezerra da Silva, Wilson Simonal, Criolo, Leci Brandão, Ed Motta, Caetano Veloso, além de outros artistas. ', '2012')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26428,
    '2026-02-07',
    '09:00',
    true,
    'Via interna Aterro do Flamengo',
    'Via interna Aterro do Flamengo, 33 - Glória, Rio de Janeiro - RJ, Brasil',
    -22.921756,
    -43.1686161,
    true,
    'TRADICIONAL',
    3000,
    '14:00',
    1183
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('IMAGINOU? AGORA AMASSA', 'imaginou-agora-amassa', 'O Imaginou Agora Amassa atrai cerca de 5000 pessoas pelas ruas do Leblon, na Zona Sul do Rio', '2024')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26749,
    '2026-02-07',
    '10:00',
    true,
    'R. José Linhares',
    'R. José Linhares, 245 - Leblon, Rio de Janeiro - RJ, 22430-220, Brasil',
    -22.9807364,
    -43.2223049,
    true,
    'TRADICIONAL',
    5000,
    '14:00',
    1200
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('INFANTIL SÁ PEREIRA', 'infantil-sa-pereira', 'A criançada vai se divertir pelas ruas de Botafogo, na Zona Sul do Rio, com o bloco infantil Sá Pereira. Formado por alunos e amigos da escola que leva o mesmo nome', '1992')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26467,
    '2026-02-07',
    '09:00',
    true,
    'R. Capistrano de Abreu',
    'R. Capistrano de Abreu, 29 - Botafogo, Rio de Janeiro - RJ, 22271-000, Brasil',
    -22.9546376,
    -43.1959408,
    true,
    'INFANTIL',
    700,
    '13:00',
    1158
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('PRIMEIRO AMOR', 'primeiro-amor', 'Quem curte um samba ao estilo “retrô” vai se sentir em casa no bloco de carnaval Primeiro Amor, o mais amoroso do Rio. De cima do trio, clássicos românticos do samba levantam o público com uma banda que tem influência de grupos como Exaltasamba, Só Para Contrariar, Raça Negra, Soweto, Travessos e Sorriso Maroto. ', '2013')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26464,
    '2026-02-07',
    '10:00',
    true,
    'Condomínio Edifício Franklin Sampaio - Av. Pref. Mendes de Morais',
    'Condomínio Edifício Franklin Sampaio - Av. Pref. Mendes de Morais, 808 - São Conrado, Rio de Janeiro - RJ, 22610-095, Brasil',
    -22.9990187,
    -43.2648057,
    true,
    'TRADICIONAL',
    5000,
    '14:00',
    1240
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DA PRACINHA', 'bloco-da-pracinha', 'Praça Pio XI - Jardim Botânico, Rio de Janeiro - RJ, 22460-000, Brasi
Praça Pio XI - Jardim Botânico, Rio de Janeiro - RJ, 22460-000, Brasil
Praça Pio XI, 174 - Jardim Botânico, Rio de Janeiro - RJ, 22461-080, Brazil', '2006')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26443,
    '2026-02-07',
    '10:00',
    true,
    'Praça Pio XI - Jardim Botânico',
    'Praça Pio XI - Jardim Botânico, Rio de Janeiro - RJ, 22460-000, Brasi',
    -22.9617832,
    -43.2173916,
    true,
    'INFANTIL',
    500,
    '15:00',
    1194
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('PEROLA DA GUANABARA', 'perola-da-guanabara', 'Utilize o transporte público por Metrô! Priorize a estação CARIOCA para ir e voltar do bloco.

O bloco que desfila em Paquetá é um dos mais descolados da cidade e, a cada ano, atrai mais adeptos.', '2011')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26441,
    '2026-02-07',
    '11:00',
    true,
    'Paquetá',
    'Paquetá, Rio de Janeiro - RJ, 20397-070, Brasi',
    -22.76226642,
    -43.10734749,
    true,
    'TRADICIONAL',
    10000,
    '15:00',
    1226
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('S.C.R. BLOCO XUPA MAS NÃO BABA', 's-c-r-bloco-xupa-mas-nao-baba', 'R. Alice, 34 - Laranjeiras, Rio de Janeiro - RJ, 22241-020, Brasil
R. Alice, 550 - Laranjeiras, Rio de Janeiro - RJ, 22241-020, Brasil', '1988')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26437,
    '2026-02-07',
    '10:00',
    true,
    'R. Alice',
    'R. Alice, 34 - Laranjeiras, Rio de Janeiro - RJ, 22241-020, Brasil',
    -22.9361259,
    -43.1903729,
    true,
    'TRADICIONAL',
    1000,
    '14:00',
    1199
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('SÓ O CUME INTERESSA', 'so-o-cume-interessa', 'O bloco foi criado por um grupo de montanhistas que só querem saber do cume. O bloco desfila na Urca, bairro famoso da zona sul do Rio conhecido, não somente porque o rei Roberto Carlos mora lá, mas pelas belas trilhas do local.', '2005')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26460,
    '2026-02-07',
    '10:00',
    true,
    'PRAÇA GENERAL TIBÚRCIO S/N - URCA',
    'PRAÇA GENERAL TIBÚRCIO S/N - URCA',
    -22.9552043,
    -43.1663915,
    true,
    'TRADICIONAL',
    300,
    '15:00',
    1248
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('TIJUCA PÁRA CAES', 'tijuca-para-caes', 'Pr. Saenz Peña, 344 - Tijuca, Rio de Janeiro - RJ, 20520-090, Brasil', '2024')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26756,
    '2026-02-07',
    '10:00',
    true,
    'Pr. Saenz Peña',
    'Pr. Saenz Peña, 344 - Tijuca, Rio de Janeiro - RJ, 20520-090, Brasil',
    -22.9242973,
    -43.2322887,
    true,
    'TRADICIONAL',
    300,
    '14:00',
    1247
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('LAMBABLOCO', 'lambabloco', 'A ideia de quatro amigas em resgatar aulas de lambaeróbica que reinavam nas academias deu mais que certo. No Lambabloco, músicas que fazem mexer o corpo todo!', '2020')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26466,
    '2026-02-07',
    '11:00',
    true,
    'Largo São Francisco de Paula',
    'Largo São Francisco de Paula, 50 - Centro, Rio de Janeiro - RJ, 20051-070, Brasil',
    -22.9049429,
    -43.1807469,
    true,
    'TRADICIONAL',
    1200,
    '16:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO URUBUZADA', 'bloco-urubuzada', 'R. Martins Pena, 55 - Tijuca, Rio de Janeiro - RJ, 20270-270, Brasil
R. Campos Sales, 67a - Tijuca, Rio de Janeiro - RJ, 20270-214, Brasil
R. Mariz e Barros, 470 - Maracanã, Rio de Janeiro - RJ, 20270-001, Brasil
R. Afonso Pena, 344 - Tijuca, Rio de Janeiro - RJ, 20270-245, Brasil
Condomínio do Edifício Pelicanus - R. Afonso Pena, 95 - Tijuca, Rio de Janeiro - RJ, 20270-242, Brasil
R. Martins Pena, 41 - Tijuca, Rio de Janeiro - RJ, 20270-270, Brasil', '2008')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26423,
    '2026-02-07',
    '14:00',
    true,
    'R. Martins Pena',
    'R. Martins Pena, 55 - Tijuca, Rio de Janeiro - RJ, 20270-270, Brasil',
    -22.9172448,
    -43.2178921,
    true,
    'TRADICIONAL',
    980,
    '17:00',
    1247
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BUTANO NA BURETA', 'butano-na-bureta', 'Formado por químicos - daí seu divertido nome - o Butano na Bureta atrai os foliões da região do Maracanã com sua bateria que toca os clássicos do carnaval.', '2010')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26420,
    '2026-02-07',
    '13:00',
    true,
    'R. Sen. Furtado',
    'R. Sen. Furtado, 15-B - Praca da Bandeira, Rio de Janeiro - RJ, 20270-021, Brasil',
    -22.9129783,
    -43.2174407,
    true,
    'TRADICIONAL',
    2000,
    '18:00',
    1222
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('CARNAECO - BLOCO DO KING', 'carnaeco-bloco-do-king', 'Av. Lúcio Costa, 3360 - Barra da Tijuca, Rio de Janeiro - RJ, 22630-010, Brasil
Av. Lúcio Costa, 2390 - Barra da Tijuca, Rio de Janeiro - RJ, 22620-172, Brasil', '2013')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26456,
    '2026-02-07',
    '13:00',
    true,
    'Av. Lúcio Costa',
    'Av. Lúcio Costa, 3360 - Barra da Tijuca, Rio de Janeiro - RJ, 22630-010, Brasil',
    -23.0083432,
    -43.3290473,
    true,
    'TRADICIONAL',
    10000,
    '18:00',
    1155
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('LAVOU TA LIMPO', 'lavou-ta-limpo', 'Lavou Tá Limpo está previsto para desfilar na Praça Seca, com público estimado de 300 pessoas, dia 03/02/24 com início da concentração às 12:00 e dispersão às 18:00. O trajeto será: R. Cândido Benício, 2235, R. Florianópolis, 1651.', '2024')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26752,
    '2026-02-07',
    '13:00',
    true,
    'R. Cândido Benício',
    'R. Cândido Benício, 2235 - Praça Seca, Rio de Janeiro - RJ, 22733-000, Brasil',
    -22.9004599,
    -43.3540574,
    true,
    'TRADICIONAL',
    400,
    '18:00',
    1223
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DA SAARA', 'bloco-da-saara', 'O tradicional centro popular de compras tem um bloco para chamar de seu! Comerciantes e frequentadores podem comprar suas fantasias em alguma das centenas de lojas do local e depois cair na folia, no sábado pré-carnaval. ', '2008')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26427,
    '2026-02-07',
    '14:00',
    true,
    'R. Buenos Aires',
    'R. Buenos Aires, 271 - Centro, Rio de Janeiro - RJ, 20061-003, Brasil',
    -22.9053271,
    -43.1847485,
    true,
    'TRADICIONAL',
    200,
    '19:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('CONFRARIA DA BEBIDINHA', 'confraria-da-bebidinha', 'Um dos caçulas do carnaval carioca, a Confraria da Bebidinha foi fundado em 2018 e dá um colorido todo especial à folia na Abolição', '2017')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26438,
    '2026-02-07',
    '14:00',
    true,
    'Tv. Coari',
    'Tv. Coari, 06 - Abolição, Rio de Janeiro - RJ, 20755-030, Brasil',
    -22.8856168,
    -43.2977624,
    true,
    'TRADICIONAL',
    400,
    '19:00',
    1150
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('QUE BLOCO É ESSE?!', 'que-bloco-e-esse', 'Com previsão de atrair cerca de 1000 animados foliões, o Que Bloco é Esse desfila no Largo de São Francisco da Prainha', '2022')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26753,
    '2026-02-07',
    '14:00',
    true,
    'Via interna Aterro do Flamengo',
    'Via interna Aterro do Flamengo, 33 - Glória, Rio de Janeiro - RJ, Brasil',
    -22.921756,
    -43.1686161,
    true,
    'TRADICIONAL',
    3000,
    '19:00',
    1183
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BANDA DA PRAIA DA BICA', 'banda-da-praia-da-bica', 'O bloco se concentra na Praia da Bica e seu público é de aproximadamente mil pessoas. ', '1989')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26429,
    '2026-02-07',
    '15:00',
    true,
    'PRAIA DA BICA NR. 1191 - JARDIM GUANABARA',
    'PRAIA DA BICA NR. 1191 - JARDIM GUANABARA',
    -22.8184219,
    -43.1972648,
    true,
    'TRADICIONAL',
    500,
    '17:00',
    1196
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('B.C SEU LARGATO MAMA', 'b-c-seu-largato-mama', 'Alegria e agitação é o que não falta no bloco Seu Largato Mama, que faz sua festa na Praça Niterói, no Maracanã, com muito entusiasmo, no sábado antes do carnaval.', '2010')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26425,
    '2026-02-07',
    '16:00',
    true,
    'Praça Niterói',
    'Praça Niterói, 17 - Maracanã, Rio de Janeiro - RJ, 20550-158, Brasil',
    -22.9160497,
    -43.2346932,
    true,
    'TRADICIONAL',
    400,
    '20:00',
    1207
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO ALEGRIA DO SAPÊ', 'bloco-alegria-do-sape', 'Com uma bateria mais do que animada, o bloco Alegria do Sapê vai reunindo centenas de foliões em uma festa sem tamanho, mas com muita alegria.', '2016')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26452,
    '2026-02-07',
    '16:00',
    true,
    'R. Camoropim',
    'R. Camoropim, 132 - Bento Ribeiro, Rio de Janeiro - RJ, 21550-440, Brasil',
    -22.8590985,
    -43.355364,
    true,
    'TRADICIONAL',
    700,
    '20:00',
    1157
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO BUNDA RACHADA', 'bloco-bunda-rachada', 'O "Bunda rachada” toca as melhoras músicas, trazendo ainda mais alegria para as ruas do Rio de Janeiro.', '2006')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26465,
    '2026-02-07',
    '15:00',
    true,
    'Rua Romero Zander',
    'Rua Romero Zander, 358 - Ramos, Rio de Janeiro - RJ, 21040-080, Brasil',
    -22.8565729,
    -43.2551629,
    true,
    'TRADICIONAL',
    800,
    '20:00',
    1224
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DO ROCK', 'bloco-do-rock', 'O Bloco do Rock busca arranjos originais unindo o peso do rock and roll com o balanço do samba. Com guitarras pesadas e tamborins afinados, é o bloco que veio para unir todas as tribos.', '2014')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26459,
    '2026-02-07',
    '16:00',
    true,
    'PRAÇA TIRADENTES',
    'PRAÇA TIRADENTES',
    -22.9072348,
    -43.182463,
    true,
    'TRADICIONAL',
    900,
    '19:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO FLA MASTER', 'bloco-fla-master', 'O bloco Fla Master é uma grande homenagem ao time de futebol Flamengo e reunião dos ex-atletas e ídolos que fizeram história no clube. A agremiação foi criada em 2016 e segue reunindo foliões e flamenguistas pela Barra da Tijuca.', '2016')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26431,
    '2026-02-07',
    '15:00',
    true,
    'AV. LÚCIO COSTA',
    'AV. LÚCIO COSTA, 3604 - BARRA DA TIJUCA, RIO DE JANEIRO - RJ, 22630-010, BRASIL',
    -23.0103884,
    -43.3331167,
    true,
    'TRADICIONAL',
    500,
    '20:00',
    1155
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO INSANO', 'bloco-insano', 'O bloco leva sua alegria ao Alto da Boa Vista, no sábado antes do carnaval, com concentração às 14h. ', '2015')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26458,
    '2026-02-07',
    '16:00',
    true,
    'Av. Édison Passos',
    'Av. Édison Passos, 19 - Alto da Boa Vista, Rio de Janeiro - RJ, 20531-073, Brasil',
    -22.9462606,
    -43.2574089,
    true,
    'TRADICIONAL',
    200,
    '20:00',
    1278
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('SIMPATIA É QUASE AMOR', 'simpatia-e-quase-amor', 'Utilize o transporte público por Metrô! Priorize a estação GENERAL OSÓRIO para ir e voltar do bloco.

Criado às vésperas do carnaval de 1985, em meio à campanha das ‘’Diretas Já”, o ‘’Simpa’’, como carinhosamente é chamado por seus admiradores, conquista e embala o carnaval com um público de idades que variam de 8 a 80 anos. Ninguém fica de fora da festa comandada a partir da Praça General Osório e que toma as orlas de Ipanema e do Leblon, em pleno domingo de Carnaval. Com irreverência, o Simpatia ilumina as ruas nas cores amarelo e lilás, entoando seu grito de guerra: "Alô burguesia de Ipanema"!', '1985')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26457,
    '2026-02-07',
    '16:00',
    true,
    'R. Teixeira de Melo - Ipanema',
    'R. Teixeira de Melo - Ipanema, Rio de Janeiro - RJ, Brasi',
    -22.9849595,
    -43.1986372,
    true,
    'TRADICIONAL',
    30000,
    '19:00',
    1190
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26604,
    '2026-02-15',
    '16:00',
    true,
    'R. Teixeira de Melo',
    'R. Teixeira de Melo, 37 - Ipanema, Rio de Janeiro - RJ, 22410-010, Brasil',
    -22.9855017,
    -43.1988706,
    true,
    'TRADICIONAL',
    30000,
    '19:00',
    1190
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('B.C BATUKE DE CIATA', 'b-c-batuke-de-ciata', 'Criado pela Organização Cultural Remanescente de Tia Ciata, o Batuke de Ciata promove a cultura e a conservação do patrimônio histórico e artístico afro-fluminense. Com muita alegria, brincadeiras e diversão, a folia acontece no Carnaval de rua do Rio de Janeiro e tem ambiente familiar. ', '2014')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26430,
    '2026-02-07',
    '16:00',
    true,
    'R. Tia Ciata',
    'R. Tia Ciata, 235 - Saúde, Rio de Janeiro - RJ, 20081-040, Brasil',
    -22.8967624,
    -43.1851036,
    true,
    'TRADICIONAL',
    500,
    '21:00',
    1241
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DA MAMADEIRA', 'bloco-da-mamadeira', 'REDONDO DO PARQUE GENERAL LEANDRO ATRÁS RUA LAURO MULLER 66', '2004')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26455,
    '2026-02-07',
    '16:00',
    true,
    'REDONDO DO PARQUE GENERAL LEANDRO ATRÁS RUA LAURO MULLER 66',
    'REDONDO DO PARQUE GENERAL LEANDRO ATRÁS RUA LAURO MULLER 66',
    -22.9550222,
    -43.1748733,
    true,
    'INFANTIL',
    100,
    '19:00',
    1158
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO  DO AQUILAH', 'bloco-do-aquilah', 'O Bloco do Aquilah faz a sua festa em Rocha Miranda, no sábado antes do carnaval, desde o ano de 2017. O grupo se concentra na Travessa Santorim, a partir das 15 horas.', '2017')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26421,
    '2026-02-07',
    '17:00',
    true,
    'R. SOARES CALDEIRA',
    'R. SOARES CALDEIRA, 115 - MADUREIRA, RIO DE JANEIRO - RJ, 21351-080, BRASIL',
    -22.8698081,
    -43.3398574,
    true,
    'TRADICIONAL',
    300,
    '21:00',
    1203
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DO BOI DA VILA DA PENHA', 'bloco-do-boi-da-vila-da-penha', 'R. Ápia, 1056 - Vila da Penha, Rio de Janeiro - RJ, 21221-250, Brasil', '2007')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26435,
    '2026-02-07',
    '16:00',
    true,
    'R. Ápia',
    'R. Ápia, 1056 - Vila da Penha, Rio de Janeiro - RJ, 21221-250, Brasil',
    -22.8391311,
    -43.3050299,
    true,
    'TRADICIONAL',
    500,
    '21:00',
    1250
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO O FERVO', 'bloco-o-fervo', 'O "bloco mais quente do Rio de Janeiro" desfila nas ruas do histórico bairro do Estácio, reduto do samba e da boemia. O desfile acontece no domingo antes do carnaval, com início às 16h', '2016')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26462,
    '2026-02-07',
    '17:00',
    true,
    'R. Prof. Quintino do Vale',
    'R. Prof. Quintino do Vale, 65a - Estácio, Rio de Janeiro - RJ, 20250-030, Brasil',
    -22.916474,
    -43.2074835,
    true,
    'TRADICIONAL',
    250,
    '21:00',
    1177
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO OLHA PÁ MIM', 'bloco-olha-pa-mim', 'O Bloco é formado por ritmistas formados pela oficina do Monobloco, que decidiram criar um bloco próprio para reunir amigos, diversão e criatividade. A  animação é na Tijuca, no sábado de carnaval.', '2016')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26447,
    '2026-02-07',
    '17:00',
    true,
    'R. Martins Pena',
    'R. Martins Pena, 43 - Tijuca, Rio de Janeiro - RJ, 20270-270, Brasil',
    -22.9174114,
    -43.2183469,
    true,
    'TRADICIONAL',
    950,
    '21:00',
    1247
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO SERROTE AFIADO', 'bloco-serrote-afiado', 'Fundado em 2004, o bloco do Engenho da Rainha, na Zona Norte do Rio, atrai foliões animados, de todas as idades, no sábado que antecede o Carnaval', '2004')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26418,
    '2026-02-07',
    '17:00',
    true,
    'RUA MÁRIO FERREIRA 217 ENGENHO DA RAINHA',
    'RUA MÁRIO FERREIRA 217 ENGENHO DA RAINHA',
    -22.870819,
    -43.2948437,
    true,
    'TRADICIONAL',
    500,
    '21:00',
    1174
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('IH, É CARNAVAL!', 'ih-e-carnaval', 'A Urca, na Zona Sul do Rio, vai ficar pequena para a animação dos foliões do bloco Ih, é Carnaval. Mas quem quiser aproveitar a folia tem que acordar cedo: a saída do bloco acontece às 7h da manhã do sábado antes do Carnaval!', '2003')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26440,
    '2026-02-07',
    '17:00',
    true,
    'Av. Pasteur',
    'Av. Pasteur, 250 - Urca, Rio de Janeiro - RJ, 22290-250, Brasil',
    -22.9529988,
    -43.1737893,
    true,
    'TRADICIONAL',
    4000,
    '21:00',
    1248
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BANDA BANDIDA', 'banda-bandida', 'Banda Pré-Carnavalesca idealizada por Milton Gadelha, Raimundo Garrone, Roberto Lameiras (In Memoriam) e Mario Moraes.', '1977')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26436,
    '2026-02-07',
    '17:00',
    true,
    'Condomínio do Edifício Comandante Moura - Rua Inhangá',
    'Condomínio do Edifício Comandante Moura - Rua Inhangá, 11 - Copacabana, Rio de Janeiro - RJ, 22020-060, Brasil',
    -22.9660642,
    -43.1810987,
    true,
    'TRADICIONAL',
    300,
    '22:00',
    1168
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BANDA HADDOCK', 'banda-haddock', 'A Banda Haddock anima o Carnaval do Rio de Janeiro com trio elétrico e algumas atrações direto da Sapucaí: tem apresentação da bateria da escola de samba Estácio de Sá, baianas do Salgueiros e vários intérpretes de outras instituições da cidade.', '1984')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26426,
    '2026-02-07',
    '18:00',
    true,
    'R. HADDOCK LOBO',
    'R. HADDOCK LOBO, 359 - TIJUCA, RIO DE JANEIRO - RJ, 20260-141, BRASIL',
    -22.9213535,
    -43.217744,
    true,
    'TRADICIONAL',
    5500,
    '22:00',
    1247
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BC.PINTO SARADO', 'bc-pinto-sarado', 'Tv. Sara, 64 - Santo Cristo, Rio de Janeiro - RJ, 20220-080, Brasil
R. Sara, 18 - Santo Cristo, Rio de Janeiro - RJ, 20220-090, Brasil
santo cristo 291 fundos - Santo Cristo, Rio de Janeiro - RJ, 20220-304, Brasil
R. da América, 2 - Santo Cristo, Rio de Janeiro - RJ, 20220-590, Brasil
R. Barão da Gamboa, 150 - Santo Cristo, Rio de Janeiro - RJ, 20220-690, Brasil', '2024')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26754,
    '2026-02-07',
    '17:00',
    true,
    'Tv. Sara',
    'Tv. Sara, 64 - Santo Cristo, Rio de Janeiro - RJ, 20220-080, Brasil',
    -22.9017757,
    -43.2038771,
    true,
    'TRADICIONAL',
    900,
    '22:00',
    1239
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CARNAVALESCO AMIGOS DA ESQUINA', 'bloco-carnavalesco-amigos-da-esquina', 'Com mais de 15 anos de história, o bloco Amigos da Esquina se reune com a bateria Venenosa para animar as ruas cariocas com muito batuque e folia.', '2004')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26453,
    '2026-02-07',
    '18:00',
    true,
    'R. Pernambuco',
    'R. Pernambuco, 886 - Encantado, Rio de Janeiro - RJ, 20730-030, Brasil',
    -22.8978819,
    -43.3017319,
    true,
    'TRADICIONAL',
    2500,
    '22:00',
    1280
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26532,
    '2026-02-14',
    '18:00',
    true,
    'R. Pernambuco',
    'R. Pernambuco, 886 - Encantado, Rio de Janeiro - RJ, 20730-030, Brasil',
    -22.8978819,
    -43.3017319,
    true,
    'TRADICIONAL',
    3000,
    '22:00',
    1280
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DO BALDE SULACAP', 'bloco-do-balde-sulacap', 'Criado em meados dos anos 70, o Bloco do Balde Sulacap continua nos dias atuais mantendo a tradição de animar o bairro durante o Carnaval.', '1972')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26454,
    '2026-02-07',
    '17:00',
    true,
    'R. ANTÔNIO DE MENDONÇA - JARDIM SULACAP',
    'R. ANTÔNIO DE MENDONÇA - JARDIM SULACAP, RIO DE JANEIRO - RJ, BRASIL',
    -22.8886172,
    -43.3921276,
    true,
    'TRADICIONAL',
    900,
    '22:00',
    1274
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO H ROMEU PINTO', 'bloco-h-romeu-pinto', 'Tradicional pelas ruas de Realengo, o H Romeu Pinto é uma das atrações da Zona Oeste. ', '2023')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26448,
    '2026-02-07',
    '18:00',
    true,
    'R. da Gazela',
    'R. da Gazela, 204 - Realengo, Rio de Janeiro - RJ, 21755-030, Brasil',
    -22.8842642,
    -43.4279796,
    true,
    'TRADICIONAL',
    700,
    '22:00',
    1225
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO JÁ COMI PIOR PAGANDO', 'bloco-ja-comi-pior-pagando', 'Tocando marchinhas de todas as épocas, o Já Comi Pior Pagando tem público de todas as idades. Nele, a animação rola solta no melhor estilo e irreverência do carioca.', '2010')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26463,
    '2026-02-07',
    '17:00',
    true,
    'RUA LEITE DE ABREU - TIJUCA - CEP 20.530-020',
    'RUA LEITE DE ABREU - TIJUCA - CEP 20.530-020',
    -22.9360298,
    -43.2430405,
    true,
    'TRADICIONAL',
    300,
    '22:00',
    1247
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO PAREI DE BEBER, NÃO DE MENTIR', 'bloco-parei-de-beber-nao-de-mentir', 'Com irreverência, o bloco agita o sábado pré-carnavalesco em Curicica, Zona Oeste da cidade, para um público estimado em 3.500 foliões.', '2009')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26434,
    '2026-02-07',
    '17:00',
    true,
    'Praça do Bandolim',
    'Praça do Bandolim, 33241 - Curicica, Rio de Janeiro - RJ, 22780-793, Brasil',
    -22.9580981,
    -43.383884,
    true,
    'TRADICIONAL',
    3500,
    '20:00',
    1171
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO SEU KUKA E EU DO GRAJAU', 'bloco-seu-kuka-e-eu-do-grajau', 'Desfilando pelas as ruas do Grajaú desde 2008, o bloco faz seu tradicional cortejo no sábado de carnaval, mas também se reúne nos dois sábados anteriores para fazer o esquenta. O ponto de partida é na Rua Barão de Mesquita, 1032.', '2006')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26461,
    '2026-02-07',
    '18:00',
    true,
    'PRAÇA PROFESSOR FRANCISCO DAUREA',
    'PRAÇA PROFESSOR FRANCISCO DAUREA',
    -22.9102973,
    -43.1754283,
    true,
    'TRADICIONAL',
    500,
    '22:00',
    1184
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26551,
    '2026-02-14',
    '20:00',
    true,
    'R. Barão de Mesquita',
    'R. Barão de Mesquita, 1032 - Tijuca, Rio de Janeiro - RJ, 20540-004, Brasil',
    -22.9235233,
    -43.258358,
    true,
    'TRADICIONAL',
    700,
    '22:00',
    1247
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('CACIQUE DE HIGIENÓPOLIS', 'cacique-de-higienopolis', 'Desde 2012, o Cacique de Higienópolis anima as ruas nos sábados que antecedem o carnaval. A partir das 16h os foliões já estão lá prontos para a festa começar!', '2012')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26424,
    '2026-02-07',
    '17:00',
    true,
    'RUA TAMIARANA',
    'RUA TAMIARANA, EM FRENTE AO NÚMERO 11. CEP: 21051-060',
    -22.8760992,
    -43.2652492,
    true,
    'TRADICIONAL',
    300,
    '22:00',
    1186
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('DIG DIG JOY', 'dig-dig-joy', 'Quem viveu os anos 1990/2000 com certeza conhece o refrão que dá nome ao bloco. Em homenagem à dupla Sandy e Junior, o bloco Dig Dig Joy promete fazer a alegria dos fãs dos filhos de Xororó. Sucessos como As Quatro Estações, Quando você passa (turu turu) e A Lenda ganharão novos arranjos em ritmo de samba. E aí, vamo pulá?', '2025')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26751,
    '2026-02-07',
    '17:00',
    true,
    'Pr. Saenz Peña',
    'Pr. Saenz Peña, 55 - Tijuca, Rio de Janeiro - RJ, 20520-090, Brasil',
    -22.9313938,
    -43.2436087,
    true,
    'TRADICIONAL',
    500,
    '20:00',
    1247
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('FUZUÊ... SÓ ALEGRIA PRA VOCÊ!!', 'fuzue-so-alegria-pra-voce', 'Como o nome já diz, o Fuzuê é só alegria! Com um público animado, ele toma conta de Del Castilho no sábado que antecede a folia.', '2004')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26450,
    '2026-02-07',
    '18:00',
    true,
    'R. Tamiarana',
    'R. Tamiarana, 4 - Higienópolis, Rio de Janeiro - RJ, 21051-060, Brasil',
    -22.8741811,
    -43.2655422,
    true,
    'TRADICIONAL',
    900,
    '22:00',
    1186
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('GREMIO RECREATIVO BLOCO CARNAVALESCO BANDA DO PECHINCHA JACAREPAGUÁ', 'gremio-recreativo-bloco-carnavalesco-banda-do-pechincha-jacarepagua', 'O bloco atrai 1000 pessoas em seu desfile no bairro do Pechincha, na Zona Oeste do Rio', '2003')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26449,
    '2026-02-07',
    '17:00',
    true,
    'Estr. do Pau-Ferro',
    'Estr. do Pau-Ferro, n 9 - Pechincha, Rio de Janeiro - RJ, 22743-050, Brasil',
    -22.9287054,
    -43.3541027,
    true,
    'TRADICIONAL',
    1000,
    '22:00',
    1214
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BANDA DO TIJUCA TENIS CLUBE', 'banda-do-tijuca-tenis-clube', 'O bloco da Banda do Tijuca Tênis Clube agita os carnavais no Rio de Janeiro com marchinhas e muita diversão. Organizado pelo clube, o cortejo convida foliões associados e convidados para curtir a festa pelas ruas do bairro.', '1975')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26444,
    '2026-02-07',
    '18:00',
    true,
    'RUA CONDE DE BONFIM',
    'RUA CONDE DE BONFIM, 451 - TIJUCA, RIO DE JANEIRO - RJ, 20520-054, BRASIL',
    -22.9281104,
    -43.2343151,
    true,
    'TRADICIONAL',
    2500,
    '22:00',
    1247
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO EU AMO A LAPA', 'bloco-eu-amo-a-lapa', 'O nome do bloco já deixa explícito: quem ama esse reduto da boemia e da carioquice já tem encontro marcado no sábado pré-carnaval. A festa acontece na Praça Cardeal Câmara, a partir das 17h.', '2010')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26422,
    '2026-02-07',
    '18:00',
    true,
    'Praça Cardeal Câmara',
    'Praça Cardeal Câmara, 71 - Lapa, Rio de Janeiro - RJ, 20230-110, Brasil',
    -22.9122354,
    -43.1797236,
    true,
    'TRADICIONAL',
    500,
    '22:00',
    1198
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('B.C QUEM FOR CORNO ME ACOMPANHE', 'b-c-quem-for-corno-me-acompanhe', 'R. Saçu, 25 - Quintino Bocaiúva, Rio de Janeiro - RJ, 20740-480, Brasil', '2025')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-07
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26750,
    '2026-02-07',
    '19:00',
    true,
    'R. Saçu',
    'R. Saçu, 25 - Quintino Bocaiúva, Rio de Janeiro - RJ, 20740-480, Brasil',
    -22.8955297,
    -43.3191384,
    true,
    'TRADICIONAL',
    100,
    '22:00',
    1314
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BAILINHO DO CAPITÃO TROMBETA', 'bailinho-do-capitao-trombeta', 'O Bailinho do Capitão Trombeta novamente acontece na Praça Iaiá Garcia, na Ribeira (Ilha do Governador). Composto por dez músicos que tocam ao vivo antigas músicas de Carnaval para crianças e responsáveis, o bloco reúne diversas atrações como brinquedos infantis, personagens, além de muita alegria com a bandinha mirim.  ', '2024')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26769,
    '2026-02-08',
    '08:00',
    true,
    'R. Maldonado',
    'R. Maldonado, 293 - Ribeira, Rio de Janeiro - RJ, 21930-130, Brasil',
    -22.8246448,
    -43.1697885,
    true,
    'INFANTIL',
    150,
    '13:00',
    1230
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CHORA ME LIGA', 'bloco-chora-me-liga', 'Utilize o transporte público por Metrô! Priorize a estação CARIOCA para ir e voltar do bloco.Bloco de música sertaneja, que arrasta multidões com clássicos do gênero e os hits do momento de um dos ritmos mais populares do país. O desfile acontece no circuito dos megablocos, no Centro da cidade', '2010')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26470,
    '2026-02-08',
    '08:00',
    true,
    'Av. Infante Dom Henrique',
    'Av. Infante Dom Henrique, 75 - Glória, Rio de Janeiro - RJ, 20021-140, Brasil',
    -22.9166167,
    -43.1735387,
    true,
    'TRADICIONAL',
    20000,
    '12:00',
    1183
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('CORDÃO DO BOITATÁ', 'cordao-do-boitata', 'Utilize o transporte público por Metrô! Priorize a estação CARIOCA para ir e voltar do bloco.
', '1997')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26494,
    '2026-02-08',
    '08:00',
    true,
    'R. Primeiro de Março',
    'R. Primeiro de Março, 33 - Centro, Rio de Janeiro - RJ, 20010-000, Brasil',
    -22.9023308,
    -43.17607,
    true,
    'MEGA BLOCO',
    10000,
    '12:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26562,
    '2026-02-15',
    '11:00',
    true,
    'LARGO DO PAÇO (PRAÇVA XV)',
    'LARGO DO PAÇO (PRAÇVA XV)',
    -22.8897935,
    -43.2599787,
    true,
    'MEGA BLOCO',
    50000,
    '16:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('UNIVERSIBLOCO', 'universibloco', 'Utilize o transporte público por Metrô! Priorize a estação CARIOCA para ir e voltar do bloco.

O UniversiBloco nasceu para dar ares de jogos universitários ao carnaval carioca no bairro do Maracanã. O bloco é ideal pra quem curte jogos universitários e não sai sem os acessórios fundamentais de todo bom torcedor: caneca, boné e camisa da faculdade', '2017')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26488,
    '2026-02-08',
    '08:00',
    true,
    'Prç. Tiradentes',
    'Prç. Tiradentes, 28 - Centro, Rio de Janeiro - RJ, 20060-010, Brasil',
    -22.9064159,
    -43.1823706,
    true,
    'TRADICIONAL',
    10000,
    '13:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCÃO DE COPACABANA', 'blocao-de-copacabana', 'Quer levar seu pet para curtir o carnaval? Então o Blocão de Copacabana foi feito pra você! Irreverente, o bloco desfila pelas ruas de Copacabana desde 2004!', '2004')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26469,
    '2026-02-08',
    '09:00',
    true,
    'AV. ATLÂNTICA - COPACABANA',
    'AV. ATLÂNTICA - COPACABANA, RIO DE JANEIRO - RJ, 22070-002, BRASIL',
    -22.9844218,
    -43.1895582,
    true,
    'TRADICIONAL',
    980,
    '12:00',
    1168
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DA BALANÇO', 'bloco-da-balanco', 'Criado em 2018 pelo Mestre Yago com o intuito de reunir um grupo seleto de ritmistas de blocos e escolas de samba, o ‘Da Balanço’ tem como diferencial mostrar os diversos ritmos brasileiros desde o Samba-Enredo até o Axé.', '2022')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26483,
    '2026-02-08',
    '09:00',
    true,
    'Nossa Senhora da Paz / Ipanema - Ipanema',
    'Nossa Senhora da Paz / Ipanema - Ipanema, Rio de Janeiro - RJ, 22411-001, Brasil',
    -22.983673,
    -43.2059651,
    true,
    'TRADICIONAL',
    1500,
    '14:00',
    1190
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO FOGO E PAIXÃO', 'bloco-fogo-e-paixao', 'Utilize o transporte público por Metrô! Priorize a estação CARIOCA para ir e voltar do bloco.

O bloco mais fogoso e apaixonado do Rio de Janeiro, que canta o amor sem vergonha de ser brega! Todo ano, reúne milhares de foliões que extravasam por meio clássicos do estilo musical conhecido como “música brega”.  Tem Reginaldo Rossi, Rosana, Sidney Magal, Fagner e, claro, o eterno muso Wando, entre muitos outros! ', '2011')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26495,
    '2026-02-08',
    '10:00',
    true,
    'LARGO SÃO FRANCISCO DE PAULA - CENTRO',
    'LARGO SÃO FRANCISCO DE PAULA - CENTRO',
    -22.9053222,
    -43.1806979,
    true,
    'TRADICIONAL',
    30000,
    '14:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('SUVACO DE CRISTO', 'suvaco-de-cristo', 'Fundado em 1986 após uma entrevista cedida por Tom Jobim, na qual o compositor culpava o sovaco do Cristo Redentor pelo mofo dos armários de sua casa, o ‘Suvaco de Cristo’ é um dos blocos mais tradicionais da cidade. Fazendo a alegria dos foliões na Rua Jardim Botânico, “bem debaixo do braço direito do Cristo”.', '1986')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26497,
    '2026-02-08',
    '10:00',
    true,
    'R. Jardim Botânico',
    'R. Jardim Botânico, 594 - Jardim Botânico, Rio de Janeiro - RJ, 22461-000, Brasil',
    -22.9631995,
    -43.2167919,
    true,
    'TRADICIONAL',
    20000,
    '12:00',
    1194
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CARNAVALESCO ESCOTEIROS NA FOLIA', 'bloco-carnavalesco-escoteiros-na-folia', 'O bloco estreia na programação oficial do Carnaval do Rio este ano. A apresentação acontece no Méier. O público estimado é de 300 pessoas. ', '2025')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26762,
    '2026-02-08',
    '10:00',
    true,
    'RuaTravessa Miracema',
    'RuaTravessa Miracema, 148 - Méier, Rio de Janeiro - RJ, 20720-130, Brasil',
    -22.9023146,
    -43.2817351,
    true,
    'TRADICIONAL',
    300,
    '13:00',
    1209
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CARNAVALESCO INFANTIL SEMENTES DO SAMBA I', 'bloco-carnavalesco-infantil-sementes-do-samba-i', 'Um dos bairros mais tradicionais do Rio, Vila Isabel, na Zona Norte, tem espaço para os pequenos foliões no domingo anterior ao Carnaval.', '2024')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26761,
    '2026-02-08',
    '11:00',
    true,
    'Blvd. 28 de Setembro',
    'Blvd. 28 de Setembro, 226 - Vila Isabel, Rio de Janeiro - RJ, 20551-055, Brasil',
    -22.915032,
    -43.2434764,
    true,
    'INFANTIL',
    200,
    '14:00',
    1251
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CARNAVALESCO PODE PROVAR QUE NÃO TEM VENENO', 'bloco-carnavalesco-pode-provar-que-nao-tem-veneno', 'Praça Augusto Rushi - Praça Augusto Ruschi - Recreio dos Bandeirantes, Rio de Janeiro - RJ, 22790-701, Brasil', '2024')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26764,
    '2026-02-08',
    '10:00',
    true,
    'Praça Augusto Rushi - Praça Augusto Ruschi - Recreio dos Bandeirantes',
    'Praça Augusto Rushi - Praça Augusto Ruschi - Recreio dos Bandeirantes, Rio de Janeiro - RJ, 22790-701, Brasil',
    -23.0161832,
    -43.4508496,
    true,
    'TRADICIONAL',
    500,
    '15:00',
    1228
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('GIGANTES DA LIRA', 'gigantes-da-lira', 'A criançada, junto aos pais foliões, também tem espaço nos blocos de carnaval. O Gigantes da Lira foi fundado em 1999, no bairro de Laranjeiras, e foi o primeiro bloco infantil de carnaval do Rio. A ideia dos fundadores é levar diversão, sonho e fantasia para a criançada e, claro, para os adultos também. ', '1999')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26480,
    '2026-02-08',
    '10:00',
    true,
    'Laranjeiras',
    'Laranjeiras, Rio de Janeiro - RJ, 22245-070, Brasil',
    -22.94162,
    -43.1916583,
    true,
    'INFANTIL',
    3600,
    '14:00',
    1199
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('SE NÃO QUISER ME DAR ME EMPRESTA', 'se-nao-quiser-me-dar-me-empresta', 'Fundado em 2008 por moradores de Ipanema, o ‘Se não quiser me dar me empresta’ é um dos que levam muita animação à orla do bairro no domingo que antecede ao Carnaval. O ponto de partida é a Avenida Vieira Souto, em frente ao Restaurante Boa Praça, no posto 8.', '2006')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26476,
    '2026-02-08',
    '11:00',
    true,
    'Av. Vieira Souto',
    'Av. Vieira Souto, S/N - Ipanema, Rio de Janeiro - RJ, 22420-002, Brasil',
    -22.9868862,
    -43.1976534,
    true,
    'TRADICIONAL',
    1000,
    '15:00',
    1190
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BATUCAR PRA SER FELIZ', 'batucar-pra-ser-feliz', 'O bloco de Jacarepaguá, na Zona Oeste do Rio, desfila pela primeira vez no Carnaval de Rua trazendo como um dos destaques a percussão. todos na faixa etária de 50 anos. Com expectativa de atrair mais de 900 pessoas, o Batucar pra ser feliz promete um desfile repleto de alegria e alto astral!', '2026')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26766,
    '2026-02-08',
    '11:00',
    true,
    'Estr. dos Três Rios',
    'Estr. dos Três Rios, 002 - Freguesia (Jacarepaguá), Rio de Janeiro - RJ, 22755-002, Brasil',
    -22.9398784,
    -43.3434047,
    true,
    'TRADICIONAL',
    200,
    '13:00',
    1265
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CARNAVALESCO ACORDA E VEM BRINCAR', 'bloco-carnavalesco-acorda-e-vem-brincar', 'R. das Dálias, 137 - Vila Valqueire, Rio de Janeiro - RJ, 21941-799, Brasil
R. das Verbenas, 14 - Vila Valqueire, Rio de Janeiro - RJ, 21330-430, Brasil
R. das Camélias, 129 - Vila Valqueire, Rio de Janeiro - RJ, 21330-200, Brasil
R. das Camélias, 456 - Vila Valqueire, Rio de Janeiro - RJ, 21330-200, Brasil', '2007')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26489,
    '2026-02-08',
    '12:00',
    true,
    'R. das Dálias',
    'R. das Dálias, 137 - Vila Valqueire, Rio de Janeiro - RJ, 21941-799, Brasil',
    -22.8815101,
    -43.3665784,
    true,
    'TRADICIONAL',
    600,
    '16:00',
    1254
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('GINGA TROPICAL', 'ginga-tropical', 'Desde 2020 o bloco atrai 1000 foliões na Rua da Alfândega, Centro do Rio', '2020')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26484,
    '2026-02-08',
    '11:00',
    true,
    'R. da Alfândega',
    'R. da Alfândega, 19 - Centro, Rio de Janeiro - RJ, 20070-000, Brasil',
    -22.9016426,
    -43.1771555,
    true,
    'TRADICIONAL',
    500,
    '16:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('GREMIO RECREATIVO E CULTURAL ESPORTIVO E CARNAVALESCO BANDA DO ARROXO', 'gremio-recreativo-e-cultural-esportivo-e-carnavalesco-banda-do-arroxo', 'O tradicional bloco faz a alegria dos foliões no bairro de Copacabana, na Zona Sul do Rio', '2024')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26830,
    '2026-02-08',
    '11:00',
    true,
    'Av. Atlântica',
    'Av. Atlântica, 1230 - Copacabana, Rio de Janeiro - RJ, 22021-000, Brazil',
    -22.9651599,
    -43.1749765,
    true,
    'TRADICIONAL',
    6000,
    '15:00',
    1168
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO BIGODINHO ESTICADO', 'bloco-bigodinho-esticado', 'Bloco infantil originado do tradicional Bigode Esticado, que faz sua festa no Méier, no subúrbio do Rio. O intuito é um só: reunir os amigos em um ambiente familiar, cerveja gelada e um bom samba pelas ruas do Méier. Tudo isso com uma boa dose de ação social.', '2004')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26482,
    '2026-02-08',
    '12:00',
    true,
    'R. Adriano',
    'R. Adriano, 144 - Todos os Santos, Rio de Janeiro - RJ, 20735-300, Brasil',
    -22.8998775,
    -43.2888657,
    true,
    'INFANTIL',
    300,
    '17:00',
    1286
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CARNAVALESCO UNIDOS DA RIBEIRA', 'bloco-carnavalesco-unidos-da-ribeira', 'O bloco, tradicional na Ilha do Governador, surgiu no início da década de 1970 por iniciativa dos moradores e comerciantes da Ribeira. Desfila no domingo anterior ao carnaval, para um público estimado e 4.500 pessoas. ', '1974')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26478,
    '2026-02-08',
    '13:00',
    true,
    'Praça Iaiá García',
    'Praça Iaiá García, SN - Ribeira, Rio de Janeiro - RJ, 21930-040, Brasil',
    -22.8258677,
    -43.1694592,
    true,
    'TRADICIONAL',
    4500,
    '17:00',
    1230
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BOHEMIOS DA PRACINHA E VITAL', 'bohemios-da-pracinha-e-vital', 'Rua Guamaré, 21 - Curicica, Rio de Janeiro - RJ, 22710-315, Brasil', '2019')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26474,
    '2026-02-08',
    '12:00',
    true,
    'Rua Guamaré',
    'Rua Guamaré, 21 - Curicica, Rio de Janeiro - RJ, 22710-315, Brasil',
    -22.9442838,
    -43.3860647,
    true,
    'TRADICIONAL',
    450,
    '17:00',
    1171
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('CARIJÓ', 'carijo', 'Desfilando desde 2020, o Bloco Carijó traz alegria à Ilha do Governador!', '2020')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26472,
    '2026-02-08',
    '12:00',
    true,
    'Av. Paranapuã',
    'Av. Paranapuã, 304 - Freguesia (Ilha do Governador), Rio de Janeiro - RJ, 21910-003, Brasil',
    -22.79445,
    -43.173815,
    true,
    'TRADICIONAL',
    350,
    '17:00',
    1179
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('CHEGOU PILARES', 'chegou-pilares', 'O bloco faz sua estreia no carnaval em 2025, com muita animação pelas ruas de Pilares, e convoca os foliões de toda a região: do Engenho, do Urubu, da Cardim, do Ferroviário, do IAPI, do Brasil Novo, da Joaquim, do Águia, da Belém, do Guarda, da Coroa.... Pilares é uma grande família!', '2025')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26760,
    '2026-02-08',
    '13:00',
    true,
    'R. Soares Meireles',
    'R. Soares Meireles, 10A - Pilares, Rio de Janeiro - RJ, 20750-112, Brasil',
    -22.880286,
    -43.2940495,
    true,
    'TRADICIONAL',
    400,
    '17:00',
    1219
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('G.R.B.C PANELA DA FOLIA', 'g-r-b-c-panela-da-folia', ' Panela da Folia desfila pela rua Belisário Pena, número 512, em Realengo, na Zona Oeste da cidade. ', '2024')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26768,
    '2026-02-08',
    '13:00',
    true,
    'Rua Belisário de Sousa',
    'Rua Belisário de Sousa, 779 - Realengo, Rio de Janeiro - RJ, 21721-240, Brasil',
    -22.8730218,
    -43.4427421,
    true,
    'TRADICIONAL',
    200,
    '17:00',
    1225
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BANDA DA BARRA', 'banda-da-barra', 'Criada em 1984, a Banda da Barra é um tradicional bloco da região. Com som instrumental, o cortejo empolga os foliões do bairro no carnaval de forma animada e com homenagens a personalidades do mundo artístico e cultural da Cidade Maravilhosa.', '1984')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26493,
    '2026-02-08',
    '14:00',
    true,
    'AVENIDA LUCIO COSTA 3646 (EM FRENTE AO BONDINHO DA BANDA DA BARRA) - BARRA DA TIJUCA',
    'AVENIDA LUCIO COSTA 3646 (EM FRENTE AO BONDINHO DA BANDA DA BARRA) - BARRA DA TIJUCA',
    -23.0101492,
    -43.3393743,
    true,
    'TRADICIONAL',
    50000,
    '18:00',
    1155
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BANDA DO ANIL', 'banda-do-anil', 'Estr. da Uruçanga, 20 - Anil, Rio de Janeiro - RJ, 22750-030, Brasil
R. Gen. José Eulálio, 142 - Anil, Rio de Janeiro - RJ, 22755-060, Brasil', '2026')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26758,
    '2026-02-08',
    '14:00',
    true,
    'Estr. da Uruçanga',
    'Estr. da Uruçanga, 20 - Anil, Rio de Janeiro - RJ, 22750-030, Brasil',
    -22.9484122,
    -43.3385876,
    true,
    'TRADICIONAL',
    300,
    '18:00',
    1153
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO FUZUÊ DA ILHA', 'bloco-fuzue-da-ilha', 'O bloco Fuzuê da Ilha promete samba e marchinhas para os foliões que acompanham o desfile. Fantasia, serpentina e confete também são atrações confirmadas.', '2008')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26468,
    '2026-02-08',
    '13:00',
    true,
    'Rua Uçá',
    'Rua Uçá, 392 - Jardim Guanabara, Rio de Janeiro - RJ, 21940-480, Brasil',
    -22.8158199,
    -43.2027058,
    true,
    'TRADICIONAL',
    1000,
    '17:00',
    1196
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('EMPOLGA ÀS 9', 'empolga-as-9', 'O bloco mais empolgado do Brasil e um dos mais reverenciados do Rio, o ‘’Empolga às 9’’, surgiu em 2003 diretamente das areias escaldantes da Praia de Ipanema, a partir da união de uma galera que fazia o melhor batuque no Posto 9. E não é que deu samba? Com bateria própria que ensaia seus arranjos exclusivos durante o ano inteiro, o Empolga tem um repertório pra lá de eclético, alcançando uma sonoridade própria e original. ', '2003')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26496,
    '2026-02-08',
    '13:00',
    true,
    'Av. Vieira Souto',
    'Av. Vieira Souto, 370 - Ipanema, Rio de Janeiro - RJ, 22420-004, Brasil',
    -22.9861017,
    -43.204765,
    true,
    'TRADICIONAL',
    5000,
    '18:00',
    1190
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26587,
    '2026-02-15',
    '13:00',
    true,
    'Praça Alm. Júlio de Noronha',
    'Praça Alm. Júlio de Noronha, 86 - Leme, Rio de Janeiro - RJ, 22010-020, Brasil',
    -22.9623025,
    -43.1653886,
    true,
    'TRADICIONAL',
    11000,
    '18:00',
    1201
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('NO RABO DO PAVÃO', 'no-rabo-do-pavao', 'RUA 24 DE MAIO, 527 RIACHUELO ESQUINA COM  A RUA VITOR MEIRELES', '2010')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26485,
    '2026-02-08',
    '14:00',
    true,
    'RUA 24 DE MAIO',
    'RUA 24 DE MAIO, 527 RIACHUELO ESQUINA COM  A RUA VITOR MEIRELES',
    -22.9025222,
    -43.2582093,
    true,
    'TRADICIONAL',
    300,
    '18:00',
    1229
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('RODOPIANDO NO TOMBO DO COPO', 'rodopiando-no-tombo-do-copo', 'O Bloco Rodopiando no Tombo do Copo foi criado no bairro do Rio Comprido, em 2014, e esse ano promete agitar as ruas do bairro com cerca de 500 pessoas. ', '2014')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26492,
    '2026-02-08',
    '14:00',
    true,
    'R. Citiso',
    'R. Citiso, 38 - Rio Comprido, Rio de Janeiro - RJ, 20261-140, Brasil',
    -22.925377,
    -43.2112203,
    true,
    'TRADICIONAL',
    400,
    '18:00',
    1232
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('VAI TOMAR NO GRAJAÚ', 'vai-tomar-no-grajau', 'O Grêmio Recreativo Bloco Carnavalesco ‘Vai Tomar no Grajaú’, fundado em 13 de julho de 2008, é um movimento social em prol da preservação da cultura do Carnaval de rua do Rio.', '2009')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26473,
    '2026-02-08',
    '14:00',
    true,
    'Av. Eng. Richard',
    'Av. Eng. Richard, 116 - Grajaú, Rio de Janeiro - RJ, 20561-096, Brazil',
    -22.92169,
    -43.26296,
    true,
    'TRADICIONAL',
    800,
    '18:00',
    1184
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CARNAVALESCO ALEGRIA DE VILA ISABEL', 'bloco-carnavalesco-alegria-de-vila-isabel', 'R. Visc. de Abaeté, 139 - Vila Isabel, Rio de Janeiro - RJ, 20551-080, Brasil', '2026')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26771,
    '2026-02-08',
    '15:00',
    true,
    'R. Visc. de Abaeté',
    'R. Visc. de Abaeté, 139 - Vila Isabel, Rio de Janeiro - RJ, 20551-080, Brasil',
    -22.9135725,
    -43.2445399,
    true,
    'TRADICIONAL',
    500,
    '19:00',
    1251
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DA CHALEIRA DO VIDIGAL', 'bloco-da-chaleira-do-vidigal', 'O bloco da Chaleira do Vidigal na década de 70, quando, depois de um almoço em pleno Carnaval, um grupo de amigos decidiu acompanhar os moradores do Vidigal que estavam descendo o morro cantando e batucando. Em clima de folia, os foliões não tinham lugar para colocar a cachaça, a não ser uma chaleira. A partir daí, a chaleira passou a ser o símbolo do bloco, virando tradição do bloco e da própria comunidade.', '1995')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26490,
    '2026-02-08',
    '15:00',
    true,
    'Av. Delfim Moreira',
    'Av. Delfim Moreira, 1034 - Leblon, Rio de Janeiro - RJ, 22441-000, Brasil',
    -22.9875358,
    -43.2259886,
    true,
    'TRADICIONAL',
    900,
    '18:00',
    1200
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('EU CHORO CURTO MAS RIO COMPRIDO', 'eu-choro-curto-mas-rio-comprido', 'Fundado em 2009, com direito a trocadilho no nome, o bloco alegra os moradores da região do Rio Comprido. ', '2009')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26486,
    '2026-02-08',
    '15:00',
    true,
    'R. Aristídes Lôbo',
    'R. Aristídes Lôbo, 150 - Rio Comprido, Rio de Janeiro - RJ, 20250-450, Brasil',
    -22.9212077,
    -43.2090265,
    true,
    'TRADICIONAL',
    500,
    '19:00',
    1232
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BANDA DA ZULMIRA', 'banda-da-zulmira', 'O bloco atrai foliões da Tijuca, na Zona Norte, para sua festa, na rua Almirante João Cândido Brasil, 251, no Maracanã.', '2013')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26772,
    '2026-02-08',
    '16:00',
    true,
    'R. Alm. João Cândido Brasil',
    'R. Alm. João Cândido Brasil, 251 - Maracanã, Rio de Janeiro - RJ, 20550-162, Brasil',
    -22.9177458,
    -43.2365679,
    true,
    'TRADICIONAL',
    500,
    '20:00',
    1207
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO FOLIÕES DA ABRACES', 'bloco-folioes-da-abraces', 'Tendo seu primeiro desfile em 2018, o bloco é formado por pessoas com deficiência e têm seus desfiles promovidos pela Associação Brasileira de Reabilitação e Assistência aos Cegos e Surdos (ABRACES).', '2018')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26477,
    '2026-02-08',
    '16:00',
    true,
    'Av. Atlântica',
    'Av. Atlântica, 2964 - Copacabana, Rio de Janeiro - RJ, 22070-000, Brasil',
    -22.9749894,
    -43.1879551,
    true,
    'TRADICIONAL',
    600,
    '18:00',
    1168
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO 8&80', 'bloco-8-80', 'Praça Cmte. Xavier de Brito, 14 - Tijuca, Rio de Janeiro - RJ, 20511-400, Brasil', '2026')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26765,
    '2026-02-08',
    '16:00',
    true,
    'Praça Cmte. Xavier de Brito',
    'Praça Cmte. Xavier de Brito, 14 - Tijuca, Rio de Janeiro - RJ, 20511-400, Brasil',
    -22.9313938,
    -43.2436087,
    true,
    'TRADICIONAL',
    500,
    '19:00',
    1247
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('MAJORZAO DA TIJUCA', 'majorzao-da-tijuca', 'O bloco desfila pelas ruas da Tijuca, na Zona Norte, das 17h às 21h', '2024')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26759,
    '2026-02-08',
    '17:00',
    true,
    'R. Maj. Ávila',
    'R. Maj. Ávila, 132 - Tijuca, Rio de Janeiro - RJ, 20540-092, Brasil',
    -22.9226369,
    -43.2327281,
    true,
    'TRADICIONAL',
    500,
    '21:00',
    1247
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('TÁ PIRANDO, PIRADO, PIROU!', 'ta-pirando-pirado-pirou', 'O Tá Pirando, Pirado, Pirou nasceu a partir  de uma articulação feita por trabalhadores do Instituto Philippe Pinel, hospital psiquiátrico do Rio de Janeiro. Entre os acompanhantes do desfile, estão pacientes e profissionais da rede de saúde mental. ', '2005')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26487,
    '2026-02-08',
    '16:00',
    true,
    'Estacionamento',
    'Estacionamento, Estacionamento - Av. Pasteur, 404 - Botafogo, Rio de Janeiro - RJ, 22290-255, Brasil',
    -22.9503732,
    -43.1788693,
    true,
    'TRADICIONAL',
    950,
    '21:00',
    1158
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BANDA DA PRAÇA AFONSO PENA', 'banda-da-praca-afonso-pena', 'R. Campos Sales, 67 - Tijuca, Rio de Janeiro - RJ, 20270-214, Brasil', '2024')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26767,
    '2026-02-08',
    '17:00',
    true,
    'R. Campos Sales',
    'R. Campos Sales, 67 - Tijuca, Rio de Janeiro - RJ, 20270-214, Brasil',
    -22.9172331,
    -43.21791,
    true,
    'TRADICIONAL',
    600,
    '22:00',
    1247
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DO BAIXO TIJUCA', 'bloco-do-baixo-tijuca', 'Praça Varnhagem, 9 - Tijuca, Rio de Janeiro - RJ, 20511-020, Brasil', '2026')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26730,
    '2026-02-08',
    '18:00',
    true,
    'Praça Varnhagem',
    'Praça Varnhagem, 9 - Tijuca, Rio de Janeiro - RJ, 20511-020, Brasil',
    -22.9189469,
    -43.2348163,
    true,
    'TRADICIONAL',
    990,
    '22:00',
    1247
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('LARGA ONÇA ALFREDO', 'larga-onca-alfredo', 'O Larga a Onça, Alfredo é um pequeno bloco familiar que desfila pelo bairro de Laranjeiras e, ao contrário dos blocos da orla, conta com público predominantemente da Zona Sul. Seu repertório é formado por clássicos dos sambas-enredo de todos os tempos.', '2008')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26479,
    '2026-02-08',
    '17:00',
    true,
    'Praça São Salvador',
    'Praça São Salvador, 6 - Laranjeiras, Rio de Janeiro - RJ, 22231-170, Brasil',
    -22.9337607,
    -43.1799996,
    true,
    'TRADICIONAL',
    980,
    '20:00',
    1199
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('TAMO JUNTO IN FOLIA', 'tamo-junto-in-folia', 'R. F Iapi, 171 - Bangu, Rio de Janeiro - RJ, 21875-220, Brasil', '2005')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26499,
    '2026-02-08',
    '18:00',
    true,
    'R. F Iapi',
    'R. F Iapi, 171 - Bangu, Rio de Janeiro - RJ, 21875-220, Brasil',
    -22.8703844,
    -43.4506279,
    true,
    'TRADICIONAL',
    1000,
    '22:00',
    1154
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('UNIDOS DO ENGENHO DE DENTRO', 'unidos-do-engenho-de-dentro', 'Fundado em 2013, o bloco Unidos do Engenho de Dentro desfila na Zona Norte. Irreverente e animado, promete animar os foliões na Zona Norte do Rio.', '2013')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-08
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26498,
    '2026-02-08',
    '18:00',
    true,
    'Rua Adolfo Bergamini',
    'Rua Adolfo Bergamini, 370 - Engenho de Dentro, Rio de Janeiro - RJ, 20730-000, Brasil',
    -22.9037256,
    -43.2972358,
    true,
    'TRADICIONAL',
    150,
    '22:00',
    1175
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BANDA DO TIO MARCO', 'banda-do-tio-marco', 'Criado nos anos 90, o bloco infantil faz seu cortejo pelas ruas de Quintino.', '1990')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-11
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26831,
    '2026-02-11',
    '20:00',
    true,
    'R. Pôrto Valter',
    'R. Pôrto Valter, 2 - Quintino Bocaiúva, Rio de Janeiro - RJ, 21380-440, Brasil',
    -22.8827973,
    -43.3118532,
    true,
    'INFANTIL',
    900,
    '22:00',
    1314
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CARNAVALESCO LOUCURA SUBURBANA', 'bloco-carnavalesco-loucura-suburbana', 'Basta ouvir o barulho dos tamborins para o folião já saber que ele está na rua. O Loucura Suburbana é assim! Conhecido por ser o bloco carioca que fez seus componentes portadores de transtornos mentais também comandarem a festa nas ruas da cidade. ', '2001')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-12
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26500,
    '2026-02-12',
    '17:00',
    true,
    'R. Ramiro Magalhães',
    'R. Ramiro Magalhães, 521 - Engenho de Dentro, Rio de Janeiro - RJ, 20730-460, Brasil',
    -22.9016174,
    -43.3012394,
    true,
    'TRADICIONAL',
    1000,
    '22:00',
    1175
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BANDA DA RUA DO MERCADO', 'banda-da-rua-do-mercado', 'Homenageando o trabalhador do Centro do Rio, a Banda da Rua do Mercado coloca seu bloco na rua sempre saudando grandes personagens da história cultural do Rio de janeiro: sambistas, escritores, jornalistas, entre outros, como Garrincha, Lamartine Babo, Ricardo Cravo Albin, Ruy Castro, Haroldo Costa, Martinho da Vila e Tia Surica. A Banda foi uma das precursoras da retomada do carnaval de rua e tornou-se conhecida por arrastar multidões pelas ruas do centro histórico do Rio, na quinta-feira que antecede o Carnaval.', '1999')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-12
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26504,
    '2026-02-12',
    '19:00',
    true,
    'R. do Mercado',
    'R. do Mercado, 31 - Centro, Rio de Janeiro - RJ, 20010-120, Brasil',
    -22.9020687,
    -43.174326,
    true,
    'TRADICIONAL',
    500,
    '22:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BATUQUE NA JUSTIÇA', 'batuque-na-justica', 'Praça Floriano, s/n - Centro, Rio de Janeiro - RJ, 20031-050, Brasil', '2024')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-12
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26774,
    '2026-02-12',
    '19:00',
    true,
    'Praça Floriano',
    'Praça Floriano, s/n - Centro, Rio de Janeiro - RJ, 20031-050, Brasil',
    -22.9107044,
    -43.1760081,
    true,
    'TRADICIONAL',
    200,
    '22:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('COBRA SARADA - ESCOLA EDEM', 'cobra-sarada-escola-edem', 'Criado em 2000 por alunos do Ensino Médio da Escola Edem, desfila há mais de 20 anos pelas ruas de Laranjeiras, na quinta-feira pré-carnaval. Excelente opção para os pimpolhos e seus marmanjos!', '2000')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-12
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26503,
    '2026-02-12',
    '18:00',
    true,
    'R. Paulo César de Andrade',
    'R. Paulo César de Andrade, s/n - Laranjeiras, Rio de Janeiro - RJ, 22221-090, Brasil',
    -22.930184,
    -43.1846943,
    true,
    'INFANTIL',
    500,
    '21:00',
    1199
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO    DUS IMPUSSIVI', 'bloco-dus-impussivi', 'Criado em 2004 por um grupo de funcionário da Petrobras, o bloco tem como lema ''A sua alegria é o combustível para nossa existência''. Desfila nas ruas do Centro do Rio, na quinta-feira pré carnaval.', '2002')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-12
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26501,
    '2026-02-12',
    '20:00',
    true,
    'R. Lélio Gama',
    'R. Lélio Gama, 3a - Centro, Rio de Janeiro - RJ, 20031-080, Brasil',
    -22.9096364,
    -43.1785995,
    true,
    'TRADICIONAL',
    800,
    '22:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('G.R.B.C.BADALO DE SANTA TERESA', 'g-r-b-c-badalo-de-santa-teresa', 'LARGO DAS NEVES', '1972')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-12
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26502,
    '2026-02-12',
    '19:00',
    true,
    'LARGO DAS NEVES',
    'LARGO DAS NEVES',
    -22.9162472,
    -43.1915549,
    true,
    'TRADICIONAL',
    300,
    '22:00',
    1237
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26583,
    '2026-02-15',
    '16:00',
    true,
    'R. Monte Alegre - Santa Teresa',
    'R. Monte Alegre - Santa Teresa, Rio de Janeiro - RJ, Brasil',
    -22.9198484,
    -43.1882707,
    true,
    'TRADICIONAL',
    950,
    '21:00',
    1237
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DAS CARMELITAS (DESFILE)', 'bloco-das-carmelitas-desfile', '‘A freira sai ou não?’ Essa é uma das lendas mais famosas do Carnaval carioca, em que a pergunta se mantém com entusiasmo e faz de Santa Teresa uma das regiões mais características dos festejos. Subindo a Ladeira do Convento das Carmelitas, o bloco atrai milhares de pessoas com suas saídas – uma na sexta que antecede o carnaval e outra na terça-feira gorda. ', '1990')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-13
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26506,
    '2026-02-13',
    '15:00',
    true,
    'LADEIRA DE SANTA TERESA - SANTA TERESA',
    'LADEIRA DE SANTA TERESA - SANTA TERESA, RIO DE JANEIRO - RJ, 20241-140, BRASIL',
    -22.9157986,
    -43.1803396,
    true,
    'TRADICIONAL',
    10000,
    '18:00',
    1237
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26648,
    '2026-02-17',
    '10:00',
    true,
    'Largo do Curvelo - Santa Teresa',
    'Largo do Curvelo - Santa Teresa, Rio de Janeiro - RJ, 20241-320, Brasil',
    -22.91882,
    -43.1832201,
    true,
    'TRADICIONAL',
    10000,
    '14:00',
    1237
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('O.A.B.C HARMONIA', 'o-a-b-c-harmonia', 'Bloco que atrai cerca de 300 foliões pelo bairro da Saúde, no Centro do Rio', '2024')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-13
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26775,
    '2026-02-13',
    '15:00',
    true,
    'R. Sacadura Cabral',
    'R. Sacadura Cabral, 355 - Saúde, Rio de Janeiro - RJ, 20221-160, Brasil',
    -22.8954364,
    -43.1922606,
    true,
    'TRADICIONAL',
    300,
    '18:00',
    1241
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO ÓRFÃOS DO BRIZOLA', 'bloco-orfaos-do-brizola', 'O Bloco Órfãos do Brizola tem a proposta de levar a política e a crítica social para as ruas no carnaval carioca e,claro, reverenciar o político gaúcho.', '2019')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-13
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26505,
    '2026-02-13',
    '18:00',
    true,
    'Prç. Tiradentes',
    'Prç. Tiradentes, 28 - Centro, Rio de Janeiro - RJ, 20060-010, Brasil',
    -22.9060466,
    -43.1817159,
    true,
    'TRADICIONAL',
    300,
    '22:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CARNAVALESCO BOÊMIOS DA LAPA', 'bloco-carnavalesco-boemios-da-lapa', 'Há mais de 20 anos, o Bloco Carnavalesco Boêmios da Lapa faz sua apresentação, na sexta-feira de carnaval, com concentração às 17h, na Avenida República do Paraguai, no Centro.', '2003')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-13
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26516,
    '2026-02-13',
    '19:00',
    true,
    'Praça Cardeal Câmara',
    'Praça Cardeal Câmara, 71 - Lapa, Rio de Janeiro - RJ, 20230-110, Brasil',
    -22.9122354,
    -43.1797236,
    true,
    'TRADICIONAL',
    600,
    '22:00',
    1198
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DO CARAMUELA', 'bloco-do-caramuela', 'Para quem gosta de dançar um forró gostoso, a hora é essa! O bloco forrozeiro faz seu carnaval na Praça Jardim do Meier, na sexta-feira, a partir das 18h. É pra ninguém ficar parado!', '2018')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-13
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26514,
    '2026-02-13',
    '18:00',
    true,
    'PRAÇA JARDIM DO MÉIER',
    'PRAÇA JARDIM DO MÉIER',
    -22.9001765,
    -43.2785394,
    true,
    'TRADICIONAL',
    3000,
    '21:00',
    1209
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DOS BANCÁRIOS VESTIU UMA CAMISINHA LISTRADA E SAIU POR AÍ', 'bloco-dos-bancarios-vestiu-uma-camisinha-listrada-e-saiu-por-ai', 'O bloco Vestiu Uma Camisinha Listrada e Saiu Por Aí desfila no Centro do Rio com o nobre objetivo de passar uma mensagem importante: o uso de preservativos. O bloco é uma realização do Sindicato dos Bancários do Rio de Janeiro, com parceria da Rede de Comunidades Saudáveis/CEDAPS, Fórum ONGs Tuberculose RJ e Fórum ONG Aids RJ. A animação fica por conta da Bateria Nota 10 da Unidos da Tijuca.', '1991')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-13
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26519,
    '2026-02-13',
    '19:00',
    true,
    'Estátua Marielle Franco - Terminal Menezes Cortes - Centro',
    'Estátua Marielle Franco - Terminal Menezes Cortes - Centro, Rio de Janeiro - RJ, 20040-007, Brasil',
    -22.9061348,
    -43.1762199,
    true,
    'TRADICIONAL',
    980,
    '22:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('CATA LATAS DO GRAJAÚ', 'cata-latas-do-grajau', 'Meio ambiente é a palavra de ordem no bloco Os Cata-Latas do Grajaú que animam seu bairro de origem com muito samba no Carnaval. O bloco tem a intenção de difundir a preservação do meio ambiente e respeito por meio de enredos autorais.', '2011')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-13
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26512,
    '2026-02-13',
    '18:00',
    true,
    'PRAÇA NOBEL S/N°',
    'PRAÇA NOBEL S/N°, GRAJAÚ',
    -22.9268142,
    -43.2595302,
    true,
    'TRADICIONAL',
    500,
    '22:00',
    1184
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26657,
    '2026-02-17',
    '18:00',
    true,
    'R. Sá Viana',
    'R. Sá Viana, 442 - Grajau, Rio de Janeiro - RJ, 20540-260, Brasil',
    -22.9267912,
    -43.2601299,
    true,
    'TRADICIONAL',
    900,
    '22:00',
    1184
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('ESCORREGA MAS NÃO CAI', 'escorrega-mas-nao-cai', 'R. Sacadura Cabral, 335 - Saúde, Rio de Janeiro - RJ, 20221-160, Brasil
Condomínio do Edifício Comercial Bulldog - R. Sacadura Cabral, 81 - Saúde, Rio de Janeiro - RJ, 20081-261, Brasil', '2009')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-13
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26521,
    '2026-02-13',
    '19:00',
    true,
    'R. Sacadura Cabral',
    'R. Sacadura Cabral, 335 - Saúde, Rio de Janeiro - RJ, 20221-160, Brasil',
    -22.8958888,
    -43.1920538,
    true,
    'TRADICIONAL',
    1000,
    '22:00',
    1241
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('TE VEJO POR DENTRO... SOU DA RADIOLOGIA', 'te-vejo-por-dentro-sou-da-radiologia', 'Bloco de Rua de profissionais de Técnicas Radiológicas e amigos com a finalidade de promover encontros culturais, artísticos e recreativos.', '2015')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-13
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26515,
    '2026-02-13',
    '19:00',
    true,
    'R. Joaquim Silva',
    'R. Joaquim Silva, 15 - Centro, Rio de Janeiro - RJ, 20241-110, Brasil',
    -22.9160434,
    -43.1773156,
    true,
    'TRADICIONAL',
    150,
    '22:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BANDA CARNAVALESCA VAI TOMAR NO AZUL', 'banda-carnavalesca-vai-tomar-no-azul', 'A turma do Engenho de Dentro vai atrás do bloco Vai Tomar no Azul.', '2010')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-13
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26522,
    '2026-02-13',
    '19:00',
    true,
    'Praca Rio Grande Do Norte - R. Pernambuco',
    'Praca Rio Grande Do Norte - R. Pernambuco, 530 - Engenho de Dentro, Rio de Janeiro - RJ, 20730-030, Brasil',
    -22.8992653,
    -43.298378,
    true,
    'TRADICIONAL',
    300,
    '22:00',
    1175
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BANDA TURMA DOS 300 - CHEGA MAIS GRAJAU', 'banda-turma-dos-300-chega-mais-grajau', 'A banda anima os foliões no Grajaú, na sexta-feira do carnaval. A concentração é na avenida Júlio Furtado, a partir das 18h.', '2008')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-13
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26507,
    '2026-02-13',
    '19:00',
    true,
    'JULIO FURTADO',
    'JULIO FURTADO , 84 COM PRACA EDMUNDO REGO',
    -22.923,
    -43.264173,
    true,
    'TRADICIONAL',
    300,
    '22:00',
    1184
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CARNAVALESCO ROLA PREGUIÇOSA TARDA MAS NÃO FALHA', 'bloco-carnavalesco-rola-preguicosa-tarda-mas-nao-falha', 'Utilize o transporte público por Metrô! Priorize a estação GENERAL OSÓRIO para ir e voltar do bloco.

O bloco foi organizado por integrantes do Pagode da Sacopã, evento que conta com uma tradicional feijoada num barracão avarandado na Ladeira do Sacopã, na Fonte da Saudade. ', '1993')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-13
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26511,
    '2026-02-13',
    '20:00',
    true,
    'R. Maria Quitéria',
    'R. Maria Quitéria, 136 - Ipanema, Rio de Janeiro - RJ, 22410-040, Brasil',
    -22.9810561,
    -43.2067367,
    true,
    'TRADICIONAL',
    10000,
    '22:00',
    1190
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CARNAVALESCO VERMELHO E PRETO E COIRMÃOS', 'bloco-carnavalesco-vermelho-e-preto-e-coirmaos', 'Pintando as ruas de vermelho e preto, o bloco faz seu desfile pelas ruas do Rio de Janeiro com muita folia, confete e música.', '2014')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-13
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26520,
    '2026-02-13',
    '19:00',
    true,
    'RUA CASTELO DE GUIMARÃES - PADRE MIGUEL',
    'RUA CASTELO DE GUIMARÃES - PADRE MIGUEL, RIO DE JANEIRO - RJ, BRASIL',
    -22.891998,
    -43.4467998,
    true,
    'TRADICIONAL',
    200,
    '21:00',
    1212
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DA SORVETERIA', 'bloco-da-sorveteria', 'Pedra de Guaratiba tem praia e....o Bloco da Sorveteria agitando as ruas do bairro!', '2015')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-13
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26509,
    '2026-02-13',
    '20:00',
    true,
    'Rua Barros de Alarcão',
    'Rua Barros de Alarcão, 464 - Pedra de Guaratiba, Rio de Janeiro - RJ, 23027-340, Brasil',
    -23.0026844,
    -43.6411632,
    true,
    'TRADICIONAL',
    800,
    '22:00',
    1215
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DAS PIRANHAS DO JEFINHO', 'bloco-das-piranhas-do-jefinho', 'O ‘Bloco das Piranhas do Jeffinho’, apesar do nome, é bem família. Sai de Pedra de Guaratiba e formado por moradores da região. Mesmo assim, a folia é garantida.', '2017')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-13
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26510,
    '2026-02-13',
    '20:00',
    true,
    'RUA BARROS DE ALARCÃO - PEDRA DE GUARATIBA',
    'RUA BARROS DE ALARCÃO - PEDRA DE GUARATIBA, RIO DE JANEIRO - RJ, 23027-340, BRASIL',
    -23.0038713,
    -43.6401254,
    true,
    'TRADICIONAL',
    400,
    '22:00',
    1215
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO MEIA DÚZIA DE GATOS PINGADOS', 'bloco-meia-duzia-de-gatos-pingados', 'Ao contrário do que o nome indica, o bloco reúne bem mais que "meia dúzia de gatos pingados", levando muita alegria às ruas de Bangu, Zona Oeste do Rio. ', '2022')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-13
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26832,
    '2026-02-13',
    '20:00',
    true,
    'Av. Cônego Vasconcelos',
    'Av. Cônego Vasconcelos, 30 - Bangu, Rio de Janeiro - RJ, 21810-012, Brasil',
    -22.8758419,
    -43.4650633,
    true,
    'TRADICIONAL',
    500,
    '22:00',
    1154
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('EMBAIXADORES DA FOLIA', 'embaixadores-da-folia', 'O bloco já veio com tudo desde que foi criado, em 2000. Dois anos depois, passou a desfilar junto de outros tradicionais blocos cariocas como Cordão da Bola Preta, Cacique de Ramos e Bafo da Onça. Os Embaixadores da Folia desfilam no centro do Rio.', '2001')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-13
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26508,
    '2026-02-13',
    '20:00',
    true,
    'Av. Nilo Peçanha - Centro',
    'Av. Nilo Peçanha - Centro, Rio de Janeiro - RJ, Brasil',
    -22.9064133,
    -43.1761697,
    true,
    'TRADICIONAL',
    5000,
    '22:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('SENTA QUE EU EMPURRO', 'senta-que-eu-empurro', 'Utilize o transporte público por Metrô! Priorize a estação LARGO DO MACHADO  para ir e voltar do bloco.
 
O carnaval é para todos! O Senta Que Eu Empurro foi fundado em 2008 por pessoas com deficiência, no bairro do Catete. A bela missão do bloco é dar visibilidade e integrar as pessoas com deficiência de maneira divertida, promovendo alegria e autoestima, além de quebrar preconceitos.', '2008')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-13
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26513,
    '2026-02-13',
    '19:00',
    true,
    'LARGO DO MACHADO - CATETE',
    'LARGO DO MACHADO - CATETE',
    -22.9311212,
    -43.1785245,
    true,
    'TRADICIONAL',
    950,
    '22:00',
    1164
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO AMIGOS DA ONÇA', 'bloco-amigos-da-onca', 'Utilize o transporte público por Metrô! Priorize a estação FLAMENGO para ir e voltar do bloco.

O  bloco Amigos da Onça vai agitar o calçadão do Flamengo, no Posto 3, levando ainda mais alegria aos foliões. O bloco é bem conhecido por suas características: tem orquestra de sopros e percussão, comissão de frente fantasiada de onças (as Oncetes), além de artistas com pernas de pau. ', '2012')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26559,
    '2026-02-14',
    '08:00',
    true,
    'Calçadão da Praia do Flamengo',
    'Calçadão da Praia do Flamengo, 3 - Flamengo, Rio de Janeiro - RJ, 22210-065, Brasil',
    -22.9345129,
    -43.1719019,
    true,
    'TRADICIONAL',
    12000,
    '13:00',
    1178
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCOBUSTER', 'blocobuster', 'Criado por amigos apaixonados por música, carnaval e cultura pop, o Blocobuster se destaca com a proposta inovadora de misturar música e cinema. O repertório é baseado em trilhas sonoras de filmes, séries e novelas.  O desfile, no Leme, homenageia o aniversário do Rio e o Oscar, conectando a energia carnavalesca à celebração do cinema global. O grupo fará um tributo a Michael Jackson, com músicas do filme "Moonwalker" e do clássico clipe "Thriller".', '2025')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26789,
    '2026-02-14',
    '08:00',
    true,
    'Praça Alm. Júlio de Noronha',
    'Praça Alm. Júlio de Noronha, 1 - Leme, Rio de Janeiro - RJ, 22010-020, Brasil',
    -22.9620949,
    -43.1649598,
    true,
    'TRADICIONAL',
    11000,
    '12:00',
    1201
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DO FORRÓ DA TAYLOR', 'bloco-do-forro-da-taylor', 'Largo São Francisco de Paula, 50 - Centro, Rio de Janeiro - RJ, 20051-070, Brasil', '2026')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26785,
    '2026-02-14',
    '08:00',
    true,
    'Largo São Francisco de Paula',
    'Largo São Francisco de Paula, 50 - Centro, Rio de Janeiro - RJ, 20051-070, Brasil',
    -22.9049429,
    -43.1807469,
    true,
    'TRADICIONAL',
    5000,
    '13:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO EXAGERADO', 'bloco-exagerado', 'Fundado em 2014, foi criado para homenagear o cantor Cazuza, com muita alegria e irreverência, relembrando sucessos do compositor que vão desde a época do Barão Vermelho até seu último disco solo lançado. Os estilos são os mais variados, dando novas roupagens às canções: baião, maracatu, samba, funk, ijexá e rock são alguns dos ritmos do bloco.', '2022')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26536,
    '2026-02-14',
    '09:00',
    true,
    'PRAÇA TIRADENTES',
    'PRAÇA TIRADENTES',
    -22.9072348,
    -43.182463,
    true,
    'TRADICIONAL',
    11000,
    '13:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('CORDÃO DA BOLA PRETA', 'cordao-da-bola-preta', 'Utilize o transporte público por Metrô! Priorize a estação CARIOCA para ir e voltar do bloco.

Mais antigo bloco de carnaval do Rio de Janeiro e um dos mais antigos do país, é o último representante remanescente dos antigos cordões carnavalescos que existiam no início do século XX. Desfilando tradicionalmente com preto e branco, "o maior bloco de carnaval do mundo" (como gosta de ser chamado) encanta e pede passagem pelas ruas do Centro do Rio de Janeiro, saudando o público com a marchinha famosa pelo verso “Quem não chora, não mama”. Entre muitos sambas, o show da agremiação não acaba sem que antes a não menos famosa música “Cidade Maravilhosa” seja entoada pela grande multidão. ', '1919')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26537,
    '2026-02-14',
    '09:00',
    true,
    'R. Primeiro de Março',
    'R. Primeiro de Março, 33 - Centro, Rio de Janeiro - RJ, 20010-000, Brasil',
    -22.9023308,
    -43.17607,
    true,
    'MEGA BLOCO',
    700000,
    '13:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('MULTIBLOCO', 'multibloco', 'Surgido como bloco carnavalesco em 2008, desde então se consagra como o bloco ‘mais eclético da Lapa’. Para isso, há um caldeirão de instrumentação: baterias das escolas de samba, trios nordestinos de forró e as nações de baque virado. Os ritmos nordestinos baião, maracatu e samba-reggae (olodum) ganham versão carioca, misturando-se ao funk e marchinha, trazendo ainda uma versão da valsa dos grandes salões.', '2009')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26561,
    '2026-02-14',
    '08:00',
    true,
    'Loja - Av. Henrique Valadares',
    'Loja - Av. Henrique Valadares, 75 - loja - Centro, Rio de Janeiro - RJ, 20231-030, Brasil',
    -22.9117859,
    -43.1873399,
    true,
    'TRADICIONAL',
    15000,
    '12:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO ESCANGALHA', 'bloco-escangalha', 'Rua Pacheco Leão, 20 - Jardim Botânico, Rio de Janeiro - RJ, 22460-030, Brasil
R. Jardim Botânico, 1060 - Jardim Botânico, Rio de Janeiro - RJ, 22460-000, Brasil', '2008')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26549,
    '2026-02-14',
    '10:00',
    true,
    'Rua Pacheco Leão',
    'Rua Pacheco Leão, 20 - Jardim Botânico, Rio de Janeiro - RJ, 22460-030, Brasil',
    -22.9662872,
    -43.219697,
    true,
    'TRADICIONAL',
    9000,
    '14:00',
    1194
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCÃO DA BARRA', 'blocao-da-barra', 'O Blocão da Barra cria um espaço de festa e animação para os doguinhos – mas, claro, em um ambiente bem cordial. A folia é na Praça do Ó, na Barra da Tijuca, no sábado de carnaval. Centenas de pessoas com seus doguinhos vão poder curtir a folia a partir das 9 horas da manhã.', '2014')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26541,
    '2026-02-14',
    '10:00',
    true,
    'PRAÇA DO Ó',
    'PRAÇA DO Ó',
    -23.0120135,
    -43.3177008,
    true,
    'TRADICIONAL',
    600,
    '13:00',
    1155
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CARNAVALESCO VERDE E BRANCO DO ZUMBI', 'bloco-carnavalesco-verde-e-branco-do-zumbi', 'É um dos blocos mais animados e tradicionais da Ilha do Governador, levando alegria às ruas do Zumbi, no sábado de carnaval.', '2001')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26530,
    '2026-02-14',
    '11:00',
    true,
    'R. PEIXOTO DE CARVALHO - ZUMBI',
    'R. PEIXOTO DE CARVALHO - ZUMBI, RIO DE JANEIRO - RJ, BRASIL',
    -22.821408,
    -43.1758604,
    true,
    'TRADICIONAL',
    900,
    '15:00',
    1256
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('CANTINHO DO URUBU', 'cantinho-do-urubu', 'Ao som de sambas-enredo e hinos do Flamengo, o bloco é um ponto de encontro de torcedores do Flamengo e amantes do carnaval, em Madureira, capital do samba.', '2016')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26529,
    '2026-02-14',
    '10:00',
    true,
    'R. Manuel Marques',
    'R. Manuel Marques, 45 - Turiaçú, Rio de Janeiro - RJ, 21351-140, Brasil',
    -22.8669546,
    -43.3430234,
    true,
    'TRADICIONAL',
    500,
    '14:00',
    1306
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('CORDÃO DA BOLA LARANJA', 'cordao-da-bola-laranja', 'Animado cortejo de carnaval da zona Oeste , o Cordão traz brincadeiras com frevo, orquestra de rua, samba, marchinha, funk e axé. Desde 2016  agita as ruas de Campo Grande, e este ano desfila no sábado de carnaval.', '2017')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26545,
    '2026-02-14',
    '10:00',
    true,
    'R. JERÔNIMO BARBALHO',
    'R. JERÔNIMO BARBALHO, CAMPO GRANDE, RIO DE JANEIRO - RJ, 23085-770',
    -22.8908945,
    -43.557391,
    true,
    'TRADICIONAL',
    7000,
    '13:00',
    1162
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DO BECO DO RATO', 'bloco-do-beco-do-rato', 'O Beco do Rato é um dos mais tradicionais redutos do samba do Rio de Janeiro. No sábado de carnaval, a turma que anima as rodas de samba durante todo o ano se reúne e realiza um desfile pelas ruas da Lapa, numa celebração dessa festa autenticamente carioca.', '2019')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26544,
    '2026-02-14',
    '12:00',
    true,
    'R. Joaquim Silva',
    'R. Joaquim Silva, 11 - Lapa, Rio de Janeiro - RJ, 20241-110, Brazil',
    -22.9160523,
    -43.1770979,
    true,
    'TRADICIONAL',
    1000,
    '16:00',
    1198
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('EXALTAÇÃO  AO SAMBA  DE ENREDO  NO ARMAZÉM  SENADO', 'exaltacao-ao-samba-de-enredo-no-armazem-senado', 'Av. Gomes Freire, 256 - Centro, Rio de Janeiro - RJ, 20231-013, Brasil', '2025')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26780,
    '2026-02-14',
    '12:00',
    true,
    'Av. Gomes Freire',
    'Av. Gomes Freire, 256 - Centro, Rio de Janeiro - RJ, 20231-013, Brasil',
    -22.9092146,
    -43.1846652,
    true,
    'TRADICIONAL',
    300,
    '16:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DO BARBAS', 'bloco-do-barbas', 'Utilize o transporte público por Metrô! Priorize a estação BOTAFOGO para ir e voltar do bloco.

Bloco tradicional do carnaval carioca, que desde a década de 1980 leva alegria para as ruas de Botafogo, com sambas em tons políticos e críticos, sem deixar a diversão de lado. Pelo contrário, sobra alegria e bom humor!', '1985')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26546,
    '2026-02-14',
    '12:00',
    true,
    'R. Arnaldo Quintela',
    'R. Arnaldo Quintela, 120 - Botafogo, Rio de Janeiro - RJ, 22280-070, Brasil',
    -22.9558838,
    -43.1847263,
    true,
    'TRADICIONAL',
    20000,
    '17:00',
    1158
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DO TAMANCO', 'bloco-do-tamanco', 'O bloco fundado em Padre Miguel, no Rio de Janeiro, desfila com o lema de levar amor, respeito e alegria para os foliões. O  cortejo é no sábado de carnaval e o bloco passa por várias ruas do bairro.', '2014')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26526,
    '2026-02-14',
    '13:00',
    true,
    'R. D',
    'R. D, 19 - Padre Miguel, Rio de Janeiro - RJ, Brasil',
    -22.8745529,
    -43.4496467,
    true,
    'TRADICIONAL',
    800,
    '17:00',
    1212
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('ALTA PRESSÃO', 'alta-pressao', 'O bloco Alta Pressão, conhecido por sua atmosfera familiar e repertório exclusivo de marchinhas e sambas-enredo, anima foliões da Zona Oeste desde 2005 no calçadão de Campo Grande. ', '2025')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26783,
    '2026-02-14',
    '13:00',
    true,
    'R. Cel. Agostinho',
    'R. Cel. Agostinho, 161 - Campo Grande, Rio de Janeiro - RJ, 23050-360, Brasil',
    -22.9057746,
    -43.5596996,
    true,
    'TRADICIONAL',
    300,
    '17:00',
    1162
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BANDA DO CHOPPINHO DA PAULA FREITAS', 'banda-do-choppinho-da-paula-freitas', 'Av. Atlântica, 2134 - Copacabana, Rio de Janeiro - RJ, 22021-001, Brasil
Av. Atlântica, 1702 - Copacabana, Rio de Janeiro - RJ, 22021-001, Brasil', '1994')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26524,
    '2026-02-14',
    '12:00',
    true,
    'Av. Atlântica',
    'Av. Atlântica, 2134 - Copacabana, Rio de Janeiro - RJ, 22021-001, Brasil',
    -22.969489,
    -43.1823333,
    true,
    'TRADICIONAL',
    950,
    '17:00',
    1168
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DA TERREIRADA', 'bloco-da-terreirada', 'Utilize o transporte público por Metrô! Priorize a estação SÃO CRISTÓVÃO para ir e voltar do bloco.

O Bloco que desfila no sábado de carnaval, pela Quinta da Boa Vista e Avenida Pedro II, em São Cristóvão, deve reunir cinco mil foliões. A concentração é ao meia-dia, mas o cortejo começa depois de 2 horas de esquenta.', '2015')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26555,
    '2026-02-14',
    '14:00',
    true,
    'QUINTA DA BOA VISTA - AVENIDA PEDRO II',
    'QUINTA DA BOA VISTA - AVENIDA PEDRO II, S/N, SÃO CRISTÓVÃO',
    -22.9051942,
    -43.2217854,
    true,
    'TRADICIONAL',
    5000,
    '18:00',
    1313
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DO SERRAGENS', 'bloco-do-serragens', 'O Bloco do Serragens está desde 2007 animando o Carnaval do outro lado da Baía de Guanabara, na Ilha de Paquetá. O desfile acontece no sábado de carnaval.', '2005')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26528,
    '2026-02-14',
    '14:00',
    true,
    'R. Adelaíde Alambari',
    'R. Adelaíde Alambari, 85 - Paquetá, Rio de Janeiro - RJ, 20397-180, Brasil',
    -22.7508782,
    -43.1064616,
    true,
    'TRADICIONAL',
    300,
    '17:00',
    1226
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('ENREDO DO MEU SAMBA', 'enredo-do-meu-samba', 'Bloco que sacode a poeira com uma super bateria tocando os maiores sambas-enredos do carnaval. Acontece no sábado de carnaval, na Travessa Tamoios, no Flamengo.', '2024')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26782,
    '2026-02-14',
    '13:00',
    true,
    'Tv. dos Tamoios',
    'Tv. dos Tamoios, 45 - Flamengo, Rio de Janeiro - RJ, 22230-050, Brasil',
    -22.9348766,
    -43.1771571,
    true,
    'TRADICIONAL',
    950,
    '18:00',
    1178
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('FOGO NA CUECA', 'fogo-na-cueca', 'Desde 2008 o bloco arrasta foliões pelo bairro de Copacabana, Zona Sul do Rio', '2008')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26533,
    '2026-02-14',
    '14:00',
    true,
    'Praça Edmundo Bitencourt',
    'Praça Edmundo Bitencourt, 721 - Copacabana, Rio de Janeiro - RJ, 22041-070, Brasil',
    -22.967197,
    -43.1902357,
    true,
    'TRADICIONAL',
    2500,
    '18:00',
    1168
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BATUQUEBATO', 'batuquebato', 'O "Batuquebato" foi criado como um projeto artístico e pedagógico pelo percussionista Gabriel Policarpo. Centenas de foliões se reúnem na Praça Tiradentes, no centro do Rio, no sábado de carnaval.', '2015')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26534,
    '2026-02-14',
    '14:00',
    true,
    'Prç. Tiradentes',
    'Prç. Tiradentes, 28 - Centro, Rio de Janeiro - RJ, 20060-010, Brasil',
    -22.9064159,
    -43.1823706,
    true,
    'TRADICIONAL',
    3000,
    '19:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO BRASIL', 'bloco-brasil', 'A alegria não vai faltar para quem quiser curtir a festa momesca no Leme. No Bloco Brasil, foliões poderão se deixar embalar pelos festejos que tem como concentração a Praça Júlio Noronha. ', '2009')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26558,
    '2026-02-14',
    '14:00',
    true,
    'Praça Alm. Júlio de Noronha',
    'Praça Alm. Júlio de Noronha, 1 - Leme, Rio de Janeiro - RJ, 22010-020, Brasil',
    -22.9620949,
    -43.1649598,
    true,
    'TRADICIONAL',
    11000,
    '18:00',
    1201
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO FLOR DE LIS', 'bloco-flor-de-lis', 'Há uma semana do Carnaval, o Flor de Lis pretende levar para as ruas mais de duas mil pessoas. Não fique fora dessa fuzarca!', '2019')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26527,
    '2026-02-14',
    '14:00',
    true,
    'LARGO SÃO FRANCISCO DE PAULA',
    'LARGO SÃO FRANCISCO DE PAULA',
    -22.9053222,
    -43.1806979,
    true,
    'TRADICIONAL',
    9900,
    '18:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('GRBC QUEM ME VIU MENTIU', 'grbc-quem-me-viu-mentiu', 'Mais um dois muitos da Ilha do Governador que desfilam no sábado de Carnaval, o Quem Me Viu Mentiu se desloca pelas ruas do bairro da Ribeira, saindo da famosa Praça Iaiá Garcia . ', '2017')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26552,
    '2026-02-14',
    '15:00',
    true,
    'Praia do Zumbi',
    'Praia do Zumbi, 25 - Zumbi, Rio de Janeiro - RJ, 21930-155, Brasil',
    -22.8205212,
    -43.1734053,
    true,
    'TRADICIONAL',
    2000,
    '17:00',
    1256
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('ORDINÁRIOS ELÉTRICOS', 'ordinarios-eletricos', 'Os Ordinários Elétricos estreiam na folia carioca celebrando o carnaval baiano e a conexão cultural entre Rio e Bahia. O bloco foi fundado em 2019 por amigos apaixonados por música e folia e homenageia ícones como Dodô e Osmar, Baiana System, Ivete Sangalo e Chiclete com Banana. Com direção musical do percussionista Leonardo Reis e apadrinhado por Compadre Washington, apresenta arranjos originais e uma bateria de 40 integrantes, misturando ritmos como samba-reggae, ijexá e galope. ', '2025')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26787,
    '2026-02-14',
    '14:00',
    true,
    'Av. Infante Dom Henrique',
    'Av. Infante Dom Henrique, 10 - Flamengo, Rio de Janeiro - RJ, 20021-140, Brasil',
    -22.921565,
    -43.1712962,
    true,
    'TRADICIONAL',
    3000,
    '19:00',
    1178
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CARNAVALESCO VINIL SOCIAL DA ABOLIÇÃO', 'bloco-carnavalesco-vinil-social-da-abolicao', 'Bloco estreia na programação oficial do carnaval do Rio. No sábado de Carnaval, irá animar as ruas do Engenho de Dentro, para um público estimado em 300 pessoas', '2025')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26788,
    '2026-02-14',
    '16:00',
    true,
    'R. Afonso Ferreira',
    'R. Afonso Ferreira, 270 - Engenho de Dentro, Rio de Janeiro - RJ, 20755-280, Brasil',
    -22.8914064,
    -43.2969113,
    true,
    'TRADICIONAL',
    200,
    '20:00',
    1175
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO POMBO CORREIO', 'bloco-pombo-correio', 'Blvd. 28 de Setembro, 219 - Vila Isabel, Rio de Janeiro - RJ, 20551-031, Brasil
Blvd. 28 de Setembro, 192 - Vila Isabel, Rio de Janeiro - RJ, 20551-031, Brasil
Blvd. 28 de Setembro, 318 - Vila Isabel, Rio de Janeiro - RJ, 20551-031, Brasil
R. Rocha Fragoso, 19 - Vila Isabel, Rio de Janeiro - RJ, 20551-180, Brasil', '2026')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26779,
    '2026-02-14',
    '16:00',
    true,
    'Blvd. 28 de Setembro',
    'Blvd. 28 de Setembro, 219 - Vila Isabel, Rio de Janeiro - RJ, 20551-031, Brasil',
    -22.9153117,
    -43.2424859,
    true,
    'TRADICIONAL',
    400,
    '19:00',
    1251
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO REBARBAS', 'bloco-rebarbas', 'Rua da Passagem, 69 - Botafogo, Rio de Janeiro - RJ, 22290-030, Brasil', '2026')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26778,
    '2026-02-14',
    '16:00',
    true,
    'Rua da Passagem',
    'Rua da Passagem, 69 - Botafogo, Rio de Janeiro - RJ, 22290-030, Brasil',
    -22.9534284,
    -43.1834159,
    true,
    'TRADICIONAL',
    500,
    '19:00',
    1158
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('GREMIO RECREATIVO BLOCO CARNAVALESCO TIGRE DO MEIER', 'gremio-recreativo-bloco-carnavalesco-tigre-do-meier', 'GRÊMIO RECREATIVO BLOCO CARNAVALESCO TIGRE DO MÉIER O Grêmio Recreativo Bloco Carnavalesco Tigre do Méier, antigo Unidos da Travessa Miracema, tem um público estimado em 50 mil pessoas no dia de seu esfile. Gente enfeitada, bateria talentosa e muito samba no pé marcam os desfiles do famoso bloco pelas ruas do bairro, desde 2015.  ', '2022')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26781,
    '2026-02-14',
    '16:00',
    true,
    'Travessa Miracema',
    'Travessa Miracema, 29 - Méier, Rio de Janeiro - RJ, 20720-130, Brasil',
    -22.9020283,
    -43.2820358,
    true,
    'TRADICIONAL',
    1100,
    '20:00',
    1209
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('RODA MAS NÃO SAI', 'roda-mas-nao-sai', 'O Roda Mas Não Sai traz a alegria de volta à Praça Presidente Aguirre Cerda, no Bairro de Fátima, no Centro. Fundado por moradores apaixonados por carnaval em 2024, o bloco nasceu para preencher a saudade de uma folia local, ao som de sambas de enredo de todos os tempos e das marchinhas clássicas de carnaval. Cavaquinho, percussão e muita animação marcam o evento. ', '2025')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26777,
    '2026-02-14',
    '15:00',
    true,
    'Praça Pres. Aguirre Cerda',
    'Praça Pres. Aguirre Cerda, 17 - Centro, Rio de Janeiro - RJ, 20240-200, Brasil',
    -22.9175616,
    -43.188028,
    true,
    'TRADICIONAL',
    350,
    '19:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BANDA DE IPANEMA', 'banda-de-ipanema', 'Utilize o transporte público por Metrô! Priorize a estação GENERAL OSÓRIO para ir e voltar do bloco.

A Banda de Ipanema faz parte da história do Carnaval da cidade. Fundada em 1965, foi declarada patrimônio cultural carioca em 2004. Tradicional até os dias de hoje, mantém como marca registrada levar às ruas da cidade um cortejo formado somente por ritmistas, músicos e instrumentos, sem carro de som. ', '1965')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26833,
    '2026-02-14',
    '17:00',
    true,
    'R. Gomes Carneiro',
    'R. Gomes Carneiro, 55 - Ipanema, Rio de Janeiro - RJ, 22071-110, Brasil',
    -22.9853573,
    -43.1961618,
    true,
    'TRADICIONAL',
    50000,
    '21:00',
    1190
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26834,
    '2026-02-17',
    '17:00',
    true,
    'R. Gomes Carneiro',
    'R. Gomes Carneiro, 55 - Ipanema, Rio de Janeiro - RJ, 22071-110, Brasil',
    -22.9853573,
    -43.1961618,
    true,
    'TRADICIONAL',
    50000,
    '21:00',
    1190
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DO QUILOMBO DA GLÓRIA', 'bloco-do-quilombo-da-gloria', '“Sou quilombola, sou raiz", exalta o hino do bloco, ligado à comunidade do Quilombo Urbano Ferreira Diniz, na Glória. Em 2025, realiza seu segundo desfile, no sábado de carnaval. ', '2024')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26776,
    '2026-02-14',
    '16:00',
    true,
    'R. Cândido Mendes',
    'R. Cândido Mendes, 320 - Glória, Rio de Janeiro - RJ, 20241-220, Brazil',
    -22.9197715,
    -43.1806651,
    true,
    'TRADICIONAL',
    500,
    '18:00',
    1183
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('CARIOCA DA GEMA', 'carioca-da-gema', 'O Bloco é formado por ritmistas formados pela oficina do Monobloco, que decidiram criar um bloco próprio para reunir amigos, diversão e criatividade.', '2007')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26560,
    '2026-02-14',
    '16:00',
    true,
    'R.DOS ARCOS',
    'R.DOS ARCOS, 24',
    -22.9121424,
    -43.1801747,
    true,
    'TRADICIONAL',
    5000,
    '21:00',
    1198
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('DNA SUBURBANO', 'dna-suburbano', 'O nome já diz: esse bloco tem a cultura do subúrbio carioca nas veias. Desfila com samba oficial, composto para o bloco, com concentração na Estrada do Portela, coração do subúrrbio. ', '2024')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26786,
    '2026-02-14',
    '17:00',
    true,
    'Estr. do Portela',
    'Estr. do Portela, 165 - Madureira, Rio de Janeiro - RJ, 21351-050, Brasil',
    -22.8719602,
    -43.340482,
    true,
    'TRADICIONAL',
    850,
    '21:00',
    1203
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('A BANDA DO LARGO DA SEGUNDA FEIRA', 'a-banda-do-largo-da-segunda-feira', 'Rua Conde de Bonfim, 25 - Tijuca, Rio de Janeiro - RJ, 20520-050, Brasil', '1990')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26531,
    '2026-02-14',
    '17:00',
    true,
    'Rua Conde de Bonfim',
    'Rua Conde de Bonfim, 25 - Tijuca, Rio de Janeiro - RJ, 20520-050, Brasil',
    -22.922794,
    -43.2220209,
    true,
    'TRADICIONAL',
    300,
    '22:00',
    1247
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26681,
    '2026-02-17',
    '17:00',
    true,
    'Rua Conde de Bonfim',
    'Rua Conde de Bonfim, 25 - Loja B - Tijuca, Rio de Janeiro - RJ, 20520-050, Brasil',
    -22.9229851,
    -43.2218226,
    true,
    'TRADICIONAL',
    999,
    '22:00',
    1247
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CARNAVALESCO BAMBAS DO CURUZU', 'bloco-carnavalesco-bambas-do-curuzu', 'Fundado em 1972 e tem como objetivo a inclusão social de jovens, adultos e crianças da comunidade. A instituição vai além do grêmio recreativo e bloco carnavalesco, oferecendo cursos, oficinas culturais e profissionais, área de lazer e, claro, muito samba.', '2007')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26554,
    '2026-02-14',
    '18:00',
    true,
    'R. CURUZU - SÃO CRISTÓVÃO',
    'R. CURUZU - SÃO CRISTÓVÃO, RIO DE JANEIRO - RJ, 20920-440, BRASIL',
    -22.8963869,
    -43.2302397,
    true,
    'TRADICIONAL',
    980,
    '22:00',
    1313
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26567,
    '2026-02-15',
    '18:00',
    true,
    'R. CURUZU - SÃO CRISTÓVÃO',
    'R. CURUZU - SÃO CRISTÓVÃO, RIO DE JANEIRO - RJ, 20920-440, BRASIL',
    -22.8963869,
    -43.2302397,
    true,
    'TRADICIONAL',
    980,
    '22:00',
    1313
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DO CAMELO', 'bloco-do-camelo', 'Praia José Bonifácio, 83 - Paquetá, Rio de Janeiro - RJ, 20396-140, Brasil
Praca Pintor Pedro Bruno, 20 - Paquetá, Rio de Janeiro - RJ, 20396-260, Brasil', '1984')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26556,
    '2026-02-14',
    '18:00',
    true,
    'Praia José Bonifácio',
    'Praia José Bonifácio, 83 - Paquetá, Rio de Janeiro - RJ, 20396-140, Brasil',
    -22.762554,
    -43.1099,
    true,
    'TRADICIONAL',
    500,
    '22:00',
    1226
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DO CORSO', 'bloco-do-corso', 'O bloco agita as ruas da charmosa Ilha de Paquetá, no sábado de carnaval. Concentração às 16h, na Rua Pinheiro Freire, 40.', '2022')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26784,
    '2026-02-14',
    '17:00',
    true,
    'R. Pinheiro Freire',
    'R. Pinheiro Freire, 40 - Paquetá, Rio de Janeiro - RJ, 20396-006, Brasil',
    -22.7614425,
    -43.1081922,
    true,
    'TRADICIONAL',
    150,
    '20:00',
    1226
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO RIO2AMORES', 'bloco-rio2amores', 'Bloco oficial dos moradores do Condomínio Rio2, desfila desde o carnaval de 2011 pelas ruas da Barra da Tijuca e de Jacarepaguá.', '2011')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26548,
    '2026-02-14',
    '17:00',
    true,
    'Rua Mário Agostinelli',
    'Rua Mário Agostinelli, 155 - Barra Olímpica, Rio de Janeiro - RJ, 22775-046, Brasil',
    -22.9709442,
    -43.3822983,
    true,
    'TRADICIONAL',
    300,
    '22:00',
    1315
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('CHORA 10', 'chora-10', 'Com uma bateria nota 10, formada em parte por ritmistas da Unidos da Tijuca, escola de samba do Morro do Borel, o bloco desfila pelas ruas do bairro com repertório de primeira e muita diversão. ', '2011')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26553,
    '2026-02-14',
    '18:00',
    true,
    'R. SÃO MIGUEL',
    'R. SÃO MIGUEL, 430 - TIJUCA, RIO DE JANEIRO - RJ, 20950-000, BRASIL',
    -22.9398048,
    -43.2531425,
    true,
    'TRADICIONAL',
    980,
    '22:00',
    1247
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('CORDÃO ALEGRIA DA TIJUCA', 'cordao-alegria-da-tijuca', 'Fundado no dia 9 de junho de 2001, o bloco Alegria da Tijuca já é tradição de Carnaval na Zona Norte do Rio de Janeiro. Este ano o Cordão da Alegria espera levar para as ruas milhares de foliões no sábado de carnaval', '1990')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26542,
    '2026-02-14',
    '18:00',
    true,
    'Condomínio do Edifício Santo Afonso - R. Afonso Pena',
    'Condomínio do Edifício Santo Afonso - R. Afonso Pena, 10 - Tijuca, Rio de Janeiro - RJ, 20270-243, Brasil',
    -22.9204251,
    -43.217418,
    true,
    'TRADICIONAL',
    1000,
    '22:00',
    1247
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('CORDÃO DO PRATA PRETA', 'cordao-do-prata-preta', 'Fundado em 2004, o Bloco Cordão do Prata Preta nasceu com objetivo de reviver o Carnaval de rua da Zona Portuária do Rio de Janeiro. Seu nome de batismo é uma homenagem ao capoeirista Horácio José da Silva, que tinha como apelido “Prata Preta”. Ele  ficou  conhecido durante a Revolta da Vacina, ao mobilizar moradores da Saúde contrários à vacinação obrigatória.', '2005')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26547,
    '2026-02-14',
    '17:00',
    true,
    'PRAÇA DA HARMONIA - GAMBOA',
    'PRAÇA DA HARMONIA - GAMBOA',
    -22.8955145,
    -43.191629,
    true,
    'TRADICIONAL',
    950,
    '22:00',
    1181
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('G.R.B.C. ACONTECEU', 'g-r-b-c-aconteceu', 'O Aconteceu é um bloco tradicional de Santa Teresa. Com repertório de marchinhas carnavalescas, o desfile lembra os carnavais mais antigos.', '2000')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26535,
    '2026-02-14',
    '17:00',
    true,
    'Largo das Neves',
    'Largo das Neves, 412 - Santa Teresa, Rio de Janeiro - RJ, 20240-040, Brasil',
    -22.9162662,
    -43.1916361,
    true,
    'TRADICIONAL',
    850,
    '20:00',
    1237
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26616,
    '2026-02-16',
    '17:00',
    true,
    'R. Alm. Alexandrino',
    'R. Alm. Alexandrino, 89 - Santa Teresa, Rio de Janeiro - RJ, 20241-260, Brasil',
    -22.9215461,
    -43.186043,
    true,
    'TRADICIONAL',
    850,
    '20:00',
    1237
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('MULHERES BRILHANTES', 'mulheres-brilhantes', 'BOULEVARD 28 DE SETEMBRO, 238 - VILA ISABEL, RIO DE JANEIRO - RJ, 20551-031, BRASI
Blvd. 28 de Setembro, 382 - Vila Isabel, Rio de Janeiro - RJ, 20551-031, Brasil', '2020')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26539,
    '2026-02-14',
    '18:00',
    true,
    'BOULEVARD 28 DE SETEMBRO',
    'BOULEVARD 28 DE SETEMBRO, 238 - VILA ISABEL, RIO DE JANEIRO - RJ, 20551-031, BRASI',
    -22.9152002,
    -43.2441524,
    true,
    'TRADICIONAL',
    500,
    '21:00',
    1251
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('B.C. CIGANAS FEITICEIRAS DE OLARIA', 'b-c-ciganas-feiticeiras-de-olaria', 'O Bloco Ciganas Feiticeiras de Olaria substituiu o antigo bloco da Preguiça de Olaria, criado em 1995. Desde então o evento agita o Carnaval nas ruas do bairro da Zona Norte com samba e marchinhas em um ambiente familiar. Os desfiles acontecem no sábado e na segunda-feira de carnaval, com concentração às 17 horas, a partir da rua Paranhos, esquina com a João Rego, em Olaria.', '1995')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26525,
    '2026-02-14',
    '19:00',
    true,
    'R. Paranhos',
    'R. Paranhos, 726 - Olaria, Rio de Janeiro - RJ, 21073-460, Brasil',
    -22.8526109,
    -43.2725687,
    true,
    'TRADICIONAL',
    300,
    '21:00',
    1210
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26607,
    '2026-02-16',
    '19:00',
    true,
    'R. Paranhos',
    'R. Paranhos, 726 - Olaria, Rio de Janeiro - RJ, 21073-460, Brasil',
    -22.8526109,
    -43.2725687,
    true,
    'TRADICIONAL',
    300,
    '21:00',
    1210
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO ESQUENTA DE PADRE MIGUEL', 'bloco-esquenta-de-padre-miguel', 'O Bloco Esquenta foi criado em 2009 para animar o Carnaval dos moradores de Padre Miguel e região. Deve reunir 500 ( quinhentas ) pessoas. A concentração é na Travessa Gilberto, na Vila Vintém.', '2009')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26550,
    '2026-02-14',
    '19:00',
    true,
    'TRAVESSA SANTO AGOSTINHO 17',
    'TRAVESSA SANTO AGOSTINHO 17',
    -22.87147681,
    -43.447465,
    true,
    'TRADICIONAL',
    400,
    '22:00',
    1212
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('TIGRE DO COQUEIRO', 'tigre-do-coqueiro', 'O Tigre do Coqueiro, mais um dos vários blocos que sairão do bairro, vai levar os clássicos do samba', '2010')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26540,
    '2026-02-14',
    '19:00',
    true,
    'Rua Barros de Alarcão',
    'Rua Barros de Alarcão, 283 - Pedra de Guaratiba, Rio de Janeiro - RJ, 23027-340, Brasi',
    -23.0016523,
    -43.6419906,
    true,
    'TRADICIONAL',
    300,
    '21:00',
    1215
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26622,
    '2026-02-16',
    '19:00',
    true,
    'Rua Barros de Alarcão',
    'Rua Barros de Alarcão, 283 - Pedra de Guaratiba, Rio de Janeiro - RJ, 23027-340, Brasi',
    -23.0016523,
    -43.6419906,
    true,
    'TRADICIONAL',
    300,
    '21:00',
    1215
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CARNAVALESCO CACHACEIROS DO ÚNICO', 'bloco-carnavalesco-cachaceiros-do-unico', '"Cachaça não é água, não", já diria a clássica marchinha. Com muito bom humor, o bloco desfila no Engenho Novo, no sábado de carnaval, com concentração às 18h, na Rua Baronesa do Engenho Novo.', '2025')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26790,
    '2026-02-14',
    '20:00',
    true,
    'R. Baronesa do Engenho Novo',
    'R. Baronesa do Engenho Novo, 318 - Engenho Novo, Rio de Janeiro - RJ, 20961-210, Brasil',
    -22.8966891,
    -43.2646588,
    true,
    'TRADICIONAL',
    200,
    '22:00',
    1176
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DA AMIZADE', 'bloco-da-amizade', 'O bloco movimenta a região de Sepetiba, com muita alegria, a partir das 19h. ', '2024')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-14
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26791,
    '2026-02-14',
    '21:00',
    true,
    'Praia Recôncavo',
    'Praia Recôncavo, 432 - Sepetiba, Rio de Janeiro - RJ, 23530-463, Brasil',
    -22.9864936,
    -43.6924966,
    true,
    'TRADICIONAL',
    800,
    '22:00',
    1243
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO AREIA', 'bloco-areia', 'Utilize o transporte público por Metrô! Priorize a estação ANTERO DE QUENTAL para ir e voltar do bloco.

Formado pelo grupo que integra a Associação Recreativa Etílica Independente Amigos da Rede do Aloísio (AREIA), o bloco desfila pela Avenida Delfim Moreira, a orla do Leblon, no domingo de Carnaval.', '2003')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26594,
    '2026-02-15',
    '09:00',
    true,
    'Av. Delfim Moreira',
    'Av. Delfim Moreira, 1034 - Leblon, Rio de Janeiro - RJ, 22441-000, Brasil',
    -22.9875358,
    -43.2259886,
    true,
    'TRADICIONAL',
    120000,
    '13:00',
    1200
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DO J', 'bloco-do-j', 'Largo São Francisco de Paula, 49 - Centro, Rio de Janeiro - RJ, 20051-070, Brasil', '2024')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26797,
    '2026-02-15',
    '09:00',
    true,
    'Largo São Francisco de Paula',
    'Largo São Francisco de Paula, 49 - Centro, Rio de Janeiro - RJ, 20051-070, Brasil',
    -22.9052377,
    -43.1807499,
    true,
    'TRADICIONAL',
    900,
    '12:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('CHARANGA TALISMÃ', 'charanga-talisma', 'Com a proposta de atrair foliões dos quatro cantos da cidade, o Charanga Talismã surgiu a partir de um coletivo carnavalesco formado por amigos. O bloco desfila pelas diversas ruas da Vila Kosmos, na Zona Norte da cidade, passando boa parte do cortejo pela Avenida Meriti, uma da principais do bairro.', '2017')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26600,
    '2026-02-15',
    '08:00',
    true,
    'Av. Meriti',
    'Av. Meriti, 18 - Vila Kosmos, Rio de Janeiro - RJ, 21220-203, Brasil',
    -22.8572933,
    -43.308827,
    true,
    'TRADICIONAL',
    3000,
    '13:00',
    1253
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('FREGOBLOCO', 'fregobloco', 'Fregobloco, da Freguesia, nasceu da vontade de revitalizar a cultura carnavalesca na Zona Oeste, que vinha perdendo espaço para outras regiões da cidade. Formado por ritmistas locais, tem repertório que mistura sambas icônicos como “Canto das Três Raças” e “Samba de Arerê” e sucessos do pop nacional e internacional.', '2025')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26793,
    '2026-02-15',
    '09:00',
    true,
    'Estr. dos Três Rios',
    'Estr. dos Três Rios, 271 - Freguesia (Jacarepaguá), Rio de Janeiro - RJ, 22755-001, Brasil',
    -22.9388286,
    -43.3410996,
    true,
    'TRADICIONAL',
    200,
    '12:00',
    1265
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('LARANJADA SAMBA CLUBE', 'laranjada-samba-clube', 'Formado numa roda de amigos num bar da Rua General Glicério, no coração do bairro de Laranjeiras, Zona Sul carioca, o Laranjada Samba Clube desfilou pela primeira vez no carnaval de 2003. Os amigos iam chegando, o bloco cresceu e a cada ano o número de foliões só aumenta. É um encontro de parceiros, família, pessoas que curtem carnaval e se divertem juntas. Não tem samba próprio, mas mantém a  tradição de cantar os clássicos da música carnavalesca e os sambas enredo das escolas.', '2003')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26566,
    '2026-02-15',
    '08:00',
    true,
    'R. Gen. Glicério',
    'R. Gen. Glicério, 224 - Laranjeiras, Rio de Janeiro - RJ, 22245-120, Brasil',
    -22.9406481,
    -43.191827,
    true,
    'TRADICIONAL',
    3000,
    '12:00',
    1199
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('DIVINAS TRETAS', 'divinas-tretas', 'Bloco da Zona Sul carioca, o Divinas Tretas leva a alegria aos foliões da Praia do Flamengo. A festa acontece no campo de terra batida do Aterro do Flamengo, em frente ao número 340 da praia.', '2009')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26572,
    '2026-02-15',
    '09:00',
    true,
    'PRAIA DO FLAMENGO',
    'PRAIA DO FLAMENGO , 340 - CAMPO DE TERRA BATIDA NO ATERRO FLAMENGO',
    -22.9299728,
    -43.172357,
    true,
    'LGBTQIAPN+',
    950,
    '14:00',
    1178
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('GRBC PIRATAS DE PADRE MIGUEL', 'grbc-piratas-de-padre-miguel', 'R. do Irerê, 107 - Bangu, Rio de Janeiro - RJ, 21875-230, Brasil
R. Sidnei, 374 - Bangu, Rio de Janeiro - RJ, 21875-030, Brasil
R. do Irerê, 107 - Bangu, Rio de Janeiro - RJ, 21875-230, Brasil', '2026')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26800,
    '2026-02-15',
    '09:00',
    true,
    'R. do Irerê',
    'R. do Irerê, 107 - Bangu, Rio de Janeiro - RJ, 21875-230, Brasil',
    -22.8708106,
    -43.4509737,
    true,
    'TRADICIONAL',
    300,
    '14:00',
    1154
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('QUE MERDA É ESSA ?', 'que-merda-e-essa', 'O Que Merda é Essa desfilou pela primeira vez no Carnaval de 1995 com a ideia de reunir músicos, cantores e compositores amadores. O samba de estreia fazia uma sátira ao próprio grupo. A letra dizia:  “Minha gente, vamos nessa / É merda no Carnaval!”, se referindo à qualidade musical de seus componentes. Mas, no ano seguinte, a crítica política virou o foco do bloco e a “Merda” passou a ser um fato em evidência no momento nacional. Com assuntos de sobra neste carnaval,  o “Que Merda é Essa” deve esquentar as ruas de Ipanema, na Zona Sul, durante seu desfile.', '1995')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26605,
    '2026-02-15',
    '09:00',
    true,
    'Rua Garcia d''Avila',
    'Rua Garcia d''Avila, 173 - Ipanema, Rio de Janeiro - RJ, 22421-010, Brasil',
    -22.9821716,
    -43.2093178,
    true,
    'TRADICIONAL',
    950,
    '14:00',
    1190
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BANGALAFUMENGA', 'bangalafumenga', 'Utilize o transporte público por Metrô! Priorize a estação GLÓRIA para ir e voltar do bloco.', '1998')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26563,
    '2026-02-15',
    '10:00',
    true,
    'Av. Infante Dom Henrique',
    'Av. Infante Dom Henrique, 75 - Glória, Rio de Janeiro - RJ, 20021-140, Brasil',
    -22.9166167,
    -43.1735387,
    true,
    'TRADICIONAL',
    40000,
    '15:00',
    1183
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO BUDA DA BARRA', 'bloco-buda-da-barra', 'O Bloco Buda da Barra é um tradicional cordão carnavalesco familiar do Rio de Janeiro, reunindo foliões pela orla da Praia da Barra durante o Carnaval. O desfile acontece pela Avenida Lúcio Costa, partindo do número 3636.', '1970')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26573,
    '2026-02-15',
    '10:00',
    true,
    'AV. LÚCIO COSTA',
    'AV. LÚCIO COSTA, 3646 - BARRA DA TIJUCA, RIO DE JANEIRO - RJ, 22630-011, BRASIL',
    -23.0101492,
    -43.3393743,
    true,
    'TRADICIONAL',
    3000,
    '15:00',
    1155
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO PRA IAIÁ', 'bloco-pra-iaia', 'Praça Alm. Júlio de Noronha, 86 - Leme, Rio de Janeiro - RJ, 22010-020, Brasil', '2013')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26565,
    '2026-02-15',
    '10:00',
    true,
    'Praça Alm. Júlio de Noronha',
    'Praça Alm. Júlio de Noronha, 86 - Leme, Rio de Janeiro - RJ, 22010-020, Brasil',
    -22.9623025,
    -43.1653886,
    true,
    'TRADICIONAL',
    10000,
    '12:00',
    1201
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('É TUDO OU NADA', 'e-tudo-ou-nada', 'O É Tudo Ou Nada foi criado em 2007,  por um grupo de alunos do tradicional Colégio Pedro II. O nome do bloco, que reúne multidões de alunos, ex-alunos e pessoas relacionadas de alguma forma ao colégio, é uma brincadeira com o hino da tabuada, tradicional da escola.  Com apenas cinco anos de existência, o É Tudo Ou Nada, que desfila pelas ruas do Humaitá e de Botafogo, foi inserido na programação oficial do Carnaval do Rio.', '2007')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26571,
    '2026-02-15',
    '11:00',
    true,
    'R. do Lavradio',
    'R. do Lavradio, 75 - Centro, Rio de Janeiro - RJ, 20230-070, Brasil',
    -22.9103967,
    -43.1828021,
    true,
    'TRADICIONAL',
    5000,
    '15:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('G.R.B.C.VERMELHO & BRANCO DA Z-10', 'g-r-b-c-vermelho-branco-da-z-10', 'Bloco da colônia de pescadores do bairro do Zumbi, na Ilha do Governador, o Vermelho & Branco parte da Praça São Pedro, em frente à sede da associação, em direção ao bairro da Ribeira. Garante a animação do folião da Ilha desde 2005, ano de sua fundação.', '2008')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26581,
    '2026-02-15',
    '10:00',
    true,
    'R. Alexandre Rosa',
    'R. Alexandre Rosa, 1 - Cacuia, Rio de Janeiro - RJ, 21930-160, Brasil',
    -22.8242024,
    -43.1774527,
    true,
    'TRADICIONAL',
    15000,
    '15:00',
    1161
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BANDA DO BAIRRO DE FÁTIMA', 'banda-do-bairro-de-fatima', 'Bloco tradicional do carnaval de rua do Rio, comemora quase cinco décadas em 2025 com uma homenagem especial à diva Carmen Miranda. O espírito comunitário e festivo marca o desfile do bloco, no domingo de carnaval.', '1977')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26592,
    '2026-02-15',
    '11:00',
    true,
    'Av. Nossa Sra. de Fátima',
    'Av. Nossa Sra. de Fátima, 88 - Centro, Rio de Janeiro - RJ, 20240-050, Brasil',
    -22.9173218,
    -43.1884949,
    true,
    'TRADICIONAL',
    500,
    '14:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CULTURAL AI QUE VERGONHA', 'bloco-cultural-ai-que-vergonha', 'Av. Pref. Mendes de Morais, 808 - São Conrado, Rio de Janeiro - RJ, 22610-095, Brasil
Av. Pref. Mendes de Morais, 6 - São Conrado, Rio de Janeiro - RJ, 22610-095, Brasil', '2007')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26584,
    '2026-02-15',
    '11:00',
    true,
    'Av. Pref. Mendes de Morais',
    'Av. Pref. Mendes de Morais, 808 - São Conrado, Rio de Janeiro - RJ, 22610-095, Brasil',
    -22.9992412,
    -43.264919,
    true,
    'TRADICIONAL',
    1000,
    '16:00',
    1240
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CARNAVALESCO SUVACO DO GATO', 'bloco-carnavalesco-suvaco-do-gato', 'Desde 2008, o bloco desfila com sua alegria em Paciência, Zona Oeste do Rio, no domingo do carnaval. Sai no domingo de carnaval, com concentração às 11h.', '2008')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26593,
    '2026-02-15',
    '12:00',
    true,
    'R. Srg. Newton Nascimento',
    'R. Srg. Newton Nascimento, 33 - Paciência, Rio de Janeiro - RJ, 23580-050, Brasil',
    -22.915281,
    -43.638075,
    true,
    'TRADICIONAL',
    500,
    '17:00',
    1227
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('GRÊMIO RECREATIVO BLOCO CARNAVALESCO ARRASTÃO DA BARRA DE GUARATIBA', 'gremio-recreativo-bloco-carnavalesco-arrastao-da-barra-de-guaratiba', 'Vai ter que ter muito samba no pé. O Grêmio Recreativo do Bloco Carnavalesco Arrastão da Barra de Guaratiba vai levar para a galera do bairro muita animação.', '1998')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26596,
    '2026-02-15',
    '13:00',
    true,
    'Estr. da Vendinha',
    'Estr. da Vendinha, 871 - Barra de Guaratiba, Rio de Janeiro - RJ, 23020-810, Brasil',
    -23.0606013,
    -43.5618751,
    true,
    'TRADICIONAL',
    2000,
    '17:00',
    1156
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26668,
    '2026-02-17',
    '13:00',
    true,
    'Estr. da Vendinha',
    'Estr. da Vendinha, 871 - Barra de Guaratiba, Rio de Janeiro - RJ, 23020-810, Brasil',
    -23.0606013,
    -43.5618751,
    true,
    'TRADICIONAL',
    2000,
    '18:00',
    1156
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('QUER SWINGAR VEM PRA CÁ', 'quer-swingar-vem-pra-ca', 'Bloco da Praça Barão de Drumond, a famosa Praça Sete, em Vila Isabel, o Quer Swingar Vem pra cá promete animar foliões não só do bairro, mas do entorno também, que compreende o Andaraí e o Grajaú.', '2018')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26598,
    '2026-02-15',
    '13:00',
    true,
    'PRAÇA BARÃO DE DRUMMOND',
    'PRAÇA BARÃO DE DRUMMOND, SEM NÚMERO - VILA ISABEL',
    -22.9162634,
    -43.2504877,
    true,
    'TRADICIONAL',
    600,
    '17:00',
    1251
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('MARCHA NERD', 'marcha-nerd', 'Utilize o transporte público por Metrô! Priorize a estação CARIOCA para ir e voltar do bloco.

Atenção cosplayers, nerds, geeks, fãs de quadrinhos e maratonistas de filmes: vocês já têm endereço certo no carnaval de rua do Rio! É o Bloco Marcha Nerd, que anima a Praça Comandante Xavier de Brito, a tradicional Praça dos Cavalinhos, na Tijuca. O bloco tira o nerd de seu habitat natural, pelo menos uma vez ao ano, e anima o carnaval de rua com figurinos divertidos do universo geek.', '2010')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26568,
    '2026-02-15',
    '13:00',
    true,
    'Largo São Francisco de Paula',
    'Largo São Francisco de Paula, s/n - Centro, Rio de Janeiro - RJ, 20051-070, Brasil',
    -22.9053222,
    -43.1806979,
    true,
    'TRADICIONAL',
    6000,
    '18:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('VOU TE PESCAR', 'vou-te-pescar', 'Tradicional bloco de Padre Miguel, Zona Norte do Rio, o ‘Vou Te Pescar’ é a opção certa para animar as ruas da região no Domingo de Carnaval, que tem previsão de movimentar 500 pessoas.', '2022')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26597,
    '2026-02-15',
    '14:00',
    true,
    'R. C Dois Conjunto Iapi Pe Miguel',
    'R. C Dois Conjunto Iapi Pe Miguel, 138 - Padre Miguel, Rio de Janeiro - RJ, 21721-000, Brasil',
    -22.8724773,
    -43.4481879,
    true,
    'TRADICIONAL',
    500,
    '18:00',
    1212
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

  -- Evento do dia 2026-02-22
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26713,
    '2026-02-22',
    '14:00',
    true,
    'R. C Dois',
    'R. C Dois, 18 - Padre Miguel, Rio de Janeiro - RJ, 21875-220, Brasil',
    -22.8720313,
    -43.4488739,
    true,
    'TRADICIONAL',
    500,
    '18:00',
    1212
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('AGYTOÊ', 'agytoe', 'O bloco reúne uma mistura de ritmos afros, recriando a cultura e a luta dos carnavais de blocos afro-baianos, do samba reggae dos anos 70 e 80 até a explosão do axé music na década de 90. Desfila pelas ruas do centro da cidade. ', '2013')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26569,
    '2026-02-15',
    '14:00',
    true,
    'Praça Cardeal Câmara',
    'Praça Cardeal Câmara, 71 - Centro, Rio de Janeiro - RJ, 20230-110, Brasil',
    -22.9122354,
    -43.1797236,
    true,
    'TRADICIONAL',
    15000,
    '19:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BANDA DO LIDO COPACABANA', 'banda-do-lido-copacabana', 'Fundada em 1961 por moradores de Copacabana, desde então sai pelas ruas do bairro revivendo o antigo Carnaval de rua com muita animação e folia.', '1961')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26574,
    '2026-02-15',
    '14:00',
    true,
    'Av. Atlântica',
    'Av. Atlântica, 2150 - Copacabana, Rio de Janeiro - RJ, 22021-001, Brasil',
    -22.9694957,
    -43.1825293,
    true,
    'TRADICIONAL',
    900,
    '17:00',
    1168
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO 442', 'bloco-442', 'Conhecido na região da Praça Mauá, o 442 sai em direção às ruas da Pequena África e da Gamboa, passando pela Praça da Harmonia, pela Avenida Rodrigues Alves, e pelas ruas Barão de Tefé e Venezuela.', '2023')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26603,
    '2026-02-15',
    '14:00',
    true,
    'Largo São Francisco da Prainha',
    'Largo São Francisco da Prainha, 5 - Saúde, Rio de Janeiro - RJ, 20081-270, Brasil',
    -22.8977322,
    -43.1839405,
    true,
    'TRADICIONAL',
    11000,
    '18:00',
    1241
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CARNAVALESCO CABRITO MAMADOR', 'bloco-carnavalesco-cabrito-mamador', 'O Cabrito Mamador anima o Carnaval dos foliões do Tauá, bairro da Ilha do Governador. A concentração é na Estrada do Dendê, 213.', '2010')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26575,
    '2026-02-15',
    '14:00',
    true,
    'Estr. do Dendê',
    'Estr. do Dendê, 213 - Tauá, Rio de Janeiro - RJ, 21920-000, Brasil',
    -22.7995013,
    -43.1860158,
    true,
    'TRADICIONAL',
    400,
    '17:00',
    1246
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO TOCA RAUUUL', 'bloco-toca-rauuul', 'Composto por 15 componentes, a divisão é feita entre baixo, guitarra, cavaco, sopros, percussões e vocais. O intuito é um só: fazer releituras das músicas do cantor Raul Seixas em diversos ritmos carnavalescos, como frevo, samba, marchinha, ijexá, afoxé e maracatu, sem jamais perder a pegada rock ‘n’ roll com outros estilos como o reggae, salsa e surf music. O repertório atravessa todas as fases da carreira do artista. A apresentação conta ainda com um forte apelo visual, com figurinos, cenografia, adereços, bonecos e efeitos visuais.', '2011')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26595,
    '2026-02-15',
    '14:00',
    true,
    'PRAÇA TIRADENTES',
    'PRAÇA TIRADENTES',
    -22.9072348,
    -43.182463,
    true,
    'TRADICIONAL',
    15000,
    '19:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO VEM QUE EU TE ABRAÇO', 'bloco-vem-que-eu-te-abraco', 'R. C, 193 - Padre Miguel, Rio de Janeiro - RJ, 21760-590, Brasil
R. Figueiredo Camargo, 351 - Bangu, Rio de Janeiro - RJ, 21875-020, Brasil
R. C, 193 - Padre Miguel, Rio de Janeiro - RJ, 21760-590, Brasil', '2026')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26801,
    '2026-02-15',
    '15:00',
    true,
    'R. C',
    'R. C, 193 - Padre Miguel, Rio de Janeiro - RJ, 21760-590, Brasil',
    -22.8730107,
    -43.4501812,
    true,
    'TRADICIONAL',
    300,
    '17:00',
    1212
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('AFOXÉ FILHOS DE GANDHI DO RIO DE JANEIRO', 'afoxe-filhos-de-gandhi-do-rio-de-janeiro', 'Patrimônio imaterial do Rio de Janeiro, os Filhos de Gandhi desfilam desde 1951 nas ruas do Rio de Janeiro. Desenvolve e preserva a cultura afro-brasileira por meio da música, da cultura e da fé.', '2025')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26802,
    '2026-02-15',
    '15:00',
    true,
    'R. do Livramento',
    'R. do Livramento, 12 - Gamboa, Rio de Janeiro - RJ, 20221-193, Brasil',
    -22.8964882,
    -43.1906266,
    true,
    'RELIGIOSO',
    4000,
    '20:00',
    1181
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CARNAVALESCO ALEGRIA DO SÃO BENTO', 'bloco-carnavalesco-alegria-do-sao-bento', 'R. São Cristiano, 178 - Bangu, Rio de Janeiro - RJ, 21860-110, Brasil
R. Pôrto Nacional, 285 - Bangu, Rio de Janeiro - RJ, 21870-350, Brasil
R. do Açafrão, 137 - Bangu, Rio de Janeiro - RJ, 21870-330, Brasil
R. Figueiredo Camargo, 712 - Bangu, Rio de Janeiro - RJ, 21870-210, Brasil
R. Figueiredo Camargo, 2 - Padre Miguel, Rio de Janeiro - RJ, 21875-020, Brasil', '2015')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26599,
    '2026-02-15',
    '16:00',
    true,
    'R. São Cristiano',
    'R. São Cristiano, 178 - Bangu, Rio de Janeiro - RJ, 21860-110, Brasil',
    -22.8655972,
    -43.4567733,
    true,
    'TRADICIONAL',
    600,
    '20:00',
    1154
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO PIRANHA PORRA LOKA', 'bloco-piranha-porra-loka', 'Com sua bateria fervorosa, o bloco faz a festa na Travessa do Desterro, em Pedra de Guaratiba, no domingo de carnaval. A concentração é às 14h.', '2022')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26585,
    '2026-02-15',
    '15:00',
    true,
    'Travessa do Desterro',
    'Travessa do Desterro, 7 - Pedra de Guaratiba, Rio de Janeiro - RJ, 23027-350, Brasil',
    -23.0013385,
    -43.6421281,
    true,
    'TRADICIONAL',
    200,
    '20:00',
    1215
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('GRBC CULTURAL ZIMBAUÊ', 'grbc-cultural-zimbaue', 'Desde 2015 o bloco leva animação e alegria para os foliões da Ilha do Governador', '2015')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26576,
    '2026-02-15',
    '15:00',
    true,
    'Condomínio Praia da Guanabara - Praia da Guanabara',
    'Condomínio Praia da Guanabara - Praia da Guanabara, 1 - Ilha do Governador, Rio de Janeiro - RJ, 21911-090, Brasil',
    -22.7940266,
    -43.170694,
    true,
    'TRADICIONAL',
    400,
    '17:00',
    1179
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('GRÊMIO RECREATIVO BLOCO ASA TEMPERADA', 'gremio-recreativo-bloco-asa-temperada', 'Vargem Grande, por sua vez, terá o Asa Temperada, no dia 11, na Estrada do Picuí 892, entre 14h e 20h.', '2024')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26798,
    '2026-02-15',
    '16:00',
    true,
    'Estrada do Pacuí',
    'Estrada do Pacuí, 892 - Vargem Grande, Rio de Janeiro - RJ, 22785-160, Brasil',
    -22.9686675,
    -43.4938447,
    true,
    'TRADICIONAL',
    600,
    '20:00',
    1270
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BANDA DO LIDINHO COPACABANA', 'banda-do-lidinho-copacabana', 'É a versão infantil de um dos mais tradicionais blocos do carnaval carioca, a Banda do Lido, e se apresenta na praça de mesmo nome, em Copacabana.', '1999')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26577,
    '2026-02-15',
    '16:00',
    true,
    'PRAÇA DO LIDO',
    'PRAÇA DO LIDO',
    -22.9654933,
    -43.1760297,
    true,
    'TRADICIONAL',
    300,
    '19:00',
    1168
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO AFRO BATIKUM', 'bloco-afro-batikum', 'Av. Min. Edgard Romero, 114 - Madureira, Rio de Janeiro - RJ, 21350-302, Brasil
Estr. do Portela, 188 - Loja 24 - Madureira, Rio de Janeiro - RJ, 21351-051, Brasil', '2024')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26794,
    '2026-02-15',
    '17:00',
    true,
    'Av. Min. Edgard Romero',
    'Av. Min. Edgard Romero, 114 - Madureira, Rio de Janeiro - RJ, 21350-302, Brasil',
    -22.8739684,
    -43.3367459,
    true,
    'TRADICIONAL',
    200,
    '20:00',
    1203
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('COROINHA', 'coroinha', 'O Coroinha é um bloco que anima foliões de Pedra de Guaratiba, na Zona Oeste, durante o Carnaval. A concentração acontece na Rua Barros de Alarcão, em frente ao número 260.', '2007')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26578,
    '2026-02-15',
    '16:00',
    true,
    'Rua Barros de Alarcão',
    'Rua Barros de Alarcão, 230 - Pedra de Guaratiba, Rio de Janeiro - RJ, 23027-340, Brasil',
    -23.001374,
    -43.6424984,
    true,
    'TRADICIONAL',
    300,
    '21:00',
    1215
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26652,
    '2026-02-17',
    '16:00',
    true,
    'Rua Barros de Alarcão',
    'Rua Barros de Alarcão, 230 - Pedra de Guaratiba, Rio de Janeiro - RJ, 23027-340, Brasil',
    -23.001374,
    -43.6424984,
    true,
    'TRADICIONAL',
    300,
    '21:00',
    1215
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('A.R.B.E.C.C. IMPÉRIO DA FOLIA - CATETE', 'a-r-b-e-c-c-imperio-da-folia-catete', 'Utilize o transporte público por Metrô! Priorize a estação LARGO DO MACHADO  para ir e voltar do bloco.', '2003')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26579,
    '2026-02-15',
    '18:00',
    true,
    'Largo do Machado',
    'Largo do Machado, 311 - Catete, Rio de Janeiro - RJ, 22220-001, Brasil',
    -22.9308225,
    -43.1773649,
    true,
    'TRADICIONAL',
    900,
    '22:00',
    1164
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('ARTEIROS DA GLORIA', 'arteiros-da-gloria', 'Os Arteiros percorrem as ruas do charmoso bairro da Glória fazendo festa com integrantes de todas as idades e foliões bem fantasiados.', '2007')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26564,
    '2026-02-15',
    '17:00',
    true,
    'R. DA GLÓRIA',
    'R. DA GLÓRIA, 190 - GLÓRIA, RIO DE JANEIRO - RJ, 20241-180, BRASIL',
    -22.9188026,
    -43.1773257,
    true,
    'TRADICIONAL',
    800,
    '21:00',
    1183
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO BONECAS DESLUMBRADAS DE OLARIA', 'bloco-bonecas-deslumbradas-de-olaria', 'Em Olaria a pedida é o bloco Bonecas Deslumbradas de Olaria, que anima anima o carnaval de rua do bairro da zona norte carioca uma bateria energética e com muita animação.', '1977')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26582,
    '2026-02-15',
    '18:00',
    true,
    'Rua Conselheiro Paulino',
    'Rua Conselheiro Paulino, 567 - Olaria, Rio de Janeiro - RJ, 21073-311, Brasil',
    -22.8515324,
    -43.2694188,
    true,
    'TRADICIONAL',
    900,
    '20:00',
    1210
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26658,
    '2026-02-17',
    '18:00',
    true,
    'Rua Conselheiro Paulino',
    'Rua Conselheiro Paulino, 567 - Olaria, Rio de Janeiro - RJ, 21073-311, Brasil',
    -22.8515324,
    -43.2694188,
    true,
    'TRADICIONAL',
    900,
    '20:00',
    1210
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CARNAVALESCO PERERECA DO GRAJAÚ', 'bloco-carnavalesco-perereca-do-grajau', 'Bloco carnavalesco familiar que agrega pessoas de todas as idades, raças, credos e gêneros. Desfila pelas ruas do Grajaú, no domingo de carnaval.', '1997')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26602,
    '2026-02-15',
    '18:00',
    true,
    'Praça Edmundo Rêgo próximo ao 12 - Grajaú',
    'Praça Edmundo Rêgo próximo ao 12 - Grajaú, Rio de Janeiro - RJ, 20561-090, Brasil',
    -22.9224929,
    -43.2640219,
    true,
    'TRADICIONAL',
    1000,
    '21:00',
    1184
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO TCHETCHECA', 'bloco-tchetcheca', 'Com espírito descontraído e muita empolgação, o bloco desfila pelas ruas do Engenho de Dentro e do Méier, no domingo de carnaval. Concentração às 16h.', '2010')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26588,
    '2026-02-15',
    '18:00',
    true,
    'R. Pernambuco',
    'R. Pernambuco, 179 - Engenho de Dentro, Rio de Janeiro - RJ, 20730-030, Brasil',
    -22.8999567,
    -43.2952589,
    true,
    'TRADICIONAL',
    400,
    '22:00',
    1175
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('CLUBE DO SAMBA ENREDO', 'clube-do-samba-enredo', 'Explode coração na maior felicidade… É hoje o dia da alegria… Me leva que eu vou, sonho meu… Quem é apaixonado por samba-enredo ganha em 2025 um bloco para chamar de seu: o Clube do Samba Enredo estreia nas ruas no domingo de carnaval, como o primeiro com repertório 100% dedicado ao gênero. O bloco tem como madrinha a Estação Primeira de Mangueira e em sua origem está o grupo musical Clube do Samba Enredo, criado em junho de 2018.', '2024')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26796,
    '2026-02-15',
    '17:00',
    true,
    'Praça da Bandeira',
    'Praça da Bandeira, 43 - Praça da Bandeira, Rio de Janeiro - RJ, 20270-060, Brasil',
    -22.9111872,
    -43.2133539,
    true,
    'TRADICIONAL',
    500,
    '20:00',
    1222
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('GREMIO RECREATIVO BLOCO CARNAVALESCO PIRANHAS DA SENADOR NABUCO DE VILA ISABEL', 'gremio-recreativo-bloco-carnavalesco-piranhas-da-senador-nabuco-de-vila-isabel', 'O Piranhas da Senador Nabuco de Vila Isabel diverte os foliões do bairro com muito samba e irreverência durante o Carnaval. A concentração é no Boulevard Vinte e Oito de Setembro.', '1979')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26586,
    '2026-02-15',
    '18:00',
    true,
    'Blvd. 28 de Setembro',
    'Blvd. 28 de Setembro, 223 - Vila Isabel, Rio de Janeiro - RJ, 20551-085, Brasil',
    -22.9153377,
    -43.2426739,
    true,
    'TRADICIONAL',
    980,
    '22:00',
    1251
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('LAMA O BLOCO', 'lama-o-bloco', 'Pelas ruas de Sepetiba, o Lama Bloco comanda o público no domingo de Carnaval! ', '2024')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26799,
    '2026-02-15',
    '18:00',
    true,
    'R. da Floresta',
    'R. da Floresta, 905 - Sepetiba, Rio de Janeiro - RJ, 23540-430, Brasil',
    -22.9766969,
    -43.7028892,
    true,
    'TRADICIONAL',
    1000,
    '22:00',
    1243
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO BALANÇO DO PINTO', 'bloco-balanco-do-pinto', 'O bloco Balanço do Pinto foi fundado em 2008 e, desde 2009, desfila no Carnaval da Tijuca levando muita animação e folia para as ruas do bairro. O ponto de partida é a Rua Pinto de Figueiredo 26, próxima à Praça Saens Peña.', '2009')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26590,
    '2026-02-15',
    '19:00',
    true,
    'R. PINTO DE FIGUEIREDO',
    'R. PINTO DE FIGUEIREDO, 26 - TIJUCA, RIO DE JANEIRO - RJ, 20511-240, BRASIL',
    -22.9254821,
    -43.2350899,
    true,
    'TRADICIONAL',
    980,
    '22:00',
    1247
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('G.R BANDA DA CONCEIÇÃO', 'g-r-banda-da-conceicao', 'Praça Maj. Valo, 87 - Saúde, Rio de Janeiro - RJ, 20081-200, Brasil
R. Maj. Daemon, 15 - Saúde, Rio de Janeiro - RJ, 20081-190, Brasil
R. Acre, 8 - 08 - Centro, Rio de Janeiro - RJ, 20081-000, Brasil
R. do Escorrega, 9 - Saúde, Rio de Janeiro - RJ, 20081-100, Brasil
Beco João José, 16 - Saúde, Rio de Janeiro - RJ, 20081-150, Brasil
Rua do Jogo da Bola, 92 - Saúde, Rio de Janeiro - RJ, 20081-170, Brasil
Praça Maj. Valo, 87 - Saúde, Rio de Janeiro - RJ, 20081-200, Brasil', '1974')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26570,
    '2026-02-15',
    '18:00',
    true,
    'Praça Maj. Valo',
    'Praça Maj. Valo, 87 - Saúde, Rio de Janeiro - RJ, 20081-200, Brasil',
    -22.8988017,
    -43.1829077,
    true,
    'TRADICIONAL',
    500,
    '22:00',
    1241
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('GRBC VIRILHA DE MINHOCA', 'grbc-virilha-de-minhoca', 'fundado em 1975, o Virilha de Minhoca desfila pelas ruas de Bangu, na Zona Oeste da cidade', '1975')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26580,
    '2026-02-15',
    '18:00',
    true,
    'R. Fonseca',
    'R. Fonseca, 798 - Loja C - Bangu, Rio de Janeiro - RJ, 21820-005, Brasil',
    -22.8825773,
    -43.4656108,
    true,
    'TRADICIONAL',
    500,
    '21:00',
    1154
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('GRÊMIO RECREATIVO BLOCO CARNAVALESCO MAU MAU DE BANGU', 'gremio-recreativo-bloco-carnavalesco-mau-mau-de-bangu', 'O que começou como o pagode do Mau Mau em um bar na Rua Bragança Paulista, em 1997, logo cresceu e foi às ruas do Rio de Janeiro pela primeira vez no ano seguinte. Hoje o bloco do Mau Mau é reconhecido em Bangu e conta com uma diretoria de 10 pessoas.', '1997')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26589,
    '2026-02-15',
    '19:00',
    true,
    'Rua Minuanos - Bangu',
    'Rua Minuanos - Bangu, Rio de Janeiro, Brasil',
    -22.8781771,
    -43.477887,
    true,
    'TRADICIONAL',
    600,
    '22:00',
    1154
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('MSS MANGUEIRÃO', 'mss-mangueirao', 'Rua Auristela, 471a - Santa Cruz, Rio de Janeiro - RJ, 23550-351, Brasil
Rua Auristela, 1 - Santa Cruz, Rio de Janeiro - RJ, 23550-351, Brasil', '2026')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26795,
    '2026-02-15',
    '18:00',
    true,
    'Rua Auristela',
    'Rua Auristela, 471a - Santa Cruz, Rio de Janeiro - RJ, 23550-351, Brasil',
    -22.9347928,
    -43.6884492,
    true,
    'TRADICIONAL',
    1000,
    '21:00',
    1236
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO TOMA UMA', 'bloco-toma-uma', 'Na charmosa Ilha do Paquetá, o bloco Toma Uma agita o domingo de carnaval, em um desfile que inicia na Praia Dr. Aristão e se encerra na rua Furquim Werneck. O grupo se concentra às 18h.', '2005')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-15
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26601,
    '2026-02-15',
    '19:00',
    true,
    'Praia Dr. Aristao',
    'Praia Dr. Aristao, 88 - Paquetá, Rio de Janeiro - RJ, 20397-135, Brasil',
    -22.7569773,
    -43.1099417,
    true,
    'TRADICIONAL',
    400,
    '22:00',
    1226
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CORRE ATRÁS', 'bloco-corre-atras', 'Tradicional do Leblon, o Corre Atrás desfila por várias ruas conhecidas do bairro do Leblon, com a intenção de resgatar as tradições dos antigos carnavais de rua. Em seu repertório, somente marchinhas e o hino oficial da agremiação.', '2006')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26640,
    '2026-02-16',
    '09:00',
    true,
    'Av. Delfim Moreira',
    'Av. Delfim Moreira, 1111 - Leblon, Rio de Janeiro - RJ, 22441-000, Brasil',
    -22.9879856,
    -43.2259236,
    true,
    'TRADICIONAL',
    10000,
    '13:00',
    1200
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('QUE PENA AMOR', 'que-pena-amor', 'Inspirado na música de mesmo nome do grupo Raça Negra, o bloco “Que Pena, Amor” nasceu em 2017 e homenageia as maiores bandas de pagode dos anos 1990, tocando clássicos do gênero com novos arranjos. Além do samba, há levadas de ijexá, funk, xote, baião, marchinha e maracatu, entre outros, que dão nova roupagem a grandes sucessos de grupos como  Só pra Contrariar, Exaltasamba, Art Popular,  Revelação e Katinguelê. As ruas da Carioca e do Mercado são palco das apresentações, mas o desfile oficial acontece na Praça Mário Lago, no Buraco do Lume.', '2017')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26639,
    '2026-02-16',
    '08:00',
    true,
    'Prç. Tiradentes',
    'Prç. Tiradentes, 69 - Centro, Rio de Janeiro - RJ, 20060-070, Brasil',
    -22.9073466,
    -43.1839151,
    true,
    'TRADICIONAL',
    15000,
    '13:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO A ROCHA DA GÁVEA', 'bloco-a-rocha-da-gavea', 'Fundado em 2002, o bloco A Rocha da Gávea desfila com a bateria do Mestre Marfim, contando com mais de 100 ritmistas por um dos bairros mais charmosos da zona sul do Rio de Janeiro.  ', '2003')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26632,
    '2026-02-16',
    '10:00',
    true,
    'Rua Pacheco Leão',
    'Rua Pacheco Leão, 20 - Jardim Botânico, Rio de Janeiro - RJ, 22460-030, Brasil',
    -22.9662872,
    -43.219697,
    true,
    'TRADICIONAL',
    14000,
    '14:00',
    1194
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DO SARGENTO PIMENTA', 'bloco-do-sargento-pimenta', 'Utilize o transporte público por Metrô! Priorize a estação GLÓRIA para ir e voltar do bloco.

É imperdível para quem é fã dos Beatles. Fundado no bairro do Flamengo, o nome é uma referência ao álbum Sgt. Pepper''s Lonely Hearts Club Band da banda britânica, e o repertório do bloco é formado principalmente por versões de canções da banda de rock The Beatles, interpretadas com arranjos de samba, marcha, maracatu e outros ritmos brasileiros. Até o príncipe Harry quando veio solteiro ao Brasil em 2017, não resistiu e caiu no samba', '2011')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26617,
    '2026-02-16',
    '10:00',
    true,
    'Av. Infante Dom Henrique',
    'Av. Infante Dom Henrique, 75 - Glória, Rio de Janeiro - RJ, 20021-140, Brasil',
    -22.9166167,
    -43.1735387,
    true,
    'TRADICIONAL',
    80000,
    '14:00',
    1183
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BRASÍLIA AMARELA', 'brasilia-amarela', 'Largo São Francisco de Paula, s/n - Centro, Rio de Janeiro - RJ, 20051-070, Brasil', '2026')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26810,
    '2026-02-16',
    '10:00',
    true,
    'Largo São Francisco de Paula',
    'Largo São Francisco de Paula, s/n - Centro, Rio de Janeiro - RJ, 20051-070, Brasil',
    -22.9053222,
    -43.1806979,
    true,
    'TRADICIONAL',
    10000,
    '12:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('VEM CÁ MINHA FLOR', 'vem-ca-minha-flor', 'Era mais uma sexta-feira na Lapa, Rio de Janeiro, e os amigos Edu Machado, Leo Santana e Marcelo Lima, entre uma cerveja e outra, tiveram a ideia de criar um bloco de carnaval em que todos saíssem floridos. Além das flores, tinha também como intuito promover um resgaste musical e comportamental do carnaval de rua carioca. E foi assim que em setembro de 2015 o bloco Vem Cá, Minha Flor foi fundado.', '2014')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26627,
    '2026-02-16',
    '09:00',
    true,
    'Av. Mal. Câmara',
    'Av. Mal. Câmara, 196-216 - Centro, Rio de Janeiro - RJ, 20020-080, Brasil',
    -22.9086609,
    -43.1697559,
    true,
    'TRADICIONAL',
    35000,
    '12:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BANDA POLVO DA ILHA', 'banda-polvo-da-ilha', 'O Bloco sai pela Ilha do Governador com a animação da banda que toca clássicos carnavalescos para fazer a festa para toda a família.O ponto de partida é a Praça Iaiá Garcia, na Ribeira.', '2005')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26619,
    '2026-02-16',
    '11:00',
    true,
    'Praça Iaiá García - Ribeira',
    'Praça Iaiá García - Ribeira, Rio de Janeiro - RJ, 21930-040, Brasil',
    -22.8258677,
    -43.1694592,
    true,
    'TRADICIONAL',
    1000,
    '15:00',
    1230
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CARNAVALESCO NOVA GERAÇÃO DO ZUMBI', 'bloco-carnavalesco-nova-geracao-do-zumbi', 'O bloco fundado em 2008 desfila sua alegria na segunda-feira de carnaval, no Zumbi, na Ilha do Governador. A concentração é às 9h, na rua Peixoto de Carvalho.', '2008')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26608,
    '2026-02-16',
    '10:00',
    true,
    'R. Peixoto de Carvalho',
    'R. Peixoto de Carvalho, 228 - Zumbi, Rio de Janeiro - RJ, 21930-210, Brasil',
    -22.8221083,
    -43.1768635,
    true,
    'TRADICIONAL',
    600,
    '15:00',
    1256
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DA INSANARJ', 'bloco-da-insanarj', 'Com uma bateria própria, o bloco desfila pelo Centro da cidade, e tem em seu trajeto importantes pontos turísticos da região, como os Arcos da Lapa e a Rua do Lavradio, reduto de antiquários. O Insana RJ promete tocar sucessos do repértorio de qualquer Carnaval e encher as ruas com muita animação.', '2010')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26614,
    '2026-02-16',
    '11:00',
    true,
    'Av. Henrique Valadares',
    'Av. Henrique Valadares, 46 - Centro, Rio de Janeiro - RJ, 20231-030, Brasil',
    -22.9111318,
    -43.1865285,
    true,
    'TRADICIONAL',
    900,
    '15:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO FICA COMIGO', 'bloco-fica-comigo', 'Av. Pref. Mendes de Morais, 808 - São Conrado, Rio de Janeiro - RJ, 22610-095, Brasil
Av. Pref. Mendes de Morais, 6 - São Conrado, Rio de Janeiro - RJ, 22610-095, Brasil', '2022')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26635,
    '2026-02-16',
    '10:00',
    true,
    'Av. Pref. Mendes de Morais',
    'Av. Pref. Mendes de Morais, 808 - São Conrado, Rio de Janeiro - RJ, 22610-095, Brasil',
    -22.9992412,
    -43.264919,
    true,
    'TRADICIONAL',
    20000,
    '15:00',
    1240
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO INFANTO JUVENIL LARGO DO MACHADINHO, MAS NÃO LARGO DO SUQUINHO', 'bloco-infanto-juvenil-largo-do-machadinho-mas-nao-largo-do-suquinho', 'Utilize o transporte público por Metrô! Priorize a estação LARGO DO MACHADO  para ir e voltar do bloco.

Versão mirim do bloco “Largo do Machado, Mas Não Largo do Copo”, o “Largo do Machadinho, Mas Não Largo do Suquinho” teve o desenhista Ziraldo, que nos deixou em 2024, como padrinho. Ele foi o responsável pelo desenho do estandarte e pelo figurino do mestre-sala, que vem vestido de Menino Maluquinho. Brincadeiras, concurso de fantasia e distribuição de kits de confete e serpentina costumam animar os foliões mirins.', '2011')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26612,
    '2026-02-16',
    '10:00',
    true,
    'Largo do Machado - 020',
    'Largo do Machado - 020, Largo do Machado - Catete, Rio de Janeiro - RJ, 22221-020, Brasil',
    -22.9303313,
    -43.178655,
    true,
    'INFANTIL',
    826,
    '15:00',
    1164
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CARNAVALESCO BAFO DA ONÇA', 'bloco-carnavalesco-bafo-da-onca', 'R. Monte Alegre, 306 - Santa Teresa, Rio de Janeiro - RJ, 20240-193, Brasil
R. do Oriente, 251 - Santa Teresa, Rio de Janeiro - RJ, 20240-130, Brasil
R. Progresso, 91 - Santa Teresa, Rio de Janeiro - RJ, 20240-060, Brasil
Largo das Neves, 13 - Santa Teresa, Rio de Janeiro - RJ, 20240-040, Brasil', '1957')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26615,
    '2026-02-16',
    '12:00',
    true,
    'R. Monte Alegre',
    'R. Monte Alegre, 306 - Santa Teresa, Rio de Janeiro - RJ, 20240-193, Brasil',
    -22.919903,
    -43.1886214,
    true,
    'TRADICIONAL',
    1000,
    '15:00',
    1237
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('CARVALHO EM PÉ', 'carvalho-em-pe', 'Quer curtir o carnaval com uma roda de samba do carvalho? Que tal o Bloco Carvalho em Pé, simpático cordão criado pelos proprietários do extinto Boteco du Carvalho para promover o estabelecimento? O Du Carvalho em Pé se concentra na Rua Visconde de Caravelas, em Botafogo.', '2011')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26634,
    '2026-02-16',
    '12:00',
    true,
    'RUA VISCONDE DE CARAVELAS',
    'RUA VISCONDE DE CARAVELAS, 14 - BOTAFOGO',
    -22.9559159,
    -43.1927436,
    true,
    'TRADICIONAL',
    900,
    '16:00',
    1158
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BANDA CLUBE NOBRE DO BAIRRO PEIXOTO', 'banda-clube-nobre-do-bairro-peixoto', 'A criançada tem um destino certo para pular o carnaval: a banda Clube Nobre do Bairro Peixoto agita a Praça Edmundo Bitencourt, em um repertório especial para crianças de todas as idades.', '1997')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26611,
    '2026-02-16',
    '12:00',
    true,
    'Praça Edmundo Bitencourt',
    'Praça Edmundo Bitencourt, 721 - Copacabana, Rio de Janeiro - RJ, 22041-070, Brasil',
    -22.967197,
    -43.1902357,
    true,
    'INFANTIL',
    800,
    '14:00',
    1168
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DAS DIVAS', 'bloco-das-divas', 'Tá aí um bloco de empoderamento feminino, onde a máxima é mais que missão: “Lugar de mulher é onde ela quiser”! As “Divas” desfilam pela orla do Recreio dos Bandeirantes e fazem coro pela igualdade social, o fim do preconceito e da violência de gênero. Tudo na cadência do samba e na alegria do Carnaval', '2014')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26609,
    '2026-02-16',
    '13:00',
    true,
    'Av. Lúcio Costa',
    'Av. Lúcio Costa, 16360 - Recreio dos Bandeirantes, Rio de Janeiro - RJ, 22795-008, Brasil',
    -23.024379,
    -43.4565906,
    true,
    'TRADICIONAL',
    10500,
    '18:00',
    1228
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO  OLHA PRA QUEM TE AMA', 'bloco-olha-pra-quem-te-ama', 'Bloco fundado por um grupo de amigos em Padre Miguel, que se reúne ao som de marchinhas de carnaval, samba-enredo e axé. O nome do bloco surgiu de uma frase preferida por um vendedor de doces na Cinelândia: “Olha pra quem te ama” resume um mandamento do bloco, que preza pelo amor uns pelos outros.', '2025')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26806,
    '2026-02-16',
    '14:00',
    true,
    'R. D',
    'R. D, 340 - Padre Miguel, Rio de Janeiro - RJ, 21870-430, Brasil',
    -22.8721083,
    -43.4495078,
    true,
    'TRADICIONAL',
    200,
    '18:00',
    1212
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO SECA COPO', 'bloco-seca-copo', 'O primeiro desfile do Seca Copo aconteceu em 1976. Toda segunda-feira de carnaval, o bloco desfila pelas ruas da Ilha do Governador, espalhando alegria e diversão pelas ruas do bairro.', '2010')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26630,
    '2026-02-16',
    '13:00',
    true,
    'R. do Monjolo',
    'R. do Monjolo, 546 - Pitangueiras, Rio de Janeiro - RJ, 21930-376, Brasil',
    -22.8171015,
    -43.1813123,
    true,
    'TRADICIONAL',
    950,
    '17:00',
    1220
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('DINOS ASSOCIAÇÃO CARNAVALESCA', 'dinos-associacao-carnavalesca', 'Os maiores clássicos do Rock misturados aos mais variados ritmos regionais do país, essa sempre foi a proposta do bloco, que está presente nas ruas do Rio desde o carnaval de 2013. A partir de 2025, o melhor do rock internacional também vai fazer parte do RocKarnaval dos Dinos!', '2013')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26618,
    '2026-02-16',
    '14:00',
    true,
    'LARGO DE SÃO FRANCISCO DE PAULA S/N',
    'LARGO DE SÃO FRANCISCO DE PAULA S/N, CENTRO',
    -22.905041,
    -43.1807478,
    true,
    'TRADICIONAL',
    12000,
    '18:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('TURBILHÃO CARIOCA', 'turbilhao-carioca', 'O bloco desfila pelo Largo de São Francisco da Prainha, no Centro do Rio e que atrai cerca de 800 pessoas em seu cortejo', '2009')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26633,
    '2026-02-16',
    '13:00',
    true,
    'Praça Alm. Júlio de Noronha',
    'Praça Alm. Júlio de Noronha, 86 - Leme, Rio de Janeiro - RJ, 22010-020, Brasil',
    -22.9623025,
    -43.1653886,
    true,
    'TRADICIONAL',
    2500,
    '18:00',
    1201
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('ACABOU AMOR', 'acabou-amor', 'R. Domingos Mondim, 41 - Tauá, Rio de Janeiro - RJ, 21920-060, Brasil
R. Domingos Mondim, 432 - Tauá, Rio de Janeiro - RJ, 21920-060, Brasil', '2016')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26631,
    '2026-02-16',
    '15:00',
    true,
    'R. Domingos Mondim',
    'R. Domingos Mondim, 41 - Tauá, Rio de Janeiro - RJ, 21920-060, Brasil',
    -22.7969792,
    -43.1844386,
    true,
    'TRADICIONAL',
    600,
    '17:00',
    1246
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('ASSOCIAÇÃO CARNAVALESCA INFIÉIS', 'associacao-carnavalesca-infieis', 'A associação foi criada em 2007 por um grupo de amigos e amantes do samba, a partir da antiga ‘''Ala dos Infiéis na Casa do Gringo”, uma referência ao fato do grupo desfilar em alas diferentes das escolas de samba ou em escolas diferentes das que torciam. Com a fundação da associação, adotou-se o nome, uma brincadeira com a política cultural que precisava ser traída para se preservar a folia, o samba, a alegria e o próprio carnaval. “Não me venha falar em traição, não há pecado nem perdão, não condene um folião” é o slogan desse bloco, que desfila tradicionalmente pelas ruas do Centro do Rio de Janeiro.', '2008')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26628,
    '2026-02-16',
    '15:00',
    true,
    'LARGO ALEXANDRE HERCULANO - CENTRO',
    'LARGO ALEXANDRE HERCULANO - CENTRO',
    -22.9058167,
    -43.1820866,
    true,
    'TRADICIONAL',
    500,
    '19:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BANDA DA AMIZADE', 'banda-da-amizade', 'E deixa rolar a amizade, como diz o nome no bloco. A banda agita os foliões do Centro, com concentração pela tarde!', '1998')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26620,
    '2026-02-16',
    '15:00',
    true,
    'Rua Tadeu Kosciusco próximo ao 79 - Centro',
    'Rua Tadeu Kosciusco próximo ao 79 - Centro, Rio de Janeiro - RJ, 20030-050, Brasil',
    -22.9145822,
    -43.1884625,
    true,
    'TRADICIONAL',
    900,
    '19:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26669,
    '2026-02-17',
    '15:00',
    true,
    'RUA TADEU KOSCIUSKO PRÓXIMO AO 79 CENTRO',
    'RUA TADEU KOSCIUSKO PRÓXIMO AO 79 CENTRO',
    -22.9144485,
    -43.1883721,
    true,
    'TRADICIONAL',
    900,
    '19:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('GRUPO MARACUTAIA', 'grupo-maracutaia', 'Praça Virgílio de Melo Franco, 85 - Centro, Rio de Janeiro - RJ, 20021-380, Brasil', '2026')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26804,
    '2026-02-16',
    '15:00',
    true,
    'Praça Virgílio de Melo Franco',
    'Praça Virgílio de Melo Franco, 85 - Centro, Rio de Janeiro - RJ, 20021-380, Brasil',
    -22.9104456,
    -43.1702772,
    true,
    'TRADICIONAL',
    950,
    '19:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('VEM DELÍCIA', 'vem-delicia', 'Fundado em 2023, o Bloco Vem Delícia é um bloco tradicional do Centro do Rio de Janeiro, que acontece na segunda-feira de carnaval, na Praça Tiradentes. E promete agitar o centro da cidade com muita alegria e purpurina! ', '2007')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26626,
    '2026-02-16',
    '15:00',
    true,
    'PRAÇA TIRADENTES',
    'PRAÇA TIRADENTES, 40 - CENTRO, RIO DE JANEIRO - RJ, 20060-070, BRASIL',
    -22.9062883,
    -43.1828256,
    true,
    'TRADICIONAL',
    9000,
    '19:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CARNAVALESCO TUDO BOM', 'bloco-carnavalesco-tudo-bom', 'O Tudo Bom desfila pelas ruas do bairro de Padre Miguel, na Zona Oeste do Rio. A festa é animada e a concentração acontece na Rua Figueiredo Camargo 351.', '2023')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26610,
    '2026-02-16',
    '16:00',
    true,
    'R. Figueiredo Camargo',
    'R. Figueiredo Camargo, 351 - Bangu, Rio de Janeiro - RJ, 21875-020, Brasil',
    -22.8715878,
    -43.4554129,
    true,
    'TRADICIONAL',
    200,
    '18:00',
    1154
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO PERU SADIO', 'bloco-peru-sadio', 'Animando os foliões do Leme há décadas, é tido como um dos mais tradicionais no Carnaval da região. É samba e festa para não acabar mais!', '2003')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26613,
    '2026-02-16',
    '16:00',
    true,
    'Av. Atlântica',
    'Av. Atlântica, 958 - Leme, Rio de Janeiro - RJ, 22010-000, Brasil',
    -22.9642446,
    -43.1725946,
    true,
    'TRADICIONAL',
    1000,
    '20:00',
    1201
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO TRAZ A CAÇAMBA', 'bloco-traz-a-cacamba', 'É para pagodear! O Traz A Caçamba faz do seu cortejo uma bonita roda de pagode, onde todos são mais que convidados a fazerem parte na cadência das palmas e das vozes. Ninguém fica de fora do molejo', '2015')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26623,
    '2026-02-16',
    '15:00',
    true,
    'Condomínio do Edifício Auser - Av. Augusto Severo',
    'Condomínio do Edifício Auser - Av. Augusto Severo, 202 - Glória, Rio de Janeiro - RJ, 20021-040, Brasil',
    -22.9160442,
    -43.1767784,
    true,
    'TRADICIONAL',
    900,
    '19:00',
    1183
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('CARROSSEL DE EMOCOES', 'carrossel-de-emocoes', 'Av. Infante Dom Henrique, 75 - Glória, Rio de Janeiro - RJ, 20021-140, Brasil', '2024')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26807,
    '2026-02-16',
    '15:00',
    true,
    'Av. Infante Dom Henrique',
    'Av. Infante Dom Henrique, 75 - Glória, Rio de Janeiro - RJ, 20021-140, Brasil',
    -22.9166167,
    -43.1735387,
    true,
    'TRADICIONAL',
    40000,
    '18:00',
    1183
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('COMUNA QUE PARIU!', 'comuna-que-pariu', 'O “Comuna Que Pariu!” é um bloco de carnaval que se organizou em 2009 por iniciativa da UJC (União da Juventude Comunista) e tomou forma mais definitiva em 2013, aquecido pelas lutas na cidade do Rio de Janeiro. ', '2022')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26809,
    '2026-02-16',
    '15:00',
    true,
    'Av. Henrique Valadares',
    'Av. Henrique Valadares, 28 - Centro, Rio de Janeiro - RJ, 20231-030, Brasil',
    -22.9104896,
    -43.1858644,
    true,
    'TRADICIONAL',
    12000,
    '20:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('ESTICA DO FLAMENGO', 'estica-do-flamengo', 'O bloco é uma opção divertida para quem está no Flamengo e em regiões vizinhas.  Desfila pelas ruas desde 2007 levando muita alegria pro Carnaval carioca.  ', '2007')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26624,
    '2026-02-16',
    '15:00',
    true,
    'R. MARQUÊS DE ABRANTES - FLAMENGO',
    'R. MARQUÊS DE ABRANTES - FLAMENGO, RIO DE JANEIRO - RJ, 22230-061, BRASIL',
    -22.9362668,
    -43.177318,
    true,
    'TRADICIONAL',
    900,
    '19:00',
    1178
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('IMPÉRIO DA CRUZADA', 'imperio-da-cruzada', 'Av. Delfim Moreira, 12 - Leblon, Rio de Janeiro - RJ, 22441-000, Brasil
Av. Delfim Moreira, 558 - Leblon, Rio de Janeiro - RJ, 22441-000, Brasil', '2009')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26636,
    '2026-02-16',
    '15:00',
    true,
    'Av. Delfim Moreira',
    'Av. Delfim Moreira, 12 - Leblon, Rio de Janeiro - RJ, 22441-000, Brasil',
    -22.9858807,
    -43.2161847,
    true,
    'TRADICIONAL',
    1000,
    '18:00',
    1200
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BANDA DO RIVIERA', 'banda-do-riviera', 'A filosofia do bloco é simples: entreter as famílias. Criada dentro do Condomínio Riviera Dei Fiori, a Banda do Riviera tem a finalidade de agitar a folia de Carnaval do condomínio na Barra da Tijuca e de convidados.', '2009')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26606,
    '2026-02-16',
    '17:00',
    true,
    'RUA ROSALINA BRAND',
    'RUA ROSALINA BRAND, 200 - BARRA DA TIJUCA, RIO DE JANEIRO - RJ, 22631-260, BRASIL',
    -23.003417,
    -43.3396284,
    true,
    'TRADICIONAL',
    4000,
    '19:00',
    1155
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BANDA DA INVÁLIDOS', 'banda-da-invalidos', 'A Banda da Inválidos vai colocar o seu bloco na rua  e encher a Lapa de muita, diversão e  alegria. O cortejo toca marchinhas ao som da bateria, o que já é uma tradição no carnaval da cidade.', '1976')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26637,
    '2026-02-16',
    '18:00',
    true,
    'RUA DOS INVÁLIDOS',
    'RUA DOS INVÁLIDOS,138 - CENTRO',
    -22.9113841,
    -43.1850206,
    true,
    'TRADICIONAL',
    1000,
    '22:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO BALANÇO DO JAMELÃO', 'bloco-balanco-do-jamelao', 'Com muito samba e animação, o bloco Balanço do Jamelão celebra a folia no Carnaval carioca com seu desfile pelas ruas do bairro do Andaraí, na região da Grande Tijuca, Zona Norte da cidade.', '2009')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26629,
    '2026-02-16',
    '18:00',
    true,
    'R. Rosa e Silva',
    'R. Rosa e Silva, 19 - Grajau, Rio de Janeiro - RJ, 20541-330, Brasil',
    -22.9287652,
    -43.2569927,
    true,
    'TRADICIONAL',
    900,
    '22:00',
    1184
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO PAPO DE CACHAÇA', 'bloco-papo-de-cachaca', 'O bloco Papo de Cachaça do Méier desfila nas segundas de carnaval pela Rua Dias da Cruz, animando os foliões da região.', '2010')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26621,
    '2026-02-16',
    '18:00',
    true,
    'R. Dias da Cruz',
    'R. Dias da Cruz, 269 - Méier, Rio de Janeiro - RJ, 20720-010, Brasil',
    -22.9039549,
    -43.2839709,
    true,
    'TRADICIONAL',
    600,
    '22:00',
    1209
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('B.C UNIDOS DO LARGO DA BICA', 'b-c-unidos-do-largo-da-bica', 'R. Mal. Galdino, 394 - Santa Cruz, Rio de Janeiro - RJ, 23520-175, Brasil
R. São Benedito, 586 - Santa Cruz, Rio de Janeiro - RJ, 23520-790, Brasil', '2025')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26805,
    '2026-02-16',
    '19:00',
    true,
    'R. Mal. Galdino',
    'R. Mal. Galdino, 394 - Santa Cruz, Rio de Janeiro - RJ, 23520-175, Brasil',
    -22.9319655,
    -43.6784817,
    true,
    'TRADICIONAL',
    400,
    '21:00',
    1236
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DA COLONIA', 'bloco-da-colonia', 'Paquetá é palco do desfile do Bloco da Colônia, que percorre diversas ruas da bucólica ilha. O ponto de partida é a Praia José Bonifácio.', '2008')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26625,
    '2026-02-16',
    '19:00',
    true,
    'PRAIA JOSÉ BONIFÁCIO',
    'PRAIA JOSÉ BONIFÁCIO, 175 - PAQUETÁ, RIO DE JANEIRO - RJ, 20396-140, BRASIL',
    -22.7656977,
    -43.1100648,
    true,
    'TRADICIONAL',
    500,
    '22:00',
    1226
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CARNAVALESCO GRILO DE BANGU', 'bloco-carnavalesco-grilo-de-bangu', 'R. Francisco Franco, 314 - Bangu, Rio de Janeiro - RJ, 21820-050, Brasil
R. Oliveira Ribeiro, 1177 - Padre Miguel, Rio de Janeiro - RJ, 21810-000, Brasil
R. Silva Cardoso, 629 - Bangu, Rio de Janeiro - RJ, 21810-031, Brasil
R. Bangu, 47 - Bangu, Rio de Janeiro - RJ, 21820-020, Brasil', '2026')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-16
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26808,
    '2026-02-16',
    '20:00',
    true,
    'R. Francisco Franco',
    'R. Francisco Franco, 314 - Bangu, Rio de Janeiro - RJ, 21820-050, Brasil',
    -22.8831128,
    -43.4683573,
    true,
    'TRADICIONAL',
    600,
    '22:00',
    1154
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO BECO DAS GARRAFAS', 'bloco-beco-das-garrafas', 'Condomínio do Edifício Palace - R. Duvivier, 24 - Copacabana, Rio de Janeiro - RJ, 22020-020, Brasil', '2026')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26813,
    '2026-02-17',
    '08:00',
    true,
    'Condomínio do Edifício Palace - R. Duvivier',
    'Condomínio do Edifício Palace - R. Duvivier, 24 - Copacabana, Rio de Janeiro - RJ, 22020-020, Brasil',
    -22.9658838,
    -43.1774716,
    true,
    'TRADICIONAL',
    1000,
    '13:00',
    1168
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('CAMISA 7', 'camisa-7', 'Praça Maracanã, 10 - Maracanã, Rio de Janeiro - RJ, 20511-050, Brasil
Blvd. 28 de Setembro, 109, Fundos - Vila Isabel, Rio de Janeiro - RJ, 20551-030, Brasil
Blvd. 28 de Setembro, 245 - loja B - Vila Isabel, Rio de Janeiro - RJ, 20551-085, Brasil
Praça Barão de Drumond, 438 - Vila Isabel, Rio de Janeiro - RJ, 20560-020, Brasil', '2026')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26816,
    '2026-02-17',
    '08:00',
    true,
    'Praça Maracanã',
    'Praça Maracanã, 10 - Maracanã, Rio de Janeiro - RJ, 20511-050, Brasil',
    -22.9131217,
    -43.236029,
    true,
    'TRADICIONAL',
    2500,
    '13:00',
    1207
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('FERVO DA LUD', 'fervo-da-lud', 'Utilize o transporte público por Metrô! Priorize a estação CARIOCA para ir e voltar do bloco.

Comandado pela cantora Ludmilla, o Fervo da Lud reúne convidados e uma multidão de foliões que se divertem ao som de seus maiores sucessos e de músicas icônicas do carnaval.', '2017')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26676,
    '2026-02-17',
    '08:00',
    true,
    'R. Primeiro de Março',
    'R. Primeiro de Março, 33 - Centro, Rio de Janeiro - RJ, 20010-000, Brasil',
    -22.9023308,
    -43.17607,
    true,
    'MEGA BLOCO',
    600000,
    '12:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO QUIZOMBA', 'bloco-quizomba', 'Criado em 2002 a partir de oficinas de percussão, o Quizomba é um dos mais conhecidos blocos da cidade e têm nos ritmos brasileiros sua maior característica', '2002')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26651,
    '2026-02-17',
    '09:00',
    true,
    'Av. Infante Dom Henrique',
    'Av. Infante Dom Henrique, 1550 - Glória, Rio de Janeiro - RJ, 20021-140, Brasil',
    -22.9150341,
    -43.1746426,
    true,
    'TRADICIONAL',
    40000,
    '14:00',
    1183
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('VAGALUME O VERDE', 'vagalume-o-verde', '‘Vagalume, O Verde’ foi criado direto na região do Horto, no Jardim Botânico, bairro que tem relevância histórica e cultural na cidade do Rio de Janeiro. Buscando ressuscitar as lembranças infantis, quando os blocos carnavalescos uniam sua comunidade com magia e fantasia todo ano, com um olhar especial para a sustentabilidade. Nesse sentido, o  bloco reaproveita materiais para criar seus estandartes e fantasias, além de plantar mudas para neutralizar suas emissões de CO2.', '2005')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26650,
    '2026-02-17',
    '10:00',
    true,
    'Rua Pacheco Leão',
    'Rua Pacheco Leão, 20 - Jardim Botânico, Rio de Janeiro - RJ, 22460-030, Brasil',
    -22.9662872,
    -43.219697,
    true,
    'TRADICIONAL',
    20000,
    '14:00',
    1194
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BAGUNÇA MEU CORETO', 'bagunca-meu-coreto', 'Bagunça Meu Coreto é um bloco carnavalesco nascido em 2005 e embalado por marchinhas e sambas. Desfila no bairro das Laranjeiras, Rio de Janeiro, saindo da Praça São Salvador e indo até o bairro do Flamengo. Seu nome vem do coreto que ornamenta a Praça São Salvador onde nasceu o bloco.', '2005')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26679,
    '2026-02-17',
    '10:00',
    true,
    'R. São Salvador',
    'R. São Salvador, 56 - Flamengo, Rio de Janeiro - RJ, 22231-130, Brasil',
    -22.9334645,
    -43.1795976,
    true,
    'TRADICIONAL',
    900,
    '15:00',
    1178
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CACHORRO CANSADO', 'bloco-cachorro-cansado', 'Utilize o transporte público por Metrô! Priorize a estação FLAMENGO para ir e voltar do bloco.

Apesar do nome, o bloco percorre as ruas do Flamengo com muita disposição! E não vale dizer que está cansado, ok?', '1981')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26674,
    '2026-02-17',
    '11:00',
    true,
    'Praça José de Alencar',
    'Praça José de Alencar, 1414 - Flamengo, Rio de Janeiro - RJ, 22230-020, Brasil',
    -22.9327171,
    -43.1774139,
    true,
    'TRADICIONAL',
    900,
    '15:00',
    1178
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('CLUBE DO SAMBA', 'clube-do-samba', 'O Clube do Samba foi fundado em 1971 por João Nogueira, um dos maiores sambistas do Rio de Janeiro. Com tradição no sangue, o bloco costumava desfilar na região central da cidade, até se mudar para Copacabana. Os enredos costumam levar letras de cunho político, satirizando a situação atual do país.', '1980')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26672,
    '2026-02-17',
    '11:00',
    true,
    'Av. Atlântica',
    'Av. Atlântica, 2634 - Copacabana, Rio de Janeiro - RJ, 22041-001, Brasi',
    -22.9726734,
    -43.1859894,
    true,
    'TRADICIONAL',
    10000,
    '13:00',
    1168
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('GRBC CARDOSÃO DE LARANJEIRAS', 'grbc-cardosao-de-laranjeiras', 'O bloco Cardosão de Laranjeiras tem história! Ele já foi campeão na categoria de   Melhor Bloco de Embalo, em 1978. O Desfile, na terça de Carnaval, se concentra às  na Rua Cardoso Júnior esquina com a Rua das Laranjeiras, por onde segue, e depois volta à quadra de esportes da Cardoso Júnior. ', '1970')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26667,
    '2026-02-17',
    '11:00',
    true,
    'R. Cardoso Júnior',
    'R. Cardoso Júnior, 746 - Laranjeiras, Rio de Janeiro - RJ, 22245-000, Brasil',
    -22.9407422,
    -43.1897899,
    true,
    'TRADICIONAL',
    500,
    '15:00',
    1199
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO BATUKE DE BATOM', 'bloco-batuke-de-batom', 'Na Ribeira a pegada é o Bloco do Batuke de Batom, que promete arrastar e divertir os foliões. Por lá, é pra ter muito samba no pé.', '2013')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26677,
    '2026-02-17',
    '12:00',
    true,
    'PRAIA DO ZUMBI 28 - ZUMBI',
    'PRAIA DO ZUMBI 28 - ZUMBI',
    -22.821055,
    -43.174346,
    true,
    'TRADICIONAL',
    4000,
    '16:00',
    1256
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO VAMO ET', 'bloco-vamo-et', 'O bloco chega ao Carnaval com letras autorais e o melhor da folia intergaláctica!', '2024')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26814,
    '2026-02-17',
    '11:00',
    true,
    'Memorial Municipal Getúlio Vargas - subsolo',
    'Memorial Municipal Getúlio Vargas - subsolo, Praça Luiz de Camões, s/n - Glória, Rio de Janeiro - RJ, 22210-005, Brasil',
    -22.9216191,
    -43.173518,
    true,
    'TRADICIONAL',
    950,
    '16:00',
    1183
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('CHEIRO NA TESTA', 'cheiro-na-testa', 'Pierrôs e colombinas! O Bloco Cheiro na Testa desfila com muita energia pelas ladeiras de Santa Teresa, com sambas enredo, marchinhas e outros ritmos. O som do atabaque invade o coração e mexe com os pés dos foliões.  ', '2008')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26688,
    '2026-02-17',
    '13:00',
    true,
    'Rua Paschoal Carlos Magno',
    'Rua Paschoal Carlos Magno, 141 - Santa Teresa, Rio de Janeiro - RJ, 20240-290, Brasil',
    -22.9213726,
    -43.1861583,
    true,
    'TRADICIONAL',
    800,
    '17:00',
    1237
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('ALÔ, PRODUÇÃO!', 'alo-producao', 'Venha fazer parte do desfile do bloco Alô, Produção!, que traz felicidade ao público do bairro da Glória. ', '2019')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26664,
    '2026-02-17',
    '13:00',
    true,
    'Praça Luiz de Camões - Glória',
    'Praça Luiz de Camões - Glória, Rio de Janeiro - RJ, 24020-170, Brasil',
    -22.9213217,
    -43.1735273,
    true,
    'TRADICIONAL',
    700,
    '18:00',
    1183
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BANDA DO PERU PELADO', 'banda-do-peru-pelado', 'Av. Atlântica, 1976 - Copacabana, Rio de Janeiro - RJ, 22021-001, Brazil
Av. Atlântica, 2634 - Copacabana, Rio de Janeiro - RJ, 22041-001, Brazil
Av. Atlântica, 1976 - Copacabana, Rio de Janeiro - RJ, 22021-001, Brazil', '2009')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26670,
    '2026-02-17',
    '14:00',
    true,
    'Av. Atlântica',
    'Av. Atlântica, 1976 - Copacabana, Rio de Janeiro - RJ, 22021-001, Brazil',
    -22.9686198,
    -43.1810974,
    true,
    'TRADICIONAL',
    900,
    '18:00',
    1168
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BANDA DO RECREIO', 'banda-do-recreio', 'Criado em 2004 por um grupo de amigos apaixonados pela cultura do carnaval de rua, chegou a chegou a desfilar como Bloco Alegria do Recreio. Desde a sua criação, mantém viva a tradição dos antigos carnavais, com músicas que resgatam o samba de raiz e a essência da folia de rua carioca.', '2025')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26817,
    '2026-02-17',
    '13:00',
    true,
    'Av. Lúcio Costa',
    'Av. Lúcio Costa, 16360 - Recreio dos Bandeirantes, Rio de Janeiro - RJ, 22795-008, Brasil',
    -23.024379,
    -43.4565906,
    true,
    'TRADICIONAL',
    10000,
    '18:00',
    1228
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOQUEEN', 'bloqueen', 'O Bloqueen como o próprio nome sugere,  é uma homenagem à consagrada banda QUEEN! No repertório, músicas mundialmente famosas da banda inglesa, com versões antropofágicas e carnavalescas que celebram toda a diversidade e riqueza da música brasileira. Canções como “We Will Rock You”, “I Want to Break Free”, “We Are The Champions”, “Kind of Magic” e “Radio Gaga” se transformam em animados samba-reggaes, axés, afoxés, ijexás, maracatus, frevos, marchinhas e outros ritmos da nossa música.', '2022')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26685,
    '2026-02-17',
    '13:00',
    true,
    'Largo São Francisco de Paula',
    'Largo São Francisco de Paula, 49 - Centro, Rio de Janeiro - RJ, 20051-070, Brasil',
    -22.9052377,
    -43.1807499,
    true,
    'TRADICIONAL',
    1300,
    '18:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('GREMIO RECREATIVO BLOCO CARNAVALESCO EMPURRA QUE PEGA DO LEBLON', 'gremio-recreativo-bloco-carnavalesco-empurra-que-pega-do-leblon', 'Av. Delfim Moreira, 1034 - Leblon, Rio de Janeiro - RJ, 22441-000, Brasil
Av. Delfim Moreira, 286 - Leblon, Rio de Janeiro - RJ, 22441-000, Brasil', '1990')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26666,
    '2026-02-17',
    '13:00',
    true,
    'Av. Delfim Moreira',
    'Av. Delfim Moreira, 1034 - Leblon, Rio de Janeiro - RJ, 22441-000, Brasil',
    -22.9875358,
    -43.2259886,
    true,
    'TRADICIONAL',
    20000,
    '17:00',
    1200
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('RIO MARACATU', 'rio-maracatu', 'Com mais de vinte anos de história, o grupo de Maracatu mais antigo fora de toma às ruas do Rio.  ', '1998')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26686,
    '2026-02-17',
    '13:00',
    true,
    'R. do Rezende',
    'R. do Rezende, 17 - Lapa, Rio de Janeiro - RJ, 20231-013, Brasil',
    -22.9121304,
    -43.183188,
    true,
    'TRADICIONAL',
    950,
    '18:00',
    1198
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CARNAVALESCO TUDO NOSSO', 'bloco-carnavalesco-tudo-nosso', ' O Tudo Nosso faz seu cortejo pelas ruas do Engenho de Dentro, com início e encerramento no Galpão do Engenhão, na Rua José dos Reis.', '2018')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26671,
    '2026-02-17',
    '14:00',
    true,
    'Galpão do Engenhão - R. José dos Reis - Engenho de Dentro',
    'Galpão do Engenhão - R. José dos Reis - Engenho de Dentro, Rio de Janeiro - RJ, 20755, Brasil',
    -22.8937004,
    -43.294743,
    true,
    'TRADICIONAL',
    100,
    '19:00',
    1175
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO ENXOTA QUE EU VOU', 'bloco-enxota-que-eu-vou', 'O bloco Enxota Que Eu Vou foi criado em 2010 em uma reunião na Pedra do Sal, berço do samba na Gamboa. Em seu desfile, o bloco tem a proposta de resgatar a cultura e preservar a música brasileira, num ambiente livre e acolhedor de Carnaval.', '2010')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26662,
    '2026-02-17',
    '15:00',
    true,
    'PRAÇA TIRADENTES',
    'PRAÇA TIRADENTES',
    -22.9072348,
    -43.182463,
    true,
    'TRADICIONAL',
    500,
    '19:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO SAMBA DE CABOCLO', 'bloco-samba-de-caboclo', 'R. Figueiredo Camargo, 331 - Padre Miguel, Rio de Janeiro - RJ, 21875-020, Brasil
R. F Iapi, 300 - Padre Miguel, Rio de Janeiro - RJ, 21721-000, Brasil', '2026')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26812,
    '2026-02-17',
    '15:00',
    true,
    'R. Figueiredo Camargo',
    'R. Figueiredo Camargo, 331 - Padre Miguel, Rio de Janeiro - RJ, 21875-020, Brasil',
    -22.8715926,
    -43.4550227,
    true,
    'TRADICIONAL',
    2000,
    '17:00',
    1212
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('EMBALO DO ENGENHO NOVO', 'embalo-do-engenho-novo', 'R. Manuela Barbosa, 10 - Méier, Rio de Janeiro - RJ, 20735-110, Brasil
R. Dias da Cruz, 279 - Méier, Rio de Janeiro - RJ, 20720-010, Brasil', '2025')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26815,
    '2026-02-17',
    '16:00',
    true,
    'R. Manuela Barbosa',
    'R. Manuela Barbosa, 10 - Méier, Rio de Janeiro - RJ, 20735-110, Brasil',
    -22.9020295,
    -43.2811372,
    true,
    'TRADICIONAL',
    500,
    '20:00',
    1209
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('SE ME DER, EU COMO!', 'se-me-der-eu-como', 'Nascido em 2003, na Rua do Matoso, o Bloco Recreativo Comunitário Se Me Der, Eu Como! desfila anualmente espalhando folia nas ruas da Tijuca.', '2004')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26659,
    '2026-02-17',
    '15:00',
    true,
    'Praça Medalha Milagrosa - Praça da Medalha Milagrosa - Rio Comprido',
    'Praça Medalha Milagrosa - Praça da Medalha Milagrosa - Rio Comprido, Rio de Janeiro - RJ, 20270-135, Brasil',
    -22.9161995,
    -43.2125984,
    true,
    'TRADICIONAL',
    600,
    '20:00',
    1232
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('SEREIAS DA GUANABARA', 'sereias-da-guanabara', 'O bloco desfila no Flamengo na terça-feira de Carnaval. Com previsão de público de 1000 pessoas, o bloco é voltado para o público LGBTI', '2017')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26646,
    '2026-02-17',
    '15:00',
    true,
    'Praia do Flamengo',
    'Praia do Flamengo, 340 - Flamengo, Rio de Janeiro - RJ, 22210-030, Brasil',
    -22.9364014,
    -43.1744786,
    true,
    'LGBTQIAPN+',
    999,
    '20:00',
    1178
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('ASSOCIAÇÃO BLOCO CARNAVALESCO CORNOS E SIMPATIZANTES', 'associacao-bloco-carnavalesco-cornos-e-simpatizantes', 'O Bloco Cornos e Simpatizantes desfila com muita diversão pelas ruas de Manguinhos.', '2007')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26647,
    '2026-02-17',
    '17:00',
    true,
    'Av. dos Democráticos',
    'Av. dos Democráticos, 30 - Manguinhos, Rio de Janeiro - RJ, 20050-000, Brasil',
    -22.8828636,
    -43.2534919,
    true,
    'TRADICIONAL',
    200,
    '21:00',
    1206
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CARNAVALESCO TEIMOSOS DO MARACANÃ', 'bloco-carnavalesco-teimosos-do-maracana', 'O bairro do Maracanã não é conhecido somente pelo estádio mais famoso do mundo. Lá, tem carnaval sim senhor. E um dos blocos que animam é o Teimosos do Maracanã.', '2019')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26665,
    '2026-02-17',
    '17:00',
    true,
    'R. Visc. de Itamarati',
    'R. Visc. de Itamarati, 42 - Maracanã, Rio de Janeiro - RJ, 20550-140, Brasil',
    -22.9156396,
    -43.2307967,
    true,
    'TRADICIONAL',
    200,
    '20:00',
    1207
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CULTURAL PEGADA DE MALANDRO', 'bloco-cultural-pegada-de-malandro', 'R. Figueiredo Camargo, 351 - Bangu, Rio de Janeiro - RJ, 21875-020, Brasil
R. Figueiredo Camargo, 110 - Padre Miguel, Rio de Janeiro - RJ, 21875-020, Brasil', '2023')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26675,
    '2026-02-17',
    '17:00',
    true,
    'R. Figueiredo Camargo',
    'R. Figueiredo Camargo, 351 - Bangu, Rio de Janeiro - RJ, 21875-020, Brasil',
    -22.8715878,
    -43.4554129,
    true,
    'RELIGIOSO',
    300,
    '19:00',
    1154
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DO LIMÃO DO PICARETA', 'bloco-do-limao-do-picareta', 'Batizado em 2005, o bloco sai desde 1974 pelas ruas do bairro de Honório Gurgel, na Zona Norte da cidade, garantindo a diversão de toda a família.', '1974')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26644,
    '2026-02-17',
    '17:00',
    true,
    'R. JURUBAIBA - HONÓRIO GURGEL',
    'R. JURUBAIBA - HONÓRIO GURGEL, RIO DE JANEIRO - RJ, BRASIL',
    -22.8534203,
    -43.3587744,
    true,
    'TRADICIONAL',
    300,
    '21:00',
    1187
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DOS PRIMOS', 'bloco-dos-primos', 'Na terça-feira de carnaval, o bloco dos Primos realiza seu desfile sob um clima familiar e cheio de afeto. A concentração é na Rua Dona Polucena, às 16h.', '2014')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26687,
    '2026-02-17',
    '16:00',
    true,
    'R. Dr. Aristão',
    'R. Dr. Aristão, 108 - Paquetá, Rio de Janeiro - RJ, 20397-135, Brasil',
    -22.7569176,
    -43.1099829,
    true,
    'TRADICIONAL',
    500,
    '21:00',
    1226
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('G.R.B.C.PERU DO MÉIER', 'g-r-b-c-peru-do-meier', 'R. Manuela Barbosa, 12 - Méier, Rio de Janeiro - RJ, 20735-110, Brasil
R. Dias da Cruz, 434 - Méier, Rio de Janeiro - RJ, 20720-012, Brasil
R. Manuela Barbosa, 12 - Méier, Rio de Janeiro - RJ, 20735-110, Brasil', '2023')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26680,
    '2026-02-17',
    '17:00',
    true,
    'R. Manuela Barbosa',
    'R. Manuela Barbosa, 12 - Méier, Rio de Janeiro - RJ, 20735-110, Brasil',
    -22.9019408,
    -43.2811885,
    true,
    'TRADICIONAL',
    400,
    '21:00',
    1209
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('GREMIO RECREATIVO BLOCO CARNAVALESCO EMBALO DE SANTA TERESA', 'gremio-recreativo-bloco-carnavalesco-embalo-de-santa-teresa', 'O Bloco de Santa Teresa, um dos bairros mais charmosos do Rio, vai se concentrar na Rua Almirante Alexandrino, de onde segue pelas ruas do bairro. Milhares de foliões devem acompanhar o cortejo!', '2002')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26678,
    '2026-02-17',
    '16:00',
    true,
    'R. Alm. Alexandrino',
    'R. Alm. Alexandrino, 1250 - Santa Teresa, Rio de Janeiro - RJ, 20241-260, Brasil',
    -22.9247158,
    -43.188663,
    true,
    'TRADICIONAL',
    800,
    '19:00',
    1237
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('LARGO DO MACHADO, MAS NÃO LARGO DO COPO', 'largo-do-machado-mas-nao-largo-do-copo', 'Utilize o transporte público por Metrô! Priorize a estação LARGO DO MACHADO  para ir e voltar do bloco.

As  marchinhas antigas que  passam de geração a geração são a inspiração do bloco Largo do Machado, Mas Não Largo do Copo.  Fundado em 2007, os seguidores não largam do copo, é claro, e nem do samba no pé. E dá-lhe carnaval!', '2007')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26656,
    '2026-02-17',
    '17:00',
    true,
    'Largo do Machado',
    'Largo do Machado, 19 - Catete, Rio de Janeiro - RJ, 22221-020, Brasil',
    -22.9313018,
    -43.1784306,
    true,
    'TRADICIONAL',
    900,
    '21:00',
    1164
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('ORQUESTRA VOADORA', 'orquestra-voadora', 'Utilize o transporte público por Metrô! Priorize a estação GLÓRIA para ir e voltar do bloco.

Um dos blocos mais bonitos da cidade, a Orquestra Voadora reúne um pesado naipe de metais, além de pernas de pau e um colorido que toma conta do Aterro do Flamengo na terça-feira de carnaval', '2009')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26683,
    '2026-02-17',
    '16:00',
    true,
    'Av. Infante Dom Henrique',
    'Av. Infante Dom Henrique, 735 - Glória, Rio de Janeiro - RJ, 20021-140, Brasil',
    -22.9202671,
    -43.1700177,
    true,
    'TRADICIONAL',
    40000,
    '19:00',
    1183
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('ASSOCIAÇÃO CARNAVALESCA BANDA DAS QUENGAS', 'associacao-carnavalesca-banda-das-quengas', 'Fundada em 1990, a Banda das Quengas é um bloco LGBTQIA+ que desfila pelas ruas da Lapa, no Rio de Janeiro. O bloco surgiu sob o comando de Juares Moraes e Tbengston Martins, com inspiração na personagem da atriz Joana Fomm na novela Tieta, cujo bordão era “quenga”. Com mais de 30 anos de existência e resistência, o grupo celebra o melhor da inclusão na festa mais diversa do mundo, enfatizando o respeito às diferenças e a todos os gêneros. Porque as ‘quengas’ merecem e devem existir!', '1990')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26682,
    '2026-02-17',
    '18:00',
    true,
    'RUA WASHINGTON LUIZ 10',
    'RUA WASHINGTON LUIZ 10',
    -22.9124486,
    -43.1868301,
    true,
    'LGBTQIAPN+',
    15000,
    '22:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BANDA DA GLÓRIA', 'banda-da-gloria', 'Bloco tradicional, que se apresenta na terça-feira gorda, na Rua da Glória, arrastando centenas de foliões.', '1974')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26645,
    '2026-02-17',
    '17:00',
    true,
    'R. da Glória',
    'R. da Glória, 190, 502 - Glória, Rio de Janeiro - RJ, 20241-180, Brasil',
    -22.9187876,
    -43.177327,
    true,
    'TRADICIONAL',
    800,
    '21:00',
    1183
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BANDA DA SAENS PENA', 'banda-da-saens-pena', 'Fundada em 2006, tradicionalmente agita os foliões no Carnaval de Rua do Rio de Janeiro. O bloco acontece na própria praça, próximo à Rua General Roca.', '2005')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26649,
    '2026-02-17',
    '17:00',
    true,
    'R. Dr. Pereira dos Santos',
    'R. Dr. Pereira dos Santos, 6854 - Tijuca, Rio de Janeiro - RJ, 20520-170, Brazil',
    -22.9251566,
    -43.2330547,
    true,
    'TRADICIONAL',
    980,
    '22:00',
    1247
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DO GALHO', 'bloco-do-galho', 'O Bloco do Galho tem um desfile tradicional e familiar no bairro de Guaratiba, na Zona Oeste do Rio de Janeiro.', '1979')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26673,
    '2026-02-17',
    '17:00',
    true,
    'R. Abílio Barreto',
    'R. Abílio Barreto, 170 - Guaratiba, Rio de Janeiro - RJ, 23036-090, Brasil',
    -22.936581,
    -43.5796207,
    true,
    'TRADICIONAL',
    900,
    '22:00',
    1185
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DO LIMÃO DE JARDIM AMÉRICA DO RIO DE JANEIRO', 'bloco-do-limao-de-jardim-america-do-rio-de-janeiro', 'O Bloco Do Limão desfila tradicionalmente todos os anos desde 2010, atraindo e levando foliões pelo bairro de Jardim América, na Zona Norte do Rio de Janeiro.', '2010')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26660,
    '2026-02-17',
    '18:00',
    true,
    'R. Monsenhor Castelo Branco',
    'R. Monsenhor Castelo Branco, 336 - Jardim America, Rio de Janeiro - RJ, 21240-190, Brasil',
    -22.8098273,
    -43.3273664,
    true,
    'TRADICIONAL',
    500,
    '22:00',
    1193
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO GAMBÁ CHEIROSO', 'bloco-gamba-cheiroso', 'O Gambá Cheiroso é um bloco formado por moradores do condomínio RIO2, no bairro de Jacarepaguá. O que surgiu de um desejo de ter um bloco próprio de carnaval já se tornou um patrimônio da família e amigos.', '2017')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26643,
    '2026-02-17',
    '17:00',
    true,
    'R. Bruno Giorgi',
    'R. Bruno Giorgi, s/n - Barra Olímpica, Rio de Janeiro - RJ, 22775-054, Brasil',
    -22.9717692,
    -43.3856253,
    true,
    'TRADICIONAL',
    900,
    '22:00',
    1315
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO TRIBO CACUIA', 'bloco-tribo-cacuia', 'Rua Sargento João Lópes, 54 - Cacuia, Rio de Janeiro - RJ, 21931-420, Brasil
Estr. da Cacuia, 280 - Cacuia, Rio de Janeiro - RJ, 21921-000, Brasil', '2001')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26653,
    '2026-02-17',
    '17:00',
    true,
    'Rua Sargento João Lópes',
    'Rua Sargento João Lópes, 54 - Cacuia, Rio de Janeiro - RJ, 21931-420, Brasil',
    -22.8111944,
    -43.1914056,
    true,
    'TRADICIONAL',
    900,
    '21:00',
    1161
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('ULTIMO GOLE', 'ultimo-gole', 'O bloco se auto-declara 100% carioca, toca samba tradicionais que agradam a todos os foliões e anima a galera da Lagoa Rodrigo de Freitas, Zona Sul do Rio. Mesmo sendo formado por cariocas, claro que todo mundo é muito bem-vindo! Afinal, carnaval é democracia.', '1996')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26663,
    '2026-02-17',
    '17:00',
    true,
    'Praça Santos Dumont',
    'Praça Santos Dumont, 100 - Gávea, Rio de Janeiro - RJ, 22470-060, Brasil',
    -22.9736179,
    -43.2271888,
    true,
    'TRADICIONAL',
    950,
    '22:00',
    1182
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCK N ROLL', 'block-n-roll', 'Rua Fernandes da Fonseca, 33 - Ribeira, Rio de Janeiro - RJ, 21930-100, Brasil', '2009')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26835,
    '2026-02-17',
    '18:00',
    true,
    'Rua Fernandes da Fonseca',
    'Rua Fernandes da Fonseca, 33 - Ribeira, Rio de Janeiro - RJ, 21930-100, Brasil',
    -22.8246596,
    -43.1695311,
    true,
    'TRADICIONAL',
    2000,
    '22:00',
    1230
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CARNAVALESCO AMIGOS DA MOCIDADE', 'bloco-carnavalesco-amigos-da-mocidade', 'Nas ruas de Bangu e Padre Miguel, o bloco Amigos da Mocidade desfila ao som de sambas históricos e músicas carnavalescas, para um público estimado em mil pessoas. ', '2018')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26684,
    '2026-02-17',
    '19:00',
    true,
    'R. Figueiredo Camargo',
    'R. Figueiredo Camargo, 292A - Bangu, Rio de Janeiro - RJ, 21875-020, Brasil',
    -22.8714361,
    -43.4544628,
    true,
    'TRADICIONAL',
    500,
    '22:00',
    1154
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO FOLIÕES DO VERDUN', 'bloco-folioes-do-verdun', 'Largo do Verdun - Grajau, Rio de Janeiro - RJ, 20540-004, Brasil', '2002')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-17
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26641,
    '2026-02-17',
    '18:00',
    true,
    'Largo do Verdun - Grajau',
    'Largo do Verdun - Grajau, Rio de Janeiro - RJ, 20540-004, Brasil',
    -22.9232888,
    -43.2567509,
    true,
    'TRADICIONAL',
    100,
    '22:00',
    1184
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO MULHERES RODADAS', 'bloco-mulheres-rodadas', 'Utilize o transporte público por Metrô! Priorize a estação LARGO DO MACHADO  para ir e voltar do bloco.', '2026')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-18
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26821,
    '2026-02-18',
    '09:00',
    true,
    'Largo do Machado - Catete',
    'Largo do Machado - Catete, Rio de Janeiro - RJ, 22220-001, Brazil',
    -22.9311144,
    -43.1784923,
    true,
    'TRADICIONAL',
    4000,
    '12:00',
    1164
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CARNAVALESCO AINDA AGUENTO', 'bloco-carnavalesco-ainda-aguento', 'Já pulou bastante Carnaval, mas não quer parar? O bloco ‘Ainda Aguento’ é pra você que deu uma cansadinha, mas ainda aguenta ficar na festa e se jogar na folia!', '2008')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-18
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26690,
    '2026-02-18',
    '12:00',
    true,
    'Praia Da Engenhoca',
    'Praia Da Engenhoca, 151 - Ribeira, Rio de Janeiro - RJ, 21930-140, Brasil',
    -22.8215369,
    -43.1709439,
    true,
    'TRADICIONAL',
    200,
    '16:00',
    1230
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('CORDÃO DO ME ENTERRA NA QUARTA', 'cordao-do-me-enterra-na-quarta', 'Av. Augusto Severo, 64 - Centro, Rio de Janeiro - RJ, 20021-040, Brasil
Av. Augusto Severo, 2516 - Glória, Rio de Janeiro - RJ, 20021-040, Brasil
Praça Edson Cortes - Av. Augusto Severo - Glória, Rio de Janeiro - RJ, 20241-180, Brasil', '2004')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-18
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26691,
    '2026-02-18',
    '15:00',
    true,
    'Av. Augusto Severo',
    'Av. Augusto Severo, 64 - Centro, Rio de Janeiro - RJ, 20021-040, Brasil',
    -22.914862,
    -43.1766139,
    true,
    'TRADICIONAL',
    8000,
    '19:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('PLANTA NA MENTE', 'planta-na-mente', 'Levantando a bandeira da legalização da maconha e o respeito à diversidade, o direito ao trabalho digno e os valores democráticos, a folia que rola na Lapa, bairro tradicional da boemia do Rio, fica por conta das marchinhas de carnaval bem humoradas, que também servem como gritos de liberdade e transformação. ', '2010')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-18
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26689,
    '2026-02-18',
    '16:00',
    true,
    'Praça Cardeal Câmara',
    'Praça Cardeal Câmara, 71 - Lapa, Rio de Janeiro - RJ, 20230-110, Brasil',
    -22.9122354,
    -43.1797236,
    true,
    'TRADICIONAL',
    2000,
    '20:00',
    1198
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO GURI DA MERCK', 'bloco-guri-da-merck', 'Fundado em 2013, é uma homenagem aos poetas de Mangueira, cujo objetivo visa a salvaguarda das Matrizes do Samba Carioca.', '2014')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-18
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26692,
    '2026-02-18',
    '17:00',
    true,
    'Albert Sabin Praça da - Taquara',
    'Albert Sabin Praça da - Taquara, Rio de Janeiro - RJ, 22710-390, Brasi',
    -22.9332266,
    -43.3683655,
    true,
    'TRADICIONAL',
    400,
    '22:00',
    1245
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('GREMIO RECREATIVO CHAVE DE OURO', 'gremio-recreativo-chave-de-ouro', 'Um dos mais tradicionais da cidade, o bloco Chave de Ouro desfila pelas ruas do Engenho de Dentro desde 1943, com uma história de resistência à repressão durante a ditadura militar, nas décadas de 60 e 70. Também conhecido como bloco de malandros, toca sambas de enredo, axé, marchinha, sertanejo, entre outros ritmos brasileiros.', '2025')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-18
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26820,
    '2026-02-18',
    '18:00',
    true,
    'R. Ana Leonidia',
    'R. Ana Leonidia, 85 - Engenho de Dentro, Rio de Janeiro - RJ, 20730-390, Brasil',
    -22.9012637,
    -43.2951491,
    true,
    'TRADICIONAL',
    200,
    '22:00',
    1175
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('B.C. URUBU MALANDRO', 'b-c-urubu-malandro', 'A folia acontece no Largo da Prainha com a alegria do B.C. Urubu Malandro.', '2012')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-20
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26693,
    '2026-02-20',
    '18:00',
    true,
    'Largo São Francisco da Prainha',
    'Largo São Francisco da Prainha, 4 - Saúde, Rio de Janeiro - RJ, 20081-270, Brasil',
    -22.8978234,
    -43.1843659,
    true,
    'TRADICIONAL',
    350,
    '22:00',
    1241
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DA ANITTA', 'bloco-da-anitta', 'Utilize o transporte público por Metrô! Priorize a estação CARIOCA para ir e voltar do bloco.

Criado pela musa Anitta e antes conhecido como Bloco das Poderosas, o Bloco da Anitta desfila pelo Rio de Janeiro desde 2016. Bloco que reverencia o melhor da música, o desfile celebra a diversidade em todos os sentidos. ', '2016')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-21
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26696,
    '2026-02-21',
    '09:00',
    true,
    'R. Primeiro de Março',
    'R. Primeiro de Março, 33 - Centro, Rio de Janeiro - RJ, 20010-000, Brasil',
    -22.9023308,
    -43.17607,
    true,
    'MEGA BLOCO',
    100000,
    '12:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO SEM SAÍDA', 'bloco-sem-saida', 'Seu primeiro desfile ocorreu em 2009. Desde então, o bloco investe no resgate do Carnaval do Rio Antigo, com marchinhas e muito samba. A alegria é garantida para toda a família.', '2009')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-21
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26704,
    '2026-02-21',
    '10:00',
    true,
    'R. Gen. Severiano',
    'R. Gen. Severiano, 52 - Botafogo, Rio de Janeiro - RJ, 22290-040, Brasil',
    -22.9523522,
    -43.1763891,
    true,
    'TRADICIONAL',
    900,
    '14:00',
    1158
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCONCE', 'bloconce', 'Calçadão da Praia do Flamengo, 484 - Flamengo, Rio de Janeiro - RJ, Brasil', '2026')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-21
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26823,
    '2026-02-21',
    '10:00',
    true,
    'Calçadão da Praia do Flamengo',
    'Calçadão da Praia do Flamengo, 484 - Flamengo, Rio de Janeiro - RJ, Brasil',
    -22.9345052,
    -43.1717463,
    true,
    'TRADICIONAL',
    900,
    '14:00',
    1178
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BAFAFA', 'bafafa', 'Praça São Salvador, 6 - Laranjeiras, Rio de Janeiro - RJ, 22231-170, Brasil', '2003')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-21
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26695,
    '2026-02-21',
    '11:00',
    true,
    'Praça São Salvador',
    'Praça São Salvador, 6 - Laranjeiras, Rio de Janeiro - RJ, 22231-170, Brasil',
    -22.9337607,
    -43.1799996,
    true,
    'TRADICIONAL',
    300,
    '16:00',
    1199
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('CHULÉ DE SANTA', 'chule-de-santa', 'Com estimativa de público de 300 pessoas, o Chulé de Santa é mais um dos blocos a exaltar a felicidade por Santa Teresa. ', '2017')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-21
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26698,
    '2026-02-21',
    '13:00',
    true,
    'R. Joaquim Murtinho',
    'R. Joaquim Murtinho, 2012 - Santa Teresa, Rio de Janeiro - RJ, 20241-320, Brazil',
    -22.9188108,
    -43.1832138,
    true,
    'TRADICIONAL',
    300,
    '18:00',
    1237
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('O BLOCO - FAROESTE CABLOCO', 'o-bloco-faroeste-cabloco', 'Bloco temático que homenageia a banda Legião urbana, uma das mais importantes do pop rock nacional dos anos 1980', '2024')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-21
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26822,
    '2026-02-21',
    '13:00',
    true,
    'Praça Cmte. Xavier de Brito',
    'Praça Cmte. Xavier de Brito, 18 - Tijuca, Rio de Janeiro - RJ, 20511-400, Brasil',
    -22.9314267,
    -43.243733,
    true,
    'TRADICIONAL',
    800,
    '18:00',
    1247
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('SE ESSA RUA FOSSE MINHA', 'se-essa-rua-fosse-minha', 'O bloco nasceu para alimentar ainda mais o espírito carnavalesco entre os moradores da região do Carmo/Sion!', '2015')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-21
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26711,
    '2026-02-21',
    '13:00',
    true,
    'PRAÇA SANDRO MOREIRA RUA MARQUÊS DE ABRANTES',
    'PRAÇA SANDRO MOREIRA RUA MARQUÊS DE ABRANTES, 100',
    -22.9368247,
    -43.178054,
    true,
    'TRADICIONAL',
    500,
    '17:00',
    1178
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BERÇO DO SAMBA', 'berco-do-samba', 'Com a promessa de ser “a cara do Rio”, o bloco Berço do Samba traz toda a raiz do tradicional carnaval carioca, homenageando sambistas que fizeram história nos desfiles pela Lapa, tradicional bairro boêmio do Rio de Janeiro.', '2005')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-21
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26710,
    '2026-02-21',
    '14:00',
    true,
    'Av. Mem de Sá',
    'Av. Mem de Sá, 41 - Lapa, Rio de Janeiro - RJ, 20230-150, Brasil',
    -22.9137877,
    -43.1788552,
    true,
    'TRADICIONAL',
    900,
    '19:00',
    1198
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('G.R.B.C. BLOCO DO PLAYMOBIL', 'g-r-b-c-bloco-do-playmobil', 'RUA ARTUR MAGIOLI 42', '2023')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-21
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26706,
    '2026-02-21',
    '15:00',
    true,
    'RUA ARTUR MAGIOLI 42',
    'RUA ARTUR MAGIOLI 42',
    -22.804129,
    -43.189717,
    true,
    'TRADICIONAL',
    1000,
    '17:00',
    1195
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('ALEGRIA DA REPÚBLICA ( MOVIMENTO CULTURAL ALEGRIA DA REPÚBLICA DO RIO', 'alegria-da-republica-movimento-cultural-alegria-da-republica-do-rio', 'R. dos Inválidos, 1 - Centro, Rio de Janeiro - RJ, 20231-043, Brasil
R. do Senado, 153 - Centro, Rio de Janeiro - RJ, 20231-003, Brasil
R. Ubaldino do Amaral, 98 - Centro, Rio de Janeiro - RJ, 20231-016, Brasil
Av. Henrique Valadares, 3 - Loja D - Lapa, Rio de Janeiro - RJ, 20231-030, Brasil
R. dos Inválidos, 1 - Centro, Rio de Janeiro - RJ, 20231-043, Brasil', '2016')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-21
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26697,
    '2026-02-21',
    '15:00',
    true,
    'R. dos Inválidos',
    'R. dos Inválidos, 1 - Centro, Rio de Janeiro - RJ, 20231-043, Brasil',
    -22.9084967,
    -43.1858347,
    true,
    'TRADICIONAL',
    800,
    '20:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DOS CACHAÇAS', 'bloco-dos-cachacas', 'A orla da Barra da Tijuca vai se encher de alegria no último sábado de carnaval com o desfile do Bloco dos Cachaças', '2008')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-21
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26694,
    '2026-02-21',
    '15:00',
    true,
    'AV. LÚCIO COSTA',
    'AV. LÚCIO COSTA, 3604 - BARRA DA TIJUCA, RIO DE JANEIRO - RJ, 22630-010, BRASIL',
    -23.0103884,
    -43.3331167,
    true,
    'TRADICIONAL',
    500,
    '20:00',
    1155
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO SUPERBACANA', 'bloco-superbacana', 'Bloco traz toda a riqueza e diversidade das músicas da Tropicália, com uma banda composta por mais de dez instrumentistas. As inspirações vêm de Caetano Veloso, Gilberto Gil, Os Mutantes, Tom Zé, Gal Costa, Jorge Ben Jor e Rogério Duprat, entre outros.', '2018')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-21
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26708,
    '2026-02-21',
    '15:00',
    true,
    'Praça Luiz de Camões - Glória',
    'Praça Luiz de Camões - Glória, Rio de Janeiro - RJ, 24020-170, Brasil',
    -22.9213217,
    -43.1735273,
    true,
    'TRADICIONAL',
    2500,
    '18:00',
    1183
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO PELA SACO', 'bloco-pela-saco', 'O Bloco Carnavalesco Pela Saco faz uma grande festa nas ruas do bairro de Botafogo, na Zona Sul do Rio, com seu cortejo de Carnaval. O ponto de partida é a Praça Tião Belo.', '2001')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-21
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26709,
    '2026-02-21',
    '17:00',
    true,
    'Praça Tião Belo - R. São Clemente',
    'Praça Tião Belo - R. São Clemente, 306 - Botafogo, Rio de Janeiro - RJ, 22260-004, Brasil',
    -22.9503556,
    -43.1922258,
    true,
    'TRADICIONAL',
    900,
    '21:00',
    1158
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('CARAXUÉ', 'caraxue', 'Além de desfrutar de uma vista maravilhosa, os foliões que vão atrás do bloco ‘’Unidos do Caraxué’’, podem contar um desfile pra lá de animado em Paquetá. E ainda podem curtir o trajeto feito de barca até a região!  ', '2015')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-21
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26700,
    '2026-02-21',
    '16:00',
    true,
    'R. Cerqueira',
    'R. Cerqueira, 74 - Paquetá, Rio de Janeiro - RJ, 20397-110, Brasil',
    -22.7521377,
    -43.1060318,
    true,
    'TRADICIONAL',
    100,
    '19:00',
    1226
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('MULHERES DE CHICO', 'mulheres-de-chico', 'Com as cores vermelho e rosa no seu estandarte, o Mulheres de Chico faz seu carnaval seguindo o estilo ''concentra mas não sai''. Com muita alegria ao som das canções de Chico Buarque de Holanda, as batuqueiras conquistaram públicos de idades e perfis variados, com charme, animação, figurinos e adereços alegres e descontraídos.', '2007')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-21
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26703,
    '2026-02-21',
    '17:00',
    true,
    'Praça Alm. Júlio de Noronha',
    'Praça Alm. Júlio de Noronha, 86 - Leme, Rio de Janeiro - RJ, 22010-020, Brasil',
    -22.9623025,
    -43.1653886,
    true,
    'TRADICIONAL',
    20000,
    '20:00',
    1201
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('ASSOCIAÇÃO CARNAVALESCA BLOCO SEPULTA CARNAVAL', 'associacao-carnavalesca-bloco-sepulta-carnaval', 'Bloco de embalo que encerra o carnaval do bairro do Engenho de Dentro.', '2003')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-21
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26707,
    '2026-02-21',
    '18:00',
    true,
    'R. Ana Leonidia',
    'R. Ana Leonidia, 190 - Engenho de Dentro, Rio de Janeiro - RJ, 20730-390, Brasil',
    -22.9003858,
    -43.2978787,
    true,
    'TRADICIONAL',
    1100,
    '22:00',
    1175
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO DA RESSACA', 'bloco-da-ressaca', 'O Bloco da Ressaca é mais um para animar a turma de Guaratiba, que também não abre mão de uma boa folia.', '2013')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-21
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26701,
    '2026-02-21',
    '18:00',
    true,
    'Rua Barros de Alarcão',
    'Rua Barros de Alarcão, 464 - Pedra de Guaratiba, Rio de Janeiro - RJ, 23027-340, Brasil',
    -23.0026844,
    -43.6411632,
    true,
    'TRADICIONAL',
    800,
    '22:00',
    1215
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('SUFRIDUS DE COPACABANA', 'sufridus-de-copacabana', 'No mesmo clima divertido e irreverente no nome do bloco, o Sufridos de Copacabana prevê animar cerca de 300 foliões na Praça Manuel Campo da Paz (Praça Inhangá). ', '2009')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-21
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26699,
    '2026-02-21',
    '17:00',
    true,
    'PRAÇA MANUEL CAMPOS DA PAZ (PRAÇA INHANGÁ)',
    'PRAÇA MANUEL CAMPOS DA PAZ (PRAÇA INHANGÁ)',
    -22.9660201,
    -43.1813039,
    true,
    'TRADICIONAL',
    300,
    '22:00',
    1168
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('G.R.B.C SÓ CACHAÇA', 'g-r-b-c-so-cachaca', 'O sábado de pós-Carnaval é dele! Assim, o Só Cachaça abraça a alegria dos foliões já saudosos do Momo pelo Santo Cristo. ', '2016')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-21
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26702,
    '2026-02-21',
    '18:00',
    true,
    'R. Guapi',
    'R. Guapi, 13 - Santo Cristo, Rio de Janeiro - RJ, 20220-650, Brasil',
    -22.9048808,
    -43.2024918,
    true,
    'TRADICIONAL',
    1000,
    '22:00',
    1239
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('MONOBLOCO', 'monobloco', 'Utilize o transporte público por Metrô! Priorize a estação CARIOCA para ir e voltar do bloco.

Um dos maiores símbolos do Carnaval do Rio, o "Monobloco" é conhecido por incorporar diversos ritmos e estilos musicais ao compasso do samba. Seu repertório eclético inclui as tradicionais marchinhas de João Roberto Kelly, o samba de Cartola e Clara Nunes, passando pelo xote de Alceu Valença, o forró de Luiz Gonzaga, o funk de Ludmilla, o pop de Anitta, até músicas de Paralamas do Sucesso, Raul Seixas e Tim Maia. É diversão garantida para todos!', '2000')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-22
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26715,
    '2026-02-22',
    '09:00',
    true,
    'R. Primeiro de Março',
    'R. Primeiro de Março, 33 - Centro, Rio de Janeiro - RJ, 20010-000, Brasil',
    -22.9023308,
    -43.17607,
    true,
    'MEGA BLOCO',
    80000,
    '12:00',
    1165
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO LITTLE BE', 'bloco-little-be', 'R. Visc. de Pirajá, 356 - Ipanema, Rio de Janeiro - RJ, 22410-002, Brasil', '2026')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-22
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26826,
    '2026-02-22',
    '09:00',
    true,
    'R. Visc. de Pirajá',
    'R. Visc. de Pirajá, 356 - Ipanema, Rio de Janeiro - RJ, 22410-002, Brasil',
    -22.9838066,
    -43.2056064,
    true,
    'INFANTIL',
    2000,
    '14:00',
    1190
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('CONDOMÍNIO HABITACIONAL BARANGAL', 'condominio-habitacional-barangal', 'Av. Vieira Souto, 9 - Ipanema, Rio de Janeiro - RJ, 22420-030, Brasil
Av. Vieira Souto, S/N - Ipanema, Rio de Janeiro - RJ, 22420-002, Brasil
Av. Vieira Souto, 9 - Ipanema, Rio de Janeiro - RJ, 22420-030, Brasil', '2002')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-22
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26718,
    '2026-02-22',
    '10:00',
    true,
    'Av. Vieira Souto',
    'Av. Vieira Souto, 9 - Ipanema, Rio de Janeiro - RJ, 22420-030, Brasil',
    -22.9867767,
    -43.2041628,
    true,
    'TRADICIONAL',
    100,
    '14:00',
    1190
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('FILHOS DA PUC', 'filhos-da-puc', 'Av. Delfim Moreira, 1111 - Leblon, Rio de Janeiro - RJ, 22441-000, Brasil
Av. Delfim Moreira, 299 - Leblon, Rio de Janeiro - RJ, 22441-000, Brasil', '2026')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-22
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26824,
    '2026-02-22',
    '10:00',
    true,
    'Av. Delfim Moreira',
    'Av. Delfim Moreira, 1111 - Leblon, Rio de Janeiro - RJ, 22441-000, Brasil',
    -22.9879856,
    -43.2259236,
    true,
    'TRADICIONAL',
    20000,
    '14:00',
    1200
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CARNAVALESCO UNIÃO DOS BLOCOS DA ILHA DO GOVERNADOR', 'bloco-carnavalesco-uniao-dos-blocos-da-ilha-do-governador', 'O bloco desfila no domingo pós-carnaval pelas ruas da Ribeira, na ILha do Governador', '2010')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-22
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26722,
    '2026-02-22',
    '11:00',
    true,
    'Rua Fernandes da Fonseca',
    'Rua Fernandes da Fonseca, 84 - Ribeira, Rio de Janeiro - RJ, 21930-100, Brasil',
    -22.824531,
    -43.169342,
    true,
    'TRADICIONAL',
    1000,
    '15:00',
    1230
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('REPÚBLICA  SUBURBANA', 'republica-suburbana', 'R. Soares Caldeira, 115 - Madureira, Rio de Janeiro - RJ, 21351-080, Brasil', '2023')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-22
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26723,
    '2026-02-22',
    '11:00',
    true,
    'R. Soares Caldeira',
    'R. Soares Caldeira, 115 - Madureira, Rio de Janeiro - RJ, 21351-080, Brasil',
    -22.8698081,
    -43.3398574,
    true,
    'TRADICIONAL',
    950,
    '16:00',
    1203
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('QUEM VAI VAI, QUEM NÃO VAI NÃO CAGUETA!', 'quem-vai-vai-quem-nao-vai-nao-cagueta', 'O bloco desfila pelas ruas do Jardim Guanabara, na Ilha do Governador, no domingo pós-carnaval', '2010')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-22
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26712,
    '2026-02-22',
    '12:00',
    true,
    'Praça Jerusalém',
    'Praça Jerusalém, 8 - Jardim Guanabara, Rio de Janeiro - RJ, 21940-460, Brasil',
    -22.8186607,
    -43.200184,
    true,
    'TRADICIONAL',
    7000,
    '17:00',
    1196
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO AÍ SIM!', 'bloco-ai-sim', 'Forfun no Carnaval? Aí sim! É tocando as músicas do grupo, misturadas com samba, maculelê, funk, maracatu e mais, o Bloco Aí Sim faz homenagem à banda.', '2017')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-22
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26714,
    '2026-02-22',
    '14:00',
    true,
    'PRAÇA COMANDANTE XAVIER DE BRITO',
    'PRAÇA COMANDANTE XAVIER DE BRITO, S/N - TIJUCA',
    -22.9315494,
    -43.2437961,
    true,
    'TRADICIONAL',
    1200,
    '18:00',
    1247
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO BONDE DA FOLIA', 'bloco-bonde-da-folia', 'O Bonde da Folia anima o rolé carnavalesco carioca, arrastando foliões pelas ruas com sua bateria animada e tocando vários sucessos clássicos do samba.', '2008')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-22
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26716,
    '2026-02-22',
    '15:00',
    true,
    'R. FONSECA GUIMARÃES',
    'R. FONSECA GUIMARÃES, 8 - SANTA TERESA, RIO DE JANEIRO - RJ, 20240-260, BRASIL',
    -22.9211263,
    -43.1871407,
    true,
    'TRADICIONAL',
    350,
    '19:00',
    1237
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO BALBÚRDIA DE REALENGO', 'bloco-balburdia-de-realengo', 'A balbúrdia e a alegria estarão presentes no último dia de folia em Realengo, Zona Oeste do Rio. O desfile do Balbúrdia de Realengo toma conta das ruas do bairro', '2024')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-22
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26827,
    '2026-02-22',
    '17:00',
    true,
    'R. do Espadarte',
    'R. do Espadarte, 14 - Realengo, Rio de Janeiro - RJ, 21755-010, Brasil',
    -22.8821466,
    -43.4284885,
    true,
    'TRADICIONAL',
    500,
    '20:00',
    1225
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CULTURAL 7 DE PAUS', 'bloco-cultural-7-de-paus', 'Fundado em 24 de março de 2007, o Bloco 7 de Paus é tradicional de Vila Isabel. Trata-se de um grupo de pessoas que têm um mesmo objetivo, levar alegria às pessoas e de alguma forma amenizar a dor e o sofrimento de muitos.', '2012')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-22
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26719,
    '2026-02-22',
    '18:00',
    true,
    'BOULEVARD 28 DE SETEMBRO',
    'BOULEVARD 28 DE SETEMBRO, 238 - VILA ISABEL, RIO DE JANEIRO - RJ, 20551-031, BRASI',
    -22.9152002,
    -43.2441524,
    true,
    'TRADICIONAL',
    900,
    '22:00',
    1251
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('BLOCO CULTURAL SAIDEIRA', 'bloco-cultural-saideira', 'Praça Alm. Júlio de Noronha, 1 - Leme, Rio de Janeiro - RJ, 22010-020, Brasil', '2024')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-22
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26825,
    '2026-02-22',
    '17:00',
    true,
    'Praça Alm. Júlio de Noronha',
    'Praça Alm. Júlio de Noronha, 1 - Leme, Rio de Janeiro - RJ, 22010-020, Brasil',
    -22.9620949,
    -43.1649598,
    true,
    'TRADICIONAL',
    500,
    '19:00',
    1201
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('GRÊMIO RECREATIVO BLOCO CARNAVALESCO AMIGOS DA JOAQUIM MÉIER', 'gremio-recreativo-bloco-carnavalesco-amigos-da-joaquim-meier', 'Fundado nos anos 2000, o Bloco Amigos da Joaquim Méier chegou e marcou o seu espaço no Rio de Janeiro, afinando-se com os ideais de sua Comunidade e comércio local. Seus desfiles acontecem nas ruas do bairro do Méier, Rua Dias da Cruz. O bloco tem uma característica familiar, composto por moradores da comunidade e com a presença de muitas crianças.', '2000')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-22
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26720,
    '2026-02-22',
    '18:00',
    true,
    'R. GUAJU - MÉIER',
    'R. GUAJU - MÉIER, RIO DE JANEIRO - RJ, 20725-030, BRASIL',
    -22.9046125,
    -43.2804125,
    true,
    'TRADICIONAL',
    1500,
    '20:00',
    1209
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

DO $$
DECLARE
  bloco_uuid UUID;
BEGIN
  -- Inserir ou atualizar bloco
  INSERT INTO blocos (nome, slug, descricao, ano_fundacao)
  VALUES ('NOSSOBLOCO OFICIAL', 'nossobloco-oficial', 'O bloco agita as ruas da Lapa, no Centro do Rio, com concentração na Rua Sacadura Cabral, uma das mais conhecidas da região. No encontro, o melhor das músicas para embalar o último dia de festa!', '2020')
  ON CONFLICT (slug) DO UPDATE SET
    nome = EXCLUDED.nome,
    descricao = COALESCE(EXCLUDED.descricao, blocos.descricao),
    ano_fundacao = COALESCE(EXCLUDED.ano_fundacao, blocos.ano_fundacao),
    updated_at = NOW()
  RETURNING id INTO bloco_uuid;

  -- Evento do dia 2026-02-22
  INSERT INTO eventos (
    bloco_id, api_id, data, horario, horario_confirmado,
    local_nome, local_endereco, local_lat, local_lng, local_confirmado,
    tipo, publico_estimado, hora_fim, bairro_id
  ) VALUES (
    bloco_uuid,
    26721,
    '2026-02-22',
    '17:00',
    true,
    'R. Sacadura Cabral',
    'R. Sacadura Cabral, 75 - Saúde, Rio de Janeiro - RJ, 20081-261, Brasil',
    -22.8977003,
    -43.1837888,
    true,
    'TRADICIONAL',
    950,
    '20:00',
    1241
  )
  ON CONFLICT (api_id) DO UPDATE SET
    data = EXCLUDED.data,
    horario = EXCLUDED.horario,
    local_nome = EXCLUDED.local_nome,
    local_endereco = EXCLUDED.local_endereco,
    local_lat = EXCLUDED.local_lat,
    local_lng = EXCLUDED.local_lng,
    tipo = EXCLUDED.tipo,
    publico_estimado = EXCLUDED.publico_estimado,
    bairro_id = EXCLUDED.bairro_id;

END $$;

