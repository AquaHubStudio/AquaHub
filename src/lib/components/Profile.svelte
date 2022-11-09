<script>
	export let user;
</script>

<div className="flex items-center">
	{#if user.image}
		<img src={user.image} alt="Profile image" width={30} height={30} className="rounded-full" />
	{:else}
		<img src="/assets/no-avatar.svg" alt="Profile image" width={30} height={30} className="rounded-full" />
	{/if}

	<p className="flex items-center pl-2 text-black">
		<span className="hidden md:inline-block">Jannis Milz</span>
		<span className="material-icons-round">keyboard_arrow_down</span>
	</p>
</div>
