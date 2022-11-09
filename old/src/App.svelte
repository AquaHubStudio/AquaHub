<script lang="ts">
  import PocketbBase from 'pocketbase';

  export const db = new PocketbBase(import.meta.env.VITE_POCKETBASE_URL);

  let projects;

  db.records.getFullList('projects').then((data) => {
    console.log({ data });

    projects = JSON.stringify(data);
  });
</script>

<main>
  <span class="text-2xl">Hello TailwindCSS! 👋</span>
  <p>Data: {projects}</p>
  <p>Test: {JSON.stringify(db.authStore.model)}</p>
</main>
