pragma solidity ^0.4.21;

import "./MintableToken.sol";

contract KEDToken is MintableToken {
    string public name = "KED Token";
    string public symbol = "KED";
    uint8 public decimals = 18;
    
    address private constant COMPANY_ADDRESS = 0x5EE25f44f1BbC961f1a85E83Dfd874588D47Cf56;
    address private constant REWARDS_ADDRESS = 0x364c74d196f04A6C3245B6Dab4E3ffEd73e1d49c;
    address private constant ADVISORS_ADDRESS = 0xdcf8c005a59Fdd3C234e678E1D73fbefF5168266;
    address private constant TEAM_ADDRESS = 0xDDfb1cf29156Fee19749a43305e7fda4B6D5ed24;
    address private constant PRE_ICO_ADDRESS = 0xaDceab807a8266E17bDfb80a183f203d719fD022;
    address private constant ICO_ADDRESS = 0x11c1696d460d71b7A8B3571b7A9967539e69bEa2;
    
    uint256 private constant COMPANY_AMOUNT = 66000000;
    uint256 private constant REWARDS_AMOUNT = 30000000;
    uint256 private constant ADVISORS_AMOUNT = 21000000;
    uint256 private constant TEAM_AMOUNT = 33000000;
    uint256 private constant PRE_ICO_AMOUNT = 50000000;
    uint256 private constant ICO_AMOUNT = 100000000;
    uint256 private constant SUPPLY_AMOUNT = 300000000;
    
    function KEDToken() public {
        uint256 decimalPlace = 10 ** uint(decimals);
        
        totalSupply_ = SUPPLY_AMOUNT * decimalPlace;
        
        initialTransfer(COMPANY_ADDRESS, COMPANY_AMOUNT, decimalPlace);
        initialTransfer(REWARDS_ADDRESS, REWARDS_AMOUNT, decimalPlace);
        initialTransfer(ADVISORS_ADDRESS, ADVISORS_AMOUNT, decimalPlace);
        initialTransfer(TEAM_ADDRESS, TEAM_AMOUNT, decimalPlace);
        initialTransfer(PRE_ICO_ADDRESS, PRE_ICO_AMOUNT, decimalPlace);
        initialTransfer(ICO_ADDRESS, ICO_AMOUNT, decimalPlace);
    }
    
    /**
    * @dev Function Transfers the funds to accounts described in the whitepaper.
    */
    function initialTransfer(address _to, uint256 _amount, uint256 _decimalPlace) private { 
        balances[_to] = _amount.mul(_decimalPlace);
        Transfer(address(0), _to, balances[_to]);
    }
}