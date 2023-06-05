// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// import "github.com/OpenZeppelin/openzeppelin-contracts/contracts/utils/math/SafeMath.sol";
import "github.com/OpenZeppelin/openzeppelin-contracts/contracts/utils/Strings.sol";

// import "@openzeppelin/contracts/utils/Strings.sol";

// Tutorials

// https://soliditytips.com/

// https://www.geeksforgeeks.org/solidity-strings/

// https://soliditytips.com/articles/concatenate-strings-solidity/
// https://soliditytips.com/articles/how-to-get-contract-balance-solidity

// https://ethereum.stackexchange.com/questions/729/how-to-concatenate-strings-in-solidity

// keccak256
// abi.
// Array is ?
// int[], int[5]

contract Lottery {
    uint seed;
    address public manager;
    address[] public players;

    event Enter(address sender, uint count);

    constructor() {
        manager = msg.sender;
    }

    function enter() public payable {
        // wei to ether ? how to convert !
        // require(msg.value > 0.00000000001 ether, "GAS not enough!");

        // address sender = msg.sender;
        // uint len = players.length;

        players.push(msg.sender);
        emit Enter(msg.sender, players.length);
    }

    // function hash(
    //     string memory _text,
    //     uint256 _num,
    //     address _addr
    // ) public pure returns (bytes32) {
    //     return keccak256(abi.encodePacked(_text, _num, _addr));
    // }

    // function MyString() public view returns (string memory str_) {

    //     string memory str = string.concat("hello", "world");
    //     return str;
    // }

    function MyNumber() public view returns (uint) {
        return block.timestamp;
    }

    // TODO: How to convert number to string
    function random() public view returns (uint256) {
        // return uint(  keccak256(abi.encodePacked(block.difficulty, now, players)) );
        // string memory _difficult = uint2str(block.difficulty);

        return
            uint(
                keccak256(
                    abi.encodePacked(
                        Strings.toString(block.timestamp),
                        block.timestamp,
                        manager
                    )
                )
            );
    }

    // https://soliditytips.com/articles/generate-random-numbers-solidity/
    function generateRandomNumber(uint _modulus) internal returns (uint) {
        seed++;
        return
            uint(
                keccak256(abi.encodePacked(block.timestamp, msg.sender, seed))
            ) % _modulus;
    }

    // function pickWinner() public {
    //     uint index = random() % players.length;
    //     players[index].transfer(this.balance);
    //     // players = new address[](5); // [0x000000, 0x000000,0x000000,0x000000,0x000000,] // reset players
    //     players = new address[](0);
    // }

    modifier restricted() {
        require(msg.sender == manager);
        _;
    }

    function getPlayers() public view returns (address[] memory) {
        return players;
    }
}
