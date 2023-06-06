// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "hardhat/console.sol";

contract Hello {
    string message;

    function setMessage(string memory newMessage) public {
        console.log("set message");
        message = newMessage;        
    }

    function getMessage() public view returns (string memory message_) {
        console.log("get message now", msg.sender);
        return message;
    }

    function getSender() public view returns (address) {
        return msg.sender;
    }
}