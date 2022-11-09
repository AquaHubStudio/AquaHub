<script>
	import Header from '../lib/components/Header.svelte';
	import '../app.css';
</script>

<div class="app">
	<!-- Header here -->
	<Header />

	<main>
		<slot />
	</main>

	<!-- Footer here -->
</div>
