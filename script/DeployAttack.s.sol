// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Script} from "lib/forge-std/src/Script.sol";
import {Attack} from "../src/Attack.sol";

contract DeployAttack is Script {
    address shopAddr = 0x24d6cE15432bA2E5D899648F7a880b269A248320;

    function run() external returns (Attack) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);
        Attack attack = new Attack(shopAddr);
        vm.stopBroadcast();

        return (attack);
    }
}

// forge script script/DeployAttack.s.sol:DeployAttack --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvv
