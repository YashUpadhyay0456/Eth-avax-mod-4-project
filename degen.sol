// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";


contract Degentoken is ERC20,ERC20Burnable {
    address private owner;
    uint redeemAmount;

    constructor() ERC20("Degen", "DGN") {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Access denied you are not the owner");
        _;
    }

    function transferTokens(address _reciever_add, uint amount) external{
            require(balanceOf(msg.sender) >= amount, "Low Balance");
            approve(msg.sender, amount);
            transferFrom(msg.sender, _reciever_add, amount);
        }

    function mint(address _address, uint256 amount) public onlyOwner {
        _mint(_address, amount);
    }
    function item_list() public pure returns (string memory) {
        return "1. BattlePass value = 10\n 2.customSKin value = 25\n 3. mystryBox value = 50\n 4. GameCash value = 100\n 5. Degen T-shirt = 200 ";
    }
    function redeemTokens(uint itemCode) external {
        require(itemCode >= 1 , "Please select a number greater than one");

        if (itemCode == 1)
        {
            redeemAmount = 10;
        } 

        else if (itemCode == 2) 
        {
            redeemAmount = 25;
        } 

        else if(itemCode == 3) 
        {
            redeemAmount = 50;
        }

        else if(itemCode == 4) 
        {
            redeemAmount = 75;
        }

        else if(itemCode == 5) 
        {
            redeemAmount = 100;
        }


        require(balanceOf(msg.sender) >= redeemAmount, "need to earn more tokkens to redeem this item");
        _burn(msg.sender, redeemAmount);
    }
    function Balance() external view returns (uint256) 
    { 
        return this.balanceOf(msg.sender);
    }

    function burntoken(uint256 amount) public {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        _burn(msg.sender, amount);
    }
}
