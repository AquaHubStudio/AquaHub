import Logo from './Logo';
import Profile from './Profile';

export default function Header() {
  return (
    <nav className="flex items-center justify-between bg-darkgray px-10 py-3">
      <Logo />
      <Profile />
    </nav>
  );
}
