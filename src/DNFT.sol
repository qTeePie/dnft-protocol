// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract DNFT is ERC721 {
    uint256 public constant MAX_SUPPLY = 1000;
    uint256 private _nextTokenId;

    constructor() ERC721("D NFT", "D:") {}

    function mintD() external {
        require(_nextTokenId < MAX_SUPPLY, "All D: NFTs are minted");
        _safeMint(msg.sender, _nextTokenId);
        _nextTokenId++;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(_ownerOf(tokenId) != address(0), "Token does not exist");
        return "ipfs://YOUR_METADATA_CID/token.json"; // Replace with actual IPFS CID
    }
}
