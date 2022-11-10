<script lang="ts">
	export let image: string;
	export let title: string;
	export let description: string;
	export let tags: string[];
	export let progress: number;
</script>

<div class="bg-gray-300 p-2.5 rounded-md m-4 shadow-md">
	<div class="flex">
		<img src={image} alt="Project logo" class="w-20 h-20 rounded-md" />
		<div class="px-4">
			<p class="text-lg font-semibold">{title}</p>
			<p class="text-gray-500 max-h-20 line-clamp-3 overflow-hidden overflow-ellipsis text-sm">{description}</p>
		</div>
	</div>
	<div class="flex items-center gap-2 md:items-start md:flex-col pt-2.5 md:pt-0">
		<div class="flex md:pt-2.5">
			{#each tags as tag}
				<p class="text-xs rounded-full mr-1.5 px-4 py-0.5 bg-slate-400">{tag}</p>
			{/each}
		</div>
		<div class="flex w-full items-center">
			<div class="w-full bg-gray-200 rounded-full h-2.5">
				<div class={`bg-blue-500 h-2.5 rounded-full w-[${progress}%]`} />
			</div>
			<span class="pl-2 text-sm ">{progress}%</span>
		</div>
	</div>
</div>
