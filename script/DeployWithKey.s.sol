// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script, console2} from "forge-std/Script.sol";
import {DemoToken} from "../src/DemoToken.sol";

contract DeployOurTokenWithPrivateKey is Script {
    uint256 public constant INITIAL_SUPPLY = 1_000_000 ether;

    function run() external returns (DemoToken) {
        uint256 deployerKey = vm.envUint("PRIVATE_KEY"); // Reads from env var
        vm.startBroadcast(deployerKey);
        DemoToken demoToken = new DemoToken(INITIAL_SUPPLY);
        vm.stopBroadcast();
        return demoToken;
    }
}
