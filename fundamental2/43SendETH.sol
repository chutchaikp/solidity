// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract SendETH {

    constructor() payable  {
    }

    function sendViaTransfer(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) public payable {
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }

    function sendViaCall(address payable _to) public payable {
       // (bool sent, bytes memory data) = _to.call{value: msg.value}("");
       (bool sent,) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }    
}

contract ReceiverETH {
    fallback() external payable {}
    receive() external payable {}
}