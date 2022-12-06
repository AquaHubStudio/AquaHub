<script lang="ts">
	export let id: string;
	export let image: string | null;
	export let title: string;
	export let description: string;
	export let tags: { title: string }[];
</script>

<div class="m-4 rounded-md bg-gray-100 p-3 shadow-md">
	<a href={`/projects/${id}`} class="flex">
		{#if image}
			<img src={image} alt="Project logo" class="h-20 w-20 rounded-md" />
		{:else}
			<div class="min-h-[80px] min-w-[80px] rounded-md bg-gray-300" />
		{/if}
		<div class="px-4 text-start">
			<p class="text-md font-semibold">{title}</p>
			<p class="max-h-20 overflow-hidden overflow-ellipsis text-xs text-gray-500 line-clamp-3">{description}</p>
		</div>
	</a>
	<div class="mt-2 flex items-center gap-1 pt-2.5 md:flex-col md:items-start md:pt-0">
		<div class="flex flex-wrap gap-2 md:pt-2">
			{#each tags as tag}
				<p class={`flex items-center gap-1 text-xs rounded-full px-3 py-0.5 text-gray-700 bg-gray-200`}>
					<span class="material-icons-round text-xs">sell</span>
					{tag}
				</p>
			{/each}
		</div>
	</div>
</div>
