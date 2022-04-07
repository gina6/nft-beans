<script setup>
  import { ethers } from "ethers";

  const emit = defineEmits(["minted"]);

  const config = useRuntimeConfig();

  async function mint() {
    const beans = useBeansContract().value;
    const signer = useSigner();
    const signerAddress = await signer.getAddress();

    const minting = await beans.payToMint(signerAddress, config.PINATA_CONTENT_ID, {
      value: ethers.utils.parseUnits("0.05", "ether")
    });
    await minting.wait();

    emit("minted");
  }
</script>

<template>
  <div class="bean-container" @click="mint">
    Mint Bean
  </div>
</template>

<style lang="scss" scoped>
  .bean-container {
    @include text;
    width: 250px;
    height: 250px;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 10px;
    background-color: $color-green;
    color: $color-black;
    opacity: 1;
  }
  :hover {
    opacity: 0.8;
    transition: ease-in-out 0.2s;
    cursor: pointer;
  }
</style>