<script lang="ts">
	import { goto } from '$app/navigation';
	import PocketBase from 'pocketbase';

	export let provider: 'google' | 'github';

	const db = new PocketBase(import.meta.env.VITE_POCKETBASE_URL);
	const providerCap = provider[0].toUpperCase() + provider.substr(1).toLowerCase();

	const redirectLogin = async () => {
		const { authProviders } = await db.users.listAuthMethods();
		authProviders.forEach(function (method) {
			if (method.name == provider) {
				localStorage.setItem('provider', JSON.stringify(method));

				goto(method.authUrl + import.meta.env.VITE_REDIRECT_URL);
			}
		});
	};
</script>

<button
	class="flex w-full items-center justify-center rounded-md border-2 border-gray-200 py-2 duration-100 hover:bg-gray-100"
	on:click={redirectLogin}
>
	<div class="h-7 w-7">
		{#if provider === 'google'}
			<svg
				class="eUuXwBkW5W4__eatjSfd RRXFBumaW2SHdseZaWm6 _gmxfZ2BpOHxa6nWwqBB"
				viewBox="0 0 21 20"
				fill="none"
				xmlns="http://www.w3.org/2000/svg"
			>
				<g clip-path="url(#clip0_13183_10121)"
					><path
						d="M20.3081 10.2303C20.3081 9.55056 20.253 8.86711 20.1354 8.19836H10.7031V12.0492H16.1046C15.8804 13.2911 15.1602 14.3898 14.1057 15.0879V17.5866H17.3282C19.2205 15.8449 20.3081 13.2728 20.3081 10.2303Z"
						fill="#3F83F8"
					/><path
						d="M10.7019 20.0006C13.3989 20.0006 15.6734 19.1151 17.3306 17.5865L14.1081 15.0879C13.2115 15.6979 12.0541 16.0433 10.7056 16.0433C8.09669 16.0433 5.88468 14.2832 5.091 11.9169H1.76562V14.4927C3.46322 17.8695 6.92087 20.0006 10.7019 20.0006V20.0006Z"
						fill="#34A853"
					/><path
						d="M5.08857 11.9169C4.66969 10.6749 4.66969 9.33008 5.08857 8.08811V5.51233H1.76688C0.348541 8.33798 0.348541 11.667 1.76688 14.4927L5.08857 11.9169V11.9169Z"
						fill="#FBBC04"
					/><path
						d="M10.7019 3.95805C12.1276 3.936 13.5055 4.47247 14.538 5.45722L17.393 2.60218C15.5852 0.904587 13.1858 -0.0287217 10.7019 0.000673888C6.92087 0.000673888 3.46322 2.13185 1.76562 5.51234L5.08732 8.08813C5.87733 5.71811 8.09302 3.95805 10.7019 3.95805V3.95805Z"
						fill="#EA4335"
					/></g
				><defs
					><clipPath id="clip0_13183_10121"
						><rect width="20" height="20" fill="white" transform="translate(0.5)" /></clipPath
					></defs
				>
			</svg>
		{:else if provider === 'github'}
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1024 1024" fill="none">
				<path
					fill-rule="evenodd"
					clip-rule="evenodd"
					d="M8 0C3.58 0 0 3.58 0 8C0 11.54 2.29 14.53 5.47 15.59C5.87 15.66 6.02 15.42 6.02 15.21C6.02 15.02 6.01 14.39 6.01 13.72C4 14.09 3.48 13.23 3.32 12.78C3.23 12.55 2.84 11.84 2.5 11.65C2.22 11.5 1.82 11.13 2.49 11.12C3.12 11.11 3.57 11.7 3.72 11.94C4.44 13.15 5.59 12.81 6.05 12.6C6.12 12.08 6.33 11.73 6.56 11.53C4.78 11.33 2.92 10.64 2.92 7.58C2.92 6.71 3.23 5.99 3.74 5.43C3.66 5.23 3.38 4.41 3.82 3.31C3.82 3.31 4.49 3.1 6.02 4.13C6.66 3.95 7.34 3.86 8.02 3.86C8.7 3.86 9.38 3.95 10.02 4.13C11.55 3.09 12.22 3.31 12.22 3.31C12.66 4.41 12.38 5.23 12.3 5.43C12.81 5.99 13.12 6.7 13.12 7.58C13.12 10.65 11.25 11.33 9.47 11.53C9.76 11.78 10.01 12.26 10.01 13.01C10.01 14.08 10 14.94 10 15.21C10 15.42 10.15 15.67 10.55 15.59C13.71 14.53 16 11.53 16 8C16 3.58 12.42 0 8 0Z"
					transform="scale(64)"
					fill="#1B1F23"
				/>
			</svg>
		{/if}
	</div>
</button>
