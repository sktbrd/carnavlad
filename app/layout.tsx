import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import "./globals.css";
import Header from "@/components/header";
import ConfettiClick from "@/components/confetti-click";
import PWAInstall from "@/components/pwa-install";

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: "Carnavlad 2026 | Blocos de Carnaval do Rio",
  description: "Seu guia definitivo dos blocos de rua do Rio de Janeiro! Descubra eventos, rotas, horários e muito mais. Porque todo bloco merece um vene diferente 🎭✨",
  manifest: "/manifest.json",
  keywords: [
    "carnaval",
    "rio de janeiro",
    "blocos",
    "carnaval 2026",
    "blocos de rua",
    "carnaval rio",
    "folia",
    "sambódromo",
    "blocos cariocas",
  ],
  authors: [{ name: "Carnavlad" }],
  creator: "Carnavlad",
  publisher: "Carnavlad",

  // OpenGraph
  openGraph: {
    type: "website",
    locale: "pt_BR",
    url: "https://carnavlad.vercel.app",
    siteName: "Carnavlad 2026",
    title: "Carnavlad 2026 | Blocos de Carnaval do Rio",
    description: "Seu guia definitivo dos blocos de rua do Rio! 🎭 Porque todo bloco merece um site",
    images: [
      {
        url: "/og-image.jpg",
        width: 1200,
        height: 630,
        alt: "Carnavlad 2026 - Porque todo bloco merece um site",
      },
    ],
  },

  // Twitter
  twitter: {
    card: "summary_large_image",
    title: "Carnavlad 2026 | Blocos de Carnaval do Rio",
    description: "Seu guia definitivo dos blocos de rua do Rio! 🎭 Porque todo bloco merece um site",
    images: ["/og-image.jpg"],
  },

  // PWA
  appleWebApp: {
    capable: true,
    statusBarStyle: "default",
    title: "Carnavlad",
  },
  applicationName: "Carnavlad",
};

export const viewport = {
  width: "device-width",
  initialScale: 1,
  maximumScale: 1,
  userScalable: false,
  themeColor: "#8A2BE2",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="pt-BR">
      <head>
        {/* PWA Icons */}
        <link rel="icon" href="/icon.svg" type="image/svg+xml" />
        <link rel="icon" type="image/png" sizes="192x192" href="/icon-192.png" />
        <link rel="icon" type="image/png" sizes="512x512" href="/icon-512.png" />
        <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png" />
        
        {/* PWA Manifest */}
        <link rel="manifest" href="/manifest.json" />
        
        {/* Theme Colors */}
        <meta name="theme-color" content="#ec4899" />
        <meta name="msapplication-TileColor" content="#9333ea" />
        <meta name="msapplication-config" content="/browserconfig.xml" />
        
        {/* Apple PWA */}
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
        <meta name="apple-mobile-web-app-title" content="Carnavlad" />
        
        {/* Mobile Web App */}
        <meta name="mobile-web-app-capable" content="yes" />
        <meta name="format-detection" content="telephone=no" />
      </head>
      <body
        className={`${geistSans.variable} ${geistMono.variable} antialiased`}
      >
        <ConfettiClick />
        <Header />
        {children}
        <PWAInstall />
      </body>
    </html>
  );
}
