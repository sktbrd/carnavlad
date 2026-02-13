import { createEvents, type EventAttributes } from 'ics';
import type { EventoCompleto } from './types';

export function generateICSFile(eventos: EventoCompleto[]) {
  const events: EventAttributes[] = eventos.map(evento => {
    const [hours, minutes] = (evento.horario || '12:00').split(':');
    const date = new Date(evento.data);
    date.setHours(parseInt(hours) || 12, parseInt(minutes) || 0, 0);

    const endDate = new Date(date);
    endDate.setHours(date.getHours() + 3); // 3 horas de duração

    return {
      start: [
        date.getFullYear(),
        date.getMonth() + 1,
        date.getDate(),
        date.getHours(),
        date.getMinutes(),
      ] as [number, number, number, number, number],
      end: [
        endDate.getFullYear(),
        endDate.getMonth() + 1,
        endDate.getDate(),
        endDate.getHours(),
        endDate.getMinutes(),
      ] as [number, number, number, number, number],
      title: evento.bloco_nome,
      description: `${evento.bloco_nome}\n\nLocal: ${evento.local_endereco}${evento.observacoes ? `\n\nObservações: ${evento.observacoes}` : ''}\n\nCarnaVlad - Seu guia do Carnaval Rio 2026`,
      location: evento.local_endereco,
      url: typeof window !== 'undefined' ? window.location.origin : 'http://localhost:30303',
      status: 'CONFIRMED' as const,
      busyStatus: 'FREE' as const,
      organizer: { name: 'CarnaVlad', email: 'contato@carnavlad.com' },
      categories: ['Carnaval', 'Rio de Janeiro', 'Blocos'],
    };
  });

  const { error, value } = createEvents(events);

  if (error) {
    console.error('Erro ao criar ICS:', error);
    return null;
  }

  return value;
}

export function downloadICS(eventos: EventoCompleto[]) {
  const icsContent = generateICSFile(eventos);
  
  if (!icsContent) {
    alert('Erro ao gerar arquivo de calendário');
    return;
  }

  const blob = new Blob([icsContent], { type: 'text/calendar;charset=utf-8' });
  const url = window.URL.createObjectURL(blob);
  const link = document.createElement('a');
  link.href = url;
  link.download = 'carnaval-rio-2026.ics';
  document.body.appendChild(link);
  link.click();
  document.body.removeChild(link);
  window.URL.revokeObjectURL(url);
}

export function getGoogleCalendarUrl(evento: EventoCompleto) {
  const [hours, minutes] = (evento.horario || '12:00').split(':');
  const date = new Date(evento.data);
  date.setHours(parseInt(hours) || 12, parseInt(minutes) || 0, 0);

  const endDate = new Date(date);
  endDate.setHours(date.getHours() + 3);

  const formatDate = (d: Date) => {
    return d.toISOString().replace(/[-:]/g, '').split('.')[0] + 'Z';
  };

  const params = new URLSearchParams({
    action: 'TEMPLATE',
    text: evento.bloco_nome,
    dates: `${formatDate(date)}/${formatDate(endDate)}`,
    details: `${evento.bloco_nome}\n\nLocal: ${evento.local_endereco}${evento.observacoes ? `\n\nObservações: ${evento.observacoes}` : ''}\n\nCarnaVlad - Seu guia do Carnaval Rio 2026`,
    location: evento.local_endereco,
  });

  return `https://calendar.google.com/calendar/render?${params.toString()}`;
}

export function openGoogleCalendarMultiple(eventos: EventoCompleto[]) {
  // Abre múltiplas abas do Google Calendar (uma para cada evento)
  // Limitando a 5 por vez para não sobrecarregar
  if (eventos.length > 5) {
    const confirm = window.confirm(
      `Isso abrirá ${eventos.length} abas do navegador (uma para cada bloco). Tem certeza?`
    );
    if (!confirm) return;
  }

  eventos.forEach((evento, index) => {
    setTimeout(() => {
      window.open(getGoogleCalendarUrl(evento), '_blank');
    }, index * 300); // 300ms de delay entre cada aba
  });
}

export function createICSDataUrl(eventos: EventoCompleto[]) {
  const icsContent = generateICSFile(eventos);
  if (!icsContent) return null;
  
  const blob = new Blob([icsContent], { type: 'text/calendar;charset=utf-8' });
  return URL.createObjectURL(blob);
}

export function openAppleCalendar(eventos: EventoCompleto[]) {
  const icsContent = generateICSFile(eventos);
  if (!icsContent) return;

  // Cria um data URL
  const dataUrl = `data:text/calendar;charset=utf-8,${encodeURIComponent(icsContent)}`;
  
  // Tenta abrir com webcal:// protocol (macOS/iOS)
  const link = document.createElement('a');
  link.href = dataUrl;
  link.download = 'carnaval-rio-2026.ics';
  link.click();
}

export function openOutlookWeb(eventos: EventoCompleto[]) {
  const icsContent = generateICSFile(eventos);
  if (!icsContent) return;

  // Cria blob e baixa
  const blob = new Blob([icsContent], { type: 'text/calendar;charset=utf-8' });
  const url = URL.createObjectURL(blob);
  const link = document.createElement('a');
  link.href = url;
  link.download = 'carnaval-rio-2026.ics';
  link.click();
  URL.revokeObjectURL(url);

  // Abre Outlook Web
  setTimeout(() => {
    window.open('https://outlook.live.com/calendar/0/view/month', '_blank');
  }, 500);
}
