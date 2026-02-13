-- Adicionar username único para perfis públicos

-- Adicionar campo username
ALTER TABLE usuarios ADD COLUMN IF NOT EXISTS username TEXT UNIQUE;

-- Criar índice para busca rápida
CREATE INDEX IF NOT EXISTS idx_usuarios_username ON usuarios(username);

-- Função para gerar username único a partir do email
CREATE OR REPLACE FUNCTION generate_username_from_email(email_input TEXT)
RETURNS TEXT AS $$
DECLARE
  base_username TEXT;
  final_username TEXT;
  counter INTEGER := 0;
BEGIN
  -- Pegar parte antes do @ e limpar
  base_username := LOWER(SPLIT_PART(email_input, '@', 1));
  base_username := REGEXP_REPLACE(base_username, '[^a-z0-9]', '', 'g');
  
  -- Limitar a 20 caracteres
  base_username := SUBSTRING(base_username, 1, 20);
  
  final_username := base_username;
  
  -- Verificar se username já existe e adicionar número se necessário
  WHILE EXISTS (SELECT 1 FROM usuarios WHERE username = final_username) LOOP
    counter := counter + 1;
    final_username := base_username || counter::TEXT;
  END LOOP;
  
  RETURN final_username;
END;
$$ LANGUAGE plpgsql;

-- Atualizar trigger de criação de usuário para adicionar username
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
DECLARE
  generated_username TEXT;
BEGIN
  -- Gerar username único
  generated_username := generate_username_from_email(NEW.email);
  
  INSERT INTO public.usuarios (id, email, nome, avatar_url, username)
  VALUES (
    NEW.id,
    NEW.email,
    NEW.raw_user_meta_data->>'full_name',
    NEW.raw_user_meta_data->>'avatar_url',
    generated_username
  )
  ON CONFLICT (id) DO UPDATE SET
    nome = EXCLUDED.nome,
    avatar_url = EXCLUDED.avatar_url,
    username = COALESCE(usuarios.username, generated_username);
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Gerar usernames para usuários existentes que não têm
UPDATE usuarios 
SET username = generate_username_from_email(email)
WHERE username IS NULL;

COMMENT ON COLUMN usuarios.username IS 'Username único para perfil público (ex: /u/joaosilva)';
