export default function AuthCodeError() {
  return (
    <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-pink-500 via-purple-500 to-yellow-500 p-4">
      <div className="bg-white/10 backdrop-blur-lg rounded-3xl p-8 max-w-md w-full border border-white/20 shadow-2xl">
        <div className="text-center">
          <div className="text-6xl mb-4">🎭</div>
          <h1 className="text-3xl font-bold text-white mb-4">
            Ops! Algo deu errado
          </h1>
          <p className="text-white/90 mb-6">
            Não conseguimos completar o login com Google. Isso pode acontecer se você cancelou a autorização ou se houve um problema de rede.
          </p>
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
