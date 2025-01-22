import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
require("dotenv").config();

const { SEPOLIA_URL, SECRETE_KEY } = process.env;

const config: HardhatUserConfig = {
  solidity: "0.8.28",
  // solidity: {
  //   compilers: [
  //           {
  //               version: "0.7.0",
  //           },
  //           {
  //               version: "0.8.0",
  //           },
  //       ],
  // } ,
  networks: {
    sepolia: {
      url: SEPOLIA_URL || "",
      accounts:
        SECRETE_KEY !== undefined ? [SECRETE_KEY] : [] 
    }
  }
};

export default config;