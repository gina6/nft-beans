import { ethers } from "ethers";
import Beans from "../build/contracts/Beans.json";

let beansContract;
let provider;
let signer;

export function getSigner() {
  if (signer) {
    return signer;
  }

  provider = new ethers.providers.Web3Provider(window.ethereum);
  signer = provider.getSigner();
  return signer;
}

export function getBeans(runtimeConfig) {
  if (beansContract) {
    return beansContract;
  }

  beansContract = new ethers.Contract(runtimeConfig.BEANS_ADDRESS, Beans.abi, getSigner());
  return beansContract;
}