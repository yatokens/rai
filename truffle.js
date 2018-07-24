module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!
  solc: {
    optimizer: {
      enabled: true,
      runs: 2000
    }
  },
  networks: {
    
    danet:{
      host:"priv.danet.bitchk.com",
      port:38545,
      network_id:92,
      from:"0x196e16bdc860d912f53057cab4bb290d01915175",
      gas: 400000
    },development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*"
    }
  },
  mocha: {
      useColors: true
  },
  rpc: {
      host: "priv.danet.bitchk.com",
      port: 38545
  }
};