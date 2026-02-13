'use client';

import { useState } from 'react';
import { Share2, Check } from 'lucide-react';

interface ShareProfileButtonProps {
  username: string;
}

export default function ShareProfileButton({ username }: ShareProfileButtonProps) {
  const [copied, setCopied] = useState(false);

  const profileUrl = `${window.location.origin}/u/${username}`;

  const handleShare = async () => {
    // Tentar usar Web Share API (mobile)
    if (navigator.share) {
      try {
        await navigator.share({
          title: `Meu perfil no Carnavlad`,
          text: `Veja os blocos que eu vou no Carnaval 2026!`,
          url: profileUrl,
        });
        return;
      } catch (err) {
        // Fallback para copiar
      }
    }

    // Copiar para clipboard
    try {
      await navigator.clipboard.writeText(profileUrl);
      setCopied(true);
      setTimeout(() => setCopied(false), 2000);
    } catch (err) {
      console.error('Erro ao copiar:', err);
    }
  };

  return (
    <button
      onClick={handleShare}
      className={`inline-flex items-center gap-2 font-bold py-3 px-6 rounded-xl transition-all shadow-lg ${
        copied
          ? 'bg-green-500 text-white'
          : 'bg-gradient-to-r from-yellow-400 to-orange-500 text-purple-900 hover:scale-105'
      }`}
    >
      {copied ? (
        <>
          <Check className="w-5 h-5" />
          Link Copiado!
        </>
      ) : (
        <>
          <Share2 className="w-5 h-5" />
          Compartilhar Perfil
        </>
      )}
    </button>
  );
}
