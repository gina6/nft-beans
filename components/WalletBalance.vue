<script setup>
  const balance = ref(null)

  function getBalance() {
    console.log("Clicked")
    // const { account } = await useAsyncData( 'account', () => window.ethereum.request({ method: 'eth_requestAccounts' }))
    // const provider = new ethers.providers.Web3Provider(window.ethereum)
    // const balance = await provider.getBalance(account)
    // balance = ethers.utils.formatEther(balance)
  }
</script>
<template>
  <div> 
    <h5> Balance: {{ balance }} </h5>
    <Button @click="getBalance"> Show My Balance </Button>
  </div>
</template>