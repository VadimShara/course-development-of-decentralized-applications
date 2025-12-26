// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract ExampleUsage {
   // Пример использования assert
   function assertExample(uint256 _value) public pure {
       // Исправление: проверяем, что _value не равен нулю
       assert(_value != 0);
   }


   // Пример использования revert
   function revertExample(bool _condition) public pure {
       // Исправление: добавляем revert с сообщением "Invalid condition" если _condition == false
       if (_condition == false) {
           revert("Invalid condition");
       }
   }


   // Пример использования if-else
   function ifElseExample(uint256 _value) public pure returns (string memory) {
       // Исправление: добавляем ветку else
       if (_value > 10) {
           return "Value is greater than 10";
       } else {
           return "Value is 10 or less";
       }
   }


   // Пример использования else if
   function elseIfExample(uint256 _value) public pure returns (string memory) {
       // Исправление: заменяем = на ==
       if (_value > 10) {
           return "Value is greater than 10";
       } else if (_value == 10) {
           return "Value is exactly 10";
       } else {
           return "Value is less than 10";
       }
   }


   // Пример использования тернарного оператора
   function ternaryExample(uint256 _value) public pure returns (string memory) {
       // Исправление: переписываем с использованием if-else
       if (_value > 10) {
           return "Value is greater than 10";
       } else {
           return "Value is 10 or less";
       }
   }
}
