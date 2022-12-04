<script lang="ts">
	import type { PageData } from './$types';

	export let data: PageData;
	const projectId = data.params.projectId;
	const projectData = data.projectData;
</script>

<svelte:head>
	<title>Home</title>
	<meta name="description" content="Svelte demo app" />
</svelte:head>

<section class="m-auto mt-8 max-w-5xl">
	<div class="flex justify-between">
		<div class="flex w-1/3 flex-col items-center">
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
		</div>
		<div class="w-2/3">
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
