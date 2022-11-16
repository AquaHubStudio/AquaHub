<script lang="ts">
	import ProjectCard from '$lib/components/ProjectCard.svelte';
</script>

<svelte:head>
	<title>Home</title>
	<meta name="description" content="Svelte demo app" />
</svelte:head>

<!-- <div class="grid grid-cols-projects grid-rows-projects p-24" /> -->
<section class="m-auto max-w-projects">
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
		<ProjectCard
			id="cl123"
			image="https://picsum.photos/200"
			title="Test Title"
			description="Some description for this project so lets type here some more text and hope for the best. I try to write even longer description. I need to find the matching best length."
			tags={[{ title: 'Tag1' }, { title: 'Tag2' }]}
		/>
		<ProjectCard
			id="cl123"
			image="https://picsum.photos/200"
			title="Test Title"
			description="Some description for this project so lets type here some more text and hope for the best. I try to write even longer description. I need to find the matching best length."
			tags={[{ title: 'Tag1' }, { title: 'Tag2' }]}
		/>
		<ProjectCard
			id="cl123"
			image="https://picsum.photos/200"
			title="Test Title"
			description="Some description for this project so lets type here some more text and hope for the best. I try to write even longer description. I need to find the matching best length."
			tags={[{ title: 'Tag1' }, { title: 'Tag2' }]}
		/>
		<ProjectCard
			id="cl123"
			image="https://picsum.photos/200"
			title="Test Title"
			description="Some description for this project so lets type here some more text and hope for the best. I try to write even longer description. I need to find the matching best length."
			tags={[{ title: 'Tag1' }, { title: 'Tag2' }]}
		/>
		<ProjectCard
			id="cl123"
			image="https://picsum.photos/200"
			title="Test Title"
			description="Some description for this project so lets type here some more text and hope for the best. I try to write even longer description. I need to find the matching best length."
			tags={[{ title: 'Tag1' }, { title: 'Tag2' }]}
		/>
	</div>
</section>
