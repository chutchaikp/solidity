// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract BaseStorage {
    uint256 number;

    function get() public view returns(uint256) {
        return number;
    }

    function set(uint256 _number) public {
        number = _number;
    }
}