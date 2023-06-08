// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

// Normal modifier
// contract Modifiers {
//     bool isUnlock = true;
//     uint count;
//     modifier checklocked() {
//         require(isUnlock, "locked");
//         _;
//     }
//     function inc1() public checklocked {
//         count++;
//     }
// }


// Modifier with params
// contract Modifiers {
//     bool isUnlock = true;
//     uint count;
//     modifier checklocked(uint _i) {
//         require(_i > 555, "locked");
//         _;
//     }
//     function inc1(uint _i) public checklocked(_i) {
//         count++;
//     }
// }

// Modifier (Sandwich)
contract Modifiers {
    bool isUnlock = true;
    uint count;
    modifier checklocked(uint _i) {
        require(_i > 555, "locked");
        _;
        count++; // <========
    }
    function inc1(uint _i) public checklocked(_i) {
        count++;
    }
}