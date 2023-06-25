// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract Variables {

    // State variable
    string public text = "hello";

    function setText() public {
        // Local variable
        string memory localText = "world";
        text = localText;
    }

    // Global variable
    function GlobalVar() public  view returns (uint, uint, address) {
        uint timestamp = block.timestamp;
        uint blockNumber = block.number;
        address sender = msg.sender;
        return (timestamp, blockNumber, sender);
    }

}