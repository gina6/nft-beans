<script setup>
const categories = [
  "Background",
  "Hat",
  "Eyes",
  "Nose",
  "Mouth",
  "Skin",
  "Hands"
]

const beans = [
  {id: 1, image: 'https://picsum.photos/250/250'},
  {id: 2, image: 'https://picsum.photos/250/250'},
  {id: 3, image: 'https://picsum.photos/250/250'},
  {id: 4, image: 'https://picsum.photos/250/250'},
]

  definePageMeta({
    layout: "custom",
  });
</script>
<template>
  <div class="wrapper">
    <div class="container-filter">
      <h1>Gallery</h1>
      <div class="divider"></div>
      <Dropdown
        v-for="category in categories" :key="category"
        :category = "category"
      >
      <div class="divider"></div>
      </Dropdown>
    </div>
    <div class="container-beans">
      <BeanPreview
        v-for="bean in beans" :key="bean.id"
        :text = "`Supreme Bean #${bean.id}`"
        :image = "bean.image"
      >
      </BeanPreview>
    </div>
  </div>
</template>
<style lang="scss" scoped>
.wrapper {
  margin: 48px 0;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  .container-filter {
    width: 22%;
    h1 {
      @include helvetica-bold;
      font-size: 30px;
      color: $color-white;
      text-align: center;
      padding-bottom: 30px;
    }
    .divider {
      height: 1px;
      width: 100%;
      background-color: $color-white;
    }
  }
  .container-beans {
    width: 70%;
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    justify-content: space-between;
    gap: 32px;
  }
}
</style>