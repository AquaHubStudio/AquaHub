import { NextApiRequest, NextApiResponse } from 'next';
import createRouter from 'next-connect';

function onError(err: Error, req: NextApiRequest, res: NextApiResponse) {
  return res.status(500).json({
    error: (err as Error).message,
  });
}

function onNoMatch(req: NextApiRequest, res: NextApiResponse) {
  return res.status(500).send('This endpoint has no match for this request method.');
}

// Create router
export const router = createRouter<NextApiRequest, NextApiResponse>({ onError, onNoMatch });
