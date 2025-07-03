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
}
