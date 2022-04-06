<script setup>
  const bean = defineProps(['text', 'image'])
</script>

<template>
  <div class="bean-container">
    <img :src="bean.image" :alt="bean.text">
    <div class="bean-text">
      {{bean.text}}
    </div>
  </div>
</template>

<style lang="scss" scoped>
  .bean-container {
    height: fit-content;

    img {
      width: 250px;
      height: 250px;
      object-fit: contain;
      border-radius: 10px;
    }
    .bean-text {
      @include helvetica;
      font-size: 20px;
      text-align: center;
    }
  }
</style>