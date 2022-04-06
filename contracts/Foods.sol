// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Foods is ERC1155, Ownable, ERC1155Burnable {
    uint256 public constant VEGETABLE = 1;
    uint256 public constant CANDY = 2;
    uint256 public constant MEAT = 3;
    uint256 public constant SPECIAL = 4;

    constructor() ERC1155("ipfs://") {
        _mint(msg.sender, VEGETABLE, 10**8, "");
        _mint(msg.sender, CANDY, 10**8, "");
        _mint(msg.sender, MEAT, 10**4, "");
        _mint(msg.sender, SPECIAL, 10**2, "");
    }

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function eat(uint256 foodId) external {
        require(balanceOf(tx.origin, foodId) >= 1, "No food to eat");

        _burn(tx.origin, foodId, 1);
    }
}