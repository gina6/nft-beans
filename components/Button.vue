<script setup>
const button = defineProps(["route", "active"]);
const route = useRoute();
const routeMatched = computed(
  () => button.route && button.route === route.fullPath
);
</script>

<template>
  <div>
    <NuxtLink
      :to="button.route"
      class="button"
      :class="{ active: button.active || routeMatched }"
    >
      <slot />
    </NuxtLink>
  </div>
</template>
<style lang="scss" scoped>
.button {
  @include helvetica-bold;
  font-size: 1em;
  color: $color-black;
  display: flex;
  justify-content: center;
  align-items: center;
  border-radius: 25px;
  background-color: $color-green;
  padding: 0.5rem 1rem;
  border-radius: 1rem;
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