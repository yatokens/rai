var unlock = require("../unlock");
var Migrations = artifacts.require("./Migrations.sol");

module.exports = function(deployer,network) {
  console.log(network);
  unlock(network);
  deployer.deploy(Migrations);
};
