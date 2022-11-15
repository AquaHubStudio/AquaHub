<script>
	import { browser } from '$app/environment';
	import { goto } from '$app/navigation';
	import { page } from '$app/stores';
	import PocketBase from 'pocketbase';

	const db = new PocketBase(import.meta.env.VITE_POCKETBASE_URL);

	if (browser) {
		const authProvider = JSON.parse(window.localStorage.getItem('provider') || '{}');
		localStorage.removeItem('provider');
		if (!authProvider) {
			goto('/');
		} else {
			db.users
				.authViaOAuth2(
					authProvider.name,
					$page.url.searchParams.get('code') || '',
					authProvider.codeVerifier,
					import.meta.env.VITE_REDIRECT_URL,
				)
				.then((loginRes) => {
					db.records
						.update('profiles', loginRes.user.profile?.id || '', {
							name: loginRes.meta.name,
							avatar: loginRes.meta.avatarUrl,
						})
						.then(() => {
							goto('/');
						});
				});
		}
	}
</script>

<svelte:head>
	<title>Login</title>
	<meta name="description" content="Svelte demo app" />
</svelte:head>

<div>Loading...</div>
