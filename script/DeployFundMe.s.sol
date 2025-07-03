// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        // Before startCroadcast -> Not a "real" tx and it's gong to simulate in a simaulated environment
        HelperConfig helperConfig = new HelperConfig(); // This is coded before startBroadcast because we don't want to pay gas fees for this
        address ethUsdPriceFeed = helperConfig.activeNetworkConfig();
        //In Structs, this is the syntax -> (address ethUsdPriceFeed, addr2 ,addr3 , addr4) = helperConfig.activeNetworkConfig();

        // After startBroadcast -> Real tx
        vm.startBroadcast();
        FundMe fundMe = new FundMe(ethUsdPriceFeed);
        vm.stopBroadcast();
        return fundMe;
    }
}
