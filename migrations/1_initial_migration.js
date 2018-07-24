var Migrations = artifacts.require("./Migrations.sol");

module.exports = function(deployer,network) {
  console.log(network);
  deployer.deploy(Migrations);
};
