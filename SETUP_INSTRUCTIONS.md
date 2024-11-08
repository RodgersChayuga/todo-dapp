
# ToDo DApp Project Setup

## 1. Project Setup with Next.js 15

### Step 1: Create a Next.js Application
Run the following command to create a Next.js application:
```bash
npx create-next-app@latest todo-dapp
```
During the setup, select **Next.js 15** if you’re prompted for a version choice.

### Step 2: Navigate to Your Project Directory
```bash
cd todo-dapp
```

### Step 3: Install Necessary Dependencies
You’ll need several dependencies for the frontend and smart contract interaction. Let’s add them step by step:

#### Frontend Dependencies
```bash
# Install Ethers.js for interacting with the blockchain
npm install ethers

# Install Wagmi for connecting to wallets (if you plan to use it)
npm install wagmi

# Optional: If you want to use Viem (integrated with Wagmi)
npm install viem
```

#### Smart Contract Development Tools (Hardhat)
Navigate outside your Next.js app to set up a smart contract project:
```bash
cd ..
mkdir smart-contracts
cd smart-contracts
npm init -y

# Install Hardhat
npm install --save-dev hardhat

# Initialize a Hardhat project
npx hardhat
```
Follow the prompts to set up a basic Hardhat project.

---

## 2. Configuring Hardhat

In your `smart-contracts` directory, you’ll have a basic structure. Let’s create a simple ToDo smart contract.

### Create a `Todo.sol` File
Inside `contracts/`, create `Todo.sol`:
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Todo {
    struct Task {
        string description;
        bool completed;
    }

    Task[] private tasks;

    function addTask(string memory _description) public {
        tasks.push(Task(_description, false));
    }

    function completeTask(uint _index) public {
        require(_index < tasks.length, "Invalid index");
        tasks[_index].completed = true;
    }

    function getTasks() public view returns (Task[] memory) {
        return tasks;
    }
}
```

### Deploy the Contract
Create a deployment script in `scripts/deploy.js`:
```javascript
async function main() {
  const Todo = await ethers.getContractFactory("Todo");
  const todo = await Todo.deploy();
  await todo.deployed();
  console.log("Todo contract deployed to:", todo.address);
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
```

Run the deployment:
```bash
npx hardhat run scripts/deploy.js --network localhost
```

---

## 3. Connect the Frontend to the Smart Contract

Go back to your `my-todo-dapp` directory and create a connection to the smart contract using `ethers.js`:

1. **Create a Utility File**: `src/utils/constants.js`
   - This file will store the ABI and contract address for your deployed contract.

2. **Interaction Logic**: Use hooks to interact with your contract (e.g., `useEffect` and `useState` in `pages/index.js`).

---

Would you like more detailed code for each part or any specific step next?
