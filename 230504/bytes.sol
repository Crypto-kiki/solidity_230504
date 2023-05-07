// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

/* 실습가이드
- d 없이
1. 0x10, 0x11, 0x12 넣어서 setABC 해보기 -> 오류 확인 incorrect data length
2. 0x10, 0x11, 0x0012 넣어서 setABC 해보기
3. getABC 결과 확인

- d 포함 후
1. 0xa665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3, 0x11, 0x1234, 0xa665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3 넣어서 setABCD 해보기
2. getABCD 결과 확인
3. 0xa665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3, 0x11, 0x1234, 0xa665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3 넣어서 setABCD 해보기
4. getABCD 결과 확인
*/

contract BYTES {
    bytes a;  // 사실상 무한정-> 자리수 동적
    bytes1 b;  // 1byte = 8 bit = 16진수 2자리
    bytes2 c;  // 자리수 정적 -> 16진수 4자리
    bytes32 d;  // 자리수 정적 -> 16진수 64자리

    // bytes 에만 memory를 붙이는 이유는, bytes1(8비트=2자리), bytes2(16비트=4자리) ... 은 용량이 정해져 있기 때문.
    // bytes, string, mapping 얘네는 얼마만큼 들어올지 모르기 때문에 최대한 준비해둠.
    function setABC(bytes memory _a, bytes1 _b, bytes2 _c, bytes32 _d) public {
        a = _a;
        b = _b;
        c = _c;
        d = _d;
    }

    // function setABC2(bytes memory _a, bytes1 _b, bytes2 _c, bytes memory _d) public {
    //     a = _a;
    //     b = _b;
    //     c = _c;
    //     d = _d;  // 에러발생 : bytes3은 8자리, bytes는 64자리. 하나는 정적, 하나는 동적 자리수이기 때문에 에러발생.
    // }

    function getABC() public view returns(bytes memory, bytes1, bytes2, bytes32) {
        return(a, b, c, d);
    }

    // uint256 은 uint로 사용해도 됐었음.
    // 하지만 bytes 같은 경우는, bytes != bytes3 임. uint는 자리수가 동적으로 적용되지만, bytes3은 정적으로 정해져있음.
}