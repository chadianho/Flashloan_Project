# Leveraged Yield Farm using Flash Loans

Make use of a Flash loan from Balancer to earn more from Compound. 

## Technology Stack & Tools

- [Solidity](https://docs.soliditylang.org/en/v0.8.17/) (Writing Smart Contracts)
- Javascript (Testing)
- [Hardhat](https://hardhat.org/) (Development Framework)
- [Ethers.js](https://docs.ethers.io/v5/) (Blockchain Interaction)
- [Alchemy](https://www.alchemy.com/) (Blockchain Connection)
- [Metamask](https://metamask.io/) (Account Management)
- [Compound Protocol](https://app.compound.finance/) (Supply or Borrow Tokens and Earn cTokens)
- [Balancer](https://docs.balancer.fi/guides/arbitrageurs/flash-loans.html) (Flash Loan Provider)

## Requirements For Initial Setup
- Install [NodeJS](https://nodejs.org/en/). We recommend using the latest LTS (Long-Term-Support) version, and preferably installing NodeJS via [NVM](https://github.com/nvm-sh/nvm#intro).
- Create an [Alchemy](https://www.alchemy.com/) account, you'll need to create an app for the Ethereum chain, on the mainnet network

## Setting Up
### 1. Clone/Download the Repository
Here is my project directory, please clone and download the project as we will need to fork the blockchain with hardhat so that we can run the smart contract on the forked blockchain environment on your pc. 
`https://github.com/chadianho/FlashloanProject`

If the directory doesn't exist, you can execute `pwd` to find out your current path, and `ls` to see the files and folders available to you.

### 2. Install Dependencies:
`npm install`

### 3. Create and Setup .env
Before running any scripts, you'll want to create a .env file with the following values (see .env):

- **ALCHEMY_API_KEY=""**
please input your mainnet alechmy api key just the last part of the url string. The url is already added in the code, it just needs your api key. The contract will only need your api and your private key because we are going to be forking the ethereum mainnet with hardhat. 

### 4. Run tests:
`npx hardhat test`

### 5. Conclusion:
Thank you for testing out my smart contract and scripts. This was a self taught practical on how to use flash loans, which is a finical instrument invented and native to blockchain technology. The test script that was run sucessfully is a flash loan that was done in the forked blockchain on your pc. Hardhat is a tool that can fork a blockchain so that developers can test their code before deploying to mainnet. This application can only be done on the forked blockchain on your pc or the mainnet because the flash loan providers does not disclose their goerli testnetwork addresses. You are more than welcome to go through the code. Thank you for your time.  

## Other Notes
### Uses of Flash loans
  * Arbitrage - use the vast funds to make profits from price discrepencies e.g on Exchange.
  * Leverage - increase exposure e.g earn more with Yield Farming on protocols like Compound.
  
