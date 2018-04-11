pragma solidity ^0.4.21;

import "zeppelin-solidity/contracts/ownership/Ownable.sol";

/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract OwnedByContract is Ownable{
    address public ownerContract;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
    * @dev Throws if called by any account other than the owner.
    */
    modifier onlyOwnerContract() {
        require(msg.sender == ownerContract);
        _;
    }

    /**
    * @dev Allows the current owner to set the minter contract to a new smart contract.
    * @param newOwner The address to set the minter. Throws an error if the address is an EOA.
    */
    function setMinterContract(address newOwner) public onlyOwner {
        require(newOwner != address(0));
        require(isContract(newOwner));
        emit OwnershipTransferred(ownerContract, newOwner);
        ownerContract = newOwner;
    }

    /**
    * @dev Checks if the address is a smart contract.
    * @param addr The address that required to be checked.
    * @return True if the account in the address is a smart contract, False if the address is an EOA.
    */
    function isContract(address addr) internal view returns (bool) {
        uint size;
        assembly { 
          size := extcodesize(addr)
        }
        return size > 0;
    }

}