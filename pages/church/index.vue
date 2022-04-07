<script setup>

  import { ethers } from "ethers";

  const foodId = ref([
    {id: 1, value: "Vegetables"},
    {id: 2, value: "Sweets"},
    {id: 3, value: "Meat"},
    {id: 4, value: "Special Food"}
  ]);

  definePageMeta({
    layout: "custom",
  });

  async function buyFood(){
    const foods = useFoodsContract().value;
    const signer = useSigner();
    const signerAddress = await signer.getAddress();

    if (foodId == 4){
      const transfer = await foods.buy(signerAddress, foodId, {
      value: ethers.utils.parseUnits("0.02", "ether")
    });
    } else {
      const transfer = await foods.buy(signerAddress, foodId, {
        value: ethers.utils.parseUnits("0.01", "ether")
      });
    }
    await transfer.wait();
  }


</script>
<template>
<div class="wrapper">
  <img src="/church-header.png" alt="people walking in the church" />
  <div class="info-container">
    <div class="text">
      <span>Seek the beans.</span>
      <span>Feed the beans.</span>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
    </div>
    <img class="image" src="/eatingbean.gif" alt="bean eating something" /> 
  </div>
  <div class="divider"></div>
  <div class="feed-container">
    <div class="summands">
      <BeanPlaceholder>
        bean NFT
      </BeanPlaceholder>
      <div class="arrows">

      <div class="arrow"></div>
      <div class="feed-button">
        <Button class="button" :active="true">Feed</Button>
        <div class="arrow-down"></div>
      </div>
      <div class="arrow"></div>
      </div>
      <div class="food">

      <BeanPlaceholder>
        food
      </BeanPlaceholder>
      <div class="food-select">

      <select name="foods" id="foods">
        <option v-for="food in foodId" :key="food.value" :value="food.value">{{food.value}}</option>
      </select>
      <Button @click="buy">Buy</Button>
      </div>
      </div>
    </div>
    <BeanPlaceholder class="sum">
      evolved bean
    </BeanPlaceholder>
  </div>
</div>
</template>
<style lang="scss" scoped>
img {
  width: 100%;
  max-width: 1240px;
  margin: 0 100px;
  margin-bottom: 162px;
  object-fit: contain;
}
.info-container {
  width: 100%;
  max-width: 1240px;
  margin: 0 100px;
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
.divider {
  width: 100%;
  max-width: 1240px;
  height: 1px;
  margin: 5% 100px 0 100px;
  background-color: $color-white;
}

.feed-container {
  width: 100%;
  max-width: 1440px;
  margin-bottom: 5%;
  .summands {
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: flex-start;
    margin-top: 10%;

    .arrows{
      display: flex;
      align-items: center;
      justify-content: center;
    .arrow {
      width: 8vw;
      max-width: 130px;
      height: 5px;
      background: $color-green;
      border-radius: 2.5px;
      margin: 0 5%
    }
    .feed-button{
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
    .food{
      .food-select {
        display: flex;
        margin: 5% auto;


        select {
          color: $color-black;
          padding: 2% 10%;
          margin-right: 2%;
        }
      }
    }
  }
  .sum {
    margin: 0 auto;
  }
}

</style>