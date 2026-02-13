'use client';

import { Button } from '@/components/ui/button';
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
  DropdownMenuSub,
  DropdownMenuSubContent,
  DropdownMenuSubTrigger,
} from '@/components/ui/dropdown-menu';
import { Download, Calendar as CalendarIcon, ExternalLink, Zap } from 'lucide-react';
import { useBlocos } from '@/lib/hooks/use-blocos';
import { downloadICS, openGoogleCalendarMultiple, openAppleCalendar, openOutlookWeb } from '@/lib/export-calendar';

export default function ExportCalendarButton() {
  const { eventos } = useBlocos();

  const handleExportICS = () => {
    downloadICS(eventos);
  };

  const handleGoogleCalendarDirect = () => {
    openGoogleCalendarMultiple(eventos);
  };

  const handleGoogleCalendarFile = () => {
    downloadICS(eventos);
  };

  const handleAppleCalendar = () => {
    openAppleCalendar(eventos);
  };

  const handleOutlook = () => {
    openOutlookWeb(eventos);
  };

  return (
    <DropdownMenu>
      <DropdownMenuTrigger asChild>
        <Button size="lg" variant="outline" className="bg-white/10 border-white/20 text-white hover:bg-white/20 hover:text-white backdrop-blur-sm">
          <CalendarIcon className="w-5 h-5 mr-2" />
          Adicionar ao Calendário
        </Button>
      </DropdownMenuTrigger>
      <DropdownMenuContent align="center" className="w-64">
        <DropdownMenuLabel>Exportar {eventos.length} blocos</DropdownMenuLabel>
        <DropdownMenuSeparator />
        
        <DropdownMenuSub>
          <DropdownMenuSubTrigger>
            <CalendarIcon className="w-4 h-4 mr-2" />
            Google Calendar
          </DropdownMenuSubTrigger>
          <DropdownMenuSubContent>
            <DropdownMenuItem onClick={handleGoogleCalendarDirect} className="cursor-pointer">
              <Zap className="w-4 h-4 mr-2 text-yellow-500" />
              <div className="flex flex-col">
                <span>Adicionar direto</span>
                <span className="text-xs text-muted-foreground">Abre {eventos.length} abas</span>
              </div>
            </DropdownMenuItem>
            <DropdownMenuItem onClick={handleGoogleCalendarFile} className="cursor-pointer">
              <Download className="w-4 h-4 mr-2" />
              Baixar arquivo .ics
            </DropdownMenuItem>
          </DropdownMenuSubContent>
        </DropdownMenuSub>

        <DropdownMenuItem onClick={handleAppleCalendar} className="cursor-pointer">
          <CalendarIcon className="w-4 h-4 mr-2" />
          Apple Calendar (iCal)
        </DropdownMenuItem>

        <DropdownMenuItem onClick={handleOutlook} className="cursor-pointer">
          <CalendarIcon className="w-4 h-4 mr-2" />
          Outlook Calendar
        </DropdownMenuItem>

        <DropdownMenuSeparator />

        <DropdownMenuItem onClick={handleExportICS} className="cursor-pointer">
          <Download className="w-4 h-4 mr-2" />
          Baixar .ics (universal)
        </DropdownMenuItem>

        <DropdownMenuSeparator />

        <div className="px-2 py-1.5 text-xs text-muted-foreground">
          💡 Google Calendar: use "Adicionar direto" para importar todos os blocos automaticamente
        </div>
      </DropdownMenuContent>
    </DropdownMenu>
  );
}
