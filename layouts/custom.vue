<script setup lang="ts">
useMeta({
  htmlAttrs: {
    style: [`height: 100%;`],
  },
  bodyAttrs: {
    style: [`background: #1B1B1B no-repeat top; min-height: 100%; margin: 0px`],
  },
});
</script>

<template>
  <div class="custom">
    <Navigation />
    <div class="container">
      <slot />
    </div>
    <Footer />
  </div>
</template>

<style lang="scss" scoped>
.container {
  top: 0;
  margin: 0 auto;
  width: 1440px;
}
</style>