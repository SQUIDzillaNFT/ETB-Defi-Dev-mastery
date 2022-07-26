pragma solidity 0.7.3;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract Weth is ERC20 {
    constructor () ERC20 ('wrapped ether', 'weth') {

        function deposit() external payable {
            _mint(msg.sender, msg.value);
        }

        function withdrawl(uint amount) external {
            require(balanceOf(msg.sender) >= amount, "balance too low");
            _burn(msg.sender, amount);
            msg.sender.transfer(amount);
        }
    }
}