// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "openzeppelin-contracts/contracts/access/Ownable.sol";

import "tokenbound/lib/erc6551/src/interfaces/IERC6551Registry.sol";
import "tokenbound/lib/erc6551/src/interfaces/IERC6551Account.sol";
import "tokenbound/lib/erc6551/src/interfaces/IERC6551Executable.sol";

contract Bond is ERC721, ERC721Burnable, Ownable {
    constructor(address initialOwner)
        ERC721("Bond", "BND")
        Ownable(initialOwner)
    {}

    address ERC6551_REGISTRY = 0x284be69BaC8C983a749956D7320729EB24bc75f9;
    address ERC6551_ACCOUNT = 0xABF81898FEA21aAa5EE27F6fA0398a217a29bE9f;
    uint GOERLI = 5;


    function safeMint(address to, uint256 tokenId) public {
        _safeMint(to, tokenId);
        IERC6551Registry(ERC6551_REGISTRY).createAccount(ERC6551_ACCOUNT, 0, GOERLI, address(this), tokenId);
    }

}