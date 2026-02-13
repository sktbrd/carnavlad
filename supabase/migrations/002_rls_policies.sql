-- Habilitar RLS em todas as tabelas
ALTER TABLE blocos ENABLE ROW LEVEL SECURITY;
ALTER TABLE eventos ENABLE ROW LEVEL SECURITY;
ALTER TABLE usuarios ENABLE ROW LEVEL SECURITY;
ALTER TABLE presencas_confirmadas ENABLE ROW LEVEL SECURITY;
ALTER TABLE amigos ENABLE ROW LEVEL SECURITY;
ALTER TABLE contribuicoes ENABLE ROW LEVEL SECURITY;
ALTER TABLE comentarios ENABLE ROW LEVEL SECURITY;

-- ============================================
-- POLÍTICAS: BLOCOS (público para leitura)
-- ============================================

CREATE POLICY "Blocos são públicos para leitura"
  ON blocos FOR SELECT
  USING (true);

CREATE POLICY "Apenas admins podem criar blocos"
  ON blocos FOR INSERT
  WITH CHECK (false); -- Trocar por auth check de admin depois

CREATE POLICY "Apenas admins podem atualizar blocos"
  ON blocos FOR UPDATE
  USING (false); -- Trocar por auth check de admin depois

-- ============================================
-- POLÍTICAS: EVENTOS (público para leitura)
-- ============================================

CREATE POLICY "Eventos são públicos para leitura"
  ON eventos FOR SELECT
  USING (true);

CREATE POLICY "Apenas admins podem criar eventos"
  ON eventos FOR INSERT
  WITH CHECK (false); -- Trocar por auth check de admin depois

CREATE POLICY "Apenas admins podem atualizar eventos"
  ON eventos FOR UPDATE
  USING (false); -- Trocar por auth check de admin depois

-- ============================================
-- POLÍTICAS: USUÁRIOS
-- ============================================

CREATE POLICY "Usuários são públicos para leitura"
  ON usuarios FOR SELECT
  USING (true);

CREATE POLICY "Usuários podem criar seu próprio perfil"
  ON usuarios FOR INSERT
  WITH CHECK (auth.uid() = id);

CREATE POLICY "Usuários podem atualizar seu próprio perfil"
  ON usuarios FOR UPDATE
  USING (auth.uid() = id);

-- ============================================
-- POLÍTICAS: PRESENÇAS CONFIRMADAS
-- ============================================

CREATE POLICY "Qualquer um pode ver presenças confirmadas"
  ON presencas_confirmadas FOR SELECT
  USING (true);

CREATE POLICY "Usuários podem confirmar presença"
  ON presencas_confirmadas FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Usuários podem remover sua presença"
  ON presencas_confirmadas FOR DELETE
  USING (auth.uid() = user_id);

-- ============================================
-- POLÍTICAS: AMIGOS
-- ============================================

CREATE POLICY "Usuários podem ver seus próprios relacionamentos"
  ON amigos FOR SELECT
  USING (auth.uid() = user_id OR auth.uid() = amigo_id);

CREATE POLICY "Usuários podem seguir outros"
  ON amigos FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Usuários podem atualizar status de amizade"
  ON amigos FOR UPDATE
  USING (auth.uid() = user_id OR auth.uid() = amigo_id);

CREATE POLICY "Usuários podem remover amizade"
  ON amigos FOR DELETE
  USING (auth.uid() = user_id OR auth.uid() = amigo_id);

-- ============================================
-- POLÍTICAS: CONTRIBUIÇÕES
-- ============================================

CREATE POLICY "Contribuições aprovadas são públicas"
  ON contribuicoes FOR SELECT
  USING (aprovado = true OR auth.uid() = user_id);

CREATE POLICY "Usuários podem criar contribuições"
  ON contribuicoes FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Usuários podem editar suas contribuições"
  ON contribuicoes FOR UPDATE
  USING (auth.uid() = user_id);

CREATE POLICY "Usuários podem deletar suas contribuições"
  ON contribuicoes FOR DELETE
  USING (auth.uid() = user_id);

-- ============================================
-- POLÍTICAS: COMENTÁRIOS
-- ============================================

CREATE POLICY "Comentários aprovados são públicos"
  ON comentarios FOR SELECT
  USING (aprovado = true OR auth.uid() = user_id);

CREATE POLICY "Usuários podem criar comentários"
  ON comentarios FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Usuários podem editar seus comentários"
  ON comentarios FOR UPDATE
  USING (auth.uid() = user_id);

CREATE POLICY "Usuários podem deletar seus comentários"
  ON comentarios FOR DELETE
  USING (auth.uid() = user_id);

-- ============================================
-- FUNÇÃO: Auto-criar perfil de usuário
-- ============================================

CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.usuarios (id, email, nome, avatar_url)
  VALUES (
    NEW.id,
    NEW.email,
    NEW.raw_user_meta_data->>'full_name',
    NEW.raw_user_meta_data->>'avatar_url'
  );
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Trigger para criar perfil automaticamente
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW
  EXECUTE FUNCTION public.handle_new_user();

-- ============================================
-- VIEWS ÚTEIS
-- ============================================

-- View: Eventos completos (com dados do bloco)
CREATE OR REPLACE VIEW eventos_completos AS
SELECT 
  e.*,
  b.nome AS bloco_nome,
  b.slug AS bloco_slug,
  b.instagram_url,
  b.whatsapp_url
FROM eventos e
JOIN blocos b ON e.bloco_id = b.id;

-- View: Contagem de presenças por evento
CREATE OR REPLACE VIEW eventos_contagem_presencas AS
SELECT 
  evento_id,
  COUNT(*) AS total_presencas
FROM presencas_confirmadas
GROUP BY evento_id;

-- View: Amigos aceitos (bidirecional)
CREATE OR REPLACE VIEW amigos_aceitos AS
SELECT 
  a.user_id,
  a.amigo_id,
  u.nome AS amigo_nome,
  u.avatar_url AS amigo_avatar,
  a.created_at
FROM amigos a
JOIN usuarios u ON a.amigo_id = u.id
WHERE a.status = 'aceito';

-- Comentários
COMMENT ON POLICY "Blocos são públicos para leitura" ON blocos IS 'Todos podem ver blocos';
COMMENT ON POLICY "Usuários podem confirmar presença" ON presencas_confirmadas IS 'Usuários autenticados podem favoritar blocos';
COMMENT ON POLICY "Usuários podem seguir outros" ON amigos IS 'Sistema de follow/unfollow';
