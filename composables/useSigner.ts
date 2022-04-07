import { ethers } from "ethers";

export default function useSigner() {
  const provider = new ethers.providers.Web3Provider((window as any).ethereum);
  return provider.getSigner();
}