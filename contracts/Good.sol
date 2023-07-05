// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

contract Good {
    address public currentWinner;
    uint public currentAuctionPrice;
     mapping(address => uint) public balances;


    constructor() {
        currentWinner =msg.sender;
        
    }
    function setCurrentAuctionPrice() public payable {
        
        require(msg.value > currentAuctionPrice, "Need to pay more than the currentAuctionPrice");
        (bool sent, ) = currentWinner.call{value: currentAuctionPrice}("");
        if (sent) {
            currentAuctionPrice = msg.value;
            currentWinner = msg.sender;
        }
    }
    //this function will ensure no DOS Attack since one can be able
    //to withdraw funds incase of new currentWinner
    function withdraw() public {
        require(msg.sender != currentWinner, "Current winner cannot withdraw");

        uint amount = balances[msg.sender];
        balances[msg.sender] = 0;

        (bool sent, ) = msg.sender.call{value: amount}("");
        require(sent, "Failed to send Ether");
    }

}