// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Task_12 {
   address public owner;


   constructor() {
       owner = msg.sender;
   }


   // Пример 6: Функции с модификаторами view и pure
   // pure — функция не читает и не изменяет состояние
   // view — функция читает, но не изменяет состояние
   // payable — функция может принимать эфир (здесь не используется)
   // Функция умножает число на 2
   function multiply(uint256 _value) public pure returns (uint256) {
       return _value * 2;
   }

   function multiplyByThree(uint256 _value) public pure returns (uint256) {
        return _value * 3;
   }
}
