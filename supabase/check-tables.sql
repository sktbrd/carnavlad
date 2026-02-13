-- Script de verificação: Quais tabelas existem?
-- Cole este SQL no Supabase SQL Editor para verificar

DO $$
DECLARE
  table_exists BOOLEAN;
BEGIN
  RAISE NOTICE '🔍 VERIFICANDO TABELAS DO CARNAVLAD...';
  RAISE NOTICE '';
  
  -- Verificar blocos
  SELECT EXISTS (
    SELECT FROM information_schema.tables 
    WHERE table_schema = 'public' AND table_name = 'blocos'
  ) INTO table_exists;
  RAISE NOTICE '% blocos', CASE WHEN table_exists THEN '✅' ELSE '❌' END;
  
  -- Verificar eventos
  SELECT EXISTS (
    SELECT FROM information_schema.tables 
    WHERE table_schema = 'public' AND table_name = 'eventos'
  ) INTO table_exists;
  RAISE NOTICE '% eventos', CASE WHEN table_exists THEN '✅' ELSE '❌' END;
  
  -- Verificar usuarios
  SELECT EXISTS (
    SELECT FROM information_schema.tables 
    WHERE table_schema = 'public' AND table_name = 'usuarios'
  ) INTO table_exists;
  RAISE NOTICE '% usuarios', CASE WHEN table_exists THEN '✅' ELSE '❌' END;
  
  -- Verificar presencas_confirmadas (IMPORTANTE!)
  SELECT EXISTS (
    SELECT FROM information_schema.tables 
    WHERE table_schema = 'public' AND table_name = 'presencas_confirmadas'
  ) INTO table_exists;
  RAISE NOTICE '% presencas_confirmadas 🎯', CASE WHEN table_exists THEN '✅' ELSE '❌ FALTANDO!' END;
  
  -- Verificar amigos
  SELECT EXISTS (
    SELECT FROM information_schema.tables 
    WHERE table_schema = 'public' AND table_name = 'amigos'
  ) INTO table_exists;
  RAISE NOTICE '% amigos', CASE WHEN table_exists THEN '✅' ELSE '❌' END;
  
  -- Verificar bairros
  SELECT EXISTS (
    SELECT FROM information_schema.tables 
    WHERE table_schema = 'public' AND table_name = 'bairros'
  ) INTO table_exists;
  RAISE NOTICE '% bairros', CASE WHEN table_exists THEN '✅' ELSE '❌' END;
  
  -- Verificar noticias
  SELECT EXISTS (
    SELECT FROM information_schema.tables 
    WHERE table_schema = 'public' AND table_name = 'noticias'
  ) INTO table_exists;
  RAISE NOTICE '% noticias', CASE WHEN table_exists THEN '✅' ELSE '❌' END;
  
  RAISE NOTICE '';
  RAISE NOTICE '📊 CONTAGENS:';
  
  -- Contar registros
  EXECUTE 'SELECT COUNT(*) FROM blocos' INTO table_exists;
  RAISE NOTICE '   Blocos: %', COALESCE((SELECT COUNT(*) FROM blocos), 0);
  
  EXECUTE 'SELECT COUNT(*) FROM eventos' INTO table_exists;
  RAISE NOTICE '   Eventos: %', COALESCE((SELECT COUNT(*) FROM eventos), 0);
  
  EXECUTE 'SELECT COUNT(*) FROM usuarios' INTO table_exists;
  RAISE NOTICE '   Usuários: %', COALESCE((SELECT COUNT(*) FROM usuarios), 0);
  
  RAISE NOTICE '';
  RAISE NOTICE '💡 PRÓXIMO PASSO:';
  RAISE NOTICE '   Se alguma tabela estiver ❌, rode: supabase/migrations/010_fix_missing_tables.sql';
  
END $$;
