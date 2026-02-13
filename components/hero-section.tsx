'use client';

import { useEffect, useState } from 'react';
import { Button } from '@/components/ui/button';
import { Calendar, MapPin, Sparkles } from 'lucide-react';
import { useBlocos } from '@/lib/hooks/use-blocos';
import ColourfulText from '@/components/colourful-text';
import ExportCalendarButton from '@/components/export-calendar-button';

const carnavalColors = [
  "rgb(255, 215, 0)",   // Amarelo ouro
  "rgb(255, 20, 147)",  // Rosa choque
  "rgb(138, 43, 226)",  // Roxo vibrante
  "rgb(50, 205, 50)",   // Verde limão
  "rgb(255, 69, 0)",    // Vermelho laranja
  "rgb(0, 191, 255)",   // Azul céu
  "rgb(255, 165, 0)",   // Laranja
  "rgb(255, 105, 180)", // Rosa quente
];

export default function HeroSection() {
  const { eventos } = useBlocos();
  const [countdown, setCountdown] = useState({ days: 0, hours: 0, minutes: 0 });
  const [proximoBloco, setProximoBloco] = useState<string>('');
  const [mounted, setMounted] = useState(false);

  useEffect(() => {
    setMounted(true);
  }, []);

  useEffect(() => {
    if (eventos.length === 0 || !mounted) return;

    const updateCountdown = () => {
      const now = new Date();

      // Encontrar o próximo evento
      const eventosComData = eventos.map(e => {
        try {
          const [hours, minutes] = (e.horario || '00:00').split(':');
          const eventoDate = new Date(e.data + 'T00:00:00-03:00'); // São Paulo timezone
          eventoDate.setHours(parseInt(hours) || 0, parseInt(minutes) || 0, 0);
          return { ...e, dataCompleta: eventoDate };
        } catch {
          return null;
        }
      }).filter(e => e !== null);

      const proximoEvento = eventosComData
        .filter(e => e.dataCompleta > now)
        .sort((a, b) => a.dataCompleta.getTime() - b.dataCompleta.getTime())[0];

      if (proximoEvento) {
        const diff = proximoEvento.dataCompleta.getTime() - now.getTime();

        if (diff > 0) {
          const days = Math.floor(diff / (1000 * 60 * 60 * 24));
          const hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
          const minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));

          setCountdown({ days, hours, minutes });
          setProximoBloco(proximoEvento.bloco_nome);
        }
      } else {
        // Se não houver próximo evento, usar o primeiro bloco como fallback
        setProximoBloco('Carnaval 2026');
      }
    };

    updateCountdown();
    const interval = setInterval(updateCountdown, 60000);

    return () => clearInterval(interval);
  }, [eventos, mounted]);

  return (
    <section className="relative overflow-hidden text-white">
      {/* Vídeo Background */}
      <video
        autoPlay
        muted
        loop
        playsInline
        className="absolute inset-0 w-full h-full object-cover"
      >
        <source src="/carna-nicole.mp4" type="video/mp4" />
      </video>

      {/* Overlay para melhor legibilidade do texto */}
      <div className="absolute inset-0 bg-gradient-to-br from-yellow-400/80 via-red-500/80 to-purple-600/80" />

      {/* Pattern de confete */}
      <div className="absolute inset-0 opacity-10">
        <div className="absolute top-0 left-0 w-full h-full" style={{
          backgroundImage: 'radial-gradient(circle, white 1px, transparent 1px)',
          backgroundSize: '50px 50px'
        }} />
      </div>

      <div className="container mx-auto px-4 py-16 md:py-24 relative z-10">
        <div className="max-w-3xl mx-auto text-center space-y-8">
          {/* Título */}
          <div className="space-y-4">
            <div className="inline-flex items-center gap-2 px-4 py-2 bg-white/20 backdrop-blur-sm rounded-full text-sm font-medium">
              <Sparkles className="w-4 h-4" />
              Carnaval Rio 2026
            </div>
            <h1 className="text-5xl md:text-7xl font-black tracking-tight flex items-center justify-center gap-3">
              <span className="text-6xl md:text-8xl">🎭</span>
              <ColourfulText
                text="CarnaVlad"
                colors={carnavalColors}
                interval={3000}
                animationDuration={0.6}
                staggerDelay={0.08}
              />
            </h1>
            <p className="text-xl md:text-2xl text-white/90">
              Seu guia completo dos blocos de rua do Rio
            </p>
          </div>

          {/* Contagem Regressiva */}
          {mounted && (
            <div className="space-y-4">
              <p className="text-lg md:text-xl font-semibold text-white/90">
                ⏰ Próximo bloco:
              </p>
              {proximoBloco && (
                <div className="bg-white/20 backdrop-blur-md rounded-xl px-6 py-3 inline-block">
                  <p className="text-2xl md:text-3xl font-bold">{proximoBloco}</p>
                </div>
              )}
              <div className="flex justify-center gap-4 md:gap-6">
                <div className="bg-white/20 backdrop-blur-md rounded-2xl p-4 md:p-6 min-w-[100px]">
                  <div className="text-4xl md:text-5xl font-black">{countdown.days}</div>
                  <div className="text-sm md:text-base text-white/80 mt-1">dias</div>
                </div>
                <div className="bg-white/20 backdrop-blur-md rounded-2xl p-4 md:p-6 min-w-[100px]">
                  <div className="text-4xl md:text-5xl font-black">{countdown.hours}</div>
                  <div className="text-sm md:text-base text-white/80 mt-1">horas</div>
                </div>
                <div className="bg-white/20 backdrop-blur-md rounded-2xl p-4 md:p-6 min-w-[100px]">
                  <div className="text-4xl md:text-5xl font-black">{countdown.minutes}</div>
                  <div className="text-sm md:text-base text-white/80 mt-1">min</div>
                </div>
              </div>
              <p className="text-sm md:text-base text-white/80">
                {proximoBloco ? `Até ${proximoBloco} começar! 🎉` : 'Carregando próximo bloco...'}
              </p>
            </div>
          )}
          
          {!mounted && (
            <div className="space-y-4 opacity-0 animate-pulse">
              <p className="text-lg md:text-xl font-semibold text-white/90">
                Carregando...
              </p>
            </div>
          )}

          {/* CTAs */}
          <div className="flex flex-col sm:flex-row gap-4 justify-center items-center">
            <ExportCalendarButton />
            <Button size="lg" className="bg-white text-purple-600 hover:bg-white/90 text-lg px-8 shadow-xl">
              <Calendar className="w-5 h-5 mr-2" />
              Ver Agenda Completa
            </Button>
            <Button size="lg" variant="outline" className="bg-transparent border-2 border-white text-white hover:bg-white/10 text-lg px-8">
              <MapPin className="w-5 h-5 mr-2" />
              Explorar Mapa
            </Button>
          </div>

          {/* Stats */}
          <div className="flex flex-wrap justify-center gap-8 pt-8 border-t border-white/20">
            <div>
              <div className="text-3xl font-bold">250+</div>
              <div className="text-sm text-white/70">Blocos</div>
            </div>
            <div>
              <div className="text-3xl font-bold">8</div>
              <div className="text-sm text-white/70">Dias de Festa</div>
            </div>
            <div>
              <div className="text-3xl font-bold">100+</div>
              <div className="text-sm text-white/70">Bairros</div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
