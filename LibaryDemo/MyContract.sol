// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract MyContract {
    function add(uint x, uint y) public pure returns(uint) {
        uint z = x + y;
        return z;
    }
}