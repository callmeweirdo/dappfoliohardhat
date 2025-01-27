import { ethers } from "hardhat";

const main = async () => {
  console.log("Deploying PortfolioManager Contract...");

  // Get the contract factory
  const PortfolioManager = await ethers.getContractFactory("PortfolioManager");

  // Deploy the contract
  const portfolioManagerContract = await PortfolioManager.deploy();

  // Wait for the deployment transaction to be mined
  await portfolioManagerContract.waitForDeployment();

  // Get the address of the deployed PortfolioManager contract
  const portfolioManagerAddress = portfolioManagerContract.target;

  console.log(`PortfolioManager Contract deployed at: ${portfolioManagerAddress}`);

  // Call a function to retrieve related contracts' addresses
  const [educationContract, projectsContract, experienceContract] =
    await portfolioManagerContract.getContractsAddress();

  console.log("Related Contracts deployed:");
  console.log(`Education Contract: ${educationContract}`);
  console.log(`Projects Contract: ${projectsContract}`);
  console.log(`Experience Contract: ${experienceContract}`);
};

// Wrap the main function in a try-catch block for better error handling
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error("Error in script:", error);
    process.exit(1);
  });
