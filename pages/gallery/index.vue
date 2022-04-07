<script setup>
  import { getBeans } from "@/utils/contracts";

  const categories = [
    "Background",
    "Hat",
    "Eyes",
    "Nose",
    "Mouth",
    "Skin",
    "Hands"
  ]

  const beans = ref([]);
  const config = useRuntimeConfig();

  async function loadNFTs() {
    const beansContract = getBeans(config);

    const count = parseInt(await beansContract.count());
    const nfts = [];
    for (let i = 0; i < count; i++) {
      let imageSrc = await beansContract.tokenURI(i);
      if (imageSrc.startsWith("ipfs://")) {
        const contentId = imageSrc.substring("ipfs://".length);
        imageSrc = `https://ipfs.io/ipfs/${contentId}`;
      }
      nfts.push({ id: i, image: imageSrc });
    }
    beans.value = nfts;
  }

  if (process.client) {
    loadNFTs();
  }

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
        v-for="category in categories"
        :key="category"
        :category="category"
      >
        <div class="divider"></div>
      </Dropdown>
    </div>
    <div class="container-beans">
      <ClientOnly>
        <BeanMint @minted="loadNFTs" />
      </ClientOnly>
      <BeanPreview
        v-for="bean in beans"
        :key="bean.id"
        :text="`Supreme Bean #${bean.id}`"
        :image="bean.image"
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
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 32px;

    @include smallScreen {
      grid-template-columns: repeat(2, 1fr);
    }

    @include mobile {
      grid-template-columns: repeat(1, 1fr);
    }

    > * {
      margin: 0 auto;
    }
  }
}
</style>