pragma solidity 0.7.3;

import '@openzeppelin/contracts/token/ERC20/IERC20.sol';

interface ContractB {
    function deposit(uint amount) external;
    function withdrawl(uint amount) external;
}

contract ContractA {
    IERC20 public token;

    constructor(address _token) {
        token = IERC20(_token);
    }

    function deposit(uint amount) external {
        token.transferFrom(msg.sender, address(this), amount);
        token.approve(address(contractB), amount);
        contractB.deposit(amount);

    }

    function withdrawl(uint amount) external {
        contractB.withdrawl(amount);
        token.transfer(msg.sender, amount);
    }
}