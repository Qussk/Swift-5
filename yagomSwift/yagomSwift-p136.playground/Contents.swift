import UIKit

//for..in 구문
//code 6-1 : if 구문 기본구현

let firest: Int = 5
let second: Int = 7

if firest > second {
    print("first > second")
} else  if firest < second {
    print("first < second")
} else {
    print("firest == second")
}
//first < second


//code 6-2-1 : if 구문의 다양한 구현(소괄호가 없는 코드)

let firest1: Int = 5
let second1: Int = 5
var biggerValue: Int = 0

if firest1 > second1 {
    biggerValue = firest1
} else if firest1 == second1 {
    biggerValue = second1
} else if firest1 == 5 {
    biggerValue = 100
//조건을 충족하더라도 이미 위의 firest1 > second1라는 조건을 충족하여 실행되지 않음. firest1 > second1만 실행됨.
}
print(biggerValue) //5


//code. 6-2-2 : if 구문의 다양한 구현(소괄호가 있는 코드)

let firest2: Int = 5
let second2: Int = 5
var biggerValue2: Int = 0

if (firest2 > second2) { //조건 수식을 소괄호로 묶는 것은 선택사항임.
biggerValue2 = firest2
} else if (firest2 < second2) {
    biggerValue2 = firest2
} else if (firest2 == 5) {
    biggerValue2 = 100
//조건을 충족하더라도 이미 위의 firest1 > second1라는 조건을 충족하여 실행되지 않음. firest1 > second1만 실행됨.
}
print(biggerValue2) //5


//switch 구문
// code. 6-3 : switch 구문 기본구현

let integerValue: Int = 5

switch integerValue {
case 0:
    print("Value == zero")
case 1...10:
    print("Value == 1~10")
    fallthrough// 다음 명령어 조건과 관계없이 실행 (fallthrough ~ break)
case Int.min..<0, 101..<Int.max:
    print("Value < 0 or Value > 100")
    break // 실행 종료
default:
    print("10 < Value <= 100")
}
//Value == 1~10
//Value < 0 or Value > 100



//code. 6-4 부동소수 타입의 범위연산을 통한 switch case구성.

let doubleValue: Double = 3.0

switch doubleValue {
case 0:
    print("0입니다.")
case 1.5...10.5:
    print("1.5 >= Value <= 10.5")
default:
    print("Value == \(doubleValue)")
}
//1.5 <= value <= 10.5





