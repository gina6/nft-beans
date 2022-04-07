import { ethers } from "ethers";
import useSigner from "./useSigner";
import Beans from "../build/contracts/Beans.json";

export default function useBeansContract() {
  const signer = useSigner();
  const config = useRuntimeConfig();

  return useState("beansContract", () => new ethers.Contract(config.BEANS_ADDRESS, Beans.abi, signer));
}