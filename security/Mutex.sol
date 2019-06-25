pragma solidity ^ 0.5.1;

contract Mutex {
  bool locked;

  modifier noReentrancy() {
    require(!locked);
    locked = true;
    _;
    locked = false;
  }

  // f is protected by a mutex, thus reentrant calls
  // from within msg.sender.call cannot call f again
  function f() noReentrancy public returns(uint) {
    (bool success, ) = msg.sender.call("");
    require(success);
    return 1;
  }
}