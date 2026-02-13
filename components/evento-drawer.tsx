'use client'

import { X, Calendar, MapPin, Clock, Share2, Heart } from 'lucide-react'
import { format } from 'date-fns'
import { ptBR } from 'date-fns/locale'
import type { EventoCompleto } from '@/lib/types'
import { useRouter } from 'next/navigation'

interface EventoDrawerProps {
  evento: EventoCompleto | null
  isOpen: boolean
  onClose: () => void
}

export default function EventoDrawer({ evento, isOpen, onClose }: EventoDrawerProps) {
  const router = useRouter()

  if (!isOpen || !evento) return null

  const handleViewDetails = () => {
    const slug = evento.bloco_nome
      .toLowerCase()
      .normalize('NFD')
      .replace(/[\u0300-\u036f]/g, '')
      .replace(/[^a-z0-9]+/g, '-')
      .replace(/^-|-$/g, '')
    
    router.push(`/evento/${slug}`)
  }

  return (
    <>
      {/* Overlay */}
      <div 
        className="fixed inset-0 bg-black/50 z-40 backdrop-blur-sm"
        onClick={onClose}
      />
      
      {/* Drawer */}
      <div className="fixed right-0 top-0 h-full w-full md:w-[480px] bg-gradient-to-br from-purple-900 via-pink-800 to-orange-700 z-50 shadow-2xl overflow-y-auto">
        {/* Header */}
        <div className="sticky top-0 bg-black/30 backdrop-blur-md border-b border-white/20 p-4 flex items-center justify-between">
          <h2 className="text-xl font-bold text-white truncate pr-2">
            {evento.bloco_nome}
          </h2>
          <button
            onClick={onClose}
            className="p-2 hover:bg-white/10 rounded-lg transition-colors flex-shrink-0"
          >
            <X className="w-5 h-5 text-white" />
          </button>
        </div>

        {/* Content */}
        <div className="p-6 space-y-6">
          {/* Quick Info */}
          <div className="bg-white/10 backdrop-blur-md rounded-2xl p-4 border border-white/20 space-y-3">
            <div className="flex items-start gap-3">
              <Calendar className="w-5 h-5 text-yellow-300 mt-1 flex-shrink-0" />
              <div>
                <p className="text-white/70 text-sm">Data</p>
                <p className="text-white font-semibold">
                  {format(new Date(evento.data), "EEEE, dd 'de' MMMM", { locale: ptBR })}
                </p>
              </div>
            </div>

            <div className="flex items-start gap-3">
              <Clock className="w-5 h-5 text-yellow-300 mt-1 flex-shrink-0" />
              <div>
                <p className="text-white/70 text-sm">Horário</p>
                <p className="text-white font-semibold">{evento.horario || 'A confirmar'}</p>
              </div>
            </div>

            <div className="flex items-start gap-3">
              <MapPin className="w-5 h-5 text-yellow-300 mt-1 flex-shrink-0" />
              <div>
                <p className="text-white/70 text-sm">Local</p>
                <p className="text-white font-semibold">{evento.local_nome}</p>
                {evento.local_endereco && (
                  <p className="text-white/70 text-sm mt-1">{evento.local_endereco}</p>
                )}
              </div>
            </div>
          </div>

          {/* CTAs */}
          <div className="space-y-3">
            <button
              onClick={handleViewDetails}
              className="w-full bg-gradient-to-r from-yellow-400 to-orange-500 text-purple-900 font-bold py-4 px-6 rounded-xl hover:scale-105 transition-transform shadow-lg"
            >
              Ver Detalhes Completos
            </button>

            <div className="grid grid-cols-2 gap-3">
              <button className="bg-white/20 text-white font-semibold py-3 px-4 rounded-xl hover:bg-white/30 transition-colors border border-white/30 flex items-center justify-center gap-2">
                <Heart className="w-4 h-4" />
                Favoritar
              </button>
              <button className="bg-white/20 text-white font-semibold py-3 px-4 rounded-xl hover:bg-white/30 transition-colors border border-white/30 flex items-center justify-center gap-2">
                <Share2 className="w-4 h-4" />
                Compartilhar
              </button>
            </div>
          </div>

          {/* Observações */}
          {evento.observacoes && (
            <div className="bg-white/10 backdrop-blur-md rounded-2xl p-4 border border-white/20">
              <h3 className="text-yellow-300 font-bold mb-2">Observações</h3>
              <p className="text-white text-sm">{evento.observacoes}</p>
            </div>
          )}
        </div>
      </div>
    </>
  )
}
