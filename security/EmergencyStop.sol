pragma solidity ^ 0.5.1;

contract EmergencyStop {
  bool public contractStopped = false;
  address public owner;

  constructor() public {
    owner = msg.sender;
  }
  modifier onlyOwner() {
    require(owner == msg.sender);
    _;
  }

  modifier haltInEmergency {
    if (!contractStopped) _;
  }

  modifier enableInEmergency {
    if (contractStopped) _;
  }

  function toggleContractStopped() public onlyOwner {
    contractStopped = !contractStopped;
  }

  function deposit() public payable haltInEmergency {
    // some code
  }

  function withdraw() public view enableInEmergency {
    // some code
  }
}