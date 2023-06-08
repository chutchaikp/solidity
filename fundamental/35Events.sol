// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "github.com/OpenZeppelin/openzeppelin-contracts/contracts/utils/Strings.sol";

contract Events {
    event LogMe(address indexed sender, string message);

    function logMe() public {


        emit LogMe(msg.sender, "hello"); 
        emit LogMe(msg.sender, "world"); 
        emit LogMe(msg.sender, Strings.toString(block.timestamp)); 
    }
}
