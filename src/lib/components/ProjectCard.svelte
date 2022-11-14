<script lang="ts">
	export let image: string;
	export let title: string;
	export let description: string;
	export let tags: string[];
	export let progress: number;
</script>

<div class="m-4 rounded-md bg-gray-100 p-3 shadow-md">
	<div class="flex">
		<img src={image} alt="Project logo" class="h-20 w-20 rounded-md" />
		<div class="px-4">
			<p class="text-md font-semibold">{title}</p>
			<p class="max-h-20 overflow-hidden overflow-ellipsis text-xs text-gray-500 line-clamp-3">{description}</p>
		</div>
	</div>
	<div class="mt-2 flex items-center gap-1 pt-2.5 md:flex-col md:items-start md:pt-0">
		<div class="flex md:pt-2">
			{#each tags as tag}
				<p class={`flex items-center gap-1 text-xs rounded-full mr-1.5 px-3 py-0.5 text-gray-700 bg-gray-200`}>
					<span class="material-icons-round text-xs">sell</span>
					{tag}
				</p>
			{/each}
		</div>
		<div class="flex w-full items-center">
			<div class="h-2.5 w-full rounded-full bg-gray-200">
				<div class={`bg-blue-500 h-2.5 rounded-full w-[${progress}%]`} />
			</div>
			<span class="pl-2 text-sm ">{progress}%</span>
		</div>
	</div>
</div>
