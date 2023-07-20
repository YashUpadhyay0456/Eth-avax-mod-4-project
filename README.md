# DegenToken Smart Contract

This is a custom ERC20 token smart contract called `DegenToken`, deployed on the Avalanche blockchain. The smart contract provides functionality for token transfers, minting, burning, and redeeming tokens for in-game items. It is designed to be used in Degen Gaming as a reward system for players. With this token, players can not only purchase items in the in-game store but also trnsfer token with other players, creating endless possibilities for growth and player retention.

## Token Details

- Name: Degen
- Symbol: DGN

## Tools Used

- Remix IDE: The smart contract was developed and tested using the Remix IDE, an online development environment for Solidity smart contracts.
- MetaMask: MetaMask was used to interact with the smart contract during testing and deployment. It provides a user-friendly interface to interact with Ethereum smart contracts.

## Contract Owner

The contract is owned by the deployer (creator) of the contract. The owner has special privileges, such as the ability to mint new tokens.

## Functions

### Transfer Tokens

Players can use the `transferTokens` function to transfer tokens to another player's address. This function requires the sender to have a sufficient token balance to perform the transfer.

```solidity
function transferTokens(address _reciever_add, uint amount) external {
    require(balanceOf(msg.sender) >= amount, "Low Balance");
    approve(msg.sender, amount);
    transferFrom(msg.sender, _reciever_add, amount);
}
```

### Mint Tokens

The contract owner can use the `mint` function to create and distribute new tokens to specific addresses.

```solidity
function mint(address _address, uint256 amount) public onlyOwner {
    _mint(_address, amount);
}
```

### Redeem Tokens

Players can use the `redeemTokens` function to redeem their tokens for in-game items. Players need to select an item code corresponding to the desired item, and the required amount of tokens will be burned from their balance.

```solidity
function redeemTokens(uint itemCode) external {
    // Item code selection and token burning logic here
}
```

### Burn Tokens

Players can use the `burntoken` function to burn their own tokens when they are no longer needed.

```solidity
function burntoken(uint256 amount) public {
    require(balanceOf(msg.sender) >= amount, "Insufficient balance");
    _burn(msg.sender, amount);
}
```

### Item List

The `item_list` function provides a description of in-game items that players can redeem using their tokens.

```solidity
function item_list() public pure returns (string memory) {
    return "1. BattlePass value = 10\n2. customSKin value = 25\n3. mystryBox value = 50\n4. GameCash value = 100\n5. Degen T-shirt = 200";
}
```

### Check Balance

Players can check their token balance using the `Balance` function.

```solidity
function Balance() external view returns (uint256) {
    return this.balanceOf(msg.sender);
}
```

## Ownership Management

The contract has a `onlyOwner` modifier that restricts certain functions to be accessible only by the contract owner (deployer).

## License

This smart contract is licensed under the MIT License. 


