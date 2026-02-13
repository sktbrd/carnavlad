'use client';

import { useState, Suspense } from 'react';
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs';
import { Calendar, List, MapPin, Clock } from 'lucide-react';
import HeroSection from '@/components/hero-section';
import Footer from '@/components/footer';
import AgendaView from '@/components/views/agenda-view';
import ListaView from '@/components/views/lista-view';
import CalendarioView from '@/components/views/calendario-view';
import MapaView from '@/components/views/mapa-view';
import AuthHandler from './auth-handler';
import type { ModoVisualizacao } from '@/lib/types';

export default function Home() {
  const [modo, setModo] = useState<ModoVisualizacao>('calendario');

  return (
    <main className="min-h-screen">
      <Suspense fallback={null}>
        <AuthHandler />
      </Suspense>
      {/* Hero Section */}
      <HeroSection />

      {/* Main Content */}
      <div className="container mx-auto px-4 py-8">
        <Tabs value={modo} onValueChange={(v) => setModo(v as ModoVisualizacao)} className="w-full">
          {/* Tabs redesenhadas */}
          <div className="mb-8 bg-white rounded-2xl shadow-md border border-gray-100 p-2">
            <div className="grid grid-cols-2 md:grid-cols-4 gap-2">
              <button
                onClick={() => setModo('calendario')}
                className={`relative flex flex-col sm:flex-row items-center justify-center gap-2 py-4 px-6 rounded-xl transition-all duration-300 cursor-pointer group focus:outline-none focus:ring-2 focus:ring-orange-500 focus:ring-offset-2 ${
                  modo === 'calendario'
                    ? 'bg-white shadow-lg'
                    : 'bg-gray-50 hover:bg-gray-100 hover:shadow-sm'
                }`}
                role="tab"
                aria-selected={modo === 'calendario'}
              >
                <Calendar className={`w-6 h-6 transition-colors duration-300 ${
                  modo === 'calendario' ? 'text-orange-500' : 'text-gray-400 group-hover:text-orange-400'
                }`} />
                <span className={`text-sm font-medium transition-all duration-300 ${
                  modo === 'calendario' ? 'text-gray-900 font-bold' : 'text-gray-600'
                }`}>
                  Calendário
                </span>
                {/* Barra gradiente animada */}
                <div className={`absolute bottom-0 left-0 right-0 h-1 bg-gradient-to-r from-orange-500 to-pink-600 rounded-b-xl transition-all duration-300 ${
                  modo === 'calendario' ? 'opacity-100 scale-100' : 'opacity-0 scale-0'
                }`} />
              </button>

              <button
                onClick={() => setModo('agenda')}
                className={`relative flex flex-col sm:flex-row items-center justify-center gap-2 py-4 px-6 rounded-xl transition-all duration-300 cursor-pointer group focus:outline-none focus:ring-2 focus:ring-orange-500 focus:ring-offset-2 ${
                  modo === 'agenda'
                    ? 'bg-white shadow-lg'
                    : 'bg-gray-50 hover:bg-gray-100 hover:shadow-sm'
                }`}
                role="tab"
                aria-selected={modo === 'agenda'}
              >
                <Clock className={`w-6 h-6 transition-colors duration-300 ${
                  modo === 'agenda' ? 'text-orange-500' : 'text-gray-400 group-hover:text-orange-400'
                }`} />
                <span className={`text-sm font-medium transition-all duration-300 ${
                  modo === 'agenda' ? 'text-gray-900 font-bold' : 'text-gray-600'
                }`}>
                  Agenda
                </span>
                <div className={`absolute bottom-0 left-0 right-0 h-1 bg-gradient-to-r from-orange-500 to-pink-600 rounded-b-xl transition-all duration-300 ${
                  modo === 'agenda' ? 'opacity-100 scale-100' : 'opacity-0 scale-0'
                }`} />
              </button>

              <button
                onClick={() => setModo('lista')}
                className={`relative flex flex-col sm:flex-row items-center justify-center gap-2 py-4 px-6 rounded-xl transition-all duration-300 cursor-pointer group focus:outline-none focus:ring-2 focus:ring-orange-500 focus:ring-offset-2 ${
                  modo === 'lista'
                    ? 'bg-white shadow-lg'
                    : 'bg-gray-50 hover:bg-gray-100 hover:shadow-sm'
                }`}
                role="tab"
                aria-selected={modo === 'lista'}
              >
                <List className={`w-6 h-6 transition-colors duration-300 ${
                  modo === 'lista' ? 'text-orange-500' : 'text-gray-400 group-hover:text-orange-400'
                }`} />
                <span className={`text-sm font-medium transition-all duration-300 ${
                  modo === 'lista' ? 'text-gray-900 font-bold' : 'text-gray-600'
                }`}>
                  Lista
                </span>
                <div className={`absolute bottom-0 left-0 right-0 h-1 bg-gradient-to-r from-orange-500 to-pink-600 rounded-b-xl transition-all duration-300 ${
                  modo === 'lista' ? 'opacity-100 scale-100' : 'opacity-0 scale-0'
                }`} />
              </button>

              <button
                onClick={() => setModo('mapa')}
                className={`relative flex flex-col sm:flex-row items-center justify-center gap-2 py-4 px-6 rounded-xl transition-all duration-300 cursor-pointer group focus:outline-none focus:ring-2 focus:ring-orange-500 focus:ring-offset-2 ${
                  modo === 'mapa'
                    ? 'bg-white shadow-lg'
                    : 'bg-gray-50 hover:bg-gray-100 hover:shadow-sm'
                }`}
                role="tab"
                aria-selected={modo === 'mapa'}
              >
                <MapPin className={`w-6 h-6 transition-colors duration-300 ${
                  modo === 'mapa' ? 'text-orange-500' : 'text-gray-400 group-hover:text-orange-400'
                }`} />
                <span className={`text-sm font-medium transition-all duration-300 ${
                  modo === 'mapa' ? 'text-gray-900 font-bold' : 'text-gray-600'
                }`}>
                  Mapa
                </span>
                <div className={`absolute bottom-0 left-0 right-0 h-1 bg-gradient-to-r from-orange-500 to-pink-600 rounded-b-xl transition-all duration-300 ${
                  modo === 'mapa' ? 'opacity-100 scale-100' : 'opacity-0 scale-0'
                }`} />
              </button>
            </div>
          </div>

          <TabsList className="hidden">
            <TabsTrigger value="calendario" />
            <TabsTrigger value="agenda" />
            <TabsTrigger value="lista" />
            <TabsTrigger value="mapa" />
          </TabsList>

          <TabsContent value="agenda" className="mt-0">
            <AgendaView />
          </TabsContent>

          <TabsContent value="lista" className="mt-0">
            <ListaView />
          </TabsContent>

          <TabsContent value="calendario" className="mt-0">
            <CalendarioView />
          </TabsContent>

          <TabsContent value="mapa" className="mt-0">
            <MapaView />
          </TabsContent>
        </Tabs>
      </div>

      {/* Footer */}
      <Footer />
    </main>
  );
}
