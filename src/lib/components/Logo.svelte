<script lang="ts">
	export let title: boolean = true;
</script>

<a href="/" class="flex items-center">
	<img src="/assets/Logo.png" alt="AquaHub logo" class="h-12 w-12" />
	{#if title}
		<p class="text-md pl-2 font-semibold text-black">AquaHub</p>
	{/if}
</a>
