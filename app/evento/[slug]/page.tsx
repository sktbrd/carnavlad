import { notFound } from 'next/navigation';
import Link from 'next/link';
import { ArrowLeft, Calendar, MapPin, Clock, Users } from 'lucide-react';
import { generateBlocoContent } from '@/lib/groq-generator';
import { AddToCalendarButton } from '@/components/evento/add-to-calendar-button';
import { ShareButton } from '@/components/evento/share-button';
import { ConfirmPresenceButton } from '@/components/evento/confirm-presence-button';
import { parseLocalDate } from '@/lib/date-utils';
import { createClient } from '@/lib/supabase/server';

interface EventPageProps {
  params: Promise<{ slug: string }>;
}

// Helper para criar slug a partir do nome do bloco
function createSlug(name: string): string {
  return name
    .toLowerCase()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-|-$/g, '');
}

// Helper inverso: slug -> nome
function slugToName(slug: string): string {
  return slug
    .split('-')
    .map((word: string) => word.charAt(0).toUpperCase() + word.slice(1))
    .join(' ');
}

// Mock data - será substituído por dados reais do banco depois
const MOCK_EVENTS: Record<string, any> = {
  'bloco-da-alegria': {
    name: 'Bloco da Alegria',
    date: '2026-02-15',
    time: '14:00',
    location: 'Praça da República',
    address: 'Praça da República, Centro - São Paulo/SP',
  },
  'cordao-do-boitata': {
    name: 'Cordão do Boitatá',
    date: '2026-02-16',
    time: '16:00',
    location: 'Largo da Batata',
    address: 'Largo da Batata, Pinheiros - São Paulo/SP',
  }
};

