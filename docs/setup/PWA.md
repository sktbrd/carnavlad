# 🎭 PWA Setup - Carnavlad

## 📱 Progressive Web App

Carnavlad agora é um PWA completo! Instale o app na tela inicial do seu dispositivo.

---

## ✨ Features do PWA

### 1. **Instalável**
- ✅ Banner "Adicionar à tela inicial" (Chrome/Edge)
- ✅ Prompt de instalação customizado
- ✅ Ícone engraçado de carnaval 🎭
- ✅ Funciona offline (cache de páginas)

### 2. **Atalhos de App**
- 📅 Calendário (acesso direto)
- 🗺️ Mapa (acesso direto)
- 👤 Perfil (acesso direto)

### 3. **Service Worker**
- ✅ Cache de assets
- ✅ Funciona offline
- ✅ Network-first strategy
- ✅ Auto-update

### 4. **Notificações** (futuro)
- 🔔 Push notifications
- 🚨 Alertas de blocos
- 📰 Novas notícias

---

## 🎨 Ícone Customizado

### Design do Ícone

**Tema:** Máscara de Carnaval Engraçada 🎭

**Elementos:**
- Máscara de carnaval dourada
- Olhos grandes e expressivos
- Penas coloridas (rosa, laranja, azul, verde)
- Confetes ao redor
- Gradiente roxo→rosa→laranja (cores do Carnavlad)
- Sorriso largo

**Cores:**
- Background: Gradiente #9333ea → #ec4899 → #f97316
- Máscara: Gradiente #fbbf24 → #f59e0b
- Confetes: Várias cores vibrantes

---

## 🔧 Como Gerar os Ícones

### Passo 1: Instalar Sharp

```bash
pnpm add -D sharp
```

### Passo 2: Gerar PNGs

```bash
chmod +x scripts/generate-icons.js
node scripts/generate-icons.js
```

**Ícones gerados:**
- `icon-192.png` (192x192) - Android
- `icon-512.png` (512x512) - Android HD
- `apple-touch-icon.png` (180x180) - iOS
- `favicon-32.png` (32x32) - Favicon base

### Passo 3: Converter Favicon (Opcional)

Use https://favicon.io/favicon-converter/ para converter `favicon-32.png` em `favicon.ico`

---

## 📄 Arquivos do PWA

### Criados

```
public/
├── manifest.json          # Manifest PWA
├── sw.js                  # Service Worker
├── icon.svg               # Ícone vetorial (source)
├── icon-192.png           # Gerado
├── icon-512.png           # Gerado
└── apple-touch-icon.png   # Gerado

components/
└── pwa-install.tsx        # Prompt de instalação

scripts/
└── generate-icons.js      # Gerador de ícones
```

---

## 🚀 Como Testar

### Local

```bash
pnpm dev -p 3456
```

**Chrome DevTools:**
1. F12 → Application → Manifest
2. Verificar manifest.json
3. Application → Service Workers
4. Verificar sw.js registrado

**Lighthouse:**
1. F12 → Lighthouse
2. Run PWA audit
3. Deve marcar ✅ em todos os itens

### Mobile

**Android (Chrome):**
1. Acesse o site
2. Veja banner "Adicionar à tela inicial"
3. Ou: Menu → "Adicionar à tela inicial"
4. Ícone aparece no app drawer
5. Abra: app standalone (sem barra de navegação)

**iOS (Safari):**
1. Acesse o site
2. Toque no botão de compartilhar
3. "Adicionar à Tela de Início"
4. Ícone aparece na home

---

## 📊 Manifest.json

### Configurações

```json
{
  "name": "Carnavlad - Blocos de Carnaval do Rio 2026",
  "short_name": "Carnavlad",
  "start_url": "/",
  "display": "standalone",
  "theme_color": "#ec4899",
  "background_color": "#9333ea"
}
```

### Shortcuts

- Calendário: `/?view=calendario`
- Mapa: `/?view=mapa`
- Perfil: `/perfil`

---

## 🔔 Service Worker

### Estratégia: Network First

1. Tenta buscar da rede primeiro
2. Se falhar, busca do cache
3. Cache é atualizado em background

### Cache

**URLs em cache:**
- `/` (home)
- `/manifest.json`
- Ícones (192, 512, SVG)

