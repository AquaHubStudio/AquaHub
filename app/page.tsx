'use client';

import { useRouter } from 'next/navigation';
import PocketBase from 'pocketbase';
import { useState } from 'react';

const db = new PocketBase('http://localhost:8090');

export default function HomePage() {
  const router = useRouter();
  const redirectUrl = 'http://localhost:3000/redirect';
  const [user, setUser] = useState(db.authStore.model);

  const redirectLogin = async () => {
    const { authProviders } = await db.users.listAuthMethods();
    authProviders.forEach(function (provider) {
      if (provider.name == 'google') {
        localStorage.setItem('provider', JSON.stringify(provider));

        router.push(provider.authUrl + redirectUrl);
      }
    });
  };

  return (
    <div>
      <h1>Home Page</h1>
      {user ? <p>Logged in as {user.email}</p> : <button onClick={redirectLogin}>Login</button>}
    </div>
  );
}
