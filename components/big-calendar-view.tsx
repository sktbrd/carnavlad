'use client';

import { Calendar, momentLocalizer, type View } from 'react-big-calendar';
import moment from 'moment';
import 'moment/locale/pt-br';
import './shadcn-big-calendar.css';
import 'react-big-calendar/lib/css/react-big-calendar.css';
import { useMemo, useState } from 'react';
import { useBlocos } from '@/lib/hooks/use-blocos';
import type { EventoCompleto } from '@/lib/types';
import EventoDrawer from './evento-drawer';

moment.locale('pt-br');
const localizer = momentLocalizer(moment);

type CalendarEvent = {
  id: string;
  title: string;
  start: Date;
  end: Date;
  resource: EventoCompleto;
};

const messages = {
  allDay: 'Dia todo',
  previous: 'Anterior',
  next: 'Próximo',
  today: 'Hoje',
  month: 'Mês',
  week: 'Semana',
  day: 'Dia',
  agenda: 'Agenda',
  date: 'Data',
  time: 'Hora',
  event: 'Evento',
  noEventsInRange: 'Não há blocos neste período.',
  showMore: (total: number) => `+ ${total} mais`,
};

export default function BigCalendarView() {
  const { eventos, loading } = useBlocos();
  const [view, setView] = useState<View>('day');
  const [selectedEvento, setSelectedEvento] = useState<EventoCompleto | null>(null);
  const [drawerOpen, setDrawerOpen] = useState(false);
  
  // Calcular data central baseada nos eventos
  const initialDate = useMemo(() => {
    if (eventos.length === 0) return new Date('2026-02-14');
    
    const dates = eventos.map(e => new Date(e.data).getTime());
    const minDate = Math.min(...dates);
    const maxDate = Math.max(...dates);
    const middleDate = new Date((minDate + maxDate) / 2);
    
    return middleDate;
  }, [eventos]);

  const [date, setDate] = useState(initialDate);

  const calendarEvents: CalendarEvent[] = useMemo(() => {
    return eventos.map(evento => {
      const [hours, minutes] = (evento.horario || '12:00').split(':');
      const start = new Date(evento.data);
      start.setHours(parseInt(hours) || 12, parseInt(minutes) || 0, 0);

      const end = new Date(start);
      end.setHours(start.getHours() + 2); // 2 horas de duração padrão

      return {
        id: evento.id,
        title: evento.bloco_nome,
        start,
        end,
        resource: evento,
      };
    });
  }, [eventos]);

  if (loading) {
    return (
      <div className="flex items-center justify-center h-[700px] border rounded-lg">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary" />
      </div>
    );
  }

  const handleSelectEvent = (event: CalendarEvent) => {
    setSelectedEvento(event.resource);
    setDrawerOpen(true);
  };

  return (
    <>
      <div className="rounded-lg border overflow-hidden">
        <Calendar
          localizer={localizer}
          events={calendarEvents}
          startAccessor="start"
          endAccessor="end"
          view={view}
          onView={setView}
          date={date}
          onNavigate={setDate}
          onSelectEvent={handleSelectEvent}
          messages={messages}
          defaultView="week"
          views={['month', 'week', 'day', 'agenda']}
          step={60}
          showMultiDayTimes
          min={new Date(2026, 1, 14, 6, 0, 0)} // 6h da manhã
          max={new Date(2026, 1, 14, 23, 0, 0)} // 23h
          components={{
            event: ({ event }) => (
              <div className="text-xs font-medium truncate px-1">
                {event.title}
              </div>
            ),
          }}
          eventPropGetter={() => ({
            style: {
              backgroundColor: '#ec4899',
              borderColor: '#be185d',
              color: '#ffffff',
              opacity: 1,
            },
            className: 'hover:!opacity-90 transition-opacity cursor-pointer',
          })}
        />
      </div>
      
      <EventoDrawer
        evento={selectedEvento}
        isOpen={drawerOpen}
        onClose={() => setDrawerOpen(false)}
      />
    </>
  );
}
