/**
 * Utilitários para manipulação de datas
 * 
 * IMPORTANTE: Datas do banco vêm como strings "YYYY-MM-DD"
 * Usar parseLocalDate() ao invés de new Date() para evitar bug de timezone
 */

/**
 * Parseia string de data "YYYY-MM-DD" como data local (não UTC)
 * 
 * BUG: new Date("2026-02-15") → interpreta como UTC 00:00
 *      → em GMT-3 vira 2026-02-14 21:00 (dia anterior!)
 * 
 * FIX: parseLocalDate("2026-02-15") → 2026-02-15 00:00 local
 */
export function parseLocalDate(dateStr: string): Date {
  const [year, month, day] = dateStr.split('-').map(Number);
  return new Date(year, month - 1, day);
}
