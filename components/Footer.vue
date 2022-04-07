<script setup>
</script>
<template>
  <div>
    <div class="footer-divider"></div>
    <div class="container">
      <div class="footer">
        <div class="infos">
          <p>© 2022 Digital Ideation</p>
          <a href="https://www.youtube.com/watch?v=dQw4w9WgXcQ"
            >Supreme Bean Cult Terms &amp; Conditions</a
          >
        </div>
        <div class="logo">
          <img src="/logo.png" alt="Supreme Bean Cult Logo" />
        </div>
        <div class="social">
          <a href="https://twitter.com/SupremeBeanCult">
            <div class="icon twitter"></div>
          </a>
          <a href="https://www.youtube.com/channel/UC5rdL_SbcwbCJSrIvhnZMvA">
            <div class="icon youtube"></div>
          </a>
          <a href="https://www.instagram.com/supremebeancult/">
            <div class="icon instagram"></div>
          </a>
          <a href="https://discord.gg/4fAHgeUt">
            <div class="icon discord"></div>
          </a>
        </div>
      </div>
    </div>
  </div>
</template>
<style lang="scss" scoped>
.footer-divider {
  background-color: $color-green;
  width: 100%;
  height: 5px;
}
.container {
  margin: 0 auto;
  .footer {
    display: flex;
    flex-direction: row;
    justify-content: space-around;
    align-items: center;
    padding: 2.5vh 0;

    .logo {
      img {
        height: 10vh;
      }
    }

    .infos {
      font-size: 0.7em;
    }
    .social {
      display: flex;
      flex-direction: row;
      justify-content: flex-end;
      align-items: center;
      @include text;
      color: $color-white;
      gap: 40%;

      .icon {
        display: inline-block;
        width: 1em;
        height: 1em;
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
        &.instagram {
          mask-image: $icon-instagram;
          mask-repeat: no-repeat;
          mask-size: contain;
        }
      }
    }
  }
}
</style>