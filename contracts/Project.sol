// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.28;

contract Projects {
    address public manager;
    address public owner;
    uint public projectCount;

    struct Project {
        uint id;
        string date;
        string name;
        string description;
        string githubUrl;
        string image;
    }

    mapping(uint => Project) public projectDetails;

    constructor(address _manager) {
        manager = _manager;
        owner = msg.sender;
    }

    modifier onlyManager() {
        require(msg.sender == manager, "You are not the owner of this portfolio");
        _;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    function insertProject(
        string calldata _date,
        string calldata _name,
        string calldata _description,
        string calldata _githubUrl,
        string calldata _image
    ) external onlyManager {
        projectDetails[projectCount] = Project(projectCount, _date, _name, _description, _githubUrl, _image);
        projectCount++;
    }

    function updateProject(
        uint _projectId,
        string calldata _date,
        string calldata _name,
        string calldata _description,
        string calldata _githubUrl,
        string calldata _image
    ) external onlyManager {
        require(projectDetails[_projectId].id == _projectId, "Invalid project ID");
        projectDetails[_projectId] = Project(_projectId, _date, _name, _description, _githubUrl, _image);
    }

    function allProjectDetails() external view returns (Project[] memory) {
        Project[] memory projects = new Project[](projectCount);
        for (uint i = 0; i < projectCount; i++) {
            projects[i] = projectDetails[i];
        }
        return projects;
    }

    function transferOwnership(address newOwner) external onlyOwner {
        owner = newOwner;
    }
}