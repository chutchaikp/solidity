// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract ValueType {

    function getMinInt8() public pure returns (int) {
        // int public minInt = 
        return type(int8).min;
    }

    // function getMaxInt8() public pure returns (int) {    
    //     return type(int8).max;
    // }
    int public  maxInt8 = type(int8).max;
}