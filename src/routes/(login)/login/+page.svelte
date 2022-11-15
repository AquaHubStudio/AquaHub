<script>
	import OAuthElement from './OAuthElement.svelte';
</script>

<svelte:head>
	<title>Login</title>
	<meta name="description" content="Svelte demo app" />
</svelte:head>

<section class="m-auto flex h-screen items-center justify-center">
	<div>
		<p>Login</p>
		<OAuthElement provider="google" />
		<a href="javascript:history.back()">« Back</a>
	</div>
</section>
