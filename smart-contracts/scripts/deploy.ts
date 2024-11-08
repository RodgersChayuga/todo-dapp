// contracts/scripts/deploy.ts
import { ethers } from "hardhat";

async function main() {
    const [deployer] = await ethers.getSigners();
    console.log("Deploying contracts with the account:", deployer.address);

    const Todo = await ethers.getContractFactory("Todo");
    const todo = await Todo.deploy();
    await todo.waitForDeployment();

    const address = await todo.getAddress();
    console.log("Todo contract deployed to:", address);

    // Save the contract address to a file that can be used by the frontend
    const fs = require("fs");
    const contractsDir = __dirname + "/../../src/constants";

    if (!fs.existsSync(contractsDir)) {
        fs.mkdirSync(contractsDir);
    }

    fs.writeFileSync(
        contractsDir + "/contracts-address.json",
        JSON.stringify({ Todo: address }, undefined, 2)
    );
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });