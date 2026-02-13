import { notFound } from 'next/navigation';
import Link from 'next/link';
import { ArrowLeft, Calendar, MapPin, Clock, Users } from 'lucide-react';
import { db } from '@/lib/db';

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

export default async function EventPage({ params }: EventPageProps) {
  const { slug } = await params;

  // Buscar todos os eventos e encontrar pelo slug
  const eventos = await db.query(
    `SELECT 
      e.id,
      e.data,
      e.horario,
      e.horario_confirmado,
      e.observacoes,
      b.nome as bloco_nome,
      l.nome as local_nome,
      l.endereco as local_endereco,
      l.latitude,
      l.longitude
    FROM eventos e
    JOIN blocos b ON e.bloco_id = b.id
    JOIN locais l ON e.local_id = l.id
    ORDER BY e.data, e.horario`
  );

  const event = eventos.rows.find(e => createSlug(e.bloco_nome) === slug);

  if (!event) {
    notFound();
  }

  // Gerar dados adicionais mock por enquanto (depois vem do banco)
  const eventData = {
    name: event.bloco_nome,
    slug,
    description: event.observacoes || 'Um dos blocos mais animados do carnaval! Venha com sua fantasia e muita energia.',
    date: event.data,
    time: event.horario || 'A confirmar',
    location: event.local_nome,
    address: event.local_endereco,
    capacity: 5000,
    price: 'Gratuito',
    organizer: event.bloco_nome,
    contact: '@' + createSlug(event.bloco_nome),
    image: 'https://images.unsplash.com/photo-1533174072545-7a4b6ad7a6c3?w=800',
    tags: ['Samba', 'Carnaval', 'Festa'],
    details: {
      whatToBring: ['Água', 'Protetor solar', 'Fantasia'],
      rules: ['Respeitar o próximo', 'Não jogar lixo no chão', 'Beber com moderação'],
      accessibility: 'Consulte a organização'
    }
  };

  const eventDate = new Date(eventData.date);
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
              {eventData.tags.map(tag => (
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
                {eventData.details.whatToBring.map((item, idx) => (
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
                {eventData.details.rules.map((rule, idx) => (
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

              {/* CTA Button */}
              <button className="w-full mt-6 bg-gradient-to-r from-yellow-400 to-orange-500 text-purple-900 font-bold py-4 px-6 rounded-xl hover:scale-105 transition-transform shadow-lg">
                Confirmar Presença
              </button>

              <button className="w-full mt-3 bg-white/20 text-white font-semibold py-3 px-6 rounded-xl hover:bg-white/30 transition-colors border border-white/30">
                Compartilhar Evento
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
