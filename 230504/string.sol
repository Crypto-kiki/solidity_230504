// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract StringAndBytes {
    string a;

    function setString(string memory _a) public {
        a = _a;
    }

    function getString() public view returns(string memory) {
        return a;
    }

    // string을 bytes로 변경하는 방법
    function stringToBytes() public view returns(bytes memory) {
        return bytes(a);
    }
    // setString에 abc를 넣고 stringToBytes()함수를 실행하면,     0: bytes: 0x616263 아스키 코드로 표현됨


    // string을 bytes로 변경하는 방법
    function stringToBytes2() public view returns(bytes1, bytes1, bytes1) {
        return (bytes(a)[0], bytes(a)[1], bytes(a)[2]);
    }
    /* setString에 abc를 넣고 stringToBytes()함수를 실행하면,
    0:
    bytes1: 0x61
    1:
    bytes1: 0x62
    2:
    bytes1: 0x63
    */


    function bytesToString(bytes memory _a) public pure returns(string memory) {
        return string(_a);
    }


    // 어떤 문자열을 넣었을 때, 첫 번째 문자를 알고싶을 경우! (예시 : _a = abc를 넣었는데 a라는 결과값을 얻고싶음).
    function bytesToString2(string memory _a) public pure returns(bytes1) {
        bytes memory _b;  // bytes형 변수 _b 선언
        _b = bytes(_a);
        return _b[0];
    }
    // 만약 returns에 bytes memory를 썼다면 에러가 발생함. 이유는 bytes memory는 동적이고, 함수 내의 return 값은 정적이기 때문.


    /* function bytesToString3(string memory _a) public pure returns(string memory) {
         bytes memory _b;  // bytes형 변수 _b 선언
         _b = bytes(_a);
         return string( _b[0]);  // 에러발생함 : string은 동적인데 안의 _b[0]은 정적임.
     } */

    
    // string이 동적이니 끝까지 동적으로 가는게 중요함!!
     function bytesToString3(string memory _a) public pure returns(string memory) {
        bytes memory _b = new bytes(1);  // bytes는 동적임. bytes(1)은 한자리를 의미함. 단, 필요에 따라서 bytes1, 2, ... 될 수 있다는것임.(스스로 변하는게 아닌 따로 코드를 작성할 수 있다는 것임)
        _b[0] = bytes(_a)[0];
        return string(_b);
    }

    function bytesToString4(string memory _a, uint _n) public pure returns(string memory) {
        bytes memory _b = new bytes(1);
        _b[0] = bytes(_a)[_n - 1];
        return string(_b);
    }
}


// array = 같은 자료형들이 들어있는 집합.
contract Array_uint {
    uint[] number = [1, 2, 3, 4, 5];
    uint [] numbers;  // 자료형 [] array이름

    // 1. 넣기 (push)
    function push(uint _a) public {
        numbers.push(_a);
    }

    // 2. 빼기 (pop)
    function pop() public {
        numbers.pop();
    }

    // 3. 보기 : 몇 번째에 누가 있는지?
    function getNumber(uint _n) public view returns(uint) {
        return numbers[_n - 1]; // 배열이름[_n번째]
    }
    
    // 4. 길이
    function getLength() public view returns(uint) {
        return numbers.length; //배열이름.길이
    }

    // 5. 바꾸기 : _k 번째를 _z로 바꾸기
    function changeNum(uint _k, uint _z) public {
        numbers[_k - 1] = _z;
    }

    // 6. delete : _n 번째 요소를 초기화 시킴. 하지만 0으로 나옴. 이유는 uint; 초기값은 0이기 때문!!!! 배열의 길이는 안변함.
    function deleteNum(uint _n) public {
        delete numbers[_n - 1];
    }

    // 7. 전체 array 반환 : memory를 붙여줘야 함. 왜냐하면 리턴값의 크기를 모르기 때문임.
    function returnArray() public view returns(uint[] memory) {
        return numbers;
    }

}



contract Array_string {
    // array = 같은 자료형들이 들어있는 집합
    string[] letters; // 자료형 [] array 이름

    // 1. 넣기
    function push(string memory _a) public {
        letters.push(_a); // 배열이름.push(변수)
    }

    // 2. 빼기
    function pop() public {
        letters.pop(); // 배열이름.pop(), 맨뒤의 숫자를 날림
    }

    // 3. 보기
    function getLetter(uint _n) public view returns(string memory) {
        return letters[_n-1]; // 배열이름[_n번째]
    }

    // 4. 길이
    function getLength() public view returns(uint) {
        return letters.length; //배열이름.길이
    }

    // 5. 바꾸기
    function changeLet(uint _k, string memory _z) public {
        letters[_k-1] = _z; //배열이름[_k번째] = _z -> _k번째를 _z로 바꿔
    }

    // 6. delete 
    function deleteLet(uint _n) public {
        delete letters[_n-1]; // delete 배열이름[_n번째] = _n번째 숫자를 없애줘
    }

    //7. 전체 array 반환
    function returnArray() public view returns(string[] memory) {
        return letters;
    }
}


// 구조체 : 서로 다른 형태의 자료형이 같이 들어갈 수 있음.
contract Struct {
    struct Student {
        string name;
        string gender;
        uint number;
        uint birthday;
    } 
    /* 구조체 선언 
    struct 구조체명 {
        .../
        .../
        ...
    }
    */

    Student s; // Student형 변수 s
    Student[] students; //Student형 변수들의 array students

    function setStudentS(string memory _name, string memory _gender, uint _number, uint _birth) public {
        s = Student(_name, _gender, _number, _birth);
    }

    function getStudentS() public view returns(Student memory) {
        return s;
    }

    function pushStudent(string memory _name, string memory _gender, uint _number, uint _birth) public {
        students.push(Student(_name, _gender, _number, _birth)); // 배열명.push(구조체명(구조체 정보들))
    }

    function popStudent() public {
        students.pop();
    }

    function getLength() public view returns(uint) {
        return students.length;
    }

    function getStudent(uint _n) public view returns(Student memory) {
        return students[_n-1];
    }

    function getStudents() public view returns(Student[] memory) {
        return students;
    }
}

// 함수명이 같아도 에러가 왜 안남? **  아웃풋은 상관없음. 이름과 인풋이 같으면 에러남. view/pure도 상관없음.
// EVM이 컴파일 때 기계어로 받아들이는데 구분할 때, 인풋값의 개수로 구분함. 인풋값이 0개인 같은 함수2개도 에러임.
// 생각해보면 함수명이 같다면 어떻게 다른지 구분하는 기준이 인풋값밖에 없긴함!
contract Errors {
    uint a;

    function add(uint _a, uint _b) public pure returns(uint) {
        return _a+_b;
    }

    /*
    function add(uint _a, uint _b) public returns(uint) {
        a = a + _a + _b;
        return a;
    }

    function add(uint _a, uint _b) public view returns(uint) {
        return a+_a+_b;
    }

    function add(uint _a, uint _c) public pure returns(uint) {
        return _a+_c;
    }

    function add(uint _a, uint _b) public pure returns(uint, uint) {
        return (_a+_a, _a+_b);
    }
    */

    function add(uint _a, uint _b, uint _c) public pure returns(uint) {
        return _a+_b+_c;
    }

    function add2() public pure returns(uint) {
        uint c = 5;
        uint d = 7;
        return c+d;
    }

}