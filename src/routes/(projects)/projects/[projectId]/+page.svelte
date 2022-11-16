<script lang="ts">
	import type { PageData } from './$types';

	export let data: PageData;
	const projectId = data.projectId;
</script>

<svelte:head>
	<title>Home</title>
	<meta name="description" content="Svelte demo app" />
</svelte:head>

<!-- <div class="grid grid-cols-projects grid-rows-projects p-24" /> -->
<section class="m-auto max-w-projects">
	{projectId}
</section>
