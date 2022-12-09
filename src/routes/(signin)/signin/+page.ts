import type { PageLoad } from './$types';
import PocketBase from 'pocketbase';
import { goto } from '$app/navigation';

export const prerender = true;
// export const csr = false;

const db = new PocketBase(import.meta.env.VITE_PUBLIC_SERVER_URL);

export const load: PageLoad = async () => {
	const user = db.authStore.isValid;

	// User already logged in
	if (user) {
		goto('/');
		return;
	}

	return;
};
