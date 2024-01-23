# University-AstanaIT_Assanali ERC-20 Token

## Title
This is the second blockchain assignment where we were ordered to deploy a university token with some basic functionality

## Usage
Deployment: Deploy the ERC-20 token contract to the Ethereum blockchain. You can use Remix, Truffle, or any other Ethereum
development environment. If you are using MetaMask, ensure that you have the Ethereum Mainnet selected. You can also use BnB testnet

Interaction: Interact with the deployed contract using a wallet or Ethereum client. You can use tools like MetaMask to interact with the Ethereum Mainnet.

Use standard ERC-20 functions such as transfer, approve, transferFrom, and balanceOf to manage and transfer tokens.

## Demo Screenshots/GIFs
![image](https://github.com/ShowSerenity/blockchain-as2/assets/124548089/fe1ced42-e071-4c53-ae98-2528b4d53942)
![image](https://github.com/ShowSerenity/blockchain-as2/assets/124548089/90e342af-382f-43fc-ba83-7531c985b719)
![image](https://github.com/ShowSerenity/blockchain-as2/assets/124548089/bc7fbff8-412c-4b02-8522-9fcbc37202d3)
![image](https://github.com/ShowSerenity/blockchain-as2/assets/124548089/8e7d6800-7937-4119-b732-e3fc5fb76c4d)
![image](https://github.com/ShowSerenity/blockchain-as2/assets/124548089/3113dda1-c8e9-4fac-8213-7c22950d9ac4)

## Licenses
https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/LICENSE

## Examples
Interacting with the ERC-20 Token:

const Web3 = require('web3');
const web3 = new Web3('NODE_URL');

const customTokenContractAddress = '0xYOUR_CONTRACT_ADDRESS';
const customTokenContract = new web3.eth.Contract(CustomToken.abi, customTokenContractAddress);

// Example: Get balance of an address
const addressToCheck = '0xADDRESS_TO_CHECK';
const balance = await customTokenContract.methods.balanceOf(addressToCheck).call();
console.log(`Balance of ${addressToCheck}: ${balance} Custom Tokens`);

// Example: Transfer tokens
const recipientAddress = '0xRECIPIENT_ADDRESS';
const amountToSend = web3.utils.toWei('10', 'ether'); // Assuming 18 decimals
const transferTx = await customTokenContract.methods.transfer(recipientAddress, amountToSend).send({ from: '0xYOUR_SENDER_ADDRESS' });
console.log(`Transaction Hash: ${transferTx.transactionHash}`);

Viewing Transaction Information:

// Example: Get the timestamp of the latest transaction
const latestTimestamp = await customTokenContract.methods.getLatestTransactionTimestamp().call();
console.log(`Latest Transaction Timestamp: ${latestTimestamp}`);

// Example: Get the sender and receiver addresses of the latest transaction
const senderAddress = await customTokenContract.methods.getTransactionSender().call();
const receiverAddress = await customTokenContract.methods.getTransactionReceiver().call();
console.log(`Sender Address: ${senderAddress}`);
console.log(`Receiver Address: ${receiverAddress}`);

