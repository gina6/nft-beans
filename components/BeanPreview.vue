<script setup>
  const bean = defineProps(['text', 'smallText', 'image'])
</script>

<template>
  <div class="bean-container">
    <img :src="bean.image" :alt="bean.text">
    <div class="bean-text">
      {{bean.text}}
      <p v-if="bean.smallText" class="small">{{ bean.smallText }}</p>
    </div>
  </div>
</template>

<style lang="scss" scoped>
  .bean-container {
    height: fit-content;
    width: min-content;

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

      > .small {
        font-size: 12px;
        opacity: 0.8;
        margin-top: 4px;
      }
    }
  }
</style>