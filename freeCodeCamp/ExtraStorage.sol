// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "./SimpleStorage.sol";

contract ExtraStorage is SimpleStorage {

    function store(uint256 _favoriteNumber) public override  {
        favoriteNumber = _favoriteNumber;
    }

    function storeEx(uint256 _favoriteNumber) public {
        favoriteNumber = favoriteNumber + _favoriteNumber;
    }
}