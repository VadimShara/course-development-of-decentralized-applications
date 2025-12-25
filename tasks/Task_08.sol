// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Task_08 {
   address public owner;


   constructor() {
       owner = msg.sender;
   }


   // Пример 2: Работа с динамическим массивом байтов
   // Функция возвращает длину массива
   function getDynamicByteArrayLength(bytes memory _data) public pure returns (uint256) {
       return _data.length;
   }

   function getDynamicByteArrayElement(bytes memory data, uint index)
    public
    pure
    returns (bytes1)
{
    require(index < data.length, "Index out of bounds");
    return data[index];
}
}
