<script lang="ts">
	export let maxWidth: string;
</script>

<footer class="relative bottom-0 w-full px-12 py-6">
	<hr class="m-auto mb-6 h-px border-0 bg-gray-400" />
	<div class={`flex justify-between text-sm max-w-${maxWidth} m-auto`}>
		<p>Copyright © 2022 AquaHub Studio</p>
		<div class="flex gap-5">
			<a href="#">Security</a>
			<a href="#">Terms and Conditions</a>
			<a href="#">Privacy</a>
			<a href="#">Cookies</a>
		</div>
	</div>
</footer>
