import type { Load } from '@sveltejs/kit';
import PocketBase, { Record } from 'pocketbase';

// export const prerender = true;
// export const csr = false;
export const ssr = false;

const db = new PocketBase(import.meta.env.VITE_PUBLIC_SERVER_URL);

export const load: Load = async ({ params }) => {
	const userData: Record = await db.collection('users').getOne(params.userId ?? '');
	const userProjects: Record[] = await db
		.collection('projects')
		.getFullList(200, { filter: `manager="${params.userId}"` });
	return { params, userData, userProjects };
};
