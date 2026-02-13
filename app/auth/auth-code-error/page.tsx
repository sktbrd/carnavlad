'use client'

import { useSearchParams } from 'next/navigation'
import { Suspense } from 'react'

function ErrorContent() {
  const searchParams = useSearchParams()
  const reason = searchParams.get('reason') || 'unknown'
  const message = searchParams.get('msg') || ''

  const errorMessages: Record<string, { title: string; description: string }> = {
    no_code: {
      title: 'Código de Autorização Não Recebido',
      description: 'O Google não enviou o código de autorização. Tente fazer login novamente.'
    },
    no_client: {
      title: 'Configuração Inválida',
      description: 'As variáveis de ambiente do Supabase não estão configuradas corretamente. Contate o administrador.'
    },
    exchange_failed: {
      title: 'Falha ao Trocar Código por Sessão',
      description: message || 'O Supabase não conseguiu processar o código do Google. Verifique as configurações de OAuth.'
    },
    unexpected: {
      title: 'Erro Inesperado',
      description: 'Ocorreu um erro inesperado durante o login. Por favor, tente novamente.'
    },
    unknown: {
      title: 'Ops! Algo deu errado',
      description: 'Não conseguimos completar o login com Google. Isso pode acontecer se você cancelou a autorização ou se houve um problema de rede.'
    }
  }

  const error = errorMessages[reason] || errorMessages.unknown

  return (
    <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-pink-500 via-purple-500 to-yellow-500 p-4">
      <div className="bg-white/10 backdrop-blur-lg rounded-3xl p-8 max-w-md w-full border border-white/20 shadow-2xl">
        <div className="text-center">
          <div className="text-6xl mb-4">🎭</div>
          <h1 className="text-3xl font-bold text-white mb-4">
            {error.title}
          </h1>
          <p className="text-white/90 mb-4">
            {error.description}
          </p>
          
          {/* Detalhes técnicos */}
          <div className="bg-black/20 rounded-lg p-4 mb-6 text-left">
            <p className="text-white/70 text-sm font-mono">
              <strong className="text-yellow-300">Razão:</strong> {reason}
            </p>
            {message && (
              <p className="text-white/70 text-sm font-mono mt-2">
                <strong className="text-yellow-300">Mensagem:</strong> {message}
              </p>
            )}
            <p className="text-white/50 text-xs mt-2">
              Para debug detalhado, adicione <code className="bg-black/30 px-1 rounded">?debug=true</code> na URL do callback
            </p>
          </div>

          <div className="space-y-3">
            <a
              href="/"
              className="block w-full bg-yellow-400 hover:bg-yellow-500 text-black font-bold py-3 px-6 rounded-xl transition-all shadow-lg hover:shadow-xl"
            >
              Voltar para Home
            </a>
            <a
              href="/login"
              className="block w-full bg-white/20 hover:bg-white/30 text-white font-bold py-3 px-6 rounded-xl transition-all border border-white/30"
            >
              Tentar Novamente
            </a>
          </div>
        </div>
      </div>
    </div>
  )
}

export default function AuthCodeError() {
  return (
    <Suspense fallback={
      <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-pink-500 via-purple-500 to-yellow-500">
        <div className="text-white text-xl">Carregando...</div>
      </div>
    }>
      <ErrorContent />
    </Suspense>
  )
}
