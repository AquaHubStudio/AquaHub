<script lang="ts">
	export let maxWidth: string;
</script>

<footer class="relative bottom-0 w-full px-12 py-6">
	<hr class="m-auto mb-6 h-px border-0 bg-gray-400" />
	<div class={`flex flex-col justify-between text-center text-sm md:flex-row md:text-start max-w-${maxWidth} m-auto`}>
		<p>Copyright © 2022 AquaHub Studio</p>
		<div class="mt-5 flex flex-col gap-5 text-center md:mt-0 md:flex-row md:text-start">
			<a href="#">Security</a>
			<a href="#">Terms and Conditions</a>
			<a href="#">Privacy</a>
			<a href="#">Cookies</a>
		</div>
	</div>
</footer>
