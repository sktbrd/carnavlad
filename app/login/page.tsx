import { GoogleLoginButton } from '@/components/auth/google-login-button'
import Link from 'next/link'

export default function LoginPage() {
  return (
    <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-pink-500 via-purple-500 to-yellow-500 p-4">
      <div className="bg-white/10 backdrop-blur-lg rounded-3xl p-8 max-w-md w-full border border-white/20 shadow-2xl">
        <div className="text-center mb-8">
          <div className="text-6xl mb-4">🎭</div>
          <h1 className="text-4xl font-bold text-white mb-2">
            Carnavlad 2026
          </h1>
          <p className="text-white/90 text-lg">
            Entre para salvar seus blocos favoritos e criar sua programação personalizada!
          </p>
        </div>

        <div className="space-y-4">
          <GoogleLoginButton />

          <div className="relative">
            <div className="absolute inset-0 flex items-center">
              <div className="w-full border-t border-white/20"></div>
            </div>
            <div className="relative flex justify-center text-sm">
              <span className="px-4 bg-transparent text-white/70">ou</span>
            </div>
          </div>

          <Link
            href="/"
            className="block w-full text-center bg-white/20 hover:bg-white/30 text-white font-semibold py-4 px-6 rounded-xl transition-all border border-white/30"
          >
            Explorar sem login
          </Link>
        </div>

        <div className="mt-8 text-center text-white/70 text-sm">
          <p>
            Ao entrar, você concorda com nossos{' '}
            <a href="#" className="underline hover:text-white">
              Termos de Uso
            </a>{' '}
            e{' '}
            <a href="#" className="underline hover:text-white">
              Política de Privacidade
            </a>
          </p>
        </div>
      </div>
    </div>
  )
}
