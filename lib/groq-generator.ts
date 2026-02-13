import Groq from 'groq-sdk';

const groq = new Groq({
  apiKey: process.env.GROQ_API_KEY || '',
});

export interface BlocoContent {
  description: string;
  whatToBring: string[];
  rules: string[];
  tags: string[];
}

export async function generateBlocoContent(blocoName: string, location: string): Promise<BlocoContent> {
  // Se não tiver API key, retorna conteúdo genérico
  if (!process.env.GROQ_API_KEY) {
    console.warn('⚠️ GROQ_API_KEY not set, using generic content');
    return {
      description: `Um dos blocos mais animados do carnaval! ${blocoName} promete muita alegria e energia contagiante.`,
      whatToBring: ['Água', 'Protetor solar', 'Fantasia', 'Dinheiro'],
      rules: ['Respeitar o próximo', 'Não jogar lixo no chão', 'Beber com moderação'],
      tags: ['Samba', 'Carnaval', 'Festa']
    };
  }

  try {
    const prompt = `Você é um especialista em blocos de carnaval do Rio de Janeiro.

Bloco: ${blocoName}
Local: ${location}

Gere conteúdo autêntico e envolvente para a página do bloco em formato JSON:

{
  "description": "descrição curta e animada do bloco (2-3 frases, estilo carioca, mencione o nome do bloco)",
  "whatToBring": ["item 1", "item 2", "item 3", "item 4"] (lista de 4 itens essenciais),
  "rules": ["regra 1", "regra 2", "regra 3"] (3 regras importantes),
  "tags": ["tag1", "tag2", "tag3"] (3 tags de estilo musical/vibe do bloco)
}

Responda APENAS com o JSON, sem explicações.`;

    const completion = await groq.chat.completions.create({
      messages: [
        {
          role: 'user',
          content: prompt,
        },
      ],
      model: 'llama-3.3-70b-versatile',
      temperature: 0.8,
      max_tokens: 500,
    });

    const content = completion.choices[0]?.message?.content || '';
    
    // Extrair JSON do conteúdo
    const jsonMatch = content.match(/\{[\s\S]*\}/);
    if (!jsonMatch) {
      throw new Error('No JSON found in response');
    }

    const parsed = JSON.parse(jsonMatch[0]);
    
    return {
      description: parsed.description || `${blocoName} é um dos blocos mais tradicionais do carnaval carioca!`,
      whatToBring: Array.isArray(parsed.whatToBring) ? parsed.whatToBring : ['Água', 'Protetor solar', 'Fantasia'],
      rules: Array.isArray(parsed.rules) ? parsed.rules : ['Respeitar o próximo', 'Não jogar lixo no chão'],
      tags: Array.isArray(parsed.tags) ? parsed.tags : ['Samba', 'Carnaval']
    };

  } catch (error) {
    console.error('Error generating content with Groq:', error);
    // Fallback para conteúdo genérico
    return {
      description: `${blocoName} é um dos blocos mais animados do carnaval! Venha com sua fantasia e muita energia.`,
      whatToBring: ['Água', 'Protetor solar', 'Fantasia', 'Dinheiro'],
      rules: ['Respeitar o próximo', 'Não jogar lixo no chão', 'Beber com moderação'],
      tags: ['Samba', 'Carnaval', 'Festa']
    };
  }
}
