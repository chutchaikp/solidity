// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "hardhat/console.sol";
import "./MyMath.sol";
import "./MyContract.sol";
import "./MyMathV2.sol";
import "./MyContractV2.sol";

contract LibaryDemo {
    uint256 public res;
    MyContract public myCon = new MyContract();
    MyContractV2 public myConV2 = new MyContractV2();

    function testMyAdd() public {
        uint x = 1;
        uint y = 2;
        res = x + y;
        console.log(res, "===", "===");
    }

    function testAdd() public  {
        res = MyMath.add(10, 13);
        console.log("===", res, "===");
    }

    function testImportContract() public view {
       // res = MyContract.add(22, 33);
       uint _res = myCon.add(44, 55);
       console.log(_res, "ok");
    }

    function testMathV2() public view  {
        uint256 resss = MyMathV2.mul(5, 3);
        console.log("ok", resss);
    }

    function testMyContractV2() public  view {
        uint256 _res = myConV2.sub(2, 1);
        console.log("ok", _res);
    }

}