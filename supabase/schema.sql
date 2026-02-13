-- Schema para Blocos de Carnaval Rio 2026

-- Habilitar extensões
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ============================================
-- AUTENTICAÇÃO E PERFIS
-- ============================================

-- Tabela de perfis de usuário
CREATE TABLE IF NOT EXISTS public.profiles (
    id UUID REFERENCES auth.users ON DELETE CASCADE PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL,
    
    -- Dados públicos
    username TEXT UNIQUE,
    full_name TEXT,
    avatar_url TEXT,
    bio TEXT,
    
    -- Preferências
    blocos_favoritos TEXT[] DEFAULT '{}',
    
    -- Metadados
    total_blocos_idos INTEGER DEFAULT 0,
    total_fotos_enviadas INTEGER DEFAULT 0,
    total_comentarios INTEGER DEFAULT 0
);

-- RLS (Row Level Security) para profiles
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

-- Policies para profiles
CREATE POLICY "Perfis são visíveis por todos"
    ON public.profiles FOR SELECT
    USING (true);

CREATE POLICY "Usuários podem atualizar próprio perfil"
    ON public.profiles FOR UPDATE
    USING (auth.uid() = id);

CREATE POLICY "Usuários podem inserir próprio perfil"
    ON public.profiles FOR INSERT
    WITH CHECK (auth.uid() = id);

-- Trigger para criar perfil automaticamente ao criar usuário
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO public.profiles (id, full_name, avatar_url, username)
    VALUES (
        NEW.id,
        NEW.raw_user_meta_data->>'full_name',
        NEW.raw_user_meta_data->>'avatar_url',
        NEW.raw_user_meta_data->>'user_name'
    );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE OR REPLACE TRIGGER on_auth_user_created
    AFTER INSERT ON auth.users
    FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- ============================================
-- BLOCOS E EVENTOS
-- ============================================

-- Tabela de blocos (entidade principal)
CREATE TABLE blocos (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  nome TEXT NOT NULL,
  descricao TEXT,
  instagram_url TEXT,
  whatsapp_url TEXT,
  slug TEXT UNIQUE NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Tabela de eventos (saídas de blocos)
CREATE TABLE eventos (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  bloco_id UUID REFERENCES blocos(id) ON DELETE CASCADE,
  data DATE NOT NULL,
  horario TIME,
  horario_confirmado BOOLEAN DEFAULT TRUE,
  local_nome TEXT NOT NULL,
  local_endereco TEXT NOT NULL,
  local_lat FLOAT,
  local_lng FLOAT,
  local_confirmado BOOLEAN DEFAULT TRUE,
  observacoes TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Tabela de contribuições (fotos/relatos)
CREATE TABLE contribuicoes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  evento_id UUID REFERENCES eventos(id) ON DELETE CASCADE,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  tipo TEXT CHECK (tipo IN ('foto', 'relato')) NOT NULL,
  conteudo TEXT NOT NULL, -- URL da foto ou texto do relato
  legenda TEXT,
  aprovado BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Tabela de comentários
CREATE TABLE comentarios (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  evento_id UUID REFERENCES eventos(id) ON DELETE CASCADE,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  texto TEXT NOT NULL,
  aprovado BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Índices para performance
CREATE INDEX idx_eventos_bloco_id ON eventos(bloco_id);
CREATE INDEX idx_eventos_data ON eventos(data);
CREATE INDEX idx_contribuicoes_evento_id ON contribuicoes(evento_id);
CREATE INDEX idx_comentarios_evento_id ON comentarios(evento_id);

-- RLS (Row Level Security)
ALTER TABLE blocos ENABLE ROW LEVEL SECURITY;
ALTER TABLE eventos ENABLE ROW LEVEL SECURITY;
ALTER TABLE contribuicoes ENABLE ROW LEVEL SECURITY;
ALTER TABLE comentarios ENABLE ROW LEVEL SECURITY;

-- Policies públicas de leitura
CREATE POLICY "Blocos são públicos" ON blocos FOR SELECT USING (true);
CREATE POLICY "Eventos são públicos" ON eventos FOR SELECT USING (true);
CREATE POLICY "Contribuições aprovadas são públicas" ON contribuicoes FOR SELECT USING (aprovado = true);
CREATE POLICY "Comentários aprovados são públicos" ON comentarios FOR SELECT USING (aprovado = true);

-- Policies de escrita (apenas autenticados)
CREATE POLICY "Usuários autenticados podem criar contribuições" ON contribuicoes FOR INSERT TO authenticated WITH CHECK (true);
CREATE POLICY "Usuários autenticados podem criar comentários" ON comentarios FOR INSERT TO authenticated WITH CHECK (true);

-- View para facilitar queries (eventos com info do bloco)
CREATE VIEW eventos_completos AS
SELECT 
  e.*,
  b.nome as bloco_nome,
  b.slug as bloco_slug,
  b.instagram_url,
  b.whatsapp_url
FROM eventos e
JOIN blocos b ON e.bloco_id = b.id;
