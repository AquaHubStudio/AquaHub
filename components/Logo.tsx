import Image from 'next/image';

export default function Logo() {
  return (
    <div className="flex items-center">
      <Image
        src="/assets/logo.png"
        alt="AquaTime Logo"
        width={40}
        height={40}
      />
      <p className="pl-2 text-xl font-semibold text-white">AquaTime</p>
    </div>
  );
}
