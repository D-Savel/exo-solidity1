// SPDX-License-Identifier: MIT
// 0x4C1F048f3c70E7535295102a0ef940C98b7BdA2a

pragma solidity ^0.8.0;

contract SmartWallet {
    mapping(address => uint256) private _balances;
    
    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }
    
    function Deposit() public payable {
       _balances[msg.sender] += msg.value;
    }
    
    function withDrawAll() public {
        require(_balances[msg.sender] >0, "SmartWallet : can not withdraw 0 eth");
        uint256 amount = _balances[msg.sender];
        _balances[msg.sender]  = 0;
       payable (msg.sender).transfer(amount);
    }
       
     function withDrawAmount(uint256 drawAmount) public {
        require(_balances[msg.sender] > drawAmount, "SmartWallet : not enough eth for withdraw");
        uint256 amount = drawAmount;
        _balances[msg.sender] -= drawAmount;
       payable (msg.sender).transfer(amount);
      
    }
    
    function transfer(address account, uint256 amount) public {
        require(_balances[msg.sender] > amount, "SmartWallet : not enough eth for transfer");
        _balances[msg.sender] -= amount;
        _balances[account] += amount;
      
    }
    
    function total() public view returns(uint256) {
        return address(this).balance;
    }
    
}