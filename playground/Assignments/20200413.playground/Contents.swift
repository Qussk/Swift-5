import UIKit


//Practice
// #### Conditional Statements
// 1. 학점을 입력받아 각각의 등급을 반환해주는 함수 (4.5 = A+,  4.0 = A, 3.5 = B+ ...)


func levelTest1(x: Double) -> String {
    switch x {
    case 4.5:
        return "A+"
    case 4.0...4.5:
        return "A"
    case 3.5...4.0:
        return "B+"
    case 3.0...3.5:
        return "B"
    case 2.5...3.0:
        return "C"
    default:
        return "F"
    }
}
print("\(levelTest1(x: 3.4))")

//2. 특정 달을 숫자로 입력 받아서 문자열로 반환하는 함수 (1 = "Jan" , 2 = "Feb", ...)
func userCalendar(x: Int) -> String {
    switch x {
    case 1:
        return "Jan"
    case 2:
        return "Feb"
    case 3:
        return "Mar"
    case 4:
        return "Apr"
    case 5:
        return "May"
    case 6:
        return "Jun"
    case 7:
        return "Jul"
    case 8:
        return "Aug"
    case 9:
        return "Sep"
    case 10:
        return "Oct"
    case 11:
        return "Nov"
    case 12:
        return "Dec"
    default:
        return "해당없음"
    }
}
print(userCalendar(x: 3))


// 3. 세 수를 입력받아 세 수의 곱이 양수이면 true, 그렇지 않으면 false 를 반환하는 함수((switch where clause 를 이용해 풀어볼 수 있으면 해보기))


func abc(a: Int, b:Int, c:Int) -> Bool {
    switch (a, b, c) {
    case let (a, b, c) where (a * b * c) > 0 :
        return true
    default:
        return false
}

}
print(abc(a: 3, b: 5, c: 6))



//### Loops
//1. 자연수 하나를 입력받아 그 수의 factorial을 구하는 함수

func factorial(x: Int) -> Int {
var result = 1

    for data in 1...x {
        result *= data
    }
    return result
}
print(factorial(x: 4))


// 2. 자연수 두 개를 입력받아 첫 번째 수를 두 번째 수만큼 제곱하여 반환하는 함수
func inLoops(x: Int, y: Int) ->Int {
    var insert = 1 //곱해야하니까 0으로 두면 안됨
    
    for _ in 1...y {
        insert *= x
    }
return insert
}
print(inLoops(x: 2, y: 3))


//3. 자연수 하나를 입력받아 각 자리수 숫자들의 합을 반환해주는 함수
func inLoop(x: Int)-> Int {
    var insert1 = 0
    var tempIndex = x

    while tempIndex > 0 {
       insert1 += (tempIndex % 10)
       tempIndex /= 10
    }
return insert1
}
print(inLoop(x: 343))



// #### Control Transfer
// 1. 자연수 하나를 입력받아 1부터 해당 숫자 사이의 모든 숫자의 합을 구해 반환하는 함수를 만들되, 그 합이 2000 을 넘는 순간 더하기를 멈추고 바로 반환하는 함수

func inTransfer(x: Int) -> Int {
   var some = 0
    for data in 0...x{
    some += data
        if some > 2000 {
            return some
        }
    }
return some
}
print(inTransfer(x: 4))


// 2. 1 ~ 50 사이의 숫자 중에서 20 ~ 30 사이의 숫자만 제외하고 그 나머지를 모두 더해 출력하는 함수

func userNumber(x:Int)-> Int {
    var number = 1
    for data in 1...50 {
        if (20...30) ~= number {
        continue
        }
        number += data
    }
return number
}
    print(userNumber(x: 40))



