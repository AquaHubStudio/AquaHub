<script>
	import OAuthElement from './OAuthElement.svelte';
</script>

<svelte:head>
	<title>Login</title>
	<meta name="description" content="Svelte demo app" />
</svelte:head>

<section class="m-auto flex h-screen items-center justify-center">
	<div class="w-full rounded-lg bg-white shadow dark:border sm:max-w-md md:mt-0 xl:p-0">
		<div class="space-y-4 p-6 sm:p-8 md:space-y-6">
			<h1 class="text-3xl font-bold leading-tight tracking-tight text-gray-900">Login</h1>
			<div class="flex flex-col justify-between gap-3">
				<OAuthElement provider="google" />
				<OAuthElement provider="github" />
			</div>
			<a class="flex" href="/">« Back</a>
		</div>
	</div>
</section>
