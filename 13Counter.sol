// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract Counter {
    uint count;

    function inc() public {
        count++;
    }

    function dec() public {
        count--;
    }
}