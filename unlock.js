const Web3 = require('web3');

const TruffleConfig = require('./truffle');


module.exports = function (network) {
  const config = TruffleConfig.networks[network];

  if (config.from&&process.env.ACCOUNT_PASSWORD) {
    const web3 = new Web3(new Web3.providers.HttpProvider('http://' + config.host + ':' + config.port));
    console.log('>> Unlocking account ' + config.from);
    web3.personal.unlockAccount(config.from, process.env.ACCOUNT_PASSWORD, 3600);
  }

};