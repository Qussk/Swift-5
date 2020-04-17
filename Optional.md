## Optional

## Optional Type Declaration

*기본형*

```
 var 변동이름 : 타입
 var 변동이름 : 옵셔널<타입>

```
```swift
//표현하는데에 2가지 방법이 있음.
var optionalType1: String?   // 자동 초기화 nil //값이 없는 것으로 초기화됨 var optionalType1: String = nil 과 동일
var optionalType2: Optional<Int> = nil   // 수동 초기화. (값 또는 nil)

optionalType1
type(of: optionalType1)
type(of: optionalType2)


// Valueless state - nil

var optionalIntInit = Optional<Int>(0)
var optionalInt: Int? = 0
type(of: optionalInt)

optionalInt = nil
optionalInt


// Optional -> NonOptional

//var nonOptional1 = nil
//var nonOptional2: Int = nil
//var nonOptionalType: Int = optionalInt



// Optional <- NonOptional

let nonOptional = 1
optionalInt = nonOptional
optionalInt = 100


// Optional -> NonOptional (X)
// Optional <- NonOptional (O)
// 옵셔 -> 논불가.
//논옵셔널을 옵셔널에 넣는것은 괜찮

// 각 타입이 가질 수 있는 값의 범위
// var nonOptionalNumber: Int    // 정수 가능
// var optionalNumber: Int?      // 정수 or nil 가능

```

## Optional Biding and Forced Unwrapping

```swift
var convertedNumber: Int? = 123

if convertedNumber != nil {
  // warning + Optional(123)
  print("convertedNumber has an integer value of \(convertedNumber).")
}
```

## Optional Binding

* 워닝제거, 옵셔널 쓰지않고 if문 안에서 다룰수 있게

*기본형*

```
 if let 논옵셔널 = 옵셔널표현 {
   실행코드
 //} else {
 //print("nill") 이런식으로
 
 while let 논옵셔널 = 옵셔널표현 {
   실행코드
 }
 guard let 논옵셔널 = 옵셔널표현  else {
   실행코드 
 }
```
```swift
let someValue = "100"

if let number = Int(someValue) {
  print("\"\(someValue)\" has an integer value of \(number)")
} else {
  print("Could not be converted to an integer")
}
//옵셔널 100 //값이 없으면 else, 값이 있으면 number에 담겨서 실행
//"100" has an integer value of 100
```

### Optional Binding

```swift
var optionalStr: String? = "Hello, Optional"
print(optionalStr)

if let optionalStr = optionalStr {
  print(optionalStr)
} else {
  print("valueless string")
}



// 여러 개의 옵셔널 바인딩과 불리언 조건을 함께 사용 가능
if let firstNumber = Int("4"),
  let secondNumber = Int("42"),
  firstNumber < secondNumber,
  secondNumber < 100 {
  print("\(firstNumber) < \(secondNumber) < 100")
}
//모든 조건을 만족했을 때, 실행


// 위와 동일한 동작
if let firstNumber = Int("4") {
  if let secondNumber = Int("42") {
    if firstNumber < secondNumber, secondNumber < 100 {
      print("\(firstNumber) < \(secondNumber) < 100")
    }
  }
}
```

## Forced Unwrapping

```
 let 논옵셔널 = 옵셔널표현!
 
 // !는 반드시값이 있다! 를 알려주는 것
```

```swift
if convertedNumber != nil {
//  print("convertedNumber has an integer value of \(convertedNumber).")
  print("convertedNumber has an integer value of \(convertedNumber!).")
}

print(convertedNumber)
print(convertedNumber!)


// Forced unwrap of nil value
//nil일때 !를 붙이고 실행하면 런타임 에러. :값이 있다고 해놓고는, 값이 없어서 에러남. (확실할 때만 !를 쓰고, 확실하지않을때는 옵셔널을 다뤄야함)
convertedNumber = nil
convertedNumber
//convertedNumber!
```

## IUO (Implicitly Unwrapped Optionals)

```swift
// Optional
let possibleString: String? = "An optional string."
//let forcedString: String = possibleString  // Error
let forcedString: String = possibleString!
type(of: possibleString)
type(of: forcedString)


// Implicitly Unwrapped Optional
// Non Optional 타입인 것처럼 함께 사용 가능
var assumedString: String! = "An implicitly unwrapped optional string."
let stillOptionalString = assumedString
type(of: assumedString)
type(of: stillOptionalString)
print(assumedString)
print(assumedString!)

//?일때는 넣지 못했는데 !일때는 넣을 수 있음. 반드시 값이 있다고 알려주고 있기 때문.
//Optional - >nonOptional(x)
//String? - > String(x)
//String! -> String(o)

let implicitString: String = assumedString
type(of: implicitString)

//assumedString = nil
//print(assumedString!)


/*
 - 추후 어느 순간에서라도 nil 이 될 수 있는 경우에는 이 것을 사용하지 말아야 함
 - nil value 를 체크해야 할 일이 생길 경우는 일반적인 옵셔널 타입 사용
 - 프로퍼티 지연 초기화에 많이 사용//일단 프로퍼티는 만들어두는데, 뒤 늦게 프로퍼티를 사용하고 싶을떄?
 */
```

## Nil-coalescing Operator

