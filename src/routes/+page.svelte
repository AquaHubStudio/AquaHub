<script>
	import FeatureDescription from '$lib/components/FeatureDescription.svelte';
</script>

<svelte:head>
	<title>Home</title>
	<meta name="description" content="Svelte demo app" />
</svelte:head>

<!-- <div class="grid grid-cols-projects grid-rows-projects p-24" /> -->
<section class="m-auto max-w-landing">
	<div class="flex h-[calc(90vh-64px)] w-full flex-col items-center justify-center text-center">
		<h1
			class="bg-gradient-to-r from-blue-400 to-violet-600 bg-clip-text text-8xl font-bold leading-tight text-white text-transparent"
		>
			One Hub. Every Project.
		</h1>
		<h5 class="text-xl italic text-gray-600">
			Share your project. Connect with like-minded founders. Track your progress.
		</h5>
		<div class="m-4 flex gap-4">
			<a href="#" class="CtA-btn bg-gray-300 text-black hover:bg-gray-400 hover:bg-opacity-50">
				<span class="material-icons-outlined">explore</span>
				Discover
			</a>
			<a href="#" class="CtA-btn bg-indigo-500 text-white hover:bg-indigo-600">
				<span class="material-icons-round">add</span>
				Create
			</a>
		</div>
	</div>
	<FeatureDescription
		image="https://picsum.photos/400"
		title="Discover projects from others"
		description="Lorem ipsum dolor sit amet consectetur, adipisicing elit. Veniam repellendus, hic cum magnam praesentium rem quis nisi. Nostrum minus id numquam eius alias eaque quibusdam. Suscipit repellat incidunt amet modi."
	/>
	<FeatureDescription
		image="https://picsum.photos/400"
		title="Connect with like-minded people"
		description="Lorem ipsum dolor sit amet consectetur, adipisicing elit. Veniam repellendus, hic cum magnam praesentium rem quis nisi. Nostrum minus id numquam eius alias eaque quibusdam. Suscipit repellat incidunt amet modi."
		reversed
	/>
	<FeatureDescription
		image="https://picsum.photos/400"
		title="Track your progress"
		description="Lorem ipsum dolor sit amet consectetur, adipisicing elit. Veniam repellendus, hic cum magnam praesentium rem quis nisi. Nostrum minus id numquam eius alias eaque quibusdam. Suscipit repellat incidunt amet modi."
	/>
</section>

<style>
	.CtA-btn {
		@apply inline-flex items-center gap-3 rounded py-2 px-6 text-base outline-none duration-200;
	}
</style>
