// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Base64.sol";

contract DNFT is ERC721, Ownable {
    uint256 private _nextTokenId;

    // Manual URI mapping
    mapping(uint256 => string) private _tokenURIs;

    constructor(address initialOwner) ERC721("DNFT", "DNFT") Ownable(initialOwner) {}

    // Mint function with URI
    function mintNFT(address to) external {
        uint256 tokenId = _nextTokenId;
        _nextTokenId++;
        _mint(to, tokenId);
        _tokenURIs[tokenId] = tokenURI(tokenId);
    }

    // Marketplace approval
    function approveMarketplace(address marketplace, uint256 tokenId) external {
        require(ownerOf(tokenId) == msg.sender, "Not your NFT");
        approve(marketplace, tokenId);
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(_ownerOf(tokenId) != address(0), "Not minted");

        string memory color = getColor(tokenId);

        // Assemble the SVG
        string memory svg = string(
            abi.encodePacked(
                "<svg xmlns='http://www.w3.org/2000/svg' width='1024' height='1024' viewBox='0 0 1024 1024'>",
                "<rect x='0' y='0' width='1024' height='1024' fill='#0f0f0f'/>",
                "<g transform='translate(632, 357)'>",
                "<g transform='skewX(-20)'>",
                "<ellipse cx='-100' cy='30' rx='30' ry='35' fill='",
                color,
                "'/>",
                "<ellipse cx='150' cy='100' rx='30' ry='35' fill='",
                color,
                "'/>",
                "</g>",
                "<path d='m -316 271 l 392 150 l 50 -70 c 130 -200, -292 -300, -362 -200 l -70 120' stroke='",
                color,
                "' stroke-width='20' fill='none' transform='translate(-100, 50) skewX(10)'/>",
                "</g>",
                "</svg>"
            )
        );

        // Assemble the JSON metadata
        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name":"DNFT #',
                        Strings.toString(tokenId),
                        '", "description":"On-chain chaos art", "image": "ipfs://QmTAxyKv5oWqBB3XvHCSh6S2DbJC7EeFYizk4ySa8nU2Q9", "animation_url": "data:image/svg+xml;base64,',
                        Base64.encode(bytes(svg)),
                        '"}'
                    )
                )
            )
        );

        return string(abi.encodePacked("data:application/json;base64,", json));
    }

    function getColor(uint256 tokenId) public pure returns (string memory) {
        string[5] memory colors = ["#00FFFF", "#8A2BE2", "#39FF14", "#FFFF00", "#FF00FF"];
        return colors[tokenId % colors.length];
    }
}
