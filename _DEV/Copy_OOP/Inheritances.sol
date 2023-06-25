// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

// virtual - ผู้ถ่ายทอด !

contract A {
    function methodA() public pure virtual returns (string memory text) {
        text = "A.methodA";
    }
    
    function methodB() public pure returns (string memory text) {
        return "A.methodB";
    }
}

contract B is A {
    function methodA() public pure virtual override returns (string memory text) {
        return "B.methodA";
    }
}

contract C is B {

}