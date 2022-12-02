import type { Load } from '@sveltejs/kit';

export const prerender = true;
// export const csr = false;

export const load: Load = ({ params }) => {
	return params;
};
