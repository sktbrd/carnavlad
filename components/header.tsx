'use client';

import LoginButton from '@/components/auth/login-button';
import { ProfileButton } from '@/components/auth/profile-button';
import SearchBar from '@/components/search-bar';
import Link from 'next/link';

export default function Header() {
  return (
    <header className="sticky top-0 z-50 w-full border-b bg-white/95 backdrop-blur supports-[backdrop-filter]:bg-white/60">
      <div className="container mx-auto px-4 py-3">
        <div className="flex items-center justify-between gap-4">
          {/* Logo */}
          <Link href="/" className="flex items-center gap-2 font-bold text-xl shrink-0">
            <span className="text-2xl">🎭</span>
            <span className="hidden sm:inline bg-gradient-to-r from-orange-500 to-pink-600 bg-clip-text text-transparent">
              CarnaVlad
            </span>
          </Link>

          {/* Busca - Oculta em mobile muito pequeno */}
          <div className="hidden md:block flex-1 max-w-2xl">
            <SearchBar />
          </div>

          {/* Navigation Links */}
          <nav className="hidden lg:flex items-center gap-6 shrink-0">
            <Link 
              href="/usuarios" 
              className="text-sm font-medium text-muted-foreground hover:text-foreground transition-colors flex items-center gap-2"
            >
              <span>👥</span>
              <span>Foliões</span>
            </Link>
          </nav>

          {/* Auth buttons */}
          <nav className="flex items-center gap-4 shrink-0">
            <ProfileButton />
            <LoginButton />
          </nav>
        </div>

        {/* Busca mobile - Abaixo em telas pequenas */}
        <div className="md:hidden mt-3">
          <SearchBar />
        </div>
      </div>
    </header>
  );
}
