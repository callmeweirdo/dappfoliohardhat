// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.28;

contract ExperienceContract {

    address public manager;
    uint public experienceCount; // Counter to track the number of experiences added

    struct ExperienceStruct {
        uint id;
        string date;
        string post;
        string knowledgeAcquired;
        string companyName;
    }

    // Fixed-size array to store up to 3 experiences
    ExperienceStruct[3] public experiences;

    constructor(address _manager) {
        manager = _manager;
    }

    modifier onlyManager() {
        require(manager == msg.sender, "You are not the Owner of the Portfolio");
        _;
    }

    // Function to insert a new experience
    function insertExperience(
        uint _id,
        string calldata _date,
        string calldata _post,
        string calldata _knowledgeAcquired,
        string calldata _companyName
    ) external onlyManager {
        require(experienceCount < 3, "You can only add up to 3 experiences");

        // Add the new experience to the array
        experiences[experienceCount] = ExperienceStruct(
            _id,
            _date,
            _post,
            _knowledgeAcquired,
            _companyName
        );

        // Increment the experience counter
        experienceCount++;
    }

    // Function to update an existing experience
    function updateExperience(
        uint _index,
        string calldata _date,
        string calldata _post,
        string calldata _knowledgeAcquired,
        string calldata _companyName
    ) external onlyManager {
        require(_index < experienceCount, "Invalid experience index");

        // Update the experience at the given index
        experiences[_index] = ExperienceStruct(
            _index,
            _date,
            _post,
            _knowledgeAcquired,
            _companyName
        );
    }

    // Function to retrieve all experiences
    function getExperiences() external view returns (ExperienceStruct[3] memory) {
        return experiences;
    }
}
