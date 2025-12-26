// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Task_10 {
   address public owner;


   constructor() {
       owner = msg.sender;
   }


   // Пример 4: Работа с временными метками (timestamps)
   // block.timestamp — текущая временная метка блока (секунды с 1970 года)
   // Функция проверяет, является ли переданная метка будущей
   function isFutureTimestamp(uint256 _timestamp) public view returns (bool) {
       return _timestamp > block.timestamp;
   }

   function isPastTimestamp(uint256 _timestamp) public view returns (bool) {
       return _timestamp < block.timestamp;
   }
}
