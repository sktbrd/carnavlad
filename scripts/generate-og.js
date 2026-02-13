const sharp = require('sharp');
const fs = require('fs');

async function generateOG() {
  // Extrair frame do GIF e redimensionar para OG size (1200x630)
  const frame = await sharp('public/carna-nicole.gif', { animated: false })
    .resize(1200, 630, {
      fit: 'cover',
      position: 'center'
    })
    .toBuffer();

  // Criar overlay com gradiente e texto
  const svg = `
    <svg width="1200" height="630">
      <!-- Gradiente de fundo overlay -->
      <defs>
        <linearGradient id="grad" x1="0%" y1="0%" x2="0%" y2="100%">
          <stop offset="0%" style="stop-color:rgba(255,0,255,0.7);stop-opacity:1" />
          <stop offset="100%" style="stop-color:rgba(255,215,0,0.8);stop-opacity:1" />
        </linearGradient>
      </defs>
      
      <!-- Overlay com gradiente -->
      <rect width="1200" height="630" fill="url(#grad)" />
      
      <!-- Texto principal -->
      <text 
        x="600" 
        y="200" 
        font-family="Arial Black, sans-serif" 
        font-size="96" 
        font-weight="900" 
        fill="#FFFFFF" 
        text-anchor="middle"
        stroke="#000000"
        stroke-width="8"
      >CARNAVLAD 2026</text>
      
      <!-- Subtítulo -->
      <text 
        x="600" 
        y="500" 
        font-family="Arial, sans-serif" 
        font-size="48" 
        fill="#FFD700" 
        text-anchor="middle"
        stroke="#000000"
        stroke-width="4"
      >🎭 Porque todo bloco merece um site</text>
    </svg>
  `;

  // Compor imagem final
  await sharp(frame)
    .composite([
      {
        input: Buffer.from(svg),
        gravity: 'center'
      }
    ])
    .jpeg({ quality: 90 })
    .toFile('public/og-image.jpg');

  console.log('✅ OG image criada em public/og-image.jpg');
}

generateOG().catch(console.error);
