import { goto } from '$app/navigation';
import PocketBase from 'pocketbase';
import type { PageLoad } from './$types';

export const prerender = true;
// export const csr = false;

const db = new PocketBase(import.meta.env.VITE_PUBLIC_SERVER_URL);

export const load: PageLoad = async () => {
	const user = db.authStore.isValid;

	// User needs to be logged in
	if (!user) {
		goto('/signin');
		return;
	}

	return;
};