export default async function EventPage({ params }: EventPageProps) {
  const { slug } = await params;

  // Buscar evento real do Supabase
  const supabase = await createClient();
  let evento = null;
  let eventoId = null;

  if (supabase) {
    const { data, error } = await supabase
      .from('eventos_completos')
      .select('*')
      .eq('bloco_slug', slug)
      .limit(1)
      .single();

    if (!error && data) {
      evento = data;
      eventoId = data.id;
    }
  }

  let eventData;
  
  if (evento) {
    // Usar dados reais do Supabase
    const eventDate = parseLocalDate(evento.data);
    const formattedDate = eventDate.toLocaleDateString('pt-BR', {
      weekday: 'long',
      year: 'numeric',
      month: 'long',
      day: 'numeric'
    });

    eventData = {
      id: evento.id,
      name: evento.bloco_nome,
      slug: evento.bloco_slug,
      description: evento.bloco_descricao || 'Um dos blocos mais animados do carnaval!',
      date: evento.data,
      time: evento.horario || 'A confirmar',
      location: evento.local_nome,
      address: evento.local_endereco,
      lat: evento.local_lat,
      lng: evento.local_lng,
      capacity: evento.publico_estimado || 5000,
      price: 'Gratuito',
      organizer: evento.bloco_nome,
      contact: evento.instagram_url ? '@' + evento.instagram_url.split('/').pop() : '@' + slug,
      image: evento.bloco_photo_url || 'https://images.unsplash.com/photo-1533174072545-7a4b6ad7a6c3?w=800',
      tags: evento.tipo ? [evento.tipo, 'Carnaval', evento.bairro_nome].filter(Boolean) : ['Carnaval'],
      details: {
        whatToBring: ['Água', 'Protetor solar', 'Fantasia', 'Dinheiro em espécie'],
        rules: ['Respeitar o próximo', 'Não jogar lixo no chão', 'Beber com moderação', 'Seguir as instruções da organização'],
        accessibility: evento.observacoes || 'Consulte a organização para informações de acessibilidade'
      }
    };
  } else if (MOCK_EVENTS[slug]) {
    eventData = {
      ...MOCK_EVENTS[slug],
      slug,
      description: 'Um dos blocos mais animados do carnaval! Venha com sua fantasia e muita energia.',
      capacity: 5000,
      price: 'Gratuito',
      organizer: MOCK_EVENTS[slug].name,
      contact: '@' + slug,
      image: 'https://images.unsplash.com/photo-1533174072545-7a4b6ad7a6c3?w=800',
      tags: ['Samba', 'Carnaval', 'Festa'],
      details: {
        whatToBring: ['Água', 'Protetor solar', 'Fantasia'],
        rules: ['Respeitar o próximo', 'Não jogar lixo no chão', 'Beber com moderação'],
        accessibility: 'Consulte a organização'
      }
    };
  } else {
    // Gera conteúdo dinâmico com Groq AI 🎭
    const name = slugToName(slug);
    const location = 'Rio de Janeiro';
    
    // Gera conteúdo usando IA
    const aiContent = await generateBlocoContent(name, location);
    
    eventData = {
      name,
      slug,
      description: aiContent.description,
      date: '2026-02-15',
      time: 'A confirmar',
      location,
      address: 'Local a confirmar',
      capacity: 5000,
      price: 'Gratuito',
      organizer: name,
      contact: '@' + slug,
      image: 'https://images.unsplash.com/photo-1533174072545-7a4b6ad7a6c3?w=800',
      tags: aiContent.tags,
      details: {
        whatToBring: aiContent.whatToBring,
        rules: aiContent.rules,
        accessibility: 'Consulte a organização para informações de acessibilidade'
      }
    };
  }

  const eventDate = parseLocalDate(eventData.date);
  const formattedDate = eventDate.toLocaleDateString('pt-BR', {
    weekday: 'long',
    year: 'numeric',
    month: 'long',
    day: 'numeric'
  });

  return (
    <div className="min-h-screen bg-gradient-to-br from-purple-900 via-pink-800 to-orange-700">
      {/* Header */}
      <div className="container mx-auto px-4 py-6">
        <Link 
          href="/"
          className="inline-flex items-center gap-2 text-white hover:text-yellow-300 transition-colors"
        >
          <ArrowLeft className="w-5 h-5" />
          <span>Voltar</span>
        </Link>
      </div>

      {/* Hero Image */}
      <div className="relative h-64 md:h-96 overflow-hidden">
        <img 
          src={eventData.image} 
          alt={eventData.name}
          className="w-full h-full object-cover"
        />
        <div className="absolute inset-0 bg-gradient-to-t from-black/70 via-black/30 to-transparent" />
        <div className="absolute bottom-0 left-0 right-0 p-8">
          <div className="container mx-auto">
            <h1 className="text-4xl md:text-6xl font-black text-white mb-4 drop-shadow-lg">
              {eventData.name}
            </h1>
            <div className="flex flex-wrap gap-2">
              {eventData.tags.map((tag: string) => (
                <span 
                  key={tag}
                  className="px-3 py-1 bg-yellow-400 text-purple-900 rounded-full text-sm font-bold"
                >
                  {tag}
                </span>
              ))}
            </div>
          </div>
        </div>
      </div>

      {/* Content */}
      <div className="container mx-auto px-4 py-12">
        <div className="grid md:grid-cols-3 gap-8">
          {/* Main Info */}
          <div className="md:col-span-2 space-y-8">
            {/* Description */}
            <div className="bg-white/10 backdrop-blur-md rounded-2xl p-6 border border-white/20">
              <h2 className="text-2xl font-bold text-yellow-300 mb-4">Sobre o Evento</h2>
              <p className="text-white text-lg leading-relaxed">
                {eventData.description}
              </p>
            </div>

            {/* What to Bring */}
            <div className="bg-white/10 backdrop-blur-md rounded-2xl p-6 border border-white/20">
              <h2 className="text-2xl font-bold text-yellow-300 mb-4">O que levar</h2>
              <ul className="space-y-2">
                {eventData.details.whatToBring.map((item: string, idx: number) => (
                  <li key={idx} className="text-white flex items-center gap-2">
                    <span className="text-yellow-300">✓</span>
                    {item}
                  </li>
                ))}
              </ul>
            </div>

            {/* Rules */}
            <div className="bg-white/10 backdrop-blur-md rounded-2xl p-6 border border-white/20">
              <h2 className="text-2xl font-bold text-yellow-300 mb-4">Regras e Recomendações</h2>
              <ul className="space-y-2">
                {eventData.details.rules.map((rule: string, idx: number) => (
                  <li key={idx} className="text-white flex items-center gap-2">
                    <span className="text-yellow-300">•</span>
                    {rule}
                  </li>
                ))}
              </ul>
            </div>

            {/* Accessibility */}
            <div className="bg-white/10 backdrop-blur-md rounded-2xl p-6 border border-white/20">
              <h2 className="text-2xl font-bold text-yellow-300 mb-4">Acessibilidade</h2>
              <p className="text-white">{eventData.details.accessibility}</p>
            </div>
          </div>

          {/* Sidebar */}
          <div className="space-y-6">
            {/* Quick Info Card */}
            <div className="bg-white/10 backdrop-blur-md rounded-2xl p-6 border border-white/20 sticky top-6">
              <h3 className="text-xl font-bold text-yellow-300 mb-6">Informações</h3>
              
              <div className="space-y-4">
                <div className="flex items-start gap-3">
                  <Calendar className="w-5 h-5 text-yellow-300 mt-1 flex-shrink-0" />
                  <div>
                    <p className="text-white/70 text-sm">Data</p>
                    <p className="text-white font-semibold capitalize">{formattedDate}</p>
                  </div>
                </div>

                <div className="flex items-start gap-3">
                  <Clock className="w-5 h-5 text-yellow-300 mt-1 flex-shrink-0" />
                  <div>
                    <p className="text-white/70 text-sm">Horário</p>
                    <p className="text-white font-semibold">{eventData.time}</p>
                  </div>
                </div>

                <div className="flex items-start gap-3">
                  <MapPin className="w-5 h-5 text-yellow-300 mt-1 flex-shrink-0" />
                  <div>
                    <p className="text-white/70 text-sm">Local</p>
                    <p className="text-white font-semibold">{eventData.location}</p>
                    <p className="text-white/70 text-sm mt-1">{eventData.address}</p>
                  </div>
                </div>

                <div className="flex items-start gap-3">
                  <Users className="w-5 h-5 text-yellow-300 mt-1 flex-shrink-0" />
                  <div>
                    <p className="text-white/70 text-sm">Capacidade</p>
                    <p className="text-white font-semibold">{eventData.capacity.toLocaleString('pt-BR')} pessoas</p>
                  </div>
                </div>

                <div className="pt-4 border-t border-white/20">
                  <p className="text-white/70 text-sm">Entrada</p>
                  <p className="text-yellow-300 font-bold text-2xl mt-1">{eventData.price}</p>
                </div>

                <div className="pt-2">
                  <p className="text-white/70 text-sm">Organização</p>
                  <p className="text-white font-semibold">{eventData.organizer}</p>
                  <p className="text-yellow-300 text-sm mt-1">{eventData.contact}</p>
                </div>
              </div>

              {/* CTA Buttons */}
              <ConfirmPresenceButton eventoId={eventoId || slug} eventName={eventData.name} />
              <AddToCalendarButton eventData={eventData} />
              <ShareButton eventData={eventData} />
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
