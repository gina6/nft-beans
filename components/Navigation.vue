<template>
  <div class="wrapper">
    <div class="container">
      <NuxtLink :to="'/'">
        <div class="logo">
          <img src="/logo.png" alt="Supreme Bean Cult Logo">
        </div>
      </NuxtLink>
      <div class="nav">
        <Button route="/">Home</Button>
        <Button route="/gallery">Gallery</Button>
        <Button route="/manifesto">Manifesto</Button>
        <Button route="/church">The Church</Button>
      </div>
    </div>
  </div>
  <div class="nav-divider"></div>
</template>
<style lang="scss" scoped>
.wrapper {
  margin: 0 auto;
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

      img{
        margin-left: 5vw;
      }
    }
    .nav {
      display: flex;
      flex-direction: row;
      align-items: center;
      gap: 80px;
      padding-left: 8px;
      padding-right: 8px;
      @include smallScreen {
        gap: 40px;
      }
    }
  }
}
.nav-divider {
  background-color: $color-green;
  width: 100%;
  height: 5px;
}
</style>
