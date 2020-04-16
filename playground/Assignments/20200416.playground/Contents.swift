import UIKit


//1. 옵셔널 타입의 문자열 파라미터 3개를 입력받은 뒤, 옵셔널을 추출하여 Unwrapped 된 하나의 문자열로 합쳐서 반환하는 함수

func combineString(str1: String?, str2: String?, str3: String?) -> String {
    
    var Value = " "
    if let someValue = str1 {
        Value += someValue
    }
    if let someValue = str2 {
        Value += someValue
    }
    if let someValue = str3 {
        Value += someValue
    }
    return Value
}
print(combineString(str1: "AB", str2: "CD", str3: "EF"))


//combineString1(str1: "AB", str2: "CD", str3: "EF")   // "ABCDEF"
//combineString1(str1: "AB", str2: nil, str3: "EF")    // "ABEF"


//2. 사칙연산(+, -, *, /)을 가진 enum 타입 Arithmetic과 2개의 자연수를 입력 파라미터로 받아 (파라미터 총 3개) 해당 연산의 결과를 반환하는 함수 구현
enum Arithmetic {
    case addition, subtraction, multiplication, division
}
//return

func calcFunc(x: Int, y: Int, z: Arithmetic )-> Int {
    
    switch z {
    case .addition:
       return x + y
    case .division:
        return x - y
    case .multiplication :
        return x * y
    case .subtraction :
        return x / y
    }
}
calcFunc(x: 3, y: 4, z: .division)




//
//[ 도전 과제 ]
//1. celcius, fahrenheit, kelvin 온도 3가지 케이스를 가진 enum 타입 Temperature 를 정의
//각 케이스에는 Double 타입의 Associated Value 를 받도록 함

//추가로 Temperature 타입 내부에 각 온도를 섭씨 온도로 변환해주는 toCelcius() 함수를 구현
//섭씨 = (화씨 - 32) * 5 / 9
//섭씨 = 켈빈 + 273


enum Temperature {
    case celcius(Double), fahrenheit(Double), kelvin(Double)
    
    func toCelcius() -> Double {
        
        switch self {
        case .celcius(let clec):
            return clec
        case .fahrenheit(let clec):
            return (clec - 32) * 5 / 9
        case .kelvin(let clec):
            return clec + 273
}
}
}
var boots: Temperature = .fahrenheit(4.5)

boots.toCelcius()




//enum Temperature {
//    case celcius(Double), fahrenheit(Double), kelvin(Double)
//
//
//    func toCelcius()-> Double {
//        switch self {
//        case .celcius(let calc):
//            return calc
//        case .fahrenheit(let calc):
//            return (calc - 32) * 5 / 9
//        case .kelvin(let calc):
//            return (calc + 273)
//        }
//    }
//}
//
//var boots: Temperature = .fahrenheit(4.5)
//
//boots.toCelcius()


