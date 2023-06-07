// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract ViewAndPure {
    uint public x = 1;

    function addX(uint y) public view returns(uint) {
        return x + y;
    }

    function add(uint i, uint j) public pure returns(uint) {
        return i + j;
    }
}
