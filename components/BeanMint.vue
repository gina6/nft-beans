<script setup>
  
</script>

<template>
  <div class="bean-container">
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