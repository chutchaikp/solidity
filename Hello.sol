// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Hello {
    string message;

    function setMessage(string memory newMessage) public {
        message = newMessage;
    }

    function getMessage() public view returns (string memory message_) {
        return message;
    }
}