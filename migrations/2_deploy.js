const Foods = artifacts.require('Foods');
const Beans = artifacts.require('Beans');

module.exports = async function (deployer) {
    await deployer.deploy(Foods);
    await deployer.deploy(Beans, Foods.address);
};