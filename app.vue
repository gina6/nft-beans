<script setup>
  const metamask = ref(false)
  onBeforeMount(() => {
    if (window.ethereum) {
      metamask.value = true
    }
  })
</script>
<template>
  <div>
    <Install v-if="metamask" />
    <Home v-else />
    <WalletBalance />
  </div>
</template>
