<script setup>
  const button = defineProps(['route', 'active'])
</script>

<template>
  <div>
    <NuxtLink :to="button.route" class="button" :class="{ active: button.active }">
      <slot />
    </NuxtLink>
  </div>
</template>
<style lang="scss" scoped>
  .button {
    @include helvetica;
    font-size: 16px;
    color: $color-black;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 25px;
    background-color: $color-green;
    width: 145px;
    padding: 0.5rem 1rem;
    border-radius: 0.5rem;
    text-transform: uppercase;
    opacity: 0.5;
    &.active {
      opacity: 1;
    }
  }
  :hover {
    opacity: 0.8;
    transition: ease-in-out 0.2s;
    cursor: pointer;
  }
</style>