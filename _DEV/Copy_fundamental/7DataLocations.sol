// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

// Data location -- storage, memory, calldata

// How to manage gas ?

contract DataLocations {
    struct MyStruct {
        uint num;
        string text;
    }
    
    int minInt = type(int8).min;

    mapping(address => MyStruct) public myMap;

    function example() private returns (bool) {

        myMap[msg.sender] = MyStruct({ num: 123, text: "hello" });

        MyStruct storage storevalue = myMap[msg.sender];
        storevalue.text = "hello edit";
        
        MyStruct memory readonly = myMap[msg.sender];
        readonly.num = 456;

        // internalFunction(13);

        uint[] memory arrayMemory = new uint[](3);
        arrayMemory[0] = 789;

        // return arrayMemory;
        return true;
    }

}