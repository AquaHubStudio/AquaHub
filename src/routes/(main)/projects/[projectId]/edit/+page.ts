import { goto } from '$app/navigation';
import type { Load } from '@sveltejs/kit';
import PocketBase, { Record } from 'pocketbase';

// export const prerender = true;
// export const csr = false;
export const ssr = false;

const db = new PocketBase(import.meta.env.VITE_PUBLIC_SERVER_URL);

export const load: Load = async ({ params }) => {
	const projectData: Record = await db.collection('projects').getOne(params.projectId ?? '');
	const userValid = db.authStore.isValid;
	const user = db.authStore.model;

	// User not logged in
	if (!userValid) {
		goto('/signin');
		return;
	}

	// User not project manager
	if (projectData.manager.id !== db.authStore.model.id) {
		goto(`/projects/${projectData.id}`);
		return;
	}

	return { params, projectData };
};
