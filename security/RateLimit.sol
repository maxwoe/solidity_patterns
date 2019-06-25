pragma solidity ^ 0.5.1;

contract RateLimit {
  uint enabledAt = now;

  modifier enabledEvery(uint t) {
    if (now >= enabledAt) {
      enabledAt = now + t;
      _;
    }
  }

  function f() public enabledEvery(1 minutes) {
    // some code
  }
}