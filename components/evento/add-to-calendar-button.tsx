'use client'

import { Calendar, Download } from 'lucide-react'
import { createEvent, type EventAttributes } from 'ics'

interface AddToCalendarButtonProps {
  eventData: {
    name: string
    description: string
    date: string
    time: string
    location: string
    address: string
  }
}

export function AddToCalendarButton({ eventData }: AddToCalendarButtonProps) {
  const handleAddToCalendar = () => {
    try {
      // Parse date and time
      const [year, month, day] = eventData.date.split('-').map(Number)
      const [hours, minutes] = eventData.time.split(':').map(Number)
      
      // Create event
      const event: EventAttributes = {
        start: [year, month, day, hours || 14, minutes || 0],
        duration: { hours: 3 },
        title: eventData.name,
        description: eventData.description,
        location: `${eventData.location}, ${eventData.address}`,
        status: 'CONFIRMED',
        busyStatus: 'BUSY',
        organizer: { name: eventData.name },
        url: window.location.href,
      }

      createEvent(event, (error, value) => {
        if (error) {
          console.error('Erro ao criar evento:', error)
          alert('Erro ao gerar arquivo de calendário')
          return
        }

        // Download .ics file
        const blob = new Blob([value], { type: 'text/calendar;charset=utf-8' })
        const link = document.createElement('a')
        link.href = URL.createObjectURL(blob)
        link.download = `${eventData.name.toLowerCase().replace(/\s+/g, '-')}.ics`
        document.body.appendChild(link)
        link.click()
        document.body.removeChild(link)
        URL.revokeObjectURL(link.href)
      })
    } catch (error) {
      console.error('Erro ao adicionar ao calendário:', error)
      alert('Erro ao gerar arquivo de calendário')
    }
  }

  return (
    <button
      onClick={handleAddToCalendar}
      className="w-full mt-3 bg-white/20 text-white font-semibold py-3 px-6 rounded-xl hover:bg-white/30 transition-colors border border-white/30 flex items-center justify-center gap-2"
    >
      <Calendar className="w-4 h-4" />
      Adicionar ao Calendário
      <Download className="w-3 h-3" />
    </button>
  )
}
