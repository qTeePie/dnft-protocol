// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "contracts/DNFT.sol"; // Adjust the import path

contract ScriptApproveNFT is Script {
    function run() external {
        // === Setup ===
        address user = vm.envAddress("USER");
        address marketplace = vm.envAddress("MARKETPLACE");
        uint256 tokenId = 0;

        // Anvil fork URL (optional)
        string memory rpcUrl = vm.envString("RPC_URL");

        vm.createSelectFork(rpcUrl); // optional: fork latest block

        // === Deploy or load existing DNFT contract ===
        DNFT dnft = DNFT(vm.envAddress("DNFT_CONTRACT"));

        // === Impersonate user ===
        vm.startBroadcast(user);

        // === Mint NFT ===
        dnft.mintNFT(user);

        // === Approve Marketplace ===
        dnft.approveMarketplace(marketplace, tokenId);

        // === Check Approval ===
        address approved = dnft.getApproved(tokenId);
        console2.log("Approved address:", approved);

        vm.stopBroadcast();
    }
}
