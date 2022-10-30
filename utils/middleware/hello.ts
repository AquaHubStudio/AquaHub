import { NextApiRequest, NextApiResponse } from 'next';

export default function hello(req: NextApiRequest, res: NextApiResponse, next: any) {
  console.log('Hello middleware!');

  return next();
}
