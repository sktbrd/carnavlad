# 📱 PWA Setup - CarnaVlad

## O Que é PWA?

Progressive Web App (PWA) permite que usuários "instalem" o site na tela inicial do celular/desktop como se fosse um app nativo.

## ✅ Implementado

### 1. **Manifest.json**
- Nome: CarnaVlad - Carnaval Rio 2026
- Cor tema: Roxo (#8A2BE2)
- Display: standalone (fullscreen sem barra de navegador)
- Ícones: 192x192 e 512x512
- Shortcuts: Calendário e Mapa

### 2. **Service Worker**
- Caching inteligente de assets
- Funciona offline (cache de páginas visitadas)
- Atualização automática em background

### 3. **Ícones**
- ✅ icon-192x192.png
- ✅ icon-512x512.png
- ✅ apple-touch-icon.png
- ✅ icon.svg (fallback)

### 4. **Meta Tags**
- Viewport otimizado
- Theme color (roxo)
- Apple Web App tags

## 🚀 Como Instalar (Usuários)

### Android (Chrome/Edge/Firefox)

1. Abra o site: `https://carnavlad.vercel.app`
2. Clique nos 3 pontinhos (menu)
3. Selecione **"Adicionar à tela inicial"** ou **"Instalar app"**
4. Confirme
5. ✅ Ícone aparece na home screen!

### iOS (Safari)

1. Abra o site no Safari
2. Toque no ícone de **Compartilhar** (caixa com seta)
3. Role para baixo
4. Toque em **"Adicionar à Tela de Início"**
5. Confirme
6. ✅ Ícone aparece na home screen!

### Desktop (Chrome/Edge)

1. Acesse o site
2. Veja ícone de **"Instalar"** na barra de endereço (ou menu)
3. Clique em "Instalar"
4. ✅ App abre em janela própria!

## 🎯 Benefícios

### Para Usuários:
- ✅ **Acesso rápido** - Ícone na home screen
- ✅ **Funciona offline** - Cache inteligente
- ✅ **Sem navegador** - Abre em fullscreen
- ✅ **Leve** - Não ocupa tanto espaço quanto app nativo
- ✅ **Push notifications** (futuro)

### Para o Site:
- ✅ **Maior engajamento** - 50%+ retenção
- ✅ **Instalações sem store** - Sem Google Play/App Store
- ✅ **SEO melhorado** - Google favorece PWAs
- ✅ **Performance** - Cache = loading rápido

## 🔧 Configuração Técnica

### next.config.mjs
```js
import withPWA from 'next-pwa';

const pwaConfig = withPWA({
  dest: 'public',
  register: true,
  skipWaiting: true,
  disable: process.env.NODE_ENV === 'development',
  runtimeCaching: [...]
});
```

### Cache Strategy

| Tipo | Strategy | Cache Time |
|------|----------|------------|
| Fonts | CacheFirst | 1 ano |
| Imagens | StaleWhileRevalidate | 1 dia |
| JS/CSS | StaleWhileRevalidate | 1 dia |
| API | NetworkFirst | 1 dia |
| Páginas | NetworkFirst | 1 dia |

### Gerando Ícones

```bash
pnpm install -D sharp
node scripts/generate-icons.mjs
```

Gera automaticamente:
- icon-192x192.png
- icon-512x512.png
- apple-touch-icon.png

## 📊 Testando PWA

### Lighthouse (Chrome DevTools)

1. Abra DevTools (F12)
2. Aba "Lighthouse"
3. Selecione "Progressive Web App"
4. Run audit
5. Score deve ser 90+

### PWA Builder

1. Acesse: [pwabuilder.com](https://pwabuilder.com)
2. Cole a URL: `https://carnavlad.vercel.app`
3. Clique "Start"
4. Veja report completo

### Manifest Validator

1. Chrome DevTools → Application → Manifest
2. Veja se manifest.json carregou
3. Verifique ícones
4. Teste "Add to homescreen"

## 🐛 Troubleshooting

### "Instalar" não aparece?

**Causas:**
- Site não está em HTTPS (obrigatório)
- Manifest.json com erro
- Service Worker não registrou
- Já está instalado

**Soluções:**
1. Verifique console (F12) por erros
2. DevTools → Application → Manifest
3. DevTools → Application → Service Workers
4. Teste em aba anônima

### Ícone não aparece?

**Causa:** Cache antigo

**Solução:**
1. Desinstale o PWA
2. Limpe cache do navegador
3. Reinstale

### Offline não funciona?

**Causa:** Service Worker não ativou

**Solução:**
1. DevTools → Application → Service Workers
2. Verifique status "activated"
3. Force reload (Ctrl+Shift+R)

## 🔄 Atualizações

### Como funciona:
1. Usuário abre o app
2. Service Worker verifica updates em background
3. Nova versão baixa automaticamente
4. Na próxima abertura, usa versão nova

### Forçar update:
```js
// No Service Worker
self.skipWaiting();
```

Já configurado no `next.config.mjs` com `skipWaiting: true`.

## 📱 Compatibilidade

| Plataforma | Suporte | Notas |
|------------|---------|-------|
| Android Chrome | ✅ 100% | Funciona perfeitamente |
| Android Firefox | ✅ 100% | Funciona perfeitamente |
| iOS Safari | ✅ 90% | Sem push notifications |
| Desktop Chrome | ✅ 100% | Funciona perfeitamente |
| Desktop Edge | ✅ 100% | Funciona perfeitamente |
| Desktop Safari | ⚠️ 70% | Suporte limitado |

## 🎯 Próximos Passos

### Fase 1 (Implementado):
- ✅ Manifest.json
- ✅ Service Worker
- ✅ Ícones
- ✅ Meta tags
- ✅ Caching offline

### Fase 2 (Futuro):
- [ ] Push notifications
- [ ] Background sync
- [ ] Share API
- [ ] Install prompt customizado
- [ ] Update notification

## 📚 Recursos

- **Next.js PWA:** https://github.com/shadowwalker/next-pwa
- **Google PWA:** https://web.dev/progressive-web-apps/
- **PWA Builder:** https://pwabuilder.com
- **Manifest Generator:** https://www.simicart.com/manifest-generator.html/

---

**🎉 Seu site agora é um PWA completo!**

Usuários podem instalá-lo na home screen e usar offline! 📱✨
