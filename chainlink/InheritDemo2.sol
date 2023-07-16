// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract A {
    string public textA;
    constructor(string memory _textA) {
        textA = _textA;
    }
}

contract B {
    string public textB;
    constructor(string memory _textB) {
        textB = _textB;
    }
}

// Calling parent Constructor
// method 1
contract C is A("Input A"), B("Input B") {

}
// method 2
contract D is A, B {
    constructor(string memory _textA, string memory _textB ) A(_textA) B(_textB) {}
}
// method 3
contract E is A,B {
    constructor() A("InputA") B("InputB") { }
    // constructor(string memory _textA, string memory _textB) A(_textA) B(_textB) {  }
}
// method 4 
contract F is A("InputA"), B {
    constructor(string memory _textB) B(_textB) {}
}
