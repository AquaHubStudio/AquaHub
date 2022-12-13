<script>
	import Header from '$lib/components/Header.svelte';
	import '../../app.css';
	import Footer from '$lib/components/Footer.svelte';
	import BetaBanner from '$lib/components/BetaBanner.svelte';
</script>

<div class="app">
	<BetaBanner />
	<Header maxWidth="landing" />
	<main>
		<slot />
	</main>
	<Footer maxWidth="landing" />
</div>
