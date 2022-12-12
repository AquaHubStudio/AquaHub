<script lang="ts">
	import type { PageData } from './$types';
	import PocketBase from 'pocketbase';

	const db = new PocketBase(import.meta.env.VITE_PUBLIC_BACKEND_URL);

	export let data: PageData;
	const projectId = data.params.projectId;
	const projectData = data.projectData;
</script>

<svelte:head>
	<title>{projectData.title} - AquaHub</title>
	<meta name="description" content="Svelte demo app" />
</svelte:head>

<section class="m-auto max-w-5xl p-8">
	<div class="flex flex-col items-center gap-4 md:flex-row md:items-start md:justify-between">
		<div class="flex w-full flex-col items-center md:w-1/3">
			{#if projectData.avatar}
				<img
					src={`${import.meta.env.VITE_PUBLIC_SERVER_URL}/api/files/projects/${projectData.id}/${projectData.avatar}`}
					alt="Project avatar preview"
					class="h-60 w-60 rounded-lg"
				/>
			{:else}
				<div class="h-60 w-60 rounded-md bg-gray-300" />
			{/if}
			<p class="mt-2 text-center text-lg">{projectData.title}</p>
			<p class="mt-2 text-center text-lg">
				Manager: <a
					class="text-blue-300 underline duration-100 hover:text-primary"
					href={`/users/${projectData.expand.manager.id}`}>{projectData.expand.manager.username}</a
				>
			</p>
			{#if projectData.manager === db.authStore.model.id}
				<a
					href={`/projects/${projectData.id}/edit`}
					class="right-4 my-4 flex items-center gap-2 rounded-md bg-primary px-3 py-1.5 text-sm text-white"
				>
					<span class="material-icons-outlined text-base">edit</span> Edit
				</a>
			{/if}
		</div>
		<div class="w-full md:w-2/3">
			<div class="mb-2">
				<div class="flex justify-between">
					<p class="projectDetail">{projectData.description}</p>
				</div>
			</div>
			<div class="flex">
				{#each projectData.tags as tag}
					<p class="mr-1.5 mt-2 rounded-sm bg-blue-400 px-4 py-1.5 text-sm text-blue-200">
						{tag}
					</p>
				{/each}
			</div>
		</div>
	</div>
</section>
