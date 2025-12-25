// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Task_07 {
   // Владелец контракта — адрес, который развернул контракт
   address public owner;


   constructor() {
       owner = msg.sender;
   }


   // Пример: Преобразование числа в массив байтов
   // abi.encodePacked упаковывает данные в компактный байтовый массив
   function getBytes(uint256 _value) public pure returns (bytes memory) {
       return abi.encodePacked(_value);
   }

   function getBytesFromString(string memory _value) public pure returns (bytes memory) {
        return bytes(_value);
   }
}
