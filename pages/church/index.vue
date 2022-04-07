<script setup>
import { ethers } from "ethers";

const foods = ref([
  { id: 1, value: "Vegetables" },
  { id: 2, value: "Sweets" },
  { id: 3, value: "Meat" },
  { id: 4, value: "Special Food" },
]);

const foodId = ref(1);

const foodImg = computed(() => "/bean-food/" + foodId.value + ".jpeg");

const beans = ref([]);
const beanId = ref(-1);

definePageMeta({
  layout: "custom",
});

async function buyFood() {
  const foods = useFoodsContract().value;
  const signer = useSigner();
  const signerAddress = await signer.getAddress();
  const transfer = await foods.buy(signerAddress, foodId.value, {
    value: ethers.utils.parseUnits(
      foodId.value == 4 ? "0.02" : "0.01",
      "ether"
    ),
  });
  await transfer.wait();
}

async function feedBean() {
  const beansContract = useBeansContract().value;
  const transfer = await beansContract.feed(beanId.value, foodId.value);
  await transfer.wait();
  await loadMyBeans();
}

async function loadMyBeans() {
  const signer = useSigner();
  const signerAddress = await signer.getAddress();

  const allBeans = await loadBeans();
  const myBeans = [];
  for (const bean of allBeans) {
    if (bean.owner === signerAddress) {
      myBeans.push(bean);
    }
  }
  beans.value = myBeans;
}

onBeforeMount(loadMyBeans);

const beanImage = computed(
  () => beans.value.find((b) => b.id === beanId.value)?.image
);
</script>
<template>
  <div class="wrapper">
    <img src="/church.png" alt="people walking in the church" />
    <div class="info-wrapper info-text">
      <div class="text">
        <span>Seek the beans.</span>
        <span>Feed the beans.</span>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
          eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
          minim veniam, quis nostrud exercitation ullamco laboris nisi ut
          aliquip ex ea commodo consequat. Duis aute irure dolor in
          reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
          pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
          culpa qui officia deserunt mollit anim id est laborum.
        </p>
      </div>
      <img class="image" src="/eatingbean.gif" alt="bean eating something" />
    </div>
    <div class="divider"></div>
    <div class="info-wrapper feed-container">
      <div class="summands">
        <div>
          <BeanPlaceholder v-if="!beanImage"> bean NFT </BeanPlaceholder>
          <BeanPreview v-else :image="beanImage" />
          <div class="feed-select">
            <select v-model="beanId">
              <option v-for="bean in beans" :value="bean.id">
                Supreme Bean #{{ bean.id }}
              </option>
            </select>
          </div>
        </div>
        <div class="arrows">
          <div class="arrow"></div>
          <div class="feed-button">
            <Button class="button" :active="true" @click="feedBean"
              >Feed</Button
            >
            <div class="arrow-down"></div>
          </div>
          <div class="arrow"></div>
        </div>
        <div class="food">
          <BeanPreview :image="foodImg" />
          <BeanPlaceholder v-if="!foodImg"> foods </BeanPlaceholder>
          <div class="feed-select">
            <select name="foods" id="foods" v-model="foodId">
              <option v-for="food in foods" :key="food.value" :value="food.id">
                {{ food.value }}
              </option>
            </select>
            <Button @click="buyFood">Buy</Button>
          </div>
        </div>
      </div>
      <BeanPlaceholder class="sum"> evolved bean </BeanPlaceholder>
    </div>
  </div>
</template>
<style lang="scss" scoped>
img {
  width: 100%;
  max-width: 1240px;
  margin: 0 auto;
  display: block;
  padding-bottom: 162px;
  object-fit: contain;
}
.info-text {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  .text {
    width: 45%;
    display: flex;
    flex-direction: column;

    span {
      @include title;
      text-transform: uppercase;
      font-size: 80px;
    }
    p {
      margin-top: 38px;
    }
  }
  .image {
    width: 45%;
    margin: 0 auto;
    object-fit: contain;
    margin: 0;
    border-radius: 10px;
  }
}

.feed-container {
  margin-bottom: 5%;
  .summands {
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: flex-start;
    margin-top: 10%;

    .arrows {
      display: flex;
      align-items: center;
      justify-content: center;
      .arrow {
        width: 8vw;
        max-width: 130px;
        height: 5px;
        background: $color-green;
        border-radius: 2.5px;
        margin: 0 5%;
      }
      .feed-button {
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 18px;

        .button {
          @include helvetica-bold;
          border-radius: 16px;
        }
      }
      .arrow-down {
        display: inline-block;
        width: 38px;
        height: 195px;
        background-size: 38px 195px;
        background-color: $color-green;
        margin-bottom: 18px;
        mask-image: $icon-arrow;
        mask-repeat: no-repeat;
        mask-size: contain;
      }
    }

    .feed-select {
      display: flex;
      margin: 5% auto;

      select {
        color: $color-black;
        padding: 2% 10%;
        margin-right: 2%;

        option {
          color: $color-black;
        }
      }
    }
  }
  .sum {
    margin: 0 auto;
  }
}
</style>