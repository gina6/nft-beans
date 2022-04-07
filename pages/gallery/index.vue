<script setup>
const metamask = ref(false);
const connection = ref(false);

const categories = [
  "Background",
  "Hat",
  "Eyes",
  "Nose",
  "Mouth",
  "Skin",
  "Hands",
];

const beans = useBeans();

onBeforeMount(() => {
  if (window.ethereum) {
    metamask.value = true;
    if (window.ethereum.selectedAddress) {
      connection.value = true;
      loadNFTs();
    }
  }
});

async function connect() {
  await window.ethereum.request({ method: "eth_requestAccounts" });
  connection.value = true;
  loadNFTs();
}

async function loadNFTs() {
  beans.value = await loadBeans();
}

definePageMeta({
  layout: "custom",
});
</script>
<template>
  <div>
    <div class="info-wrapper">
      <h1>Gallery</h1>
      <Install v-if="!metamask" />
      <div class="connect" v-else-if="!connection">
        <h3>Seems like your wallet is not connected</h3>
        <Button @click="connect" class="button"> Connect Wallet </Button>
      </div>
    </div>
    <div class="wrapper">
      <div class="container-filter">
        <h1>Filter</h1>
        <div class="gallery-divider"></div>
        <Dropdown
          v-for="category in categories"
          :key="category"
          :category="category"
        >
          <div class="gallery-divider"></div>
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
          :smallText="bean.owner"
          :image="bean.image"
        >
        </BeanPreview>
      </div>
    </div>
  </div>
</template>
<style lang="scss" scoped>
.info-wrapper {
  h1 {
    padding-top: 5%;
  }
  h3 {
    padding: 1em 0;
  }
  .button {
    width: 20%;
  }
}

.wrapper {
  margin: 48px 0;
  display: flex;
  flex-direction: row;
  justify-content: space-evenly;
  .container-filter {
    width: 22%;
    h1 {
      @include helvetica-bold;
      font-size: 30px;
      color: $color-white;
      text-align: center;
      padding-bottom: 30px;
    }
    .gallery-divider {
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