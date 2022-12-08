<script lang="ts">
	import ProjectCard from '$lib/components/ProjectCard.svelte';
	import type { PageData } from './$types';

	export let data: PageData;
	const userData = data.userData;
	const userProjects = data.userProjects;
</script>

<svelte:head>
	<title>Home</title>
	<meta name="description" content="Svelte demo app" />
</svelte:head>

<section class="m-auto mt-8 max-w-5xl">
	<div class="flex justify-between">
		<div class="flex w-1/3 flex-col items-center">
			{#if userData.avatar}
				<!-- Slice end of google avatar to increase avatar size -->
				<img
					src={userData.avatar.includes('googleusercontent')
						? userData.avatar.slice(0, -5) + 's500-c'
						: userData.avatar}
					alt="Project avatar preview"
					class="h-60 w-60 rounded-lg"
				/>
			{:else}
				<div class="h-60 w-60 rounded-md bg-gray-300" />
			{/if}
			<p class="mt-2 text-center text-2xl">{userData.name}</p>
			<p class="mt-2 text-center text-lg">
				Joined <span class="text-gray-500">{new Date(userData.created).toLocaleDateString()}</span>
			</p>
		</div>
		<div class="w-2/3">
			{#each userProjects as project}
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
	</div>
</section>
