'use client';

import { useEffect, useState } from 'react';
import { Download, X } from 'lucide-react';

export default function PWAInstall() {
  const [deferredPrompt, setDeferredPrompt] = useState<any>(null);
  const [showInstallPrompt, setShowInstallPrompt] = useState(false);
  const [dismissed, setDismissed] = useState(false);

  useEffect(() => {
    if (sessionStorage.getItem('pwa-prompt-dismissed')) {
      setDismissed(true);
    }
  }, []);

  useEffect(() => {
    // Registrar service worker
    if ('serviceWorker' in navigator) {
      window.addEventListener('load', () => {
        navigator.serviceWorker
          .register('/sw.js')
          .then((registration) => {
            console.log('✅ Service Worker registrado:', registration.scope);
          })
          .catch((error) => {
            console.error('❌ Erro ao registrar Service Worker:', error);
          });
      });
    }

    // Capturar evento de instalação
    const handleBeforeInstallPrompt = (e: any) => {
      e.preventDefault();
      setDeferredPrompt(e);
      
      // Mostrar prompt se não foi instalado ainda
      const isInstalled = window.matchMedia('(display-mode: standalone)').matches;
      if (!isInstalled) {
        // Esperar 3 segundos antes de mostrar
        setTimeout(() => {
          setShowInstallPrompt(true);
        }, 3000);
      }
    };

    window.addEventListener('beforeinstallprompt', handleBeforeInstallPrompt);

    return () => {
      window.removeEventListener('beforeinstallprompt', handleBeforeInstallPrompt);
    };
  }, []);

  const handleInstallClick = async () => {
    if (!deferredPrompt) return;

    deferredPrompt.prompt();
    const { outcome } = await deferredPrompt.userChoice;
    
    console.log(`Usuário ${outcome === 'accepted' ? 'aceitou' : 'recusou'} instalar o app`);
    
    setDeferredPrompt(null);
    setShowInstallPrompt(false);
  };

  const handleDismiss = () => {
    setShowInstallPrompt(false);
    setDismissed(true);
    // Não mostrar novamente nesta sessão
    sessionStorage.setItem('pwa-prompt-dismissed', 'true');
  };

  if (dismissed || !showInstallPrompt || !deferredPrompt) {
    return null;
  }

  return (
    <div className="fixed bottom-4 left-4 right-4 md:left-auto md:right-4 md:w-96 z-50 animate-in slide-in-from-bottom-5">
      <div className="bg-gradient-to-r from-purple-600 via-pink-500 to-orange-400 rounded-2xl shadow-2xl p-6 border border-white/20">
        <button
          onClick={handleDismiss}
          className="absolute top-2 right-2 p-1 hover:bg-white/20 rounded-full transition-colors"
        >
          <X className="w-5 h-5 text-white" />
        </button>

        <div className="flex items-start gap-4">
          <div className="w-16 h-16 rounded-xl bg-white/20 flex items-center justify-center shrink-0">
            <span className="text-4xl">🎭</span>
          </div>

          <div className="flex-1">
            <h3 className="text-white font-bold text-lg mb-2">
              Instalar Carnavlad
            </h3>
            <p className="text-white/90 text-sm mb-4">
              Adicione o app à sua tela inicial para acesso rápido aos blocos de carnaval!
            </p>

            <button
              onClick={handleInstallClick}
              className="w-full bg-white text-purple-900 font-bold py-3 px-4 rounded-xl hover:scale-105 transition-transform shadow-lg flex items-center justify-center gap-2"
            >
              <Download className="w-5 h-5" />
              Instalar App
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}