```swift
optionalStr = nil

var result = ""
if optionalStr != nil {
   result = optionalStr!
} else {
   result = "This is a nil value"
}
print(optionalStr)
print(result)
//optionalStr이 nil일때 실행.


//간소화 실행. nil일수도, 값이 있을 수도 있는 상황에 ??을 넣으면 뒤에것을 무시하고 실행.
let anotherExpression = optionalStr ?? "This is a nil value"
print(optionalStr)
print(anotherExpression)// nill인지 아닌지 체크 이미 했기때문에 옵셔널바인딩 하지 않음.


let optionalInteger: Int? = 100
let anotherExpression2 = optionalInteger ?? -1 //??=100
print(anotherExpression2)


// 어디에 쓰일 수 있을까요?
// Example

let defaultColorName = "red"//기본컬러색
var userDefinedColorName: String?//옵셔널 : 유저가 정의한 컬러가 없으면 기본 색상을 쓰도록.

var colorNameToUse = userDefinedColorName ?? defaultColorName
print(colorNameToUse)

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
print(colorNameToUse)


//0 > 2 ? a: b
//isTrue a:b

//?://참과 거짓
//??//옵셔널을 다루기위한 것.
```

### Question

* isTrue ? a : b   와의 차이
* optionalStr ?? "This is a nil value" 를 3항 연산자로 바꿔보기

```swift
let answer1 = optionalStr ?? "This is a nil value"
//->3항연산자로

let answer2 = optionalStr != nil ? optionalStr! : "This is a nil value"
                         //nil이 있는지 아닌지 체크
let answer3 = optionalStr == nil ? "This is a nil value" : optionalStr!

//트루일때 앞, 펄스일때 뒤


//nil일때 ~을 하겠다.

if let binding = optionalStr {
    
}

// Oprional - > nonOprional

let str1: String = "A" // nil 넣을 수 없음
let str2: String! = "A" //nil을 넣을 수는 있는데 특정값이 있다고 생각하고 씀
type(of: str1)
type(of: str2)
```

## Optional Chaining
```
let greeting: [String: String] = [
  "John": "Wassup",
  "Jane": "Morning",
  "Edward": "Yo",
  "Tom": "Howdy",
  "James": "Sup"
]

print(greeting["John"])
print(greeting["John"]?.count)//반드시 ?를 써야함
print(greeting["NoName"]) //nil

// Optional Chaining
print(greeting["John"]?.lowercased().uppercased()) //옵셔널 아니면 nil
print(greeting["Alice"]?.lowercased().uppercased())//nil //Alice는 없기 떄문에
//print(greeting["Alice"]!.lowercased().uppercased())// nil일떄 !하면 오류남. // 반드시 값이 있을떄만 !를 씀

// Optional Binding
if let greetingValue = greeting["John"] {
  print(greetingValue.lowercased().uppercased())
}
```

### Question
* 아래 두 종류 옵셔널의 차이점이 무엇일까요?

```swift
var optionalArr1: [Int]? = [1,2,3] //배열 옵셔널
var optionalArr2: [Int?] = [1,2,3] //


var arr1: [Int]? = [1,2,3] //값은 옵셔널이아니고 반드시 인트타입. 하지만 배열자체가 nil일수도 있고 값이 있을수도 있고의 뜻.
//arr1.append(nil)
//arr1 = nil

print(arr1?.count)//Optional(3)
print(arr1?[1]) //Optional(2)


var arr2: [Int?] = [1,2,3] //배열은 있는데, 배열 안에 nil이 있을 수도 있음.
arr2.append(nil) //[1, 2, 3, nil]
//arr2 = nil //빈 배열을 집어넣는 것은 되는데, nil은 넣을 수 없음.

print(arr2.count)
//print(arr2[1])
print(arr2.last) //"Optional(nil)
```

## Optional Function Types

```swift
//input parameter, output return type

func voidFunction() {//func voidFunction() -> () {
    print("voidFunction is called")
}

//var functionVariable: () -> () = voidFunction
var functionVariable: (() -> ())? = voidFunction //보이드 펑션을 옵셔널에 집어 넣음.
functionVariable?()
//functionVariable = nil
//functionVariable()

functionVariable = nil
functionVariable?()
```
```swift
func sum(a: Int, b: Int) -> Int {
  a + b
}
sum(a: 2, b: 3)

//var sumFunction: (Int, Int) -> Int = sum(a:b:)
var sumFunction: ((Int, Int) -> Int)? = sum(a:b:) //sum이라는 함수에 a와 b라는 파라미터의 변수에 담을 수 있다..
type(of: sumFunction)

print(sumFunction?(1, 2))//Optional(3)
//print(sumFunction!(1, 2)) //3

//sumFunction = nil
//sumFunction?(1, 2) //nil올 수도 있고 안올수도 있고
//sumFunction!(1, 2) //!의 '반드시 값이 있다' 와 맞지않아 오류발생

//
var dict1: [String:String?] = [:]
 //       a : b
//?넣으면 b에 nil쓸수 있음
```

### Question
* 2개의 정수를 입력받아 Modulo 연산(%)의 결과를 반환하는 함수를 만들되, 2번째 파라미터와 결과값의 타입은 옵셔널로 정의.
* 두 번째 파라미터 입력값으로 nil 이나 0이 들어오면 결과로 nil을 반환하고, 그 외에는 계산 결과 반환
 
``` func calculateModulo(op1: Int, op2: Int?) -> Int? {
 }
```
```swift
// OptionalStr ?? "This is a nil value" 를 3항 연산자로 바꿔보기
let answer = optionalStr != nil ? optionalStr! : "This is a nil value"




// 2개의 정수를 입력받아 Modulo 연산(%)의 결과를 반환하는 함수
func calculateModulo(op1: Int, op2: Int?) -> Int? {
  guard let op2 = op2, op2 != 0/*0이 아닌경우*/ else { return nil }
  return op1 % op2
}

calculateModulo(op1: 10, op2: 4)
calculateModulo(op1: 39, op2: 5)

```






