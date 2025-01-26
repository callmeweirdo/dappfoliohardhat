// SPDX-Lisence Identifier: GPL -3.0;

pragma solidity 0.8.28;

import "./Education.sol";

contract PortfoloManager{
    address public owner;

    constructor(){
        owner == msg.sender;

        educationContract = new Education(owner);
    }

    function getContractsAddress() public view returns(address education) {
        return address(educationContract);
    }



}