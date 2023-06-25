// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract SimpleStorage {

    // default visibility is internal
    uint256 public  favoriteNumber;
    // People public person = People({favoriteNumber: 13, name: "chutchai" });
    // People public person = People(13, "wit");

    People[]  peoples;

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    mapping(string => uint256) public nameToFavoriteNumber;

    // conventional arg start with _ 
    // the more "stuff" in the function the more gas it costs
    function store(uint256 _favotireNumber) public virtual  {
        favoriteNumber = _favotireNumber;
        // favoriteNumber += 1; // execution cost	22935 gas
        // transaction cost	23846 gas
        // transaction cost	26646 gas
        // transaction cost	26646 gas
        // retrieve();
        // transaction cost	43886 gas
    }

    // View and pure functions, when called alone, don't spend gas
    // View = read state
    // View and pure functions disallow modification of state

    function retrieve() private view returns(uint256) {
        // favoriteNumber = 0; // disallow modification state
        return favoriteNumber;
    }

    // Pure functions additionally disallow you to read from blockchain state
    // function getData() public pure returns(uint256) {
    //     return favoriteNumber;
    // }

    function addPeople(string memory _name, uint256 _favoriteNumber) public {
        peoples.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

    // memory, calldata, storage ? 
    function someFunction(string memory _data) private pure returns(uint256) {
        // _data = "edit";
        // _data = "edit";
        uint len = bytes(_data).length;
        return  len;
    }

}

  