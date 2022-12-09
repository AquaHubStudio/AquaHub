<script lang="ts">
	export let reversed: boolean = false;
	export let image: string;
	export let title: string;
	export let description: string;
</script>

<div class="mx-12 mb-24">
	<div class={`flex ${reversed ? 'flex-row-reverse' : ''} items-center justify-between gap-24`}>
		<img src={image} alt="Example" class="w-1/3" />
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