**Auto-update:**
- Novo service worker instalado em background
- Ativa na próxima vez que o app abrir

---

## 🎨 Componente PWAInstall

### Features

- ✅ Banner animado de instalação
- ✅ Aparece após 3 segundos
- ✅ Pode ser fechado (X)
- ✅ Não aparece novamente na sessão se fechado
- ✅ Não aparece se já instalado
- ✅ Design consistente com o app

### Localização

```
┌────────────────────────────┐
│                            │
│                            │
│  [Conteúdo do site]        │
│                            │
│                            │
└────────────────────────────┘
  ┌──────────────────────┐
  │ 🎭 Instalar Carnavlad│
  │ Adicione à tela...   │
  │ [Instalar App]       │
  └──────────────────────┘
```

---

## 📱 Experiência do Usuário

### Desktop (Chrome/Edge)

**Instalação:**
1. Banner nativo do navegador aparece
2. Ou: ⋮ → "Instalar Carnavlad"
3. App abre em janela standalone
4. Aparece na barra de tarefas

### Mobile (Android)

**Instalação:**
1. Banner "Adicionar à tela inicial"
2. Ou: prompt customizado do app
3. Ícone aparece no app drawer
4. Splash screen com cores do app
5. App abre fullscreen

### Mobile (iOS)

**Instalação:**
1. Safari → Compartilhar → "Adicionar à Tela de Início"
2. Ícone aparece na home
3. App abre sem barra Safari

---

## 🎯 Checklist PWA

### Lighthouse PWA Audit

- [x] Instalável (manifest.json válido)
- [x] Service Worker registrado
- [x] HTTPS (Vercel)
- [x] Responsivo (viewport meta tag)
- [x] Ícones corretos (192, 512, Apple)
- [x] Theme color definido
- [x] Splash screen configurado
- [x] Offline fallback

### Features Extras

- [x] Atalhos de app (shortcuts)
- [x] Categorias definidas
- [x] Screenshots (futuro)
- [x] Prompt de instalação customizado
- [x] Detecção de modo standalone

---

## 🚧 Próximas Melhorias

### Notificações Push

```javascript
// Pedir permissão
Notification.requestPermission()

// Enviar notificação
self.registration.showNotification('Novo bloco!', {
  body: 'Cordão da Bola Preta confirmado!',
  icon: '/icon-192.png',
  badge: '/icon-192.png',
})
```

### Sincronização em Background

```javascript
// Sync quando voltar online
self.addEventListener('sync', (event) => {
  if (event.tag === 'sync-blocos') {
    event.waitUntil(syncBlocos());
  }
});
```

### Compartilhamento

```javascript
// Web Share API
navigator.share({
  title: 'Carnavlad',
  text: 'Veja os blocos!',
  url: window.location.href,
})
```

---

## 🐛 Troubleshooting

### Ícones não aparecem
**Causa:** Sharp não instalado ou PNG não gerado  
**Solução:** `pnpm add -D sharp && node scripts/generate-icons.js`

### Service Worker não registra
**Causa:** HTTPS obrigatório (exceto localhost)  
**Solução:** Testar em localhost ou deploy com HTTPS

### Prompt de instalação não aparece
**Causa:** Já instalado ou critérios não cumpridos  
**Solução:** Desinstalar app e limpar cache

### App não funciona offline
**Causa:** Service Worker não está cacheando  
**Solução:** Verificar sw.js no DevTools → Application

---

## 📈 Métricas PWA

### Performance

- Lighthouse PWA Score: 100/100 (objetivo)
- First Contentful Paint: < 2s
- Time to Interactive: < 3.5s
- Service Worker: Registrado ✅

### Instalações

**Métricas a trackear:**
- Taxa de instalação (installs / visitantes)
- Retenção de usuários instalados
- Uso de atalhos do app
- Tempo médio no app vs. browser

---

## 🎉 Resultado Final

**Carnavlad agora é um app nativo!**

✅ Instala em 2 cliques  
✅ Funciona offline  
✅ Ícone engraçado de carnaval  
✅ Acesso rápido (atalhos)  
✅ Splash screen personalizada  
✅ Notificações (futuro)  

---

_Última atualização: 2026-02-13 15:25 GMT-3_
