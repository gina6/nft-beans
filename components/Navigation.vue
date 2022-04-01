<script setup>
  const activeRoute = ref('home')
</script>
<template>
  <div class="wrapper">
    <div class="container">
      <NuxtLink :to="'/'">
        <div class="logo">
          <span class="top">Supreme Bean</span>
          <span class="bottom">Cult</span>
        </div>
      </NuxtLink>
      <div class="nav">
        <Button :route="'/'" :active="activeRoute==='home'" @click="activeRoute='home'">Home</Button>
        <Button :route="'/gallery'" :active="activeRoute==='gallery'"  @click="activeRoute='gallery'">Gallery</Button>
        <Button :route="'/manifesto'" :active="activeRoute==='manifesto'"  @click="activeRoute='manifesto'">Manifesto</Button>
        <Button :route="'/church'" :active="activeRoute==='church'" @click="activeRoute='church'">The Church</Button>
      </div>
    </div>
  </div>
  <div class="divider"></div>
</template>
<style lang="scss" scoped>
.wrapper {
  margin: 0 auto;
  width: 1440px;
  .container {
    width: 100%;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    margin: 36px 0;
    .logo{
      width: fit-content;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      text-transform: uppercase;
      .top {
        @include helvetica;
        font-size: 25px;
        color: $color-green;
      }
      .bottom {
        @include impact;
        font-size: 90px;
        color: $color-green;
      }
    }
    .nav {
      display: flex;
      flex-direction: row;
      align-items: center;
      gap: 80px;      
    }
  }
}
.divider {
  background-color: $color-green;
  min-width: 100%;
  height: 5px;
}
</style>
