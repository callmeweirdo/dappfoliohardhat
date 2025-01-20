import { ethers } from "hardhat";

async function main() {
    console.log("Deploying Developer Contract...");

    // Get the contract for the Developer cotract
    const Developer = await ethers.getContractFactory("Developer");

    // Deploy the contract
    const developerContract = await Developer.deploy();

    // wait for the deploy ment to complete
    await developerContract.deployed();

    console.log(`Developer contract deployed to: ${developerContract.address}`);

}


// Run the script with error handling

main().then(() => process.exit(0)).catch((error) => {
    console.error("Error deploying Developer contract:", error);
    process.exit(1);
});