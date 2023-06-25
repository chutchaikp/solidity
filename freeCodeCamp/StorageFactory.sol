// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "./SimpleStorage.sol";

contract StorageFactory {
    
    SimpleStorage public simpleStorage;

    function createSimpleStorageContract() public {
        // How does storage facory know what simple storage looks like ?
        simpleStorage = new SimpleStorage();
    }
}