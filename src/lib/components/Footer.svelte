<script lang="ts">
	export let maxWidth: string;
</script>

<footer class="bg-gray-100 px-12 py-6">
	<div class={`flex justify-between text-sm max-w-${maxWidth} m-auto`}>
		<p>Copyright © 2022 AquaHub Studio.</p>
		<div class="flex gap-5">
			<a href="/security">Security</a>
			<a href="/terms">Terms and Conditions</a>
			<a href="/privacy">Privacy</a>
			<a href="/cookies">Cookies</a>
		</div>
	</div>
</footer>
