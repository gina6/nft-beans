import { defineNuxtConfig } from 'nuxt3'

// https://v3.nuxtjs.org/docs/directory-structure/nuxt.config
export default defineNuxtConfig({
  publicRuntimeConfig: {
    BEANS_ADDRESS: process.env.BEANS_ADDRESS
  },
  build: {
    transpile: ["@ethersproject", "ethers"],
  },
  vite: {
    css: {
      preprocessorOptions: {
        scss: {
          additionalData: '@import "@/assets/scss/main.scss";',
        },
      },
    },
    optimizeDeps: {
      include: [
        "bn.js",
        "js-sha3",
        "hash.js",
        "aes-js",
        "scrypt-js",
        "bech32",
      ]
    }
  },
})
