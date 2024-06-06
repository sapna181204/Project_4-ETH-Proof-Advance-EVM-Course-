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
