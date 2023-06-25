// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract Enums {
    enum Status {
        Pending, // 0
        Shipped, // 1
        Accepted, // 2
        Rejected, // 3
        Canceled // 4
    }

    Status public status;

    function get() public view returns (Status) {
        return status;
    }

    function set(Status _status) public {
        status = _status;
    }

    function Accepted() public {
        status = Status.Accepted;
    }

    function Canceled() public {
        status = Status.Canceled;
    }    

    function Reset() public {
        delete status;
    }

}

// TODO: memory vs storage 
// enum

// contract Structs {
    
//     uint[] public nums = [2, 4, 5];
//     mapping(string => uint) public peoples;

//     constructor() {
//         peoples["foo"] = 10;
//         peoples["bar"] = 13;
//         peoples["hello"] = 222;
//         peoples["world"] = 555;
//         peoples["bangkok"] = 666;
//     }

// }