<script>
	import Header from '../lib/components/Header.svelte';
	import '../app.css';
	import Footer from '$lib/components/Footer.svelte';
</script>

<div class="app">
	<Header maxWidth="landing" />
	<main>
		<slot />
	</main>
	<Footer maxWidth="landing" />
</div>
