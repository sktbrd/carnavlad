'use client'

import { Share2, Check } from 'lucide-react'
import { useState } from 'react'

interface ShareButtonProps {
  eventData: {
    name: string
    date: string
  }
}

export function ShareButton({ eventData }: ShareButtonProps) {
  const [copied, setCopied] = useState(false)

  const handleShare = async () => {
    const shareData = {
      title: eventData.name,
      text: `Vem pro ${eventData.name}! 🎭✨`,
      url: window.location.href,
    }

    // Check if Web Share API is available
    if (navigator.share) {
      try {
        await navigator.share(shareData)
      } catch (error) {
        // User cancelled or error occurred
        if ((error as Error).name !== 'AbortError') {
          console.error('Erro ao compartilhar:', error)
        }
      }
    } else {
      // Fallback: copy link to clipboard
      try {
        await navigator.clipboard.writeText(window.location.href)
        setCopied(true)
        setTimeout(() => setCopied(false), 2000)
      } catch (error) {
        console.error('Erro ao copiar link:', error)
        alert('Erro ao copiar link')
      }
    }
  }

  return (
    <button
      onClick={handleShare}
      className="w-full mt-3 bg-white/20 text-white font-semibold py-3 px-6 rounded-xl hover:bg-white/30 transition-colors border border-white/30 flex items-center justify-center gap-2"
    >
      {copied ? (
        <>
          <Check className="w-4 h-4" />
          Link Copiado!
        </>
      ) : (
        <>
          <Share2 className="w-4 h-4" />
          Compartilhar Evento
        </>
      )}
    </button>
  )
}
