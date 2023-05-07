// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;
/*
실습가이드 1
10 넣어보기 -> 출력값 10
0x10 넣어보기 -> 출력값 16

실습가이드 2
setABCD에서 b에 256 넣어보기 -> b는 uint8 -> 2자리까지 -> 256은 100 -> 자리수 넘어감

실습가이드 3
setABCD에서 0x1234 모두 넣어보기 -> b는 uint8 -> 2자리까지 -> 256은 100 -> 자리수 넘어감
*/

pragma solidity ^0.8.18;

contract UNITBYTES {
    uint a;  
    uint8 b; // 1byte = 16진수 2자리까지 표현 가능함 (ff, 0 ~ 255)
    uint16 c;
    uint256 d;
    /* 모두 숫자형인데 용량이 다름.
    용량이 다르다 = 표현할 수 있는 최대값의 크기가 다르다.
    8bit = 1byte는 16진수를 2자리까지 쓸 수 있음.
    16진수 2자리에서 가장 큰 숫자는 ff = 다음 3자리 16진수 최소값은 100이기 때문에. 즉, 16진수 2자리에서 표현할 수 있는 최대 값은 255임.
    */ 

    function setABCD(uint _a, uint8 _b, uint16 _c, uint256 _d) public {
        a = _a;
        b = _b;
        c = _c;
        d = _d;
    }

    function setABCD2(uint _a, uint8 _b, uint16 _c, uint8 _d) public {
        a = _a;  // 들어온 것은 64자리, 들어온 것은 2자리 -> 문제 없음.
        b = _b;  // 준비한 것과 들어온 것 일치
        c = _c;  // 준비한 것은 4자리, 들어온 것은 2자리. -> 문제 없음
        d = _d;  // 준비한 것은 64자리, 들어온 것은 2자리. -> 문제 없음
    }

    /*
    function setABCD3(uint256 _a, uint256 _b, uint256 _c, uint256 _d) public {
        a = _a;
        b = _b; // uint8로 선언되었는데 들어오는 값은 더 큰 uint256
        c = _c; // uint16로 선언되었는데 들어오는 값은 더 큰 uint256
        d = _d;
    }
    */

    function getABCD() public view returns(uint, uint8, uint16, uint256) {
        return(a, b, c, d);
    }

    function getABCD2() public view returns(uint, uint, uint, uint) {
        return(a, b, c, d);
    }  // 위 함수는 문제없음.

    // function getABCD3() public view returns(uint8, uint8, uint8, uint8) {
    //     return(a, b, c, d);
    // }  // 원래 길이보다 더 길게 주어지면 상관없음. 위 함수에서 _c 는 uint16 (4자리)인데 uint8(2자리)로 아웃풋을 내려 하기 때문에 에러발생.(준비한 값의 일부 날아감) 

}