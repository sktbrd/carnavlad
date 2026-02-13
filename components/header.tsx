'use client';

import LoginButton from '@/components/auth/login-button';
import Link from 'next/link';

export default function Header() {
  return (
    <header className="sticky top-0 z-50 w-full border-b bg-white/95 backdrop-blur supports-[backdrop-filter]:bg-white/60">
      <div className="container mx-auto flex h-16 items-center justify-between px-4">
        <Link href="/" className="flex items-center gap-2 font-bold text-xl">
          <span className="text-2xl">🎭</span>
          <span className="hidden sm:inline bg-gradient-to-r from-orange-500 to-pink-600 bg-clip-text text-transparent">
            CarnaVlad
          </span>
        </Link>

        <nav className="flex items-center gap-4">
          <LoginButton />
        </nav>
      </div>
    </header>
  );
}
