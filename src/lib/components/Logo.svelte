<script lang="ts">
	export let title: boolean = true;
</script>

<div class="flex items-center">
	<img src="images/logo.png" alt="AquaHub logo" class="w-16 h-16" />
	{#if title}
		<p class="pl-2 text-xl font-medium text-black">AquaHub</p>
	{/if}
</div>
