var unlock = require("../unlock");
var bignum = require('bignum');
const RaiToken = artifacts.require('./RaiToken.sol');

//초기 발행 92억
var value = bignum.mul(92000000000, 10 ** 18).toString();


module.exports = (deployer,network) => {
  unlock(network);
  deployer.deploy(RaiToken, 'Rai Token', "RAI", value, 18);
};