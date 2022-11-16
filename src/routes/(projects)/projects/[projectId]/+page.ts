export const prerender = true;
// export const csr = false;

export const load: PageLoad = ({ params }) => {
	return params;
};
