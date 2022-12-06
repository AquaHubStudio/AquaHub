<script lang="ts">
	import ProjectCard from '$lib/components/ProjectCard.svelte';
	import type { Record } from 'pocketbase';
	import type { PageData } from './$types';

	export let data: PageData;
	const projects = data.items;
</script>

<svelte:head>
	<title>Home</title>
	<meta name="description" content="Svelte demo app" />
</svelte:head>

<section class="m-auto max-w-main">
	<div class="m-4 flex gap-3">
		<div class="relative w-1/4">
			<div class="absolute ml-2 flex h-full items-center">
				<span class="material-icons-round text-gray-700">search</span>
			</div>
			<input
				type="text"
				placeholder="Search..."
				class="w-full rounded-md border-transparent bg-gray-100 px-9 py-3 text-sm outline-none focus:border-gray-500 focus:bg-white focus:ring-0"
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
