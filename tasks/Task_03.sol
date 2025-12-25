contract Task_03 {
   struct Person {
       string name;
       uint8 age;
   }


   Person[] public people; // Массив структур


   function addPerson(string memory _name, uint8 _age) external {
       people.push(Person(_name, _age)); // Добавление новой структуры в массив
   }

   function getUser(uint index) public view returns (string memory, uint) {
        return (people[index].name, people[index].age);
   }
}
