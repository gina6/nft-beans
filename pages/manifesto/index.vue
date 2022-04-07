<script setup>
definePageMeta({
  layout: "custom",
});

const moreInfo = ref(false);
function more() {
  moreInfo.value = true;
}
</script>
<template>
  <div>
    <div class="info-wrapper container">
      <div class="image"></div>
      <div class="text">
        <h1>Manifesto</h1>
        <h2>The beaning of life</h2>
        <p>
          66 Million years ago, the Supreme Bean landed with a big impact on
          earth, extinguishing two thirds of the life on earth. On impact, it
          shattered into hundreds of small beans.
        </p>
        <p>
          The founding father, known only as “Imperial Bean Master” had consumed
          one of the fragments and a prophecy was revealed. We shall find all
          the fragments and combine them to summon the Supreme Bean once again,
          so it may lead us to the promised land. Until all beans are found, we
          shall feed them sweets, greens, meat and special food made by our
          group members.
        </p>
        <p>
          (Do not ask questions why people from the town near our church vanish.
          It has nothing to do with us!)
        </p>
        <Button @click="more" class="button">Is this for real?</Button>
      </div>
    </div>
    <div v-if="moreInfo" class="more">
      <div class="divider"></div>
      <div class="info-wrapper">
        <h1>Why so serious?</h1>
        <p>
          Chill it's just an experimental project as part of our studies. We
          explored technical and design aspects of NFTs and the Blockchain.
        </p>
        <p>
          The cult thing is just a lore in order to create a community around
          our project.
        </p>
        <p>
          The whole project was conceptualized, designed, and developed during
          three weeks in the course "Emerging Technologies".
        </p>
      </div>
    </div>
  </div>
</template>
<style lang="scss" scoped>
.container {
  margin: 54px 0px;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  width: 100%;

  .image {
    width: 40%;
    aspect-ratio: 500/500;
    background: url(/manifesto.png) no-repeat;
    background-size: cover;
    margin-right: 40px;
  }
  .text {
    width: 60%;
    h2 {
      margin-bottom: 70px;
    }
    p {
      margin-top: 1rem;
    }
    .button {
      width: 30%;
      margin-top: 10%;
    }
  }
}

.info-wrapper {
  min-height: 50vh;
  margin-top: 5%;
  margin-bottom: 5%;
  h1 {
    padding-bottom: 2%;
  }
}
</style>