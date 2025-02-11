// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.28;

import "./Education.sol";
import "./Project.sol";
import "./Experience.sol"; // Corrected file name

contract PortfolioManager {
    address public owner;
    Education public educationContract;
    Projects public projectsContract;
    Experience public experienceContract;

    constructor() {
        owner = msg.sender;
        educationContract = new Education(address(this));
        projectsContract = new Projects(address(this));
        experienceContract = new Experience(address(this));
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    function transferOwnership(address newOwner) external onlyOwner {
        require(newOwner != address(0), "Invalid address for new owner");
        owner = newOwner;
        educationContract.transferOwnership(newOwner);
        projectsContract.transferOwnership(newOwner);
        experienceContract.transferOwnership(newOwner);
    }

    function getContractAddresses() public view returns (address education, address projects, address experience) {
        return (address(educationContract), address(projectsContract), address(experienceContract));
    }
}