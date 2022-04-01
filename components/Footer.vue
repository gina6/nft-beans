<script setup>
</script>
<template>
  <div class="divider"></div>
  <div class="container">
    <div class="footer">
      <div class="social">
        <div class="icon twitter"></div>
        <p>@SupremeBeanCult</p>
      </div>
      <div class="social">
        <div class="icon youtube"></div>
        <p>Suprem Bean Cult</p>
      </div>
      <div class="social">
        <div class="icon discord"></div>
        <p>Suprem Bean Cult</p>
      </div>
    </div>
  </div>
</template>
<style lang="scss" scoped>
  .divider {
    background-color: $color-green;
    min-width: 100%;
    height: 5px;
  }
  .container {
    margin: 0 auto;
    width: 1440px;
    .footer {
      display: flex;
      flex-direction: row;
      justify-content: space-between;
      align-items: center;
      margin: 36px 100px;
      .social {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        @include text;
        color: $color-white;
  
        .icon {
          display: inline-block;
          width: 50px;
          height: 50px;
          background-size: 50px 50px;
          background-color: $color-green;
          margin-bottom: 12px;
          &.twitter {
            mask-image: $icon-twitter;
            mask-repeat: no-repeat;
            mask-size: contain;
          }
          &.youtube {
            mask-image: $icon-youtube;
            mask-repeat: no-repeat;
            mask-size: contain;
          }
          &.discord {
            mask-image: $icon-discord;
            mask-repeat: no-repeat;
            mask-size: contain;
          }
        }
      }
  }
  }
</style>