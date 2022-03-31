module.exports = {
  networks: {
    development: {
      // Mantis
      // host: "mantis-rpc.switch.ch",
      // port: "*",
      // network_id: 96970,
      // Ganache
      host: "127.0.0.1",
      port: 7545,
      network_id: 5777,

      dashboard: {
        port: 24012,
      }
    },
    develop: {
      port: 8545,
      network_id: 20,
      accounts: 5,
      defaultEtherBalance: 500,
      blockTime: 3
    }
  },

  solc: {
    optimizer: {
      enabled: true,
      runs: 200
    }
  },

  // Configure your compilers
  compilers: {
    solc: {
      version: "0.8.12",    // Fetch exact version from solc-bin (default: truffle's version)

    }
  },


};
