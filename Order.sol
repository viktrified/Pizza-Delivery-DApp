// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Delivery {
    uint256 public orderAmount;

    struct User {
        address client;
        bool delivered;
        uint256 numberOfPizzaSelected;
    }

    mapping(uint256 => User) users;

    function orderPizza(
        uint _numberOfPizzaSelected
    ) public payable returns (uint256) {
        require(msg.value >= 1 ether, "Payment Failed");

        User memory newUser = User(msg.sender, false, _numberOfPizzaSelected);
        orderAmount++;
        users[orderAmount] = newUser;
        return orderAmount;
    }
}
