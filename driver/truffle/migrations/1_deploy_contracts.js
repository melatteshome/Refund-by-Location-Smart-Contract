// const PayByLocation = artifacts.require("PayByLocation");
// module.exports = function(deployer, accounts) {
//   deployer.deploy(PayByLocation);
// };

const PayByLocation = artifacts.require("PayByLocation");

module.exports = function(deployer, accounts) {
    deployer.deploy(PayByLocation);
}