pragma solidity ^0.5.9;

import "openzeppelin-solidity/contracts/token/ERC20/BurnableToken.sol";
import "openzeppelin-solidity/contracts/token/ERC20/StandardToken.sol";
import "openzeppelin-solidity/contracts/ownership/Claimable.sol";

contract ZeroCarbon is StandardToken, Claimable, BurnableToken {
    using SafeMath for uint256;

    string public constant name = "Carbon Neutral";
    string public constant symbol = "Cnnn"; 
    uint8 public constant decimals = 16; 

    uint256 public constant INITIAL_SUPPLY = 240000000 * (10 ** uint256(decimals));

    constructor () public {
        totalSupply_ = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;
        emit Transfer(0x0, msg.sender, INITIAL_SUPPLY);
    }

    function transferAnyERC20Token(address tokenAddress, uint tokens) public onlyOwner returns (bool success) {
        return ERC20Basic(tokenAddress).transfer(owner, tokens);
    }  
}
