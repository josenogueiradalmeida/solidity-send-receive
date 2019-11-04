pragma solidity ^0.5.0;

contract Receiver {
  uint public balance = 0;
  
  event Recebeu(address, address, uint);
  
  function () payable external {
    emit Recebeu(msg.sender, address(this), msg.value);
  }
}