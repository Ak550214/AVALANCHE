// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract GT is ERC20, Ownable, ERC20Burnable {
    event LogMessage(string message);

    constructor() ERC20("Degen", "DGN") {}

    // Minting new tokens
    function mint(address to, uint amount) external onlyOwner {
        _mint(to, amount);
    }

    // Transferring tokens
    function transferTokens(address _receiver, uint _value) external {
        require(balanceOf(msg.sender) >= _value, "INSUFFICIENT TOKENS!!");
        _transfer(msg.sender, _receiver, _value);
    }

    // Redeeming tokens for items
    function redeemForItem(uint256 itemNo) external {
        require(itemNo >= 1 && itemNo <= 3, "Invalid item number");
        
        uint256 amount = itemNo;
        _burn(msg.sender, amount);
        emit LogMessage("Redemption is successful");
    }

    // Checking token balance
    function getBalance() external view returns (uint256) {
        return balanceOf(msg.sender);
    }

    // Burning tokens
    function burnTokens(uint256 _value) external {
        require(balanceOf(msg.sender) >= _value, "INSUFFICIENT TOKENS!!");
        _burn(msg.sender, _value);
        emit LogMessage("Tokens burned successfully");
    }
}
