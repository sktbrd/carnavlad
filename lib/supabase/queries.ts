import { SupabaseClient } from '@supabase/supabase-js'
import { EventoCompleto } from '@/lib/types'

/**
 * Busca todos os eventos completos (com dados do bloco)
 */
export async function getEventosCompletos(supabase: SupabaseClient) {
  const { data, error } = await supabase
    .from('eventos_completos')
    .select('*')
    .order('data', { ascending: true })

  if (error) {
    console.error('Erro ao buscar eventos:', error)
    return []
  }

  return data as EventoCompleto[]
}

/**
 * Busca eventos confirmados pelo usuário
 */
export async function getEventosConfirmados(
  supabase: SupabaseClient,
  userId: string
) {
  // Primeiro buscar os IDs dos eventos confirmados
  const { data: presencas, error: presencasError } = await supabase
    .from('presencas_confirmadas')
    .select('evento_id, created_at')
    .eq('user_id', userId)
    .order('created_at', { ascending: false })

  if (presencasError || !presencas || presencas.length === 0) {
    console.error('Erro ao buscar presenças confirmadas:', presencasError)
    return []
  }

  // Buscar detalhes dos eventos
  const eventoIds = presencas.map(p => p.evento_id)
  
  const { data: eventos, error: eventosError } = await supabase
    .from('eventos_completos')
    .select('*')
    .in('id', eventoIds)

  if (eventosError) {
    console.error('Erro ao buscar eventos completos:', eventosError)
    return []
  }

  return eventos as EventoCompleto[]
}

/**
 * Confirma presença em um evento (favoritar)
 */
export async function confirmarPresenca(
  supabase: SupabaseClient,
  userId: string,
  eventoId: string
) {
  const { data, error } = await supabase
    .from('presencas_confirmadas')
    .insert({
      user_id: userId,
      evento_id: eventoId,
    })
    .select()
    .single()

  if (error) {
    console.error('Erro ao confirmar presença:', error)
    return { success: false, error }
  }

  return { success: true, data }
}

/**
 * Remove confirmação de presença (desfavoritar)
 */
export async function removerPresenca(
  supabase: SupabaseClient,
  userId: string,
  eventoId: string
) {
  const { error } = await supabase
    .from('presencas_confirmadas')
    .delete()
    .eq('user_id', userId)
    .eq('evento_id', eventoId)

  if (error) {
    console.error('Erro ao remover presença:', error)
    return { success: false, error }
  }

  return { success: true }
}

/**
 * Verifica se usuário confirmou presença em evento
 */
export async function isPresencaConfirmada(
  supabase: SupabaseClient,
  userId: string,
  eventoId: string
): Promise<boolean> {
  const { data, error } = await supabase
    .from('presencas_confirmadas')
    .select('id')
    .eq('user_id', userId)
    .eq('evento_id', eventoId)
    .single()

  if (error) return false
  return !!data
}

/**
 * Busca amigos aceitos do usuário
 */
export async function getAmigosAceitos(
  supabase: SupabaseClient,
  userId: string
) {
  const { data, error } = await supabase
    .from('amigos_aceitos')
    .select('*')
    .eq('user_id', userId)

  if (error) {
    console.error('Erro ao buscar amigos:', error)
    return []
  }

  return data
}

/**
 * Seguir usuário (follow)
 */
export async function seguirUsuario(
  supabase: SupabaseClient,
  userId: string,
  amigoId: string
) {
  const { data, error } = await supabase
    .from('amigos')
    .insert({
      user_id: userId,
      amigo_id: amigoId,
      status: 'pendente', // ou 'aceito' se for follow direto
    })
    .select()
    .single()

  if (error) {
    console.error('Erro ao seguir usuário:', error)
    return { success: false, error }
  }

  return { success: true, data }
}

/**
 * Deixar de seguir (unfollow)
 */
export async function deixarDeSeguir(
  supabase: SupabaseClient,
  userId: string,
  amigoId: string
) {
  const { error } = await supabase
    .from('amigos')
    .delete()
    .eq('user_id', userId)
    .eq('amigo_id', amigoId)

  if (error) {
    console.error('Erro ao deixar de seguir:', error)
    return { success: false, error }
  }

  return { success: true }
}

/**
 * Aceitar pedido de amizade
 */
export async function aceitarAmizade(
  supabase: SupabaseClient,
  userId: string,
  amigoId: string
) {
  const { data, error } = await supabase
    .from('amigos')
    .update({ status: 'aceito' })
    .eq('user_id', amigoId) // Quem enviou
    .eq('amigo_id', userId) // Quem recebeu
    .select()
    .single()

  if (error) {
    console.error('Erro ao aceitar amizade:', error)
    return { success: false, error }
  }

  return { success: true, data }
}

/**
 * Rejeitar pedido de amizade
 */
export async function rejeitarAmizade(
  supabase: SupabaseClient,
  userId: string,
  amigoId: string
) {
  const { error } = await supabase
    .from('amigos')
    .delete()
    .eq('user_id', amigoId)
    .eq('amigo_id', userId)

  if (error) {
    console.error('Erro ao rejeitar amizade:', error)
    return { success: false, error }
  }

  return { success: true }
}

/**
 * Buscar usuários por email ou nome
 */
export async function buscarUsuarios(
  supabase: SupabaseClient,
  query: string
) {
  const { data, error } = await supabase
    .from('usuarios')
    .select('*')
    .or(`email.ilike.%${query}%,nome.ilike.%${query}%`)
    .limit(10)

  if (error) {
    console.error('Erro ao buscar usuários:', error)
    return []
  }

  return data
}

/**
 * Contar blocos confirmados de um usuário
 */
export async function contarBlocosConfirmados(
  supabase: SupabaseClient,
  userId: string
): Promise<number> {
  const { count, error } = await supabase
    .from('presencas_confirmadas')
    .select('*', { count: 'exact', head: true })
    .eq('user_id', userId)

  if (error) {
    console.error('Erro ao contar blocos:', error)
    return 0
  }

  return count || 0
}

/**
 * Contar amigos de um usuário
 */
export async function contarAmigos(
  supabase: SupabaseClient,
  userId: string
): Promise<number> {
  const { count, error } = await supabase
    .from('amigos')
    .select('*', { count: 'exact', head: true })
    .eq('user_id', userId)
    .eq('status', 'aceito')

  if (error) {
    console.error('Erro ao contar amigos:', error)
    return 0
  }

  return count || 0
}
