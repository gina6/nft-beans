import { ethers } from "ethers";
import useSigner from "./useSigner";
import Foods from "../build/contracts/Foods.json";

export default function useFoodsContract() {
  const signer = useSigner();
  const config = useRuntimeConfig();

  return useState("foodsContract", () => new ethers.Contract(config.FOODS_ADDRESS, Foods.abi, signer));
}