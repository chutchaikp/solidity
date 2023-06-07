// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

// check gas usage!

contract SimpleStorage {
    uint256 public myNumber;

    function store(uint256 _myNumber) public {
        myNumber = _myNumber;
    }
}