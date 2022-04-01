<script setup>
  
</script>
<template>
  <div class="button">
    <slot />
  </div>
</template>
<style scoped>
  .button {
    color: white;
    background-color: mediumturquoise;
    width: fit-content;
    padding: 0.5rem 1rem;
    border-radius: 0.5rem;
  }
  :hover {
    opacity: 0.8;
    transition: ease-in-out 0.2s;
    cursor: pointer;
  }
</style>