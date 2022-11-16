<script lang="ts">
	import Logo from './Logo.svelte';
	import Profile from './Profile.svelte';

	export let maxWidth: string;
</script>

<header class="bg-white px-7 py-2 shadow-sm">
	<nav class={`flex items-center max-w-${maxWidth} justify-between m-auto`}>
		<Logo />
		<div class="flex gap-5">
			<a href="/discover" class="text-gray-800 duration-100 hover:text-gray-500">Discover</a>
			<a href="#" class="text-gray-800 duration-100 hover:text-gray-500">Create project</a>
		</div>
		<Profile />
	</nav>
</header>
