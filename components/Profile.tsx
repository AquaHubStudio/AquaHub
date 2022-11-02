import Image from 'next/image';

export default function Profile() {

  return (
    <div className="flex items-center">
      {/* {session?.user?.image ? (
        <Image src={session.user.image} alt="Profile image" width={30} height={30} className="rounded-full" />
      ) : ( */}
        <Image src="/assets/no-avatar.svg" alt="Profile image" width={30} height={30} className="rounded-full" />
      {/* )} */}
      <p className="flex items-center pl-2 text-black">
        <span className="hidden md:inline-block">Jannis Milz</span>
        <span className="material-icons-round">keyboard_arrow_down</span>
      </p>
    </div>
  );
}
