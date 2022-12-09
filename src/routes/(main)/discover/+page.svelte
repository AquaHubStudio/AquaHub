<script lang="ts">
	import ProjectCard from '$lib/components/ProjectCard.svelte';
	import type { PageData } from './$types';
	import PocketBase from 'pocketbase';
	import { page } from '$app/stores';
	import { goto } from '$app/navigation';

	const db = new PocketBase(import.meta.env.VITE_PUBLIC_SERVER_URL);

	export let data: PageData;
	let projects = data.items;

	let search = '';

	const handleSearch = () => {
		setTimeout(async () => {
			projects =
				(await db.collection('projects').getList(1, 20, { sort: '-updated', filter: `title~"${search}"` })).items ?? [];
		}, 500);
	};

	const handleClearSearch = () => {
		search = '';
		handleSearch();
	};
</script>

<svelte:head>
	<title>Discover - AquaHub</title>
	<meta name="description" content="Svelte demo app" />
</svelte:head>

<section class="m-auto max-w-main">
	<div class="m-4 flex gap-3">
		<div class="relative w-full sm:w-1/2 lg:w-1/4">
			<div class="absolute ml-2 flex h-full items-center">
				<span class="material-icons-round text-gray-700">search</span>
			</div>
			<div class="absolute right-0 flex h-full items-center justify-end">
				<button on:click={handleClearSearch} class="material-icons-round mr-2 text-lg text-gray-700">close</button>
			</div>
			<input
				type="text"
				placeholder="Search..."
				class="w-full rounded-md border-transparent bg-gray-100 px-9 py-3 text-sm outline-none focus:border-gray-500 focus:bg-white focus:ring-0"
				bind:value={search}
				on:input={handleSearch}
			/>
		</div>
	</div>

	<div class="grid grid-cols-projects grid-rows-projects">
		{#each projects as project}
			<ProjectCard
				id={project.id}
				image={project.avatar
					? `${import.meta.env.VITE_PUBLIC_SERVER_URL}/api/files/projects/${project.id}/${project.avatar}`
					: null}
				title={project.title}
				description={project.description}
				tags={project.tags}
			/>
		{/each}
	</div>
</section>
