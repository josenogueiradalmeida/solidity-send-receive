pragma solidity ^0.5.0;

contract Sender {
  
  event Enviou(address, address, uint);
    
  function send(address payable _receiver) payable public {
    _receiver.transfer(msg.value);
    emit Enviou(msg.sender, _receiver, msg.value);
  }
  
}
