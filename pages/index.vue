<script setup>
const metamask = ref(false);
onBeforeMount(() => {
  if (window.ethereum) {
    metamask.value = true;
  }
});
definePageMeta({
  layout: "custom",
});
</script>
<template>
  <div>
    <div class="wrapper title">
      <h1>Welcome Brother. Welcome Sister.</h1>
      <h2>How have you bean?</h2>
    </div>
    <div class="wrapper">
      <h1>The Vision</h1>
      <div class="img-paragraph">
        <span>
          <p>
            Join us, the five carbeanals, on an epic quest to reunite the
            ancient bean! Let us unite as one true supreme bean cult. Collect
            fragments of the ancient bean, feed them, and combine them with
            other collectors. Then the ancient bean will lead us to the sacred
            land!
          </p>
          <ul>
            <li><NuxtLink to="/gallery"> > Become a collector </NuxtLink></li>
            <li>
              <NuxtLink to="/manifesto"> > More about our Manifesto</NuxtLink>
            </li>
          </ul>
        </span>
        <img
          src="../public/home-vision.png"
          alt="sketch of some monk dude writing something"
        />
      </div>
      <div class="divider"></div>
    </div>
    <div class="wrapper">
      <h1>The Carbeanals</h1>
      <div class="divider"></div>
    </div>
    <!-- <Install v-if="!metamask" />
    <Home />
    <WalletBalance /> -->
  </div>
</template>
<style lang="scss" scoped>
div {
  h1 {
    text-transform: uppercase;
    letter-spacing: 0.02em;
    padding-bottom: 2%;
  }

  .img-paragraph {
    display: flex;

    img {
      padding: 0 0 0 20%;
    }

    ul {
      padding: 5% 0 0 5%;
      list-style-type: none;

      li {
        padding: 0 0 5% 0;
        color: $color-green;
      }
    }
  }

  .wrapper {
    min-height: 50vh;
    margin-bottom: 5%;
    .divider {
      width: 100%;
      height: 1px;
      margin-top: 5%;
      background-color: $color-white;
    }
  }

  .title {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    background: url(../public/home-header.png) no-repeat;
  }
}
</style>