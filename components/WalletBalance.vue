<script setup>
  import { ethers } from "ethers";
  import Beans from "../build/contracts/Beans.json";

  const config = useRuntimeConfig();
  const balance = ref("")

  async function getBalance() {
    console.log("Clicked")
    const [account] = await window.ethereum.request({ method: 'eth_requestAccounts' })
    const provider = new ethers.providers.Web3Provider(window.ethereum)
    const accountBalance = await provider.getBalance(account)
    balance.value = ethers.utils.formatEther(accountBalance)

    // get the end user
    const signer = provider.getSigner();
    // get the smart contract
    const beansContract = new ethers.Contract(config.BEANS_ADDRESS, Beans.abi, signer);

    const count = parseInt(await beansContract.count());
    console.log(`${count} NFTs minted:`);
    for (let i = 0; i < count; i++) {
      console.log(`${i} @ ${await beansContract.tokenURI(i)}`);
    }
  }
</script>
<template>
  <div> 
    <h5> Balance: {{ balance }} </h5>
    <Button @click="getBalance"> Show My Balance </Button>
  </div>
</template>