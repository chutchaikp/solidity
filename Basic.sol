// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

// public - all can access
// external - Cannot be accessed internally, only externally
// internal - only this contract and contracts deriving from it can access
// private - can be accessed only from this contract

// The difference is because in public functions, 
// Solidity immediately copies array arguments to memory, 
// while external functions can read directly from calldata. 
// Memory allocation is expensive, whereas reading from calldata is cheap.

contract Basic {

    function plus(uint x, uint y) external pure returns (uint) {
        return x + y;
    }

    function minus(uint x, uint y) external pure returns (uint) {
        return x - y;
    }

   function plus2(uint x, uint y) public  pure returns (uint) {
        return x + y;
    }

    function minus2(uint x, uint y) public pure returns (uint) {
        return x - y;
    }

}