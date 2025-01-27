// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.28;

import "./Education.sol";

contract PortfolioManager {
    address public owner;

    Education public educationContract;
    // Uncomment and implement these when ready:
    // Projects public projectsContract;
    // Experience public experienceContract;

    // Constructor to initialize the PortfolioManager and deploy the Education contract
    constructor() {
        owner = msg.sender;

        // Deploy the Education contract and store its address
        educationContract = new Education(owner);

        // Uncomment and initialize these when ready:
        // projectsContract = new Projects(owner);
        // experienceContract = new Experience(owner);
    }

    // Modifier to restrict certain functions to the contract owner
    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    // Function to get the address of the deployed Education contract
    function getContractsAddress() public view returns (address education) {
        return (address(educationContract));
    }

    // Example of a function to change ownership of the PortfolioManager
    function transferOwnership(address newOwner) external onlyOwner {
        require(newOwner != address(0), "Invalid address for new owner");
        owner = newOwner;
    }
}
