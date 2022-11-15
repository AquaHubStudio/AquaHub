<script lang="ts">
	import { goto } from '$app/navigation';
	import PocketBase from 'pocketbase';

	export let provider: 'google' | 'github';

	const db = new PocketBase(import.meta.env.VITE_POCKETBASE_URL);

	const redirectLogin = async () => {
		const { authProviders } = await db.users.listAuthMethods();
		console.log(authProviders);

		authProviders.forEach(function (method) {
			if (method.name == provider) {
				localStorage.setItem('provider', JSON.stringify(method));

				goto(method.authUrl + import.meta.env.VITE_REDIRECT_URL);
			}
		});
	};
</script>

<button on:click={redirectLogin}>Login with {provider}</button>
