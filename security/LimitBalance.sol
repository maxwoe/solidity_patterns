pragma solidity ^ 0.5.1;

contract LimitBalance {
  uint256 public limit;

  constructor(uint256 value) public {
    limit = value;
  }

  modifier limitedPayable() {
    require(address(this).balance <= limit);
    _;
  }

  function deposit() public payable limitedPayable {
    // some code
  }
}