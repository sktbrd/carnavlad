-- Migration 013: Garantir que view amigos_aceitos existe
-- Use se o card de amigos não estiver mostrando nada no /perfil

-- Criar (ou recriar) view amigos_aceitos
CREATE OR REPLACE VIEW amigos_aceitos AS
SELECT 
  a.user_id,
  a.amigo_id,
  u.nome AS amigo_nome,
  u.username AS amigo_username,
  u.avatar_url AS amigo_avatar,
  a.created_at
FROM amigos a
JOIN usuarios u ON a.amigo_id = u.id
WHERE a.status = 'aceito';

-- Garantir que todos os follows existentes são 'aceito'
-- (para casos onde foi criado como 'pendente' por engano)
UPDATE amigos 
SET status = 'aceito' 
WHERE status != 'aceito';

-- Verificar se funcionou
DO $$
DECLARE
  view_exists BOOLEAN;
  total_amigos INTEGER;
  total_usuarios INTEGER;
BEGIN
  -- Verificar se view existe
  SELECT EXISTS (
    SELECT FROM information_schema.views 
    WHERE table_name = 'amigos_aceitos'
  ) INTO view_exists;
  
  SELECT COUNT(*) INTO total_amigos FROM amigos;
  SELECT COUNT(*) INTO total_usuarios FROM usuarios;
  
  RAISE NOTICE '✅ Migration 013 concluída!';
  RAISE NOTICE '   View amigos_aceitos: %', CASE WHEN view_exists THEN 'EXISTE' ELSE 'NÃO CRIADA' END;
  RAISE NOTICE '   Total de relacionamentos: %', total_amigos;
  RAISE NOTICE '   Total de usuários: %', total_usuarios;
  
  IF NOT view_exists THEN
    RAISE WARNING '   ⚠️  View não foi criada! Verificar permissões.';
  END IF;
  
  IF total_usuarios = 0 THEN
    RAISE WARNING '   ⚠️  Tabela usuarios vazia! Rodar migration 012 primeiro.';
  END IF;
  
  IF total_amigos = 0 THEN
    RAISE NOTICE '   ℹ️  Nenhum follow ainda (normal se acabou de criar).';
  END IF;
END $$;

-- Comentário
COMMENT ON VIEW amigos_aceitos IS 'View que retorna amigos aceitos com dados enriquecidos (nome, avatar)';
