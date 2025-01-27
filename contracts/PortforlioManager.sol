// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.28;

import "./Education.sol";
// import "./Projects.sol";
// import "./Experience.sol";

contract PortfolioManager {
    address public owner;

    Education public educationContract;
    // Projects public projectsContract;
    // Experience public experienceContract;

    // Constructor to initialize the PortfolioManager and deploy related contracts
    constructor() {
        owner = msg.sender;

        // Deploy related contracts and pass the owner address
        educationContract = new Education(owner);
        // projectsContract = new Projects(owner);
        // experienceContract = new Experience(owner);
    }

    // Modifier to restrict certain functions to the contract owner
    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    // Function to get the addresses of the deployed contracts
    function getContractsAddress() public view returns (
        address education
        // address projects,
        // address experience
    ) {
        return (
            address(educationContract)
            // address(projectsContract),
            // address(experienceContract)
        );
    }

    // Example of a function to change ownership of the PortfolioManager
    function transferOwnership(address newOwner) external onlyOwner {
        require(newOwner != address(0), "Invalid address for new owner");
        owner = newOwner;
    }
}