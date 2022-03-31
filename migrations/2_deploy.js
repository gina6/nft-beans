const Beans = artifacts.require('Beans');

module.exports = async function (deployer) {
    await deployer.deploy(Beans);
};