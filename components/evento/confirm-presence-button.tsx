'use client';

import { Heart, LogIn, Loader2 } from 'lucide-react';
import { usePresenca } from '@/lib/hooks/use-presenca';

interface ConfirmPresenceButtonProps {
  eventoId: string;
  eventName: string;
  variant?: 'default' | 'compact';
}

export function ConfirmPresenceButton({ eventoId, eventName, variant = 'default' }: ConfirmPresenceButtonProps) {
  const { confirmado, loading, isAuthenticated, togglePresenca } = usePresenca(eventoId);

  if (loading) {
    return (
      <button
        disabled
        className={`font-bold rounded-xl opacity-50 cursor-not-allowed flex items-center justify-center gap-2 ${
          variant === 'compact'
            ? 'py-2 px-4 text-sm'
            : 'w-full py-4 px-6'
        } bg-gradient-to-r from-yellow-400 to-orange-500 text-purple-900`}
      >
        <Loader2 className="w-5 h-5 animate-spin" />
        {variant === 'default' && 'Carregando...'}
      </button>
    );
  }

  if (!isAuthenticated) {
    return (
      <button
        onClick={togglePresenca}
        className={`font-bold rounded-xl hover:scale-105 transition-transform shadow-lg flex items-center justify-center gap-2 ${
          variant === 'compact'
            ? 'py-2 px-4 text-sm'
            : 'w-full py-4 px-6'
        } bg-gradient-to-r from-yellow-400 to-orange-500 text-purple-900`}
      >
        <LogIn className="w-5 h-5" />
        {variant === 'default' ? 'Entrar para Confirmar' : 'Login'}
      </button>
    );
  }

  return (
    <button
      onClick={togglePresenca}
      className={`font-bold rounded-xl hover:scale-105 transition-transform shadow-lg flex items-center justify-center gap-2 ${
        variant === 'compact'
          ? 'py-2 px-4 text-sm'
          : 'w-full py-4 px-6'
      } ${
        confirmado
          ? 'bg-gradient-to-r from-pink-500 to-purple-600 text-white'
          : 'bg-gradient-to-r from-yellow-400 to-orange-500 text-purple-900'
      }`}
    >
      <Heart className={`w-5 h-5 ${confirmado ? 'fill-current' : ''}`} />
      {variant === 'default' && (confirmado ? 'Presença Confirmada!' : 'Confirmar Presença')}
      {variant === 'compact' && (confirmado ? 'Confirmado' : 'Confirmar')}
    </button>
  );
}
