<script setup>
  definePageMeta({
    layout: "custom",
  });
</script>
<template>
  <div class="container">
    <div class="image"></div>
    <div class="text">
      <h1>Manifesto</h1>
      <h2>The beaning of life</h2>
      <p>66 Million years ago, the Supreme Bean landed with a big impact on earth, extinguishing two thirds of the life on earth. On impact, it shattered into hundreds of small beans.</p>
      <p>The founding father, known only as “Imperial Bean Master” had consumed one of the fragments and a prophecy was revealed. We shall find all the fragments and combine them to summon the Supreme Bean once again, so it may lead us to the promised land. Until all beans are found, we shall feed them sweets, greens, meat and special food made by our group members.</p>
      <p>(Do not ask questions why people from the town near our church vanish. It has nothing to do with us!)</p>
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
    aspect-ratio: 551/718;
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
  }
}
</style>