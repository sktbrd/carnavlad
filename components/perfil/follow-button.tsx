'use client';

import { useState, useEffect } from 'react';
import { createClient } from '@/lib/supabase/client';
import { UserPlus, UserMinus, Loader2 } from 'lucide-react';

interface FollowButtonProps {
  currentUserId: string;
  targetUserId: string;
  targetUsername: string;
}

export default function FollowButton({ currentUserId, targetUserId, targetUsername }: FollowButtonProps) {
  const [isFollowing, setIsFollowing] = useState(false);
  const [loading, setLoading] = useState(true);
  const supabase = createClient();

  useEffect(() => {
    checkFollowStatus();
  }, [currentUserId, targetUserId]);

  async function checkFollowStatus() {
    if (!supabase) {
      setLoading(false);
      return;
    }

    try {
      const { data, error } = await supabase
        .from('amigos')
        .select('id')
        .eq('user_id', currentUserId)
        .eq('amigo_id', targetUserId)
        .single();

      if (!error && data) {
        setIsFollowing(true);
      }
    } catch (err) {
      console.error('[follow-button] Error checking status:', err);
    } finally {
      setLoading(false);
    }
  }

  async function toggleFollow() {
    if (!supabase) return;

    setLoading(true);

    try {
      if (isFollowing) {
        // Deixar de seguir
        console.log('[follow-button] Deixando de seguir:', targetUsername);
        const { error } = await supabase
          .from('amigos')
          .delete()
          .eq('user_id', currentUserId)
          .eq('amigo_id', targetUserId);

        if (error) {
          console.error('[follow-button] Error unfollowing:', error);
          return;
        }

        console.log('[follow-button] ✅ Deixou de seguir');
        setIsFollowing(false);
      } else {
        // Seguir
        console.log('[follow-button] Seguindo:', targetUsername);
        const { error } = await supabase
          .from('amigos')
          .insert({
            user_id: currentUserId,
            amigo_id: targetUserId,
            status: 'aceito', // Follow direto (não precisa aprovação)
          });

        if (error) {
          console.error('[follow-button] Error following:', error);
          return;
        }

        console.log('[follow-button] ✅ Agora está seguindo');
        setIsFollowing(true);
      }
    } catch (err) {
      console.error('[follow-button] Unexpected error:', err);
    } finally {
      setLoading(false);
    }
  }

  if (loading) {
    return (
      <button
        disabled
        className="inline-flex items-center gap-2 bg-white/20 text-white font-bold py-3 px-8 rounded-xl opacity-50 cursor-not-allowed"
      >
        <Loader2 className="w-5 h-5 animate-spin" />
        Carregando...
      </button>
    );
  }

  return (
    <button
      onClick={toggleFollow}
      className={`inline-flex items-center gap-2 font-bold py-3 px-8 rounded-xl hover:scale-105 transition-transform shadow-lg ${
        isFollowing
          ? 'bg-white/20 text-white border-2 border-white/40 hover:bg-white/30'
          : 'bg-gradient-to-r from-yellow-400 to-orange-500 text-purple-900'
      }`}
    >
      {isFollowing ? (
        <>
          <UserMinus className="w-5 h-5" />
          Deixar de Seguir
        </>
      ) : (
        <>
          <UserPlus className="w-5 h-5" />
          Seguir
        </>
      )}
    </button>
  );
}
