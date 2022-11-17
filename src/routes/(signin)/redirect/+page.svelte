<script>
	import { browser } from '$app/environment';
	import { goto } from '$app/navigation';
	import { page } from '$app/stores';
	import PocketBase from 'pocketbase';

	const db = new PocketBase(import.meta.env.VITE_SERVER_URL);

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
				.then((signInRes) => {
					db.records
						.update('profiles', signInRes.user.profile?.id || '', {
							name: signInRes.meta.name,
							avatar: signInRes.meta.avatarUrl,
						})
						.then(() => {
							// Update authStore after updated user
							db.users.refresh();
							goto('/');
						});
				});
		}
	}
</script>

<svelte:head>
	<title>Redirect</title>
	<meta name="description" content="Svelte demo app" />
</svelte:head>

<div>Loading...</div>
