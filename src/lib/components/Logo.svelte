<script lang="ts">
	export let title: boolean = true;
</script>

<div class="flex items-center">
	<img src="images/logo.png" alt="AquaHub logo" class="h-12 w-12" />
	{#if title}
		<p class="text-md pl-2 font-medium text-black">AquaHub</p>
	{/if}
</div>
