// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract Errors {
    function Require(uint i) public pure returns (string memory) {
        require(i > 10, "Invalid" );
        return "ok";
    }

    function Revert(uint i) public pure returns (string memory) {
        if (i < 10) {
            revert("Input less than 10");
        }
        if (i < 20) {
            revert("Input less than 20");
        }
        return "ok";
    }

    uint num;
    function Assert() public view {
        assert(num == 0);
    }

    // reduce gas
    // custom error 
    error myError(address sender, uint i);
    function CustomError(uint _i) public view {
        if (_i < 10) {
            revert myError(msg.sender, _i);
        }
    }
}