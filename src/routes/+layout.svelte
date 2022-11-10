<script>
	import Header from '../lib/components/Header.svelte';
	import '../app.css';
	import Footer from '$lib/components/Footer.svelte';
</script>

<div class="app">
	<Header />
	<main>
		<slot />
	</main>
	<Footer />
</div>
