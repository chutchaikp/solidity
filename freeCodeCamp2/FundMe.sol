// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

// Smart contracts can hold funds just like how wallets can

// Extension Method
import "./PriceConverter.sol";
import "hardhat/console.sol";

contract FundMe {
    using PriceConverter for uint256;

    // 2 ways reduct gas : // constant and immutable
    // 1316537
    // 1294063
    // 1294063
    uint256 public constant MINIMUM_USD = 50 * 1e18;

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    // basic Solidity: Contructor
    // Immutable variables are like constants. Values of immutable variables can be set inside the constructor but cannot be modified afterwards.
    address public i_owner;
    // 444 - immutable
    // 2580 - non-immutable
    // 444 - immutable
    // 

    constructor() {
        i_owner = msg.sender;
    }

    // check fund mechanism
    function fund() public payable {
        // Want to be able to set a minimum fund amount
        // 1. How do we send ETH to this contract ?
        // require(msg.value > 1e18, "Didn't send enough!");

        uint256 rate = msg.value.getConversionRate();
        require(rate > MINIMUM_USD, "Didn't send enough!");

        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

    // ABI
    // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306

    function withdraw() public onlyi_Owner {
        for (
            uint256 funderIndex = 0;
            funderIndex < funders.length;
            funderIndex++
        ) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        // Basic Solidity
        // Resetting an Array
        // actually withdraw the funds

        funders = new address[](0); // completely blank a new array
        // // transfer
        // payable(msg.sender).transfer(address(this).balance);
        // // send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send failed");
        // call *** recommeded method
        (
            bool callSuccess, // bytes memory callReturned

        ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");

        // msg.sender = address
        // payable(msg.sender) = address
    }

    // Sending ETH from a Contract
    // Basic Solidity: Modifiers

    modifier onlyi_Owner() {
        require(msg.sender == i_owner, "Sender is not i_owner");
        _;
    }

    receive() external payable {
        fund();
    }
    fallback() external payable {
        fund();
    }

    // function getPrice() public view returns (uint256) {
    //     console.log("Hello getPrice function");
    //     uint256 price = PriceConverter.getPrice();
    //     console.log("price %s", price);
    //     return price;
    // }

    // function getPriceVII() public view returns (uint256, uint256) {
    //     console.log("Hello function getPriceVII ");
    //     (uint256 price, uint256 updatedAt) = PriceConverter.getPriceV2();
    //     return (price, updatedAt);
    // }

    // function testMe() public payable {
    //     console.log("Hello console log");
    //     console.log("sender %s", msg.sender);
    //     console.log("value is %s", msg.value);
    // }
}

// TODO:
// Ge funds from users
// Withdraw funds
// Set a minimum funding value in USD

// Testnet Demo

// contract address // 0x716B44b6D1d9434bc92b1501F5721Fcc3F5053e4

// 2023-07-01 - Advanced Solidity: Immutable & Constant
// 2023-07-01 - Advanced Solidity: Custom Errors
// 2023-07-01 
    // - Lesson 5 : Ethers.js Simple Storage
    // - Effective Debugging Strategies & Getting Help (Don't skip this!!)
// 2023-07-01 - How to Debug Anythink 
// 2023-07-01 - Install & Setup: Moving to local development


