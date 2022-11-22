import { sveltekit } from '@sveltejs/adapter-node';
import preprocess from 'svelte-preprocess';

/** @type {import('vite').UserConfig} */
const config = {
	// Consult https://github.com/sveltejs/svelte-preprocess
	// for more information about preprocessors
	preprocess: preprocess({
		postcss: true,
	}),
	plugins: [sveltekit()],
	server: { port: 3000 },
};

export default config;
