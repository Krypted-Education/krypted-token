const KEDToken = artifacts.require('./KEDToken.sol');

module.exports = function(deployer) {
  return deployer.then(() => {
    return deployer.deploy(KEDToken).then(instance => {
      confirmationAddress = KEDToken.address;
    });
  });
};
