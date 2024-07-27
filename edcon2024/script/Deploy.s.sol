// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {MCScript, MCDevKit} from "@mc/devkit/Flattened.sol";
import {DeployLib} from "./DeployLib.sol";

contract DeployScript is MCScript {
    using DeployLib for MCDevKit;

    function run() public startBroadcastWith("DEPLOYER_PRIV_KEY") {
        // init StableCredit.sol
        mc.init("StableCredit");

        // デプロイされたコントラクトのデータを取得する。
        mc.use("StableCoin", StableCoin);
        mc.use("CDP", CDP);
        mc.use("Initialize", CDPInitialize);
    }
}
