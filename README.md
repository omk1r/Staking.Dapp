**README**

# Staking DApp - Testtoken

This repository contains a decentralized application (DApp) for staking Testtoken (TEST) on the Sepolia testnet. The DApp allows users to buy TEST tokens, stake them to earn rewards, and also unstake their tokens. It is built using Solidity for the smart contract and React with Web3.js for the frontend integration.

## Smart Contract - Staking.sol

The smart contract `Staking.sol` is deployed on the Sepolia testnet. It is an ERC20 token named "Testtoken" (TEST) that allows users to stake and unstake their tokens to earn rewards. Below are the functionalities provided by the smart contract:

1. **Constructor**: The constructor function initializes the Testtoken by minting 1,000,000 tokens to the deployer's address.

2. **buy(uint256 amount)**: External function that allows users to buy TEST tokens by sending ether to the contract. The token price is set to 0.1 ether per token.

3. **stake(uint32 amount)**: External function that allows users to stake a specified amount of their TEST tokens and start earning rewards.

4. **unstake()**: External function that allows users to unstake their previously staked tokens. Rewards are claimed, and the staked tokens are transferred back to the user.

5. **claim()**: Public function used internally to calculate and mint rewards for stakers based on the time they have staked their tokens.

## Frontend - React App

The frontend of the DApp is built using React and Web3.js to interact with the deployed smart contract. The interface provides the following functionalities:

1. **Buy**: Users can purchase TEST tokens by clicking the "Buy" button, which will prompt a Metamask transaction to send ether and receive tokens.

2. **Stake**: Users can stake their TEST tokens by clicking the "Stake" button and entering the desired amount of tokens they wish to stake. This will initiate another Metamask transaction to approve the staking of tokens.

3. **Unstake**: Users can unstake their previously staked tokens by clicking the "Unstake" button. This will initiate a Metamask transaction to withdraw staked tokens and claim rewards.

4. **Total Staked**: This functionality displays the total amount of TEST tokens staked by the user.

## Getting Started

1. Clone the repository to your local machine.

2. Navigate to the project directory and install the necessary dependencies using npm:

   ```
   npm install
   ```

3. Configure your MetaMask extension to connect to the Sepolia testnet.

4. Deploy the `Staking.sol` smart contract to the Sepolia testnet using Hardhat or any other Ethereum development environment.

5. Update the frontend `App.js` file with the contract address and ABI obtained from the deployment.

6. Run the React app locally:

   ```
   npm start
   ```

7. Access the DApp in your web browser at http://localhost:3000.

## Note

This DApp is deployed on the Sepolia testnet and is intended for testing and demonstration purposes only. Do not use real funds or sensitive information while interacting with the DApp.

**Disclaimer**: Please exercise caution when interacting with smart contracts and make sure to review the code for security vulnerabilities before deployment.

For any questions or issues, please feel free to open an issue or contact the repository owner.

Happy staking!
