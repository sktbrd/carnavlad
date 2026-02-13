'use client';

import { useEffect } from 'react';
import confetti from 'canvas-confetti';

export default function ConfettiClick() {
  useEffect(() => {
    const handleClick = (e: MouseEvent) => {
      const colors = [
        '#FFD700', // amarelo
        '#FF4500', // vermelho
        '#32CD32', // verde
        '#00BFFF', // azul
        '#8A2BE2', // roxo
        '#FF6B35', // laranja
        '#EC4899', // rosa
      ];

      // Confetti na posição do mouse
      confetti({
        particleCount: 30,
        spread: 70,
        origin: {
          x: e.clientX / window.innerWidth,
          y: e.clientY / window.innerHeight,
        },
        colors: colors,
        ticks: 100,
        gravity: 1.2,
        decay: 0.94,
        startVelocity: 20,
        scalar: 0.8,
      });
    };

    // Adicionar listener global
    document.addEventListener('click', handleClick);

    // Cleanup
    return () => {
      document.removeEventListener('click', handleClick);
    };
  }, []);

  return null; // Componente invisível
}
