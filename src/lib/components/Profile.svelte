<script lang="ts">
	export let user: any = {};
</script>

<div class="flex items-center">
	{#if user.image}
		<img src={user.image} alt="Profile avatar" class="rounded-full h-12 w-12" />
	{:else}
		<img src="images/no-avatar.svg" alt="Profile avatar" class="rounded-full h-7 w-7" />
	{/if}

	<p class="flex items-center pl-2 text-black">
		<span class="hidden md:inline-block">Jannis Milz</span>
		<span class="material-icons-round">keyboard_arrow_down</span>
	</p>
</div>
