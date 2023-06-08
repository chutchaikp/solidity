// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract Payables { 
    
    address payable public owner;
    
    constructor() payable  {
        owner = payable(msg.sender);
    }

    function deposit() public payable {

    }
    
    function getBalance() external view returns(uint) {
        return address(this).balance;
    }
}