pragma solidity ^0.5.0;

contract Sender {
  
  uint256 public saldo = 0;
  
  event Enviou(address, address, uint256);  
  event Saldo(uint256);
  
  /* 
  function send(address payable _receiver) payable public {
    _receiver.transfer(msg.value);
    emit Enviou(msg.sender, _receiver, msg.value);
  }
  */
  
  function () payable external {
      saldo = msg.value;
      emit Saldo(saldo);
  }
  
  function enviar(address payable to, uint256 valueInWei) public {
    require(to != address(0x0));
    require(to != address(this));
    require (address(this).balance >= valueInWei);
    address from = msg.sender;
		
 	  to.transfer(valueInWei);

    emit Enviou(from, to, valueInWei);
  }
  
  function emiteSaldo() public {
      emit Saldo(saldo);
  }

}
