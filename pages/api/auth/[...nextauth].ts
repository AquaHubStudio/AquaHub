import NextAuth, { type NextAuthOptions } from 'next-auth';
import GoogleProvider from 'next-auth/providers/google';

export const authOptions: NextAuthOptions = {
  providers: [
    GoogleProvider({
      clientId: process.env.GOOGLE_CLIENT_ID || '',
      clientSecret: process.env.GOOGLE_CLIENT_SECRET || '',
    }),
  ],
  callbacks: {
    async signIn({ account, profile }) {
      console.log({ profile });

      if (account?.provider === 'google') {
        return profile?.email_verified && profile?.email.endsWith('@example.com');
      }
      return true; // Do different verification for other providers that don't have `email_verified`
    },
    async jwt({ token }) {
      console.log({ token });

      return token;
    },
    async session({ session, user, token }) {
      console.log({ session, user, token });

      return session;
    },
  },
};

export default NextAuth(authOptions);
