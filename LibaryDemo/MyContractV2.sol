// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract MyContractV2 {
    function sub(uint a, uint b) external pure returns(uint) {
        return a - b;
    }

    function mul(uint a, uint b) external pure returns (uint256)  {
        return a * b;
    }

}