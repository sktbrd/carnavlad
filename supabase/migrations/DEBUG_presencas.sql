-- DEBUG: Verificar sistema de presenças confirmadas
-- Rode este SQL no Supabase SQL Editor para diagnosticar o problema

-- ============================================
-- PASSO 1: Verificar se tabelas existem
-- ============================================

SELECT 
  'presencas_confirmadas' as tabela,
  EXISTS (
    SELECT FROM information_schema.tables 
    WHERE table_name = 'presencas_confirmadas'
  ) as existe;

SELECT 
  'usuarios' as tabela,
  EXISTS (
    SELECT FROM information_schema.tables 
    WHERE table_name = 'usuarios'
  ) as existe;

-- ============================================
-- PASSO 2: Verificar dados nas tabelas
-- ============================================

-- Quantas presenças confirmadas existem?
SELECT 
  'Total de presenças confirmadas' as info,
  COUNT(*) as total
FROM presencas_confirmadas;

-- Quais usuários confirmaram presença?
SELECT 
  pc.id,
  pc.user_id,
  pc.evento_id,
  u.nome as usuario_nome,
  u.email as usuario_email,
  e.bloco_nome as evento_nome,
  pc.created_at
FROM presencas_confirmadas pc
LEFT JOIN usuarios u ON pc.user_id = u.id
LEFT JOIN eventos e ON pc.evento_id = e.id
ORDER BY pc.created_at DESC
LIMIT 10;

-- ============================================
-- PASSO 3: Testar query do QuemVai
-- ============================================

-- Esta é a query EXATA que o componente QuemVai usa
SELECT 
  pc.user_id,
  pc.created_at,
  u.id,
  u.nome,
  u.email,
  u.username,
  u.avatar_url
FROM presencas_confirmadas pc
LEFT JOIN usuarios u ON pc.user_id = u.id
WHERE pc.evento_id = (
  -- Pegar o ID do primeiro evento como exemplo
  SELECT id FROM eventos LIMIT 1
)
ORDER BY pc.created_at ASC;

-- ============================================
-- PASSO 4: Verificar RLS policies
-- ============================================

-- Ver policies da tabela presencas_confirmadas
SELECT 
  schemaname,
  tablename,
  policyname,
  permissive,
  roles,
  cmd,
  qual,
  with_check
FROM pg_policies
WHERE tablename = 'presencas_confirmadas';

-- ============================================
-- PASSO 5: Testar inserção manual
-- ============================================

-- DESCOMENTAR E AJUSTAR IDs PARA TESTAR:
/*
INSERT INTO presencas_confirmadas (user_id, evento_id)
VALUES (
  (SELECT id FROM auth.users LIMIT 1),  -- Primeiro user
  (SELECT id FROM eventos LIMIT 1)      -- Primeiro evento
)
ON CONFLICT (user_id, evento_id) DO NOTHING
RETURNING *;
*/

-- ============================================
-- PASSO 6: Verificar se há usuarios na tabela
-- ============================================

SELECT 
  'Total de usuários em auth.users' as info,
  COUNT(*) as total
FROM auth.users;

SELECT 
  'Total de usuários em public.usuarios' as info,
  COUNT(*) as total
FROM usuarios;

-- Se auth.users > usuarios, rodar migration 012!

-- ============================================
-- RESUMO
-- ============================================

DO $$
DECLARE
  total_presencas INTEGER;
  total_usuarios_auth INTEGER;
  total_usuarios_public INTEGER;
  total_eventos INTEGER;
BEGIN
  SELECT COUNT(*) INTO total_presencas FROM presencas_confirmadas;
  SELECT COUNT(*) INTO total_usuarios_auth FROM auth.users;
  SELECT COUNT(*) INTO total_usuarios_public FROM usuarios;
  SELECT COUNT(*) INTO total_eventos FROM eventos;
  
  RAISE NOTICE '=== RESUMO DO DEBUG ===';
  RAISE NOTICE 'Presenças confirmadas: %', total_presencas;
  RAISE NOTICE 'Usuários autenticados (auth.users): %', total_usuarios_auth;
  RAISE NOTICE 'Perfis públicos (usuarios): %', total_usuarios_public;
  RAISE NOTICE 'Eventos cadastrados: %', total_eventos;
  
  IF total_usuarios_auth > total_usuarios_public THEN
    RAISE WARNING '⚠️  Há % usuários sem perfil público! Rodar migration 012.', 
      total_usuarios_auth - total_usuarios_public;
  END IF;
  
  IF total_presencas = 0 THEN
    RAISE WARNING '⚠️  Nenhuma presença confirmada ainda (normal se acabou de instalar)';
  ELSE
    RAISE NOTICE '✅ Há % presenças confirmadas no banco', total_presencas;
  END IF;
  
  IF total_eventos = 0 THEN
    RAISE WARNING '⚠️  Nenhum evento cadastrado! Rodar migrations de import.';
  END IF;
END $$;
