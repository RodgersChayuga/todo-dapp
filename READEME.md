# ToDo DApp - Decentralized Application for Task Management

## Overview
This project is a decentralized ToDo application built using **Next.js 15** for the frontend and **Solidity** for the smart contracts. It leverages popular tools in the blockchain ecosystem to provide a comprehensive, hands-on learning experience in building decentralized applications (DApps). Users can add, manage, and complete tasks, all stored securely on the Ethereum blockchain.

---

## Table of Contents
1. [Project Setup](#project-setup)
2. [Tools Used](#tools-used)
    - [Frontend](#frontend)
    - [Server Side / Smart Contracts](#server-side--smart-contracts)
    - [Interaction Tools](#interaction-tools)
3. [Installation](#installation)
4. [Running the Project](#running-the-project)
5. [Deploy the Smart Contract (Locally)](#deploy-the-smart-contract-locally)
6. [Learning Resources](#learning-resources)
7. [Folder Structure](#folder-structure)

---

## Project Setup
Ensure you have **Node.js** installed (recommended: latest LTS version) and a package manager such as **npm** or **yarn**.

---

## Tools Used

### Frontend
#### 1. Next.js 15
- **Why**: A React framework that enables server-side rendering, static site generation, and powerful routing capabilities, making it an excellent choice for building performant and scalable DApps.
- **Use**: Provides the user interface (UI) for the ToDo application and handles interaction with the Ethereum network.
- **Resources**: [Next.js Documentation](https://nextjs.org/docs)

#### 2. React.js
- **Why**: A popular JavaScript library for building user interfaces, particularly single-page applications.
- **Use**: Component-based development to create interactive and responsive UI elements.
- **Resources**: [React Documentation](https://reactjs.org/docs/getting-started.html)

---

### Server Side / Smart Contracts
#### 1. Solidity
- **Why**: The primary language for writing smart contracts on the Ethereum blockchain.
- **Use**: Used to create the smart contract that manages ToDo tasks on-chain.
- **Resources**: [Solidity Documentation](https://docs.soliditylang.org)

#### 2. Hardhat
- **Why**: A development environment and task runner for Ethereum, helping with compiling, testing, debugging, and deploying smart contracts.
- **Use**: Local development network, contract testing, and deployment.
- **Resources**: [Hardhat Documentation](https://hardhat.org)

#### 3. OpenZeppelin Contracts (Optional)
- **Why**: Provides reusable and secure smart contract libraries to help with common patterns and security practices.
- **Use**: Use built-in templates for security and ease of development when expanding functionality.
- **Resources**: [OpenZeppelin Documentation](https://docs.openzeppelin.com/contracts)

---

### Interaction Tools
#### 1. Ethers.js
- **Why**: A JavaScript library for interacting with the Ethereum blockchain, offering an intuitive API for reading blockchain data, sending transactions, and interacting with smart contracts.
- **Use**: Used to connect the frontend to smart contracts, perform read/write operations, and manage transactions.
- **Resources**: [Ethers.js Documentation](https://docs.ethers.io/v5/)

#### 2. Viem
- **Why**: A modern, lightweight library designed for connecting Ethereum and other EVM-compatible blockchains with JavaScript/TypeScript applications. It offers a modular and type-safe approach to handle data fetching, interactions, and state management.
- **Use**: Ideal for developers seeking a reliable alternative to existing libraries like Ethers.js, with the added benefit of extensibility and improved development experience.
- **Resources**: [Viem Documentation](https://viem.sh/)

#### 3. Wagmi
- **Why**: Provides React hooks for Ethereum, making it simple to integrate wallet connections and other interactions into React applications.
- **Use**: Streamlines wallet connections and common Ethereum operations, enhancing frontend interactions with the blockchain.
- **Resources**: [Wagmi Documentation](https://wagmi.sh)

---

## Installation

### Prerequisites
1. Ensure **Node.js** is installed.
2. Install a package manager (e.g., **npm** or **yarn**).
3. If building from scratch [SETUP INSTRUCTIONS -> Here](SETUP_INSTRUCTIONS.md)

### Project Setup
1. Clone the repository:
    ```bash
    git clone https://github.com/your-username/your-repo-name.git
    cd your-repo-name
    ```

2. Install dependencies for the frontend:
    ```bash
    npm install
    # or
    yarn install
    ```

3. Initialize the Hardhat project (in a separate folder for contracts):
    ```bash
    mkdir contracts && cd contracts
    npm init -y
    npm install --save-dev hardhat
    npx hardhat
    ```

4. Install additional libraries:
    ```bash
    # In the root project directory:
    npm install ethers
    npm install wagmi
    npm install @openzeppelin/contracts  # Optional
    ```

---

## Running the Project

### 1. Compile and Test the Smart Contract
In the `contracts/` folder, create and test your Solidity smart contract using **Hardhat**.
```bash
npx hardhat compile
npx hardhat test
```

---

## Deploy the Smart Contract (Locally)

#### 1. Deploy your smart contract to a local development blockchain using Hardhat.
```bash
npx hardhat node  # Start local network
npx hardhat run scripts/deploy.js --network localhost
```
#### 2. Run the Frontend Application
In the `frontend/` folder, run the Next.js application.
```bash
npm run dev
```

---

## Learning Resources
- **Solidity**: [Solidity Documentation](https://docs.soliditylang.org/)
- **Hardhat**: [Hardhat Guide](https://hardhat.org)
- **Next.js**: [Next.js Documentation](https://nextjs.org/docs)
- **Ethers.js**: [Ethers.js Guide](https://docs.ethers.io/v5/)
- **Wagmi**: [Wagmi Docs](https://wagmi.sh)

---

## Folder Structure 
```plaintext
todo-dapp/
├── contracts/               # Smart contracts and related files (Hardhat project)
│   ├── contracts/           # Solidity contracts
│   │   └── Todo.sol         # Your ToDo contract
│   ├── scripts/             # Deployment scripts
│   │   └── deploy.js        # Script for deploying contracts
│   ├── test/                # Test files for smart contracts
│   │   └── Todo.test.js     # Smart contract tests
│   ├── hardhat.config.js    # Hardhat configuration file
│   └── package.json         # Package file for Hardhat dependencies
├── src/                     # Next.js frontend source code
│   ├── app/                 # App directory for Next.js routing and layouts
│   │   ├── layout.js        # Main layout file (can include a global layout component)
│   │   ├── page.js          # Homepage (ToDo list UI as the default route)
│   │   └── [additional route directories if needed]
│   ├── components/          # Reusable React components
│   │   ├── TaskList.js      # Component for displaying ToDo tasks
│   │   └── TaskForm.js      # Component for adding tasks
│   ├── hooks/               # Custom React hooks (e.g., for blockchain interactions)
│   │   └── useTodoContract.js
│   ├── styles/              # CSS/SCSS files for styling
│   │   └── globals.css
│   └── utils/               # Utility functions and helpers
│       └── constants.js     # Smart contract addresses, ABI, etc.
├── public/                  # Static assets (images, icons, etc.)
├── .env                     # Environment variables (if needed)
├── next.config.js           # Next.js configuration file
├── package.json             # Package file for frontend dependencies
└── README.md                # Project documentation

```

## Explanation of the Structure

### 1. `contracts/` Directory
- This is where your **Hardhat** project lives. It contains:
  - `contracts/`: All Solidity files, e.g., `Todo.sol`.
  - `scripts/`: Deployment scripts for deploying contracts to a local or remote blockchain.
  - `test/`: Files for testing your smart contracts using Hardhat.
  - `hardhat.config.js`: Configuration file for Hardhat.

### 2. `src/` Directory
- Contains all frontend-related files for the **Next.js** application:
  - `app/`: Next.js page components (e.g., `index.js` as the main page for your ToDo app).
  - `components/`: Reusable React components for different parts of the UI.
  - `hooks/`: Custom React hooks for fetching and interacting with the smart contract using **Ethers.js** or **Wagmi**.
  - `styles/`: Stylesheets for custom styling of the application.
  - `utils/`: Utility files, including constants (e.g., contract addresses and ABIs).

### 3. `public/` Directory
- Contains static assets such as images and icons that are directly accessible via URL paths.
