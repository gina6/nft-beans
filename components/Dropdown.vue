<script setup>
  const button = defineProps(['category'])
</script>
<template>
<div>
  <div class="dropdown">
    <span>
      {{category}}
    </span>
    <div class="chevron"></div>
  </div>
  <slot/>
</div>
  
</template>
<style lang="scss" scoped>
  .dropdown {
    width: 100%;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    padding: 30px 0;
    span {   
      @include text;
      color: $color-white;
    }
    .chevron {
      display: inline-block;
      width: 64px;
      height: 43px;
      background-size: 64px 43px;
      background-image: $icon-chevronbean;
    }
  }
</style>