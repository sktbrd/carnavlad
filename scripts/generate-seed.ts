// Script para gerar seed.sql a partir dos dados brutos
// Roda com: pnpm tsx scripts/generate-seed.ts

type BlocoRaw = {
  data: string;
  horario: string;
  nome: string;
  local: string;
  observacoes?: string;
};

const BLOCOS_RAW: BlocoRaw[] = [
  // 14/02 - Sábado
  { data: '2026-02-14', horario: '07:00', nome: 'Cordão Da Bola Preta', local: 'R. Primeiro De Março, Centro' },
  { data: '2026-02-14', horario: '07:00', nome: 'Multibloco', local: 'Av. Henrique Valadares, Centro' },
  { data: '2026-02-14', horario: '07:00', nome: 'Bloco Amigos Da Onça', local: 'Calçadão Da Praia Do Flamengo, Flamengo' },
  { data: '2026-02-14', horario: '07:00', nome: 'Bloco Exagerado', local: 'Praça Tiradentes, Centro' },
  { data: '2026-02-14', horario: '07:00', nome: 'Blocobuster', local: 'Praça Alm. Júlio De Noronha, Leme' },
  { data: '2026-02-14', horario: '07:00', nome: 'Ceu Na Terra', local: 'R. Alm. Alexandrino, Santa Teresa' },
  { data: '2026-02-14', horario: '07:00', nome: 'Bloco Do Forró Da Taylor', local: 'Largo São Francisco De Paula, Centro' },
  { data: '2026-02-14', horario: '08:00', nome: 'Bloco Escangalha', local: 'R. Pacheco Leão, Jardim Botânico' },
  { data: '2026-02-14', horario: '15:00', nome: 'Banda De Ipanema', local: 'R. Gomes Carneiro, Ipanema' },
  
  // 15/02 - Domingo
  { data: '2026-02-15', horario: '07:00', nome: 'Boi Tolo', local: 'Sai de alguns pontos do centro da cidade e se encontram no Aterro, em direção ao Leme', observacoes: 'Múltiplos pontos de saída' },
  { data: '2026-02-15', horario: '07:00', nome: 'Bloco Areia', local: 'Av. Delfim Moreira, Leblon' },
  { data: '2026-02-15', horario: '14:00', nome: 'Simpatia É Quase Amor', local: 'R. Teixeira De Melo, Ipanema' },
  { data: '2026-02-15', horario: '15:00', nome: 'Banda De Ipanema', local: 'R. Gomes Carneiro, Ipanema' },
  
  // 16/02 - Segunda
  { data: '2026-02-16', horario: '07:00', nome: 'Que Pena Amor', local: 'Praça Tiradentes, Centro' },
  { data: '2026-02-16', horario: '07:00', nome: 'Bloco Corre Atrás', local: 'Av. Delfim Moreira, Leblon' },
  { data: '2026-02-16', horario: '14:00', nome: 'Carrossel De Emoções', local: 'Av. Infante Dom Henrique, Glória' },
  
  // 17/02 - Terça
  { data: '2026-02-17', horario: '15:00', nome: 'Orquestra Voadora', local: 'Av. Infante Dom Henrique, Glória' },
  { data: '2026-02-17', horario: '15:00', nome: 'Banda De Ipanema', local: 'R. Gomes Carneiro, Ipanema' },
  
  // 18/02 - Quarta
  { data: '2026-02-18', horario: '13:00', nome: 'Cordão Do Me Enterra Na Quarta', local: 'Av. Augusto Severo, Centro' },
];

function slugify(text: string): string {
  return text
    .toLowerCase()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-|-$/g, '');
}

function generateSQL(): string {
  const blocos: Map<string, { id: string; nome: string; slug: string }> = new Map();
  const eventos: string[] = [];

  let blocoCounter = 1;
  let eventoCounter = 1;

  // Agrupar por bloco único
  BLOCOS_RAW.forEach((item) => {
    const slug = slugify(item.nome);
    
    if (!blocos.has(slug)) {
      const id = `bloco-${blocoCounter++}`;
      blocos.set(slug, { id, nome: item.nome, slug });
    }

    const bloco = blocos.get(slug)!;
    const eventoId = `evento-${eventoCounter++}`;
    
    eventos.push(`
    ('${eventoId}', '${bloco.id}', '${item.data}', '${item.horario}', true, '${item.local.split(',')[0]}', '${item.local}', NULL, NULL, true, ${item.observacoes ? `'${item.observacoes}'` : 'NULL'})`);
  });

  let sql = `-- Seed gerado automaticamente
-- Total: ${blocos.size} blocos, ${eventos.length} eventos

BEGIN;

-- Inserir blocos
INSERT INTO blocos (id, nome, slug, created_at, updated_at) VALUES
`;

  const blocosArray = Array.from(blocos.values());
  sql += blocosArray
    .map(
      (b) =>
        `  ('${b.id}', '${b.nome.replace(/'/g, "''")}', '${b.slug}', NOW(), NOW())`
    )
    .join(',\n');

  sql += `
ON CONFLICT (slug) DO NOTHING;

-- Inserir eventos
INSERT INTO eventos (id, bloco_id, data, horario, horario_confirmado, local_nome, local_endereco, local_lat, local_lng, local_confirmado, observacoes) VALUES
`;

  sql += eventos.join(',\n');

  sql += `
ON CONFLICT DO NOTHING;

COMMIT;
`;

  return sql;
}

// Gerar e printar
console.log(generateSQL());
