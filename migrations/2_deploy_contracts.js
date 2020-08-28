const Fps = artifacts.require("Fps");

module.exports = function (deployer) {
  deployer.deploy(Fps);
};
