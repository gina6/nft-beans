// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

interface IFoods {
    function eat(uint256 foodId) external;
    function balanceOf(address account, uint256 foodId) external returns (uint256);
}

contract Beans is ERC721, ERC721URIStorage, ERC721Burnable, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;
    IFoods private foods;

    mapping(uint256 => uint256) eatenFood;

    constructor(
        address foodsAddress
    ) ERC721("Beans", "BNS") {
        foods = IFoods(foodsAddress);
    }

    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://";
    }

    function safeMint(address to, string memory uri) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }

    // The following functions are overrides required by Solidity.

    function _burn(uint256 tokenId)
        internal
        override(ERC721, ERC721URIStorage)
    {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        uint256 food = eatenFood[tokenId];
        return string(abi.encodePacked(super.tokenURI(tokenId), "_", Strings.toString(food), ".png"));
    }

    function feed(uint256 tokenId, uint256 foodId)
        public
    {
        require(ownerOf(tokenId) == tx.origin, "Only the owner can feed the bean");
        require(foods.balanceOf(tx.origin, foodId) >= 1, "You have no food to feed the bean");
        require(eatenFood[tokenId] == 0, "Bean has already eaten");

        foods.eat(foodId);
        eatenFood[tokenId] = foodId;
    }

    function payToMint(address recipient, string memory contentId)
        public
        payable
        returns (uint256)
    {
        require(msg.value >= 0.05 ether, "Need to pay up!");

        uint256 newItemId = _tokenIdCounter.current();
        _tokenIdCounter.increment();

        string memory metadataURI = string(abi.encodePacked(contentId, "/", Strings.toString(newItemId)));

        _mint(recipient, newItemId);
        _setTokenURI(newItemId, metadataURI);

        return newItemId;
    }

    function count() public view returns (uint256) {
        return _tokenIdCounter.current();
    }
}
