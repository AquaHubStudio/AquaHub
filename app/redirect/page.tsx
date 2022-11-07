'use client';

import { useRouter } from 'next/navigation';
import PocketBase from 'pocketbase';
import { useEffect } from 'react';

const db = new PocketBase('http://localhost:8090');

export default function RedirectPage({ searchParams }: any) {
  const router = useRouter();

  if (typeof window === 'undefined') {
    return null;
  }

  var localStorageProvider = localStorage.getItem('provider');

  if (!localStorageProvider) {
    return router.push('/');
  }

  const authProvider = JSON.parse(localStorageProvider);

  if (!authProvider.name || !authProvider.codeVerifier || !searchParams.code) {
    return router.push('/');
  }

  const loginUser = async () => {
    await db.admins.authViaEmail(); // TODO: add credentials from environment variables

    const loginRes = await db.users.authViaOAuth2(
      authProvider.name,
      searchParams.code,
      authProvider.codeVerifier,
      'http://localhost:3000/redirect',
    );

    const test = await db.records.update('profiles', loginRes.user.profile?.id || '', {
      name: loginRes.meta.name,
      avatar: loginRes.meta.avatarUrl,
    });
  };

  loginUser().then(() => {
    router.push('/');
  });

  return <div>Loading...</div>;
}
