// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Task_04 {
   mapping(address => uint256) public balances; // Маппинг адресов на балансы


   function setBalance(address _addr, uint256 _balance) external {
       balances[_addr] = _balance; // Установка баланса для указанного адреса
   }

   function getBalance(address _addr) external view returns (uint) {
        return balances[_addr];
   }

}
