import { ethers } from "hardhat";

async function main() {
    console.log("Deploying Developer Contract...");

    // Get the contract factory for the Developer contract
    const Developer = await ethers.getContractFactory("Developer");

    // Deploy the contract
    const developerContract = await Developer.deploy();

    // Wait for the deployment transaction to be mined
    await developerContract.waitForDeployment();

    const deployedDeveloperContract = await developerContract.getAddress();

    console.log(`Developer contract deployed to: ${deployedDeveloperContract}`);
}

// Run the script with error handling
main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error("Error deploying Developer contract:", error);
        process.exit(1);
    });
