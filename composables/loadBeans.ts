import useBeansContract from "./useBeansContract";

export default async function loadBeans() {
  const beansContract = useBeansContract().value;

  const count = parseInt(await beansContract.count());
  const nfts = [];
  for (let i = 0; i < count; i++) {
    let imageSrc = await beansContract.tokenURI(i);
    const owner = await beansContract.ownerOf(i);
    if (imageSrc.startsWith("ipfs://")) {
      const contentId = imageSrc.substring("ipfs://".length);
      imageSrc = `https://ipfs.io/ipfs/${contentId}`;
    }
    nfts.push({ id: i, image: imageSrc, owner });
  }
  return nfts;
}