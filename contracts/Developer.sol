// SPDX-License Identifier: GPL -3.0

pragma solidity >=0.8.28;

contract Developer{
    address public developer;

    constructor(){
        developer = msg.sender;
    }

    modifier onlyDeveloper(){
        require(developer == msg.sender, "You're not the Developer for this Portfolio");
        _;
    }
}