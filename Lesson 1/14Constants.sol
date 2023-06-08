// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

// contract Var { 
//     string public text = "hello"; // execution cost	3401 gas
// }

contract Var { 
    string public constant TEXT = "hello"; // execution cost	707 gas
}