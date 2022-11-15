<script>
	import OAuthElement from './OAuthElement.svelte';
</script>

<svelte:head>
	<title>Login</title>
	<meta name="description" content="Svelte demo app" />
</svelte:head>

<section class="m-auto flex h-screen items-center justify-center">
	<div class="w-full bg-white rounded-lg shadow dark:border md:mt-0 sm:max-w-md xl:p-0">
		<div class="p-6 space-y-4 md:space-y-6 sm:p-8">
			<h1 class="text-3xl font-bold leading-tight tracking-tight text-gray-900">Login</h1>
			<div class="flex flex-col justify-between gap-3">
				<OAuthElement provider="google" />
				<OAuthElement provider="github" />
			</div>
			<a class="flex" href="javascript:history.back()">« Back</a>
		</div>
	</div>
</section>
