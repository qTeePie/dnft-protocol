// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "forge-std/Test.sol";
import "src/DNFT.sol";

contract DNFTTest is Test {
    DNFT d;

    function setUp() public {
        d = new DNFT();
    }

    function testNothing() public pure {
        assertTrue(true); // This always passes
    }
}
