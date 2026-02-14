/**
 * Sistema de imagens dos blocos com fallback inteligente
 */

// Fallback images por tipo de bloco
const FALLBACK_IMAGES = {
  'TRADICIONAL': 'https://images.unsplash.com/photo-1533174072545-7a4b6ad7a6c3?w=1200&q=80',
  'MEGA BLOCO': 'https://images.unsplash.com/photo-1583275479873-0b8e9c2e0d70?w=1200&q=80',
  'INFANTIL': 'https://images.unsplash.com/photo-1517457373958-b7bdd4587205?w=1200&q=80',
  'LGBTQIAPN+': 'https://images.unsplash.com/photo-1518135714426-c18f5ffb6f4d?w=1200&q=80',
  'RELIGIOSO': 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=1200&q=80',
  'DEFAULT': 'https://images.unsplash.com/photo-1533174072545-7a4b6ad7a6c3?w=1200&q=80'
}

/**
 * Retorna a URL da imagem do bloco com fallback inteligente
 */
export function getBlocoImage(photoUrl?: string | null, tipo?: string): string {
  // Se tem foto, usa ela
  if (photoUrl) return photoUrl
  
  // Senão, usa fallback baseado no tipo
  const tipoNormalized = tipo?.toUpperCase() || 'DEFAULT'
  return FALLBACK_IMAGES[tipoNormalized as keyof typeof FALLBACK_IMAGES] || FALLBACK_IMAGES.DEFAULT
}

/**
 * Retorna a URL otimizada da imagem (com parâmetros de resize)
 */
export function getBlocoImageOptimized(
  photoUrl?: string | null,
  tipo?: string,
  options: {
    width?: number
    height?: number
    quality?: number
  } = {}
): string {
  const url = getBlocoImage(photoUrl, tipo)
  
  // Se for Unsplash, adiciona parâmetros de otimização
  if (url.includes('unsplash.com')) {
    const params = new URLSearchParams()
    if (options.width) params.set('w', options.width.toString())
    if (options.height) params.set('h', options.height.toString())
    if (options.quality) params.set('q', options.quality.toString())
    
    const separator = url.includes('?') ? '&' : '?'
    return `${url}${separator}${params.toString()}`
  }
  
  return url
}

/**
 * Verifica se a imagem é real (do bloco) ou fallback
 */
export function isBlocoImageReal(photoUrl?: string | null): boolean {
  return !!photoUrl
}
