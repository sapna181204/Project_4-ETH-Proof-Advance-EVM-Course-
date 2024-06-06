# Project_4-ETH-Proof-Advance-EVM-Course-
# ETH Proof: Advance EVM Course
# Project 4 
/*
1. Create Solidity contracts for creating smart contract wallets.
2. Use the reference of EIP-4337 to create new structs that facilitate user operations with this wallet.
3. Create a small front-end page where we can see the balance of a user/address.
*/





// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol"; //import IERC20

contract SmartWallet {                                  //new contract created named SmartWallet
    address public owner;                               //store the address of the contract owner
    
    constructor() {                                     //contructor
        owner = msg.sender;                             //store owner's address
    }

    function transfer(address token, uint amount) external {               
        require(msg.sender == owner, "Only owner can transfer funds");     //checks if caller of function is contract owner
        require(IERC20(token).transfer(owner, amount), "Transfer failed"); //transfers tokens to owner's address
    }

    function getBalance(address token) external view returns (uint) {
        return IERC20(token).balanceOf(address(this));                  //returns balance of specified ERC20 token held by contract itself.
    }
}

# README.txt
REMIX DEFAULT WORKSPACE

Remix default workspace is present when:
i. Remix loads for the very first time 
ii. A new workspace is created with 'Default' template
iii. There are no files existing in the File Explorer

This workspace contains 3 directories:

1. 'contracts': Holds three contracts with increasing levels of complexity.
2. 'scripts': Contains four typescript files to deploy a contract. It is explained below.
3. 'tests': Contains one Solidity test file for 'Ballot' contract & one JS test file for 'Storage' contract.

SCRIPTS

The 'scripts' folder has four typescript files which help to deploy the 'Storage' contract using 'web3.js' and 'ethers.js' libraries.

For the deployment of any other contract, just update the contract's name from 'Storage' to the desired contract and provide constructor arguments accordingly 
in the file `deploy_with_ethers.ts` or  `deploy_with_web3.ts`

In the 'tests' folder there is a script containing Mocha-Chai unit tests for 'Storage' contract.

To run a script, right click on file name in the file explorer and click 'Run'. Remember, Solidity file must already be compiled.
Output from script will appear in remix terminal.

Please note, require/import is supported in a limited manner for Remix supported modules.
For now, modules supported by Remix are ethers, web3, swarmgw, chai, multihashes, remix and hardhat only for hardhat.ethers object/plugin.
For unsupported modules, an error like this will be thrown: '<module_name> module require is not supported by Remix IDE' will be shown.


