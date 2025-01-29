// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.28 ;

contract Education {

    address public manager;
    struct EducationStruct{
        uint id;
        string date;
        string degree;
        string knowledgeAcquired;
        string institutionName;
    }

    EducationStruct[3] public educationDetails;

    uint public educationCount ;

    constructor(address _manager){
        manager = _manager;
    }

    modifier onlyManager () {
        require(msg.sender == manager, "Not Authorized");
        _;
    }

    function insertEductaion(
        string calldata _date,
        string calldata _degree,
        string calldata _knowledgeAcquired,
        string calldata _institutionName
    ) external onlyManager
    {
        require(educationCount < 3, "Only 3 Education Details Allowed");
        educationDetails[educationCount] = EducationStruct(educationCount, _date, _degree, _knowledgeAcquired, _institutionName);
        educationCount++;
    }

    function changeEducation(
        uint _educationId,
        string calldata _date,
        string calldata _degree,
        string calldata _knowledgeAcquired,
        string calldata _institutionName
    ) external onlyManager{
        require(_educationId >= 0 && _educationId < educationCount, "Invalid education ID");
        educationDetails[_educationId] = EducationStruct(_educationId, _date, _degree, _knowledgeAcquired, _institutionName);
    }

    function allEducationDetails() external view returns(EducationStruct[3] memory){
        return educationDetails;
    }

}