<script lang="ts">
	export let user: any = {};
</script>

<div class="flex items-center">
	{#if user.image}
		<img src={user.image} alt="Profile avatar" class="h-12 w-12 rounded-full" />
	{:else}
		<img src="images/no-avatar.svg" alt="Profile avatar" class="h-7 w-7 rounded-full" />
	{/if}

	<p class="flex items-center pl-2 text-black">
		<span class="hidden md:inline-block">Your Name</span>
		<span class="material-icons-round">keyboard_arrow_down</span>
	</p>
</div>
