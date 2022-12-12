<script lang="ts">
	export let reversed: boolean = false;
	export let image: string;
	export let title: string;
	export let description: string;
</script>

<div class="mx-12 mb-24">
	<div
		class={`flex ${
			reversed ? 'md:flex-row-reverse' : 'md:flex-row'
		} flex-col items-center justify-between gap-12 md:gap-24`}
	>
		<img src={image} alt="Example" class="w-2/3 md:w-1/3" />
		<div>
			<h3
				class="mb-2 w-fit bg-gradient-to-r from-blue-400 to-violet-600 bg-clip-text text-4xl font-extrabold text-transparent"
			>
				{title}
			</h3>
			<p class="italic text-gray-600">
				{description}
			</p>
		</div>
	</div>
</div>
