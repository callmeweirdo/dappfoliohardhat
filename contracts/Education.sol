// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.28;

contract Education {
    address public manager;
    address public owner;
    uint public educationCount;

    struct EducationStruct {
        uint id;
        string date;
        string degree;
        string knowledgeAcquired;
        string institutionName;
    }

    mapping(uint => EducationStruct) public educationDetails;

    constructor(address _manager) {
        manager = _manager;
        owner = msg.sender;
    }

    modifier onlyManager() {
        require(msg.sender == manager, "Not Authorized");
        _;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    function insertEducation(
        string calldata _date,
        string calldata _degree,
        string calldata _knowledgeAcquired,
        string calldata _institutionName
    ) external onlyManager {
        educationDetails[educationCount] = EducationStruct(educationCount, _date, _degree, _knowledgeAcquired, _institutionName);
        educationCount++;
    }

    function changeEducation(
        uint _educationId,
        string calldata _date,
        string calldata _degree,
        string calldata _knowledgeAcquired,
        string calldata _institutionName
    ) external onlyManager {
        require(educationDetails[_educationId].id == _educationId, "Invalid education ID");
        educationDetails[_educationId] = EducationStruct(_educationId, _date, _degree, _knowledgeAcquired, _institutionName);
    }

    function allEducationDetails() external view returns (EducationStruct[] memory) {
        EducationStruct[] memory educations = new EducationStruct[](educationCount);
        for (uint i = 0; i < educationCount; i++) {
            educations[i] = educationDetails[i];
        }
        return educations;
    }

    function transferOwnership(address newOwner) external onlyOwner {
        owner = newOwner;
    }
}