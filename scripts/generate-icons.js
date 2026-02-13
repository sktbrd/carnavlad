#!/usr/bin/env node

/**
 * Gera ícones PNG a partir do SVG
 * Requer: npm install sharp
 */

const sharp = require('sharp');
const fs = require('fs');
const path = require('path');

const sizes = [
  { name: 'icon-192.png', size: 192 },
  { name: 'icon-512.png', size: 512 },
  { name: 'apple-touch-icon.png', size: 180 },
  { name: 'favicon.ico', size: 32 }, // Será convertido depois
];

const svgPath = path.join(__dirname, '..', 'public', 'icon.svg');
const publicDir = path.join(__dirname, '..', 'public');

async function generateIcons() {
  console.log('🎭 Gerando ícones do Carnavlad...\n');

  const svgBuffer = fs.readFileSync(svgPath);

  for (const { name, size } of sizes) {
    const outputPath = path.join(publicDir, name);
    
    try {
      await sharp(svgBuffer)
        .resize(size, size)
        .png()
        .toFile(outputPath);
      
      console.log(`✅ ${name} (${size}x${size})`);
    } catch (error) {
      console.error(`❌ Erro ao gerar ${name}:`, error.message);
    }
  }

  // Gerar favicon.ico separadamente
  try {
    const favicon32Path = path.join(publicDir, 'favicon-32.png');
    await sharp(svgBuffer)
      .resize(32, 32)
      .png()
      .toFile(favicon32Path);
    
    console.log('✅ favicon-32.png (32x32)');
    console.log('\n💡 Use uma ferramenta online para converter favicon-32.png → favicon.ico');
    console.log('   Ou: https://favicon.io/favicon-converter/\n');
  } catch (error) {
    console.error('❌ Erro ao gerar favicon:', error.message);
  }

  console.log('🎉 Ícones gerados com sucesso!\n');
}

// Verificar se sharp está instalado
try {
  require.resolve('sharp');
  generateIcons();
} catch (err) {
  console.error('❌ Erro: sharp não está instalado');
  console.error('   Execute: pnpm add -D sharp\n');
  process.exit(1);
}
