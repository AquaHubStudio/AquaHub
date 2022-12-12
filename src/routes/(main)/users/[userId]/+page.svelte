<script lang="ts">
	import ProjectCard from '$lib/components/ProjectCard.svelte';
	import type { PageData } from './$types';

	export let data: PageData;
	const userData = data.userData;
	const userProjects = data.userProjects;
</script>

<svelte:head>
	<title>{userData.username} - AquaHub</title>
	<meta name="description" content="Svelte demo app" />
</svelte:head>

<section class="m-auto max-w-5xl p-8">
	<div class="flex flex-col justify-between gap-2 md:flex-row">
		<div class="flex w-full flex-col items-center md:w-1/3">
			{#if userData.avatar}
				<!-- Slice end of google avatar to increase avatar size -->
				<img
					src={userData.avatar.includes('googleusercontent')
						? userData.avatar.slice(0, -5) + 's500-c'
						: userData.avatar}
					referrerpolicy="no-referrer"
					alt="Project avatar preview"
					class="aspect-square h-60 w-60 rounded-lg"
				/>
			{:else}
				<div class="h-60 w-60 rounded-md bg-gray-300" />
			{/if}
			<p class="mt-2 text-center text-2xl">{userData.username}</p>
			<p class="mt-2 text-center text-lg">
				Joined <span class="text-gray-500">{new Date(userData.created).toLocaleDateString()}</span>
			</p>
		</div>
		<div class="md:w-2/3">
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
