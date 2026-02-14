-- Migration 012: Sincronizar usuários de auth.users para public.usuarios
-- Use quando o trigger não tiver criado perfis automaticamente

-- Inserir perfis para todos os usuários autenticados que ainda não têm perfil
INSERT INTO public.usuarios (id, email, nome, avatar_url)
SELECT 
  id, 
  email, 
  COALESCE(
    raw_user_meta_data->>'full_name', 
    raw_user_meta_data->>'name', 
    split_part(email, '@', 1)
  ) as nome,
  raw_user_meta_data->>'avatar_url' as avatar_url
FROM auth.users
WHERE id NOT IN (SELECT id FROM public.usuarios)
ON CONFLICT (id) DO NOTHING;

-- Mostrar resultado
DO $$
DECLARE
  total_auth INTEGER;
  total_usuarios INTEGER;
BEGIN
  SELECT COUNT(*) INTO total_auth FROM auth.users;
  SELECT COUNT(*) INTO total_usuarios FROM public.usuarios;
  
  RAISE NOTICE '✅ Sincronização concluída!';
  RAISE NOTICE '   Usuários autenticados (auth.users): %', total_auth;
  RAISE NOTICE '   Perfis públicos (usuarios): %', total_usuarios;
  
  IF total_auth = total_usuarios THEN
    RAISE NOTICE '   ✅ Todos os usuários têm perfil!';
  ELSE
    RAISE WARNING '   ⚠️  Diferença de % usuários', total_auth - total_usuarios;
  END IF;
END $$;

-- Comentário
COMMENT ON TABLE usuarios IS 'Perfis públicos dos usuários - sincronizado com auth.users';
