// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script, console2} from "forge-std/Script.sol";
import {DemoToken} from "../src/DemoToken.sol";

contract DeployOurToken is Script {
    uint256 public constant INITIAL_SUPPLY = 1_000_000 ether; // 1 million tokens with 18 decimal places

    function run() external returns (DemoToken) {
        vm.startBroadcast();
        DemoToken demoToken = new DemoToken(INITIAL_SUPPLY);
        vm.stopBroadcast();
        return demoToken;
    }
}
