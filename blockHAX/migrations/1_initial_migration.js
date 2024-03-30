const BlockHAX=artifacts.require("TrusterLenderPool");
const ERC20TokenAddress = "0xb3b3a98F6AEF3980a1E923CC405B2dF46Ede99cD";

module.exports = function(deployer) {
    // deployment steps
    deployer.deploy(BlockHAX, ERC20TokenAddress);
}