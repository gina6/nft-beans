<script setup>
  
</script>

<template>
  <div class="placeholder-container">
    <slot />
  </div>
</template>

<style lang="scss" scoped>
  .placeholder-container {
    @include text;
    width: 250px;
    height: 250px;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 10px;
    border: 5px solid $color-green;
    background-color: $color-white;
    color: $color-black;
    opacity: 1;
  }
</style>