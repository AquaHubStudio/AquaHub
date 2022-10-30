import type { NextApiRequest, NextApiResponse } from 'next';
import { router } from '.';
import hello from '../../utils/middleware/hello';

// Actual route with proper method (GET | POST | PATCH | PUT | DELETE | ALL)
router.get(hello, (req, res) => {
  return res.status(200).json({
    response: true,
  });
});

// Export router => optional Error handler functions
export default router;
