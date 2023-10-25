// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Bond} from "../src/Bond.sol";

contract BondTest is Test {

    function setUp() public {
        address owner = vm.addr(1);
        bond = new Bond(owner);

        // vm.prank(owner);
        bond.safeMint(address(1));
        assertEq(bond.ownerOf(0), owner);
    }
}
