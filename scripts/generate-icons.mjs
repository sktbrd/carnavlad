import sharp from 'sharp';
import { readFileSync } from 'fs';

const svg = readFileSync('./public/icon.svg');

// Gerar 192x192
await sharp(svg)
  .resize(192, 192)
  .png()
  .toFile('./public/icon-192x192.png');

console.log('✓ icon-192x192.png criado');

// Gerar 512x512
await sharp(svg)
  .resize(512, 512)
  .png()
  .toFile('./public/icon-512x512.png');

console.log('✓ icon-512x512.png criado');

// Gerar apple-touch-icon
await sharp(svg)
  .resize(180, 180)
  .png()
  .toFile('./public/apple-touch-icon.png');

console.log('✓ apple-touch-icon.png criado');

console.log('\n🎉 Todos os ícones gerados!');
