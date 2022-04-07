<template>
  <div>
    <h3>Seems like you haven't installed MetaMask</h3>
    <p>
      Click
      <a
        href="https://metamask.io/download.html"
        target="_blank"
        rel="noopener noreferrer"
      >
        here
      </a>
      to install
    </p>
  </div>
</template>
<style lang="scss" scoped>
h3 {
  @include highlight;
  padding-top: 1em;
}

a {
  @include link;
  font-size: 1em;
}

p {
  padding-top: 0.5em;
}
</style>