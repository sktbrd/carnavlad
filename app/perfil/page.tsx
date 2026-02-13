import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import { Calendar, MapPin, Users, LogOut } from 'lucide-react'
import Link from 'next/link'
import { getEventosConfirmados, getAmigosAceitos, contarBlocosConfirmados } from '@/lib/supabase/queries'
import { parseLocalDate } from '@/lib/date-utils'

export default async function PerfilPage() {
  const supabase = await createClient()

  if (!supabase) {
    redirect('/login')
  }

  const {
    data: { user },
  } = await supabase.auth.getUser()

  if (!user) {
    redirect('/login')
  }

  // Buscar blocos confirmados do Supabase
  const eventosConfirmados = await getEventosConfirmados(supabase, user.id)

  // Buscar amigos do Supabase
  const amigosData = await getAmigosAceitos(supabase, user.id)
  
  // Enriquecer dados dos amigos com contagem de blocos
  const amigos = await Promise.all(
    amigosData.map(async (amigo) => ({
      id: amigo.amigo_id,
      nome: amigo.amigo_nome || 'Amigo',
      avatar_url: amigo.amigo_avatar || `https://api.dicebear.com/7.x/avataaars/svg?seed=${amigo.amigo_id}`,
      blocos_confirmados: await contarBlocosConfirmados(supabase, amigo.amigo_id),
    }))
  )

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
            <form action="/auth/signout" method="post">
              <button
                type="submit"
                className="flex items-center gap-2 text-white/90 hover:text-white transition-colors"
              >
                <LogOut className="w-5 h-5" />
                <span className="hidden sm:inline">Sair</span>
              </button>
            </form>
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
                src={user.user_metadata.avatar_url || `https://api.dicebear.com/7.x/avataaars/svg?seed=${user.email}`}
                alt={user.user_metadata.full_name || user.email || 'Avatar'}
                className="w-32 h-32 rounded-full border-4 border-yellow-400 shadow-lg"
              />
              <div className="absolute -bottom-2 -right-2 bg-yellow-400 rounded-full p-2 shadow-lg">
                <span className="text-2xl">🎭</span>
              </div>
            </div>

            {/* Info */}
            <div className="flex-1 text-center sm:text-left">
              <h1 className="text-3xl sm:text-4xl font-bold text-white mb-2">
                {user.user_metadata.full_name || 'Foliã(o)'}
              </h1>
              <p className="text-white/80 text-lg mb-4">{user.email}</p>

              {/* Stats */}
              <div className="flex flex-wrap justify-center sm:justify-start gap-6">
                <div className="text-center">
                  <div className="text-3xl font-bold text-yellow-300">
                    {eventosConfirmados.length}
                  </div>
                  <div className="text-white/70 text-sm">Blocos Confirmados</div>
                </div>
                <div className="text-center">
                  <div className="text-3xl font-bold text-yellow-300">
                    {amigos.length}
                  </div>
                  <div className="text-white/70 text-sm">Amigos</div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div className="grid lg:grid-cols-3 gap-8">
          {/* Blocos Confirmados */}
          <div className="lg:col-span-2">
            <div className="bg-white/10 backdrop-blur-lg rounded-3xl p-6 border border-white/20 shadow-xl">
              <h2 className="text-2xl font-bold text-white mb-6 flex items-center gap-3">
                <Calendar className="w-7 h-7 text-yellow-300" />
                Blocos Confirmados
              </h2>

              {eventosConfirmados.length === 0 ? (
                <div className="text-center py-12">
                  <div className="text-6xl mb-4">🎭</div>
                  <p className="text-white/70 mb-4">
                    Você ainda não confirmou presença em nenhum bloco
                  </p>
                  <Link
                    href="/"
                    className="inline-block bg-yellow-400 hover:bg-yellow-500 text-black font-bold py-3 px-6 rounded-xl transition-all"
                  >
                    Explorar Blocos
                  </Link>
                </div>
              ) : (
                <div className="space-y-4">
                  {eventosConfirmados.map((evento) => {
                    const dataObj = parseLocalDate(evento.data)
                    const dia = dataObj.getDate()
                    const mes = dataObj.toLocaleDateString('pt-BR', { month: 'short' })

                    return (
                      <Link
                        key={evento.id}
                        href={`/evento/${evento.bloco_slug}`}
                        className="block bg-white/10 hover:bg-white/20 rounded-2xl p-4 border border-white/20 transition-all group"
                      >
                        <div className="flex gap-4">
                          {/* Data */}
                          <div className="flex-shrink-0 bg-yellow-400 rounded-xl p-3 text-center w-16">
                            <div className="text-2xl font-bold text-purple-900">{dia}</div>
                            <div className="text-xs uppercase text-purple-700">{mes}</div>
                          </div>

                          {/* Info */}
                          <div className="flex-1 min-w-0">
                            <h3 className="text-white font-bold text-lg mb-1 group-hover:text-yellow-300 transition-colors">
                              {evento.bloco_nome}
                            </h3>
                            <div className="flex items-center gap-2 text-white/70 text-sm mb-1">
                              <Calendar className="w-4 h-4" />
                              <span>{evento.horario || 'Horário a confirmar'}</span>
                            </div>
                            <div className="flex items-center gap-2 text-white/70 text-sm">
                              <MapPin className="w-4 h-4" />
                              <span>{evento.local_nome}</span>
                            </div>
                          </div>
                        </div>
                      </Link>
                    )
                  })}
                </div>
              )}
            </div>
          </div>

          {/* Lista de Amigos */}
          <div className="lg:col-span-1">
            <div className="bg-white/10 backdrop-blur-lg rounded-3xl p-6 border border-white/20 shadow-xl sticky top-8">
              <h2 className="text-2xl font-bold text-white mb-6 flex items-center gap-3">
                <Users className="w-7 h-7 text-yellow-300" />
                Amigos
              </h2>

              {amigos.length === 0 ? (
                <div className="text-center py-8">
                  <div className="text-4xl mb-3">👥</div>
                  <p className="text-white/70 text-sm">
                    Adicione amigos para ver quem vai nos mesmos blocos!
                  </p>
                </div>
              ) : (
                <div className="space-y-3">
                  {amigos.map((amigo) => (
                    <div
                      key={amigo.id}
                      className="flex items-center gap-3 bg-white/10 hover:bg-white/20 rounded-xl p-3 border border-white/10 transition-all cursor-pointer"
                    >
                      <img
                        src={amigo.avatar_url}
                        alt={amigo.nome}
                        className="w-12 h-12 rounded-full border-2 border-yellow-300"
                      />
                      <div className="flex-1 min-w-0">
                        <div className="text-white font-semibold truncate">
                          {amigo.nome}
                        </div>
                        <div className="text-white/60 text-sm">
                          {amigo.blocos_confirmados} blocos
                        </div>
                      </div>
                    </div>
                  ))}
                </div>
              )}

              <button className="w-full mt-6 bg-yellow-400 hover:bg-yellow-500 text-black font-bold py-3 px-4 rounded-xl transition-all shadow-lg hover:shadow-xl">
                + Adicionar Amigos
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
