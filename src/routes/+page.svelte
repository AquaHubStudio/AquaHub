<script>
	import Landing from '$lib/components/Landing.svelte';
	import ProjectCard from '$lib/components/ProjectCard.svelte';
</script>

<svelte:head>
	<title>Home</title>
	<meta name="description" content="Svelte demo app" />
</svelte:head>

<div>
	<Landing />
	<div class="grid grid-cols-projects grid-rows-projects p-24">
		<ProjectCard
			image="https://picsum.photos/200"
			title="Test Title"
			description="Some description for this project so lets type here some more text and hope for the best. I try to write even longer description. I need to find the matching best length."
			tags={['Tag1', 'Tag2']}
			progress={23}
		/>
		<ProjectCard
			image="https://picsum.photos/200"
			title="Test Title"
			description="Some description for this project so lets type here some more text and hope for the best. I try to write even longer description. I need to find the matching best length."
			tags={['Tag1', 'Tag2']}
			progress={23}
		/>
		<ProjectCard
			image="https://picsum.photos/200"
			title="Test Title"
			description="Some description for this project so lets type here some more text and hope for the best. I try to write even longer description. I need to find the matching best length."
			tags={['Tag1', 'Tag2']}
			progress={23}
		/>
		<ProjectCard
			image="https://picsum.photos/200"
			title="Test Title"
			description="Some description for this project so lets type here some more text and hope for the best. I try to write even longer description. I need to find the matching best length."
			tags={['Tag1', 'Tag2']}
			progress={23}
		/>
		<ProjectCard
			image="https://picsum.photos/200"
			title="Test Title"
			description="Some description for this project so lets type here some more text and hope for the best. I try to write even longer description. I need to find the matching best length."
			tags={['Tag1', 'Tag2']}
			progress={23}
		/>
		<ProjectCard
			image="https://picsum.photos/200"
			title="Test Title"
			description="Some description for this project so lets type here some more text and hope for the best. I try to write even longer description. I need to find the matching best length."
			tags={['Tag1', 'Tag2']}
			progress={23}
		/>
	</div>
</div>
