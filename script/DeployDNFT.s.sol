// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "contracts/DNFT.sol";

contract DeployDNFT is Script {
    function run() external {
        vm.startBroadcast();
        // Since this is just for play, TMP using hardcoded addres
        DNFT nft = new DNFT(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
        console.log("Deployed DNFT at:", address(nft));
        nft.mintNFT(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
        vm.stopBroadcast();
    }
}
