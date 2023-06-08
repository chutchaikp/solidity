// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract Storages {
    string public  text;

    function set(string calldata _text) public {
        text = _text;
    }

    function get() public view returns (string memory) {   
        return text;
    }
}