'use client';

import { useState, useEffect } from 'react';
import { createClient } from '@/lib/supabase/client';
import type { Noticia } from '@/lib/types';
import { ExternalLink, AlertTriangle, RefreshCw, Filter } from 'lucide-react';

export default function NoticiasView() {
  const [noticias, setNoticias] = useState<Noticia[]>([]);
  const [loading, setLoading] = useState(true);
  const [filtroFonte, setFiltroFonte] = useState<string>('todas');
  const [mostrarAlertas, setMostrarAlertas] = useState(false);

  useEffect(() => {
    fetchNoticias();
  }, []);

  async function fetchNoticias() {
    setLoading(true);
    const supabase = createClient();

    if (!supabase) {
      console.error('[noticias] Supabase not available');
      setLoading(false);
      return;
    }

    try {
      let query = supabase
        .from('noticias')
        .select('*')
        .order('publicado_em', { ascending: false })
        .limit(50);

      const { data, error } = await query;

      if (error) {
        console.error('[noticias] Error fetching:', error);
        setNoticias([]);
      } else {
        setNoticias(data as any);
      }
    } catch (err) {
      console.error('[noticias] Unexpected error:', err);
      setNoticias([]);
    } finally {
      setLoading(false);
    }
  }

  // Filtrar notícias
  const noticiasFiltradas = noticias.filter(noticia => {
    if (filtroFonte !== 'todas' && noticia.fonte !== filtroFonte) {
      return false;
    }
    if (mostrarAlertas && !noticia.is_alerta) {
      return false;
    }
    return true;
  });

  // Badge de fonte
  const getBadgeColor = (fonte: string) => {
    const colors: Record<string, string> = {
      diariodorio: 'bg-blue-500',
      g1: 'bg-red-500',
      vejario: 'bg-green-500',
      twitter: 'bg-sky-500',
      instagram: 'bg-pink-500',
      riotur: 'bg-purple-500',
    };
    return colors[fonte] || 'bg-gray-500';
  };

  if (loading) {
    return (
      <div className="flex items-center justify-center py-20">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-orange-500" />
      </div>
    );
  }

  return (
    <div className="space-y-6">
      {/* Header com Filtros */}
      <div className="bg-white rounded-2xl shadow-md border border-gray-100 p-6">
        <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
          <div>
            <h2 className="text-2xl font-bold text-gray-900">Notícias do Carnaval</h2>
            <p className="text-gray-600 mt-1">
              {noticiasFiltradas.length} notícia{noticiasFiltradas.length !== 1 ? 's' : ''} encontrada{noticiasFiltradas.length !== 1 ? 's' : ''}
            </p>
          </div>

          <div className="flex flex-wrap gap-3">
            {/* Filtro de Fonte */}
            <select
              value={filtroFonte}
              onChange={(e) => setFiltroFonte(e.target.value)}
              className="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-orange-500 focus:border-orange-500"
            >
              <option value="todas">Todas as fontes</option>
              <option value="diariodorio">Diário do Rio</option>
              <option value="g1">G1</option>
              <option value="vejario">Veja Rio</option>
              <option value="twitter">Twitter</option>
              <option value="riotur">Riotur</option>
            </select>

            {/* Toggle Alertas */}
            <button
              onClick={() => setMostrarAlertas(!mostrarAlertas)}
              className={`flex items-center gap-2 px-4 py-2 rounded-lg font-medium transition-all ${
                mostrarAlertas
                  ? 'bg-red-500 text-white'
                  : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
              }`}
            >
              <AlertTriangle className="w-4 h-4" />
              <span className="hidden sm:inline">
                {mostrarAlertas ? 'Apenas Alertas' : 'Todos'}
              </span>
            </button>

            {/* Recarregar */}
            <button
              onClick={fetchNoticias}
              className="flex items-center gap-2 px-4 py-2 bg-orange-500 hover:bg-orange-600 text-white rounded-lg font-medium transition-all"
            >
              <RefreshCw className="w-4 h-4" />
              <span className="hidden sm:inline">Atualizar</span>
            </button>
          </div>
        </div>
      </div>

      {/* Lista de Notícias */}
      {noticiasFiltradas.length === 0 ? (
        <div className="bg-white rounded-2xl shadow-md border border-gray-100 p-12 text-center">
          <div className="text-6xl mb-4">📰</div>
          <h3 className="text-xl font-bold text-gray-900 mb-2">Nenhuma notícia encontrada</h3>
          <p className="text-gray-600">
            {mostrarAlertas
              ? 'Não há alertas no momento.'
              : 'Tente executar o scraper para coletar notícias.'}
          </p>
        </div>
      ) : (
        <div className="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
          {noticiasFiltradas.map((noticia) => (
            <a
              key={noticia.id}
              href={noticia.url}
              target="_blank"
              rel="noopener noreferrer"
              className={`block bg-white rounded-2xl shadow-md border transition-all hover:shadow-xl hover:-translate-y-1 overflow-hidden ${
                noticia.is_alerta ? 'border-red-500 border-2' : 'border-gray-100'
              }`}
            >
              {/* Imagem */}
              {noticia.imagem_url && (
                <div className="aspect-video overflow-hidden bg-gray-200">
                  <img
                    src={noticia.imagem_url}
                    alt={noticia.titulo}
                    className="w-full h-full object-cover"
                  />
                </div>
              )}

              {/* Conteúdo */}
              <div className="p-5">
                {/* Badges */}
                <div className="flex items-center gap-2 mb-3">
                  <span
                    className={`${getBadgeColor(noticia.fonte)} text-white text-xs px-2 py-1 rounded-full font-semibold uppercase`}
                  >
                    {noticia.fonte}
                  </span>
                  {noticia.is_alerta && (
                    <span className="bg-red-500 text-white text-xs px-2 py-1 rounded-full font-semibold flex items-center gap-1">
                      <AlertTriangle className="w-3 h-3" />
                      ALERTA
                    </span>
                  )}
                </div>

                {/* Título */}
                <h3 className="text-lg font-bold text-gray-900 mb-2 line-clamp-2">
                  {noticia.titulo}
                </h3>

                {/* Resumo */}
                <p className="text-gray-600 text-sm line-clamp-3 mb-4">
                  {noticia.resumo}
                </p>

                {/* Tags */}
                {noticia.tags && noticia.tags.length > 0 && (
                  <div className="flex flex-wrap gap-2 mb-4">
                    {noticia.tags.map((tag) => (
                      <span
                        key={tag}
                        className="bg-gray-100 text-gray-700 text-xs px-2 py-1 rounded"
                      >
                        #{tag}
                      </span>
                    ))}
                  </div>
                )}

                {/* Footer */}
                <div className="flex items-center justify-between text-xs text-gray-500">
                  <span>
                    {new Date(noticia.publicado_em).toLocaleDateString('pt-BR', {
                      day: '2-digit',
                      month: 'short',
                      year: 'numeric',
                    })}
                  </span>
                  <ExternalLink className="w-4 h-4" />
                </div>
              </div>
            </a>
          ))}
        </div>
      )}
    </div>
  );
}
