<script lang="ts">
	import { goto } from '$app/navigation';
	import PocketBase from 'pocketbase';

	let avatar: Blob;
	let title = '';
	let description = '';
	let tag = '';
	let tags: string[] = [];
	let errors: { field: string; message: string }[] = [];

	const db = new PocketBase(import.meta.env.VITE_PUBLIC_SERVER_URL);

	const handleAvatar = (e: any) => {
		avatar = e.target.files[0];
	};

	const handleAddTag = () => {
		if (tag) {
			tags = [...tags, tag];
			tags = tags;
			tag = '';
		}
	};

	const handleRemoveTag = (tag: string) => {
		var index = tags.indexOf(tag);
		if (index !== -1) {
			tags.splice(index, 1);
		}
		tags = tags;
	};

	const handleSubmit = async () => {
		const formData = new FormData();

		// Validate inputs
		if (!title) {
			errors.push({ field: 'title', message: 'This field is required' });
			errors = errors;
		}
		if (tags.length === 0) {
			errors.push({ field: 'tags', message: 'At least one tag is required' });
			errors = errors;
		}

		// Send request when no errors
		if (errors.length === 0) {
			formData.append('avatar', avatar);
			formData.append('title', title);
			formData.append('description', description);
			formData.append('tags', JSON.stringify(tags));
			formData.append('manager', db.authStore.model.id);

			try {
				const project = await db.collection('projects').create(formData);
				goto(`/projects/${project.id}`);
			} catch (err: any) {
				for (const [key, value] of Object.entries(err.data.data)) {
					errors.push({ field: key, message: value.message });
					errors = errors;
				}
			}
		}
	};
</script>

<svelte:head>
	<title>Create Project - AquaHub</title>
	<meta name="description" content="Svelte demo app" />
</svelte:head>

<section class="m-auto max-w-5xl p-8">
	<div class="flex flex-col justify-between md:flex-row">
		<div class="m-auto flex w-full justify-center md:w-2/5">
			<label
				for="dropzone-file"
				class="m-auto flex h-60 w-60 cursor-pointer flex-col items-center justify-center rounded-lg border-2 border-dashed border-gray-300 bg-gray-300 dark:border-gray-600 md:ml-auto "
			>
				<div class="flex flex-col items-center justify-center pt-5 pb-5">
					{#if avatar}
						<img src={URL.createObjectURL(avatar)} alt="Project avatar preview" class="absolute h-60 w-60 rounded-lg" />
					{:else}
						<svg
							aria-hidden="true"
							class="mb-3 h-10 w-10 text-gray-400"
							fill="none"
							stroke="currentColor"
							viewBox="0 0 24 24"
							xmlns="http://www.w3.org/2000/svg"
							><path
								stroke-linecap="round"
								stroke-linejoin="round"
								stroke-width="2"
								d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12"
							/></svg
						>
						<p class="mb-2 text-sm text-gray-500 dark:text-gray-400">
							<span class="font-semibold">Click to upload</span> or drag and drop
						</p>
						<p class="text-xs text-gray-500 dark:text-gray-400">SVG, PNG, JPG or GIF</p>
						<p class="text-xs text-gray-500 dark:text-gray-400">500x500 (recommended)</p>
					{/if}
				</div>
				<input id="dropzone-file" type="file" class="hidden" on:change={handleAvatar} />
			</label>
		</div>
		<div class="mt-5 w-full md:mt-0 md:w-3/5">
			<div class="mb-2">
				<label class="text-gray mb-1 flex text-xs font-bold uppercase tracking-wide">
					<span class="mr-1.5">Title</span>
				</label>
				<div class="flex justify-between">
					<input
						class="projectDetail"
						placeholder="What's the title of your project?"
						maxlength="50"
						bind:value={title}
						on:input={() => {
							const errorObj = errors.find((err) => err.field === 'title');
							if (errors && errorObj) {
								errors.splice(errors.indexOf(errorObj), 1);
								errors = errors;
							}
						}}
					/>
				</div>
				{#if errors?.find((err) => err.field === 'title')}
					<p class="error">{errors?.find((err) => err.field === 'title')?.message}</p>
				{/if}
			</div>
			<div class="mb-2">
				<label class="text-gray mb-1 flex text-xs font-bold uppercase tracking-wide">
					<span class="mr-1.5">Description</span>
				</label>
				<div class="flex justify-between">
					<textarea
						class="projectDetail"
						placeholder="How would you describe your project?"
						rows="4"
						maxlength="1000"
						bind:value={description}
					/>
				</div>
			</div>
			<div>
				<label class="text-gray mb-1 flex text-xs font-bold uppercase tracking-wide">
					<span class="mr-1.5">Tags</span>
				</label>
				<div class="flex justify-between">
					<input
						class="projectDetail"
						placeholder={`${tags.length >= 4 ? 'You can only select a maximum of 4 tags' : 'Select a tag'}`}
						maxlength="20"
						disabled={tags.length >= 4}
						bind:value={tag}
						on:keydown={(e) => {
							if (e.key === 'Enter') {
								const errorObj = errors.find((err) => err.field === 'tags');
								if (errors && errorObj) {
									errors.splice(errors.indexOf(errorObj), 1);
									errors = errors;
								}
								handleAddTag();
							}
						}}
						on:input={() => {
							const errorObj = errors.find((err) => err.field === 'tags');
							if (errors && errorObj) {
								errors.splice(errors.indexOf(errorObj), 1);
								errors = errors;
							}
						}}
					/>
				</div>
				{#if errors?.find((err) => err.field === 'tags')}
					<p class="error">{errors?.find((err) => err.field === 'tags')?.message}</p>
				{/if}
			</div>
			<div>
				{#each tags as tag}
					<button
						class="mr-1.5 mt-2 bg-blue-400 px-3 py-1.5 text-sm text-blue-200"
						on:click={() => handleRemoveTag(tag)}
					>
						{tag} <span class="ml-1.5">&#x2715</span>
					</button>
				{/each}
			</div>
		</div>
	</div>
	<div class="mt-2 flex w-full justify-end">
		<button type="submit" class="rounded bg-primary px-5 py-2 duration-200 hover:bg-opacity-80" on:click={handleSubmit}
			>Create</button
		>
	</div>
</section>

<style>
	.projectDetail {
		@apply block w-full appearance-none rounded border py-3 px-4 leading-tight focus:outline-none disabled:bg-gray-300;
	}

	.error {
		@apply py-0.5 text-xs text-red-400;
	}
</style>
