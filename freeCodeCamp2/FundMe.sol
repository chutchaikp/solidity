// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// Smart contracts can hold funds just like how wallets can

contract FundMe {

    
    function fund() public payable  {
        // Want to be able to set a minimum fund amoun
        // 1. How do we send ETH to this contract ?
        require(msg.value > 1e18, "Didn't send enough!");
        
    }

}

// TODO: 
// Ge funds from users
// Withdraw funds
// Set a minimum funding value in USD