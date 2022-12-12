<script>
	import FeatureDescription from '$lib/components/FeatureDescription.svelte';
</script>

<svelte:head>
	<title>Home - AquaHub</title>
	<meta name="description" content="Svelte demo app" />
</svelte:head>

<section class="m-auto max-w-landing px-10">
	<div class="flex h-[calc(90vh-64px)] w-full flex-col items-center justify-center text-center">
		<h1
			class="bg-gradient-to-r from-blue-400 to-violet-600 bg-clip-text text-5xl font-bold leading-tight text-transparent sm:text-7xl md:text-8xl"
		>
			One Hub. Every Project.
		</h1>
		<p class="text-base italic text-gray-600 sm:text-lg md:text-xl">
			Share your projects. Connect with like-minded founders. Track your progress (coming soon).
		</p>
		<div class="m-4 flex gap-4">
			<a href="/discover" class="CtA-btn bg-gray-300 text-black hover:bg-gray-400 hover:bg-opacity-50">
				<span class="material-icons-outlined">explore</span>
				Discover
			</a>
			<a href="/create" class="CtA-btn bg-indigo-500 text-white hover:bg-indigo-600">
				<span class="material-icons-round">add</span>
				Create
			</a>
		</div>
	</div>
	<FeatureDescription
		image="../../assets/landing/discover.svg"
		title="Discover projects from others"
		description="Dive into the paradise of projects and discover many awesome and exciting projects currently going on. Check out your competition but also cheer up each other."
	/>
	<FeatureDescription
		image="../../assets/landing/connect.svg"
		title="Connect with like-minded people"
		description="The perfect place to meet founders from all over the world. Get in touch with like-minded people and hopefully find your next business partner. Also get the chance to hire interested people to help out your project (coming soon)."
		reversed
	/>
	<FeatureDescription
		image="../../assets/landing/progress.svg"
		title="Track your progress (coming soon)"
		description="Not only get in touch with others and share your project you are working on currently but also track your progress. Have access to helpful tools to make your life as a project manager easier."
	/>
</section>

<style>
	.CtA-btn {
		@apply inline-flex items-center gap-3 rounded py-2 px-6 text-base outline-none duration-200;
	}
</style>
