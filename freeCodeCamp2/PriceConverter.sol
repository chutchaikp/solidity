// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {

    function getPrice() internal  view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (
            // uint80 roundId
            ,
            int256 price,
            // uint256 startedAt
            ,
            // uint256 updatedAt
            ,
            // uint80 priceedInRound
            ) = priceFeed.latestRoundData();
            // ETH in term of USD
        return uint256( price * 1e10); // 1**10 == 10000000000
    }
    

    function getVersion() internal  view returns (uint256) {
        AggregatorV3Interface agg = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        uint256 ver = agg.version();
        return ver;
    }

    // 1 eth = ? USD
    function getConversionRate(uint256 ethAmount) internal view returns(uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }

}