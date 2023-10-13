// SPDX-Licence-Identifier:MIT
pragma solidity ^0.8.18;
import {Test,console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";
contract FundMeTest is Test{
    FundMe fundMe;
  function setUp() external{
    DeployFundMe deployFundMe=new DeployFundMe();
    fundMe=deployFundMe.run();

  }
  function testIfMinUsdIsFive() public{
     assertEq(fundMe.MINIMUM_USD(),5e18);
  }
  function testOwnerIsMsgSender() public{
    assertEq(fundMe.i_owner(),msg.sender);
    // console.log(msg.sender);
    // console.log(address(this));
    // console.log(fundMe.i_owner());
  }
  function testIfVersionAccurate() public{
    assertEq(fundMe.getVersion(),4); 
  }
}
