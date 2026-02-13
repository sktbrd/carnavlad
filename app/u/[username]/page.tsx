import { createClient } from '@/lib/supabase/server';
import { notFound } from 'next/navigation';
import Link from 'next/link';
import { Calendar, MapPin, Users, ArrowLeft, Share2 } from 'lucide-react';
import { contarBlocosConfirmados, contarAmigos } from '@/lib/supabase/queries';
import BlocosConfirmadosList from '@/components/perfil/blocos-confirmados-list';
import FollowButton from '@/components/perfil/follow-button';

interface PerfilPublicoPageProps {
  params: Promise<{ username: string }>;
}

export default async function PerfilPublicoPage({ params }: PerfilPublicoPageProps) {
  const { username } = await params;
  const supabase = await createClient();

  if (!supabase) {
    notFound();
  }

  // Buscar usuário pelo username
  const { data: usuario, error } = await supabase
    .from('usuarios')
    .select('*')
    .eq('username', username)
    .single();

  if (error || !usuario) {
    notFound();
  }

  // Buscar estatísticas
  const totalBlocos = await contarBlocosConfirmados(supabase, usuario.id);
  const totalAmigos = await contarAmigos(supabase, usuario.id);

  // Verificar se é o próprio usuário logado
  const { data: { user: currentUser } } = await supabase.auth.getUser();
  const isOwnProfile = currentUser?.id === usuario.id;

  return (
    <div className="min-h-screen bg-gradient-to-br from-purple-600 via-pink-500 to-orange-400">
      {/* Header */}
      <div className="bg-white/10 backdrop-blur-md border-b border-white/20">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4">
          <div className="flex items-center justify-between">
            <Link
              href="/"
              className="text-white hover:text-yellow-300 transition-colors text-lg font-bold"
            >
              ← Voltar
            </Link>

            <div className="flex items-center gap-4">
              {isOwnProfile && (
                <Link
                  href="/perfil"
                  className="text-white hover:text-yellow-300 transition-colors text-sm"
                >
                  Editar Perfil
                </Link>
              )}
              
              <button
                onClick={() => {
                  navigator.clipboard.writeText(window.location.href);
                  alert('Link copiado!');
                }}
                className="flex items-center gap-2 text-white/90 hover:text-white transition-colors"
              >
                <Share2 className="w-5 h-5" />
                <span className="hidden sm:inline">Compartilhar</span>
              </button>
            </div>
          </div>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        {/* Card do Perfil */}
        <div className="bg-white/10 backdrop-blur-lg rounded-3xl p-8 border border-white/20 shadow-2xl mb-8">
          <div className="flex flex-col sm:flex-row items-center sm:items-start gap-6">
            {/* Avatar */}
            <div className="relative">
              <img
                src={usuario.avatar_url || `https://api.dicebear.com/7.x/avataaars/svg?seed=${usuario.email}`}
                alt={usuario.nome || usuario.username}
                className="w-32 h-32 rounded-full border-4 border-yellow-400 shadow-lg"
              />
              <div className="absolute -bottom-2 -right-2 bg-yellow-400 rounded-full p-2 shadow-lg">
                <span className="text-2xl">🎭</span>
              </div>
            </div>

            {/* Info */}
            <div className="flex-1 text-center sm:text-left">
              <h1 className="text-3xl sm:text-4xl font-bold text-white mb-2">
                {usuario.nome || usuario.username}
              </h1>
              <p className="text-white/80 text-lg mb-4">@{usuario.username}</p>

              {/* Stats */}
              <div className="flex flex-wrap justify-center sm:justify-start gap-6 mb-6">
                <div className="text-center">
                  <div className="text-3xl font-bold text-yellow-300">{totalBlocos}</div>
                  <div className="text-white/70 text-sm">Blocos Confirmados</div>
                </div>
                <div className="text-center">
                  <div className="text-3xl font-bold text-yellow-300">{totalAmigos}</div>
                  <div className="text-white/70 text-sm">Amigos</div>
                </div>
              </div>

              {/* Follow Button */}
              {!isOwnProfile && currentUser && (
                <FollowButton 
                  currentUserId={currentUser.id}
                  targetUserId={usuario.id}
                  targetUsername={usuario.username}
                />
              )}

              {!currentUser && (
                <Link
                  href="/login"
                  className="inline-block bg-gradient-to-r from-yellow-400 to-orange-500 text-purple-900 font-bold py-3 px-8 rounded-xl hover:scale-105 transition-transform shadow-lg"
                >
                  Entrar para Seguir
                </Link>
              )}
            </div>
          </div>
        </div>

        {/* Blocos Confirmados */}
        <div className="bg-white/10 backdrop-blur-lg rounded-3xl p-6 border border-white/20 shadow-xl">
          <h2 className="text-2xl font-bold text-white mb-6 flex items-center gap-3">
            <Calendar className="w-7 h-7 text-yellow-300" />
            Blocos Confirmados
          </h2>

          <BlocosConfirmadosList userId={usuario.id} />
        </div>
      </div>
    </div>
  );
}

// Metadata dinâmica para SEO
export async function generateMetadata({ params }: PerfilPublicoPageProps) {
  const { username } = await params;
  
  return {
    title: `@${username} | Carnavlad`,
    description: `Veja os blocos que @${username} vai no Carnaval 2026!`,
    openGraph: {
      title: `@${username} no Carnavlad`,
      description: `Veja os blocos que @${username} vai no Carnaval 2026!`,
      url: `https://carnavlad.vercel.app/u/${username}`,
    },
  };
}
