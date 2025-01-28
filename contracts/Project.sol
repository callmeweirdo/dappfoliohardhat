// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.28;

contract Projects {
    address public manager;

    struct Project {
        string date;
        string name;
        string description;
        string githubUrl;
        string image;
    }

    uint public projectCount;
    Project[3] public projectDetails;

    constructor(address _manager) {
        manager = _manager;
    }

    modifier onlyManager() {
        require(msg.sender == manager, "You are not the owner of this portfolio");
        _;
    }

    function insertProject(
        string calldata _date,
        string calldata _name,
        string calldata _description,
        string calldata _githubUrl,
        string calldata _image
    ) external onlyManager {
        require(projectCount < 3, "You can only add 3 projects");
        projectDetails[projectCount] = Project(_date, _name, _description, _githubUrl, _image);
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
        require(_projectId >= 0 && _projectId < projectCount, "Invalid project ID");
        projectDetails[_projectId] = Project(_date, _name, _description, _githubUrl, _image);
    }

    function allProjectDetails() external view returns (Project[3] memory) {
        return projectDetails;
    }
}// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.28;

contract Projects {
    address public manager;

    struct Project {
        string date;
        string name;
        string description;
        string githubUrl;
        string image;
    }

    uint public projectCount;
    Project[3] public projectDetails;

    constructor(address _manager) {
        manager = _manager;
    }

    modifier onlyManager() {
        require(msg.sender == manager, "You are not the owner of this portfolio");
        _;
    }

    function insertProject(
        string calldata _date,
        string calldata _name,
        string calldata _description,
        string calldata _githubUrl,
        string calldata _image
    ) external onlyManager {
        require(projectCount < 3, "You can only add 3 projects");
        projectDetails[projectCount] = Project(_date, _name, _description, _githubUrl, _image);
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
        require(_projectId >= 0 && _projectId < projectCount, "Invalid project ID");
        projectDetails[_projectId] = Project(_date, _name, _description, _githubUrl, _image);
    }

    function allProjectDetails() external view returns (Project[3] memory) {
        return projectDetails;
    }
}
