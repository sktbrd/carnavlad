-- Verificar importação dos dados da API

-- 1. Contar registros
SELECT 'Bairros' as tabela, COUNT(*) as total FROM bairros
UNION ALL
SELECT 'Blocos', COUNT(*) FROM blocos
UNION ALL
SELECT 'Eventos', COUNT(*) FROM eventos
UNION ALL
SELECT 'Usuarios', COUNT(*) FROM usuarios
UNION ALL
SELECT 'Presencas', COUNT(*) FROM presencas_confirmadas;

-- 2. Ver top 10 blocos por público
SELECT 
  bloco_nome,
  data,
  horario,
  publico_estimado,
  tipo,
  bairro_nome,
  bairro_regiao
FROM eventos_completos
WHERE publico_estimado > 0
ORDER BY publico_estimado DESC
LIMIT 10;

-- 3. Ver eventos de fevereiro
SELECT 
  bloco_nome,
  data,
  horario,
  local_nome,
  publico_estimado,
  tipo
FROM eventos_completos
WHERE data >= '2026-02-01' AND data < '2026-03-01'
ORDER BY data, horario
LIMIT 20;

-- 4. Ver distribuição por tipo
SELECT 
  tipo,
  COUNT(*) as total_eventos,
  SUM(publico_estimado) as publico_total
FROM eventos
WHERE tipo IS NOT NULL
GROUP BY tipo
ORDER BY total_eventos DESC;

-- 5. Ver distribuição por bairro (top 10)
SELECT 
  b.nome as bairro,
  b.regiao,
  COUNT(e.id) as total_eventos
FROM bairros b
LEFT JOIN eventos e ON b.id = e.bairro_id
GROUP BY b.id, b.nome, b.regiao
ORDER BY total_eventos DESC
LIMIT 10;
