import PocketBase from 'pocketbase';

const db = new PocketBase('http://pocketbase:8090');

export default async function ProjectsPage() {
  await db.admins.authViaEmail(process.env.POCKETBASE_USERNAME || '', process.env.POCKETBASE_PASSWORD || '');
  const data = await db.records.getFullList('projects');
  console.log({ client: db.authStore.model });

  return <div>Hopefully soon some data: {JSON.stringify(data)}</div>;
}
