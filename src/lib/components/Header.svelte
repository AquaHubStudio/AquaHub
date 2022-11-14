<script lang="ts">
	import Logo from './Logo.svelte';
	import Profile from './Profile.svelte';

	export let maxWidth: string;
</script>

<header class="bg-white px-7 py-2 shadow-sm">
	<nav class={`flex items-center max-w-${maxWidth} justify-between m-auto`}>
		<Logo />
		<Profile />
	</nav>
</header>
