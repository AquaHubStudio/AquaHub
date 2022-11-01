import Image from 'next/image';

type LogoProps = {
  title?: boolean;
};

export default function Logo(props: LogoProps) {
  return (
    <div className="flex items-center">
      <Image src="/assets/logo.png" alt="AquaTime Logo" width={40} height={40} />
      {props.title && <p className="pl-2 text-xl font-medium text-black">AquaHub</p>}
    </div>
  );
}
