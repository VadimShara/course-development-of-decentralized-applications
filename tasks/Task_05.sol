// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Task_05 {
   enum Status {
       Pending,
       Active,
       Inactive
   }


   Status public currentStatus; // Переменная типа Status


   function setStatus(Status _status) external {
       currentStatus = _status; // Установка текущего статуса
   }

   function getBalance() external view returns (Status) {
        return currentStatus;
   }
}
