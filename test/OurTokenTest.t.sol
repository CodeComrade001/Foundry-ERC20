// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {DeployOurToken} from "../script/DeployOurToken.s.sol";
import {DemoToken} from "../src/DemoToken.sol";
import {Test, console} from "forge-std/Test.sol";
import {ZkSyncChainChecker} from "lib/foundry-devops/src/ZkSyncChainChecker.sol";

contract OurTokenTest is Test, ZkSyncChainChecker {
    uint256 BOB_STARTING_AMOUNT = 100 ether;
    uint256 public constant INITIAL_SUPPLY = 1_000_000 ether; // 1 million tokens with 18 decimal places

    DemoToken public demoToken;
    DeployOurToken public deployer;
    address public deployerAddress;
    address bob;
    address alice;

    function setUp() public {
        deployer = new DeployOurToken();
        if (!isZkSyncChain()) {
            demoToken = deployer.run();
        } else {
            demoToken = new DemoToken(INITIAL_SUPPLY);
            demoToken.transfer(msg.sender, INITIAL_SUPPLY);
        }

        bob = makeAddr("bob");
        alice = makeAddr("alice");

        vm.prank(msg.sender);
        demoToken.transfer(bob, BOB_STARTING_AMOUNT);
    }

    function testInitialSupply() public view {
        assertEq(demoToken.totalSupply(), deployer.INITIAL_SUPPLY());
    }

    function testBobBalance() public view {
        assertEq(BOB_STARTING_AMOUNT, demoToken.balanceOf(bob));
    }

    function testUsersCantMint() public {
        (bool success,) = address(demoToken).call(abi.encodeWithSignature("mint(address,uint256)", address(this), 1));
        assertFalse(success, "Non-owners should not be able to mint");
    }

    function testAllowances() public {
        uint256 initialAllowance = 1000;

        // Bob approves Alice to spend tokens on his behalf

        vm.prank(bob);
        demoToken.approve(alice, initialAllowance);
        uint256 transferAmount = 500;

        vm.prank(alice);
        demoToken.transferFrom(bob, alice, transferAmount);
        assertEq(demoToken.balanceOf(alice), transferAmount);
        assertEq(demoToken.balanceOf(bob), BOB_STARTING_AMOUNT - transferAmount);
    }
}
