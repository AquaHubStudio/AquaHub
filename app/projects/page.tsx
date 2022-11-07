'use client';
import PocketBase from 'pocketbase';
import { useEffect, useState } from 'react';

const db = new PocketBase('http://localhost:8090');

export default function ProjectsPage() {
  const [profiles, setProfiles] = useState(db.records.getFullList('profiles') ?? 'Crazy');

  // async function test() {
  //   const result = await db.records.getFullList('profiles');
  //   // const result = await fetch('http://localhost:8090/api/collections/profiles/records?page=1&perPage=100');

  //   setProfiles(JSON.stringify(result));
  // }
  // const user = db.authStore.model;

  return (
    <div>
      <p>User: {JSON.stringify(db.authStore.model)}</p>
      {/* <button onClick={test}>Load data</button> */}
      <p>Fetch: {JSON.stringify(profiles)}</p>
      {/* <p>Hopefully soon some data: {JSON.stringify(data)}</p>
      <p>Your user: {JSON.stringify(user)}</p> */}
    </div>
  );
}
