// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

// Smart contracts can hold funds just like how wallets can

// Extension Method
import "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;

    uint256 public minimumUsd = 50 * 1e18;

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    // basic Solidity: Contructor
    

    function fund() public payable {
        // Want to be able to set a minimum fund amoun
        // 1. How do we send ETH to this contract ?
        // require(msg.value > 1e18, "Didn't send enough!");

        uint256 rate = msg.value.getConversionRate();
        require(rate > minimumUsd, "Didn't send enough!");

        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

    // ABI
    // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306

    function withdraw() public {
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
        (bool callSuccess, bytes memory callReturned) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");

        // msg.sender = address
        // payable(msg.sender) = address
    }

    // Sending ETH from a Contract
}

// TODO:
// Ge funds from users
// Withdraw funds
// Set a minimum funding value in USD
