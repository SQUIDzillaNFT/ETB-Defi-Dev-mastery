pragma solidity 0.7.3;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract token1 is ERC20 {
    constructor() ERC20('name', 'ticker') {}
}

contract token2 is ERC20 {
    constructor() ERC20('name', 'ticker') {
        _mint(msg.sender, 100000);
    }
}

contract token3 is ERC20 {
    address public admin;

    constructor() ERC20('name', 'ticker') {
       admin = msg.sender;
    }

    function mint(address to, uint amount) external {
        require(msg.sender == admin, "only admin");
        _mint(to, amount);
    }
}

contract token4 is ERC20 {

    constructor() ERC20('name', 'ticker') {
       admin = msg.sender;
    }

    function faucet(address to, uint amount) external {
        _mint(to, amount);
    }
}
