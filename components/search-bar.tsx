'use client';

import { useState, useMemo, useRef, useEffect } from 'react';
import { Search, Calendar, MapPin, X } from 'lucide-react';
import { Input } from '@/components/ui/input';
import { useBlocos } from '@/lib/hooks/use-blocos';
import { parseLocalDate } from '@/lib/date-utils';
import { format } from 'date-fns';
import { ptBR } from 'date-fns/locale';
import Link from 'next/link';

export default function SearchBar() {
  const [query, setQuery] = useState('');
  const [isOpen, setIsOpen] = useState(false);
  const { eventos } = useBlocos();
  const inputRef = useRef<HTMLInputElement>(null);
  const dropdownRef = useRef<HTMLDivElement>(null);

  // Buscar eventos por nome do bloco
  const resultados = useMemo(() => {
    if (!query.trim()) return [];

    const q = query.toLowerCase();
    return eventos
      .filter(evento => 
        evento.bloco_nome.toLowerCase().includes(q) ||
        evento.local_nome.toLowerCase().includes(q) ||
        evento.bairro_nome?.toLowerCase().includes(q)
      )
      .slice(0, 8); // Limitar a 8 resultados
  }, [query, eventos]);

  // Fechar dropdown ao clicar fora
  useEffect(() => {
    function handleClickOutside(event: MouseEvent) {
      if (
        dropdownRef.current &&
        !dropdownRef.current.contains(event.target as Node) &&
        inputRef.current &&
        !inputRef.current.contains(event.target as Node)
      ) {
        setIsOpen(false);
      }
    }

    document.addEventListener('mousedown', handleClickOutside);
    return () => document.removeEventListener('mousedown', handleClickOutside);
  }, []);

  // Atalho de teclado (Ctrl/Cmd + K)
  useEffect(() => {
    function handleKeyDown(e: KeyboardEvent) {
      if ((e.metaKey || e.ctrlKey) && e.key === 'k') {
        e.preventDefault();
        inputRef.current?.focus();
        setIsOpen(true);
      }
      if (e.key === 'Escape') {
        setIsOpen(false);
        inputRef.current?.blur();
      }
    }

    document.addEventListener('keydown', handleKeyDown);
    return () => document.removeEventListener('keydown', handleKeyDown);
  }, []);

  const handleClear = () => {
    setQuery('');
    setIsOpen(false);
    inputRef.current?.focus();
  };

  return (
    <div className="relative w-full max-w-xl">
      {/* Input de busca */}
      <div className="relative">
        <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-gray-400" />
        <Input
          ref={inputRef}
          type="text"
          placeholder="Buscar blocos... (Ctrl+K)"
          value={query}
          onChange={(e) => {
            setQuery(e.target.value);
            setIsOpen(true);
          }}
          onFocus={() => setIsOpen(true)}
          className="pl-10 pr-10 h-12 text-base bg-white/90 backdrop-blur border-gray-200 focus:border-orange-500 focus:ring-orange-500"
        />
        {query && (
          <button
            onClick={handleClear}
            className="absolute right-3 top-1/2 -translate-y-1/2 p-1 hover:bg-gray-100 rounded-full transition-colors"
          >
            <X className="w-4 h-4 text-gray-500" />
          </button>
        )}
      </div>

      {/* Dropdown de resultados */}
      {isOpen && query && (
        <div
          ref={dropdownRef}
          className="absolute top-full mt-2 w-full bg-white rounded-2xl shadow-2xl border border-gray-200 max-h-[500px] overflow-y-auto z-50"
        >
          {resultados.length === 0 ? (
            <div className="p-6 text-center text-gray-500">
              <Search className="w-12 h-12 mx-auto mb-3 text-gray-300" />
              <p className="font-medium">Nenhum bloco encontrado</p>
              <p className="text-sm mt-1">Tente buscar por outro nome</p>
            </div>
          ) : (
            <div className="p-2">
              <p className="px-3 py-2 text-xs text-gray-500 font-medium uppercase">
                {resultados.length} {resultados.length === 1 ? 'resultado' : 'resultados'}
              </p>
              <div className="space-y-1">
                {resultados.map((evento) => {
                  const slug = evento.bloco_slug || 
                    evento.bloco_nome.toLowerCase()
                      .normalize('NFD')
                      .replace(/[\u0300-\u036f]/g, '')
                      .replace(/[^a-z0-9]+/g, '-')
                      .replace(/^-+|-+$/g, '');

                  return (
                    <Link
                      key={evento.id}
                      href={`/evento/${slug}`}
                      onClick={() => {
                        setQuery('');
                        setIsOpen(false);
                      }}
                      className="block px-3 py-3 rounded-xl hover:bg-gradient-to-r hover:from-orange-50 hover:to-pink-50 transition-all group"
                    >
                      <div className="flex items-start gap-3">
                        {/* Emoji/Ícone */}
                        <div className="w-10 h-10 rounded-full bg-gradient-to-br from-orange-400 to-pink-500 flex items-center justify-center text-white text-lg font-bold shrink-0">
                          {evento.bloco_nome.charAt(0).toUpperCase()}
                        </div>

                        {/* Info */}
                        <div className="flex-1 min-w-0">
                          <h4 className="font-bold text-gray-900 group-hover:text-orange-600 transition-colors truncate">
                            {evento.bloco_nome}
                          </h4>
                          
                          <div className="flex items-center gap-3 mt-1 text-xs text-gray-600">
                            <span className="flex items-center gap-1">
                              <Calendar className="w-3 h-3" />
                              {format(parseLocalDate(evento.data), "dd/MM", { locale: ptBR })}
                            </span>
                            
                            {evento.horario && (
                              <span className="flex items-center gap-1">
                                ⏰ {evento.horario}
                              </span>
                            )}
                            
                            {evento.bairro_nome && (
                              <span className="flex items-center gap-1">
                                <MapPin className="w-3 h-3" />
                                {evento.bairro_nome}
                              </span>
                            )}
                          </div>

                          {evento.local_nome && (
                            <p className="text-xs text-gray-500 mt-1 truncate">
                              {evento.local_nome}
                            </p>
                          )}
                        </div>
                      </div>
                    </Link>
                  );
                })}
              </div>
            </div>
          )}
        </div>
      )}
    </div>
  );
}
