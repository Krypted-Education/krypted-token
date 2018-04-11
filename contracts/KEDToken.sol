pragma solidity ^0.4.21;

import "./MintableToken.sol";

contract KEDToken is MintableToken {
    string public name = "Krypted Token";
    string public symbol = "KED";
    uint8 public decimals = 18;
    
    function KEDToken(uint256 _totalSupply) public {
        totalSupply_ = _totalSupply * 10 ** uint(decimals);
        balances[owner] = totalSupply_;
        Transfer(address(0), owner, _totalSupply);
    }
}