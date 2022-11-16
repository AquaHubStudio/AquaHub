<script lang="ts">
	import { clickOutside } from '../helpers/clickOutside';
	import PocketBase from 'pocketbase';

	const db = new PocketBase(import.meta.env.VITE_POCKETBASE_URL);

	let ddOpen = false;

	const handleDdClick = () => {
		ddOpen = !ddOpen;
	};

	const handleDdOutsideClick = () => {
		if (ddOpen) {
			ddOpen = false;
		}
	};

	const logout = () => {
		db.authStore.clear();
		location.reload();
	};
</script>

<div>
	{#if db.authStore.isValid}
		<div class="relative text-left" use:clickOutside on:click_outside={handleDdOutsideClick}>
			<div class="flex items-center">
				{#if db.authStore.model?.profile.avatar}
					<img src={db.authStore.model.profile.avatar} alt="Profile avatar" class="h-8 w-8 rounded-full" />
				{:else}
					<img src="/assets/no-avatar.svg" alt="Profile avatar" class="h-8 w-8 rounded-full" />
				{/if}
				<button on:click={handleDdClick} class="flex items-center pl-2 text-black duration-200 hover:text-gray-600">
					<span class="hidden md:inline-block">{db.authStore.model?.profile.name}</span>
					<span class="material-icons-round">keyboard_arrow_down</span>
				</button>
			</div>

			<div
				class={`absolute ${
					ddOpen ? '' : 'hidden'
				} right-0 z-10 mt-2 w-48 origin-top-right divide-y divide-gray-100 rounded-md bg-white shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none`}
			>
				<div class="py-1" role="none">
					<a href="#" class="block px-4 py-2 text-sm text-gray-700 duration-200 hover:text-gray-500">My Projects</a>
				</div>
				<div class="py-1" role="none">
					<button on:click={logout} class="block px-4 py-2 text-sm text-red-500 duration-200 hover:text-red-400"
						>Sign out</button
					>
				</div>
			</div>
		</div>
	{:else}
		<a href="/signin" class="duration-100 hover:opacity-70">Sign in</a>
	{/if}
</div>
