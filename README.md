# Supreme Bean Cult (NFT Concept)

During the three week module "Studio Emerging Technologies" we conceptualized, designed, and developed a site where users can buy Bean-NFTs. 

The idea evolves around a lore which should motivate people to buy NFTs, evolve them, and collaborate with other collectors.

* [View Demo Site](https://supreme-bean-cult.herokuapp.com/)

## Technologies and Frameworks

### Frameworks
The whole project setup is made with [Nuxt3.js](https://v3.nuxtjs.org/) and the deployment is made with [Heroku](https://heroku.com).

### Blockchain
We used the framework [Truffle](https://trufflesuite.com/truffle/) for developing the Smart Contracts and [Ganache](https://trufflesuite.com/ganache/) for the local blockchain setup. [OpenZepplin](https://docs.openzeppelin.com/) also made developing Smart Contracts a lot easier.

For now it only works on a local blockchain. It might be soon deployed on a Testnetwork. 

The account connection happens via MetaMask.

## The Lore
66 Million years ago, the Supreme Bean landed with a big impact on earth, extinguishing two thirds of the life on earth. On impact, it shattered into hundreds of small beans.

The founding father, known only as “Imperial Bean Master” had consumed one of the fragments and a prophecy was revealed. We shall find all the fragments and combine them to summon the Supreme Bean once again, so it may lead us to the promised land. Until all beans are found, we shall feed them sweets, greens, meat and special food made by our group members.

We also setup Twitter, Instagram, Youtube, and Discord channels. But there aren't any posts yet.

## Run Locally
There are some crucial steps in order to run it locally. First you have to setup the project and then you can connect it to a local blockchain.

### Setup
Make sure to install the dependencies

```bash
npm install
```

### Run local Blockchain
Setup a local blockchain for example with Ganache and copy the contract addresses of the Bean and Food contracts into the .env file.

Import an account into MetaMask using the secret key.

Then you should be able to mint NFTs on your local blockchain.

### Development
```bash
npm run dev -- -o
```

### Production
```bash
npm run build
```
