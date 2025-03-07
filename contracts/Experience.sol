// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.28;

contract Experience {
    address public manager;
    address public owner;
    uint public experienceCount;

    struct ExperienceStruct {
        uint id;
        string date;
        string post;
        string knowledgeAcquired;
        string companyName;
    }

    mapping(uint => ExperienceStruct) public experiences;

    constructor(address _manager) {
        manager = _manager;
        owner = msg.sender;
    }

    modifier onlyManager() {
        require(manager == msg.sender, "You are not the Owner of the Portfolio");
        _;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    function insertExperience(
        string calldata _date,
        string calldata _post,
        string calldata _knowledgeAcquired,
        string calldata _companyName
    ) external onlyManager {
        experiences[experienceCount] = ExperienceStruct(experienceCount, _date, _post, _knowledgeAcquired, _companyName);
        experienceCount++;
    }

    function updateExperience(
        uint _index,
        string calldata _date,
        string calldata _post,
        string calldata _knowledgeAcquired,
        string calldata _companyName
    ) external onlyManager {
        require(experiences[_index].id == _index, "Invalid experience index");
        experiences[_index] = ExperienceStruct(_index, _date, _post, _knowledgeAcquired, _companyName);
    }

    function allExperienceDetails() external view returns (ExperienceStruct[] memory) {
        ExperienceStruct[] memory experience = new ExperienceStruct[](experienceCount);
        for (uint i = 0; i < experienceCount; i++) {
            experience[i] = experiences[i];
        }
        return experience;
    }

    function transferOwnership(address newOwner) external onlyOwner {
        owner = newOwner;
    }
}