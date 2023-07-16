// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

interface ICounter {
    function count() external view returns(uint);
    function increment() external ;    
    
}

contract InterfaceDemo {
    function incrementCounter(address _counterAddr) external {
        ICounter(_counterAddr).increment();
    }
    function getCount(address _counterAddr) external view returns(uint) {
        return ICounter(_counterAddr).count();
    }
}