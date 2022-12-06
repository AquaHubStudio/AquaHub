import type { Load } from '@sveltejs/kit';
import PocketBase, { Record } from 'pocketbase';

// export const prerender = true;
// export const csr = false;
export const ssr = false;

const db = new PocketBase(import.meta.env.VITE_PUBLIC_SERVER_URL);

export const load: Load = async () => {
	const projectData: Record[] = await db.collection('projects').getList(1, 20, { sort: '-updated' });
	return projectData;
};
