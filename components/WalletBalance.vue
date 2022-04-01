<script setup>
  import { ethers } from "ethers";

  const balance = ref(null)

  async function getBalance() {
    console.log("Clicked")

    const [account] = await window.ethereum.request({ method: 'eth_requestAccounts' })
    const provider = new ethers.providers.Web3Provider(window.ethereum)
    const accountBalance = await provider.getBalance(account)
    balance.value = ethers.utils.formatEther(accountBalance)
  }
</script>
<template>
  <div> 
    <h5> Balance: {{ balance }} </h5>
    <!-- <Button @click="getBalance"> Show My Balance </Button> -->
  </div>
</template>