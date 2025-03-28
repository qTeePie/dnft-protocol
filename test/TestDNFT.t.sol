// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
// Local
import {DNFT} from "contracts/DNFT.sol";
import {DeployDNFT} from "script/DeployDNFT.s.sol";

contract TestDNFT is Test {
    string constant TOKEN_URI = "ipfs://test-uri";

    address immutable user = makeAddr("user");
    address immutable marketplace = makeAddr("marketplace");

    DNFT dnft;

    function setUp() public {
        //DeployDNFT deployer = new DeployDNFT();
        //deployer.run();

        // Initialize DNFT
        dnft = new DNFT(user);
        console2.log("Workie");
    }

    function testMint() public {
        // Arrange Act
        dnft.mintNFT(user);

        // Assert
        assertEq(dnft.ownerOf(0), user, "Owner should be correct");
    }

    function testCanApproveMarketplace() public {
        // Arrange
        dnft.mintNFT(user);
        vm.prank(user);

        // Act
        dnft.approveMarketplace(marketplace, 0);
        assertEq(dnft.getApproved(0), marketplace);
    }

    function testApproveMarketplace() public {
        vm.startPrank(user);
        dnft.approveMarketplace(marketplace, 0);
        address approved = dnft.getApproved(0);

        assertEq(approved, marketplace);
        vm.stopPrank();
    }
}
