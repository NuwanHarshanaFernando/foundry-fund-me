// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundMeTest is Test {
    FundMe fundMe;

    function setUp() external {
        // FundMe fundMe = new FundMe(); // fundMe variable of type FundMe is a new FundMe contract
        // us -> FundMeTest -> FundMe -> The reason for the error of testOwnerIsMsgSender
        fundMe = new FundMe();
    }

    function testMinimumDollarIsFive() public {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testOwnerIsMsgSender() public {
        console.log(fundMe.i_owner());
        console.log(msg.sender);
        //  assertEq(fundMe.i_owner(), msg.sender); // Fails because of (us -> FundMeTest -> FundMe)
        assertEq(fundMe.i_owner(), address(this)); // Now test pass
    }

    // What can we do to work with addresses outside our system?
    // 4 types of testing:

    // 1. Unit: Testing a single function
    // 2. Integration: Testing multiple functions
    // 3. Forked: Testing on a forked network
    // 4. Staging: Testing on a live network (testnet or mainnet)

    function testPriceFeedVersionIsAccurate() public {
        uint256 version = fundMe.getVersion();
        assertEq(version, 4); // Fails , Because the contract address is not exists because it run completey new anvil chain
    }
}
