// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract A {
    function simple() public pure virtual  returns(string memory) {
        return "A";
    }
}

contract B is A {
    function simple() public pure override virtual returns(string memory) {
        return "B";
    }
}

contract C is B {
    function simple() public pure  override returns(string memory){
        return "C";
    }

}