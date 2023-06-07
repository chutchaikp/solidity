// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract Outputs {
    function normal() public pure returns (uint, bool) {
        return (1, true);
    }

    function named() public pure returns (uint x, bool b) {
        return (2, false);
    }

    function assigned() public pure returns (uint x, bool b) {
        b = true;
        x = 13;
    }

    function useNormal() public pure returns (uint, bool) {
        (uint i, bool b) = normal();
        return (i, b);
    }
}