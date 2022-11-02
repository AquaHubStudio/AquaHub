import PocketBase from 'pocketbase';

const db = new PocketBase('http://pocketbase:8090');
// const db = new PocketBase('https://pocketbase.io');

// async function getAuthMethods() {
//   console.log('data');

//   return data;
// }

export default async function ProjectsPage() {
  // const data = await db.records.getFullList('projects');
  // const res = await fetch('http://localhost:8090/api/collections/projects/records', {
  //   cache: 'no-store',
  // });
  // const data = await res.json();
  // const authMethods = await getAuthMethods();
  // console.log(data);
  // console.log(authMethods);

  await db.admins.authViaEmail(process.env.POCKETBASE_USERNAME || '', process.env.POCKETBASE_PASSWORD || '');
  const data = await db.records.getFullList('projects');

  return <div>Hopefully soon some data: {JSON.stringify(data)}</div>;
}
