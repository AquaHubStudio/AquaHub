import { useSession } from 'next-auth/react';
import Image from 'next/image';

export default function Profile() {
  const { data: session } = useSession();

  return (
    <div className="flex items-center">
      {session?.user?.image ? (
        <Image
          src={session.user.image}
          alt="Profile image"
          width={30}
          height={30}
          className="rounded-full"
        />
      ) : (
        <Image
          src="/assets/no-avatar.svg"
          alt="Profile image"
          width={30}
          height={30}
          className="rounded-full"
        />
      )}
      <p className="flex items-center pl-2 text-white">
        {session?.user?.name}
        <span className="material-icons-round">keyboard_arrow_down</span>
      </p>
    </div>
  );
}
