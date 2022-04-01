<script setup>
  const metamask = ref(false)
  onBeforeMount(() => {
    if (window.ethereum) {
      metamask.value = true
    }
  })
  definePageMeta({
    layout: "custom",
  });
</script>
<template>
  <div>
    <Install v-if="!metamask" />
    <Home />
    <WalletBalance />
  </div>
</template>
<style lang="scss" scoped>
  div {
    color: $color-white;
  }
</style>