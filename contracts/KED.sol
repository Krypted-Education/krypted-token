pragma solidity ^0.4.19;

import "./MintableToken.sol";

contract KEDToken is MintableToken {
    string public name = "Krypted Token";
    string public symbol = "KED";
    uint8 public decimals = 18;
}