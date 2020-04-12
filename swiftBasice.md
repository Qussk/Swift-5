# Swift Basics

## Type

* **String** (문자) = ""  
* **Int** (숫자) = 0   
* **UInt** (부호없는 숫자 = 8  
* **Bool**  (참, 거짓) = true, false   
* **Float** 소수점 = 4 (4.0로 표현)  
* **Double** 소수점(Float보다 더 많은 수 표현),정수도 가능
=3.234342  
* **Characther** 이모지, 한 글자인 문자표현 = ":rocket"  



## Contents 

* Pinst() = 디버그 영역에 원하는 정보를 출력하기 위한 함수   
* 주석 : /* ~ */(범위), //, ///   
* Semicolon = 독립적으로 쓰지 않으나 한라인에 다중명령을 사용하고 싶은 경우 
``` print(""); print(0); print(1); print(2);``` 

## Constants and Variables 

* 상수와 변수는 현재 어떤 데이터에 대한 상태값, 속성 정보 등을 담고 있는 컨테이너

  * 상수 (Constants) : 한 번 설정되면 값 변경 불가  
  * 변수 (Variables) : 설정한 값을 변경 가능

```swift

let name = ""

var age = 0
 age = 20 

//다중으로 사용해야할 경우 
var x = 0.0, y = 0.0, z = 0.0 

x = 20 
y = 40
x = 33 

```
  
## Naming

```swift
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"
let 한글 = "세종대왕"
let `let` = 1   // Swift 에서 사용되는 키워드일 경우 backquote(`) 를 이용해 사용 가능

print(π)
print(你好)
print(한글)
print(🐶🐮)
print(`let`)
```

* 변수로 사용할 수 없는 이름
  1. **같은 스코프 범위 내에서 중복되는 이름**
  2. 공백문자
  3. 수학 기호 (√, ∑ 등)
  4. 화살표 (→, ← 등)
  5. 숫자로 시작하는 이름 (시작 부분 외에는 사용 가능) 

```swift
// e.g.
// let 한글 = "ㄱ"
// let 공 백 = "X"
// let √ = "root"
// let → = "arrow"
// let 369게임 = "12짝45짝..."
```

## Type Annotation & Type Inference

* Type Annotation : 변수 선언시 사용될 자료의 타입을 명확하게 지정

```swift
let year: Int = 2019

let language: String
language = "Swift"

var red, green, blue: Double
red = 255.0
green = 150.123
blue = 75
```

* Type Inference : 변수 선언시 사용되는 값의 타입을 통해 변수의 타입을 추론

```swift
let name: String = "Tory"
type(of: name)

let age: Int = 4
type(of: age)
```
`type(of: age)`을 통해 타입 조회가능.


## Literals & Types

* 리터럴 :  소스코드에서 고정된 값으로 표현되는 문자 (데이터) 그 자체)  
(정수 / 실수 / 문자 / 문자열 / 불리언 리터럴 등) 

* Numeric Literals

```swift
var signedInteger = 123
signedInteger = +123
signedInteger = -123
type(of: signedInteger)


// 10진수
let decimalInteger = 17
// 2진수
let binaryInteger = 0b10001
type(of: binaryInteger)

// 8진수
let octalInteger = 0o21
// 16진수
let hexadecimalInteger = 0x11


//1000000000을 _로 자유롭게 구분지을 수 있음

var bigNumber = 1_000_000_000
bigNumber = 1_0000_0000_0000
bigNumber = 000_001_000_000_000
bigNumber = 0b1000_1000_0000
bigNumber = 0xAB_00_FF_00_FF
```


## Integer Types

* 8-bit : Int8, UInt8
* 16-bit : Int16, UInt16
* 32-bit : Int32, UInt32
* 64-bit : Int64, UInt64
* Platform dependent : Int, UInt (64-bit on modern devices)

```swift
//64비트
var integer = 123
integer = -123
type(of: integer)

var unsignedInteger: UInt = 123
type(of: unsignedInteger)


MemoryLayout<Int8>.size
Int8.max
Int8.min

MemoryLayout<Int16>.size
Int16.max // (-2^15) ~ (2^15 -1)
Int16.min

MemoryLayout<UInt8>.size
UInt8.max // 2^8 - 1
UInt8.min  // 0

MemoryLayout<Int32>.size
Int32.max
Int32.min

MemoryLayout<Int64>.size
Int64.max
Int64.min

//var number1 = Int(Int32.max + Int32(100))

//iPhone6 = 64비트
//iPhone5 = 32비트
```

### Question

* Int 에 Int32.max ~ Int64.max 사이의 숫자를 넣었을 경우 생각해야 할 내용은?

```swift
MemoryLayout<Int>.size
Int.max
Int.min

MemoryLayout<UInt>.size
UInt.max
UInt.min


Int32.max
Int64.max

let q1 = Int(Int32.max) + 1
//Int32.max + 1   오버플로우 / 32비트 초과
 //Int64.max + 1
```

## Overflow Operators

```swift
//오버플로우 연산자 , 위의 것 무시하고 사용할수 있음
// 아래 각 연산의 결과는?

// Overflow addition
//var add: Int8 = Int8.max + 1
var add: Int8 = Int8.max &+ 1

Int8.min

Int8.max &+ 1
Int32.max &+ 1
Int64.max &+ 1

// 01111111  Int8의 맥스
// +      1
//----------
// 10000000


// 01111111
// 10000000
```

## Floating-point Literal

```swift
var floatingPoint = 1.23
floatingPoint = 1.23e4
type(of: floatingPoint)

var floatingPointValue = 1.23
type(of: floatingPointValue)

var floatValue: Float = 1.23
type(of: floatValue)

MemoryLayout<Float>.size
Float.greatestFiniteMagnitude
Float.leastNormalMagnitude

MemoryLayout<Double>.size
Double.greatestFiniteMagnitude
Double.leastNormalMagnitude
```
* Double - 최소 소수점이하 15자리수 이하의 정밀도
* Float - 최소 소수점이하 6자리수 이하의 정밀도   
(※부동 소수점이므로 소수점 이하의 정밀도는 변경될 수 있음)

### Boolean Literal

```swift
var isBool = true
type(of: isBool)

isBool = false
//isBool = False
//isBool = 1
//isBool = 0
```

### String Literal

```swift
let str = "Hello, world!"
type(of: str)

let str1 = ""
type(of: str1)

var language: String = "Swift"
```

### Character Literal
```swift
var nonCharacter = "C"
type(of: nonCharacter)

var character: Character = "C"
type(of: character)

//메모리 - 코드, 게리터, 힙, 스택(16에 저장되나 초과하면 스택)

MemoryLayout<String>.size
MemoryLayout<Character>.size


//character = "string"
//character = ' '
//character = ""
//character = " "
```

## Typealias : 문맥상 더 적절한 이름으로 기존타입의 이름을 참조하여 사용하고 싶은 경우

```swift
typealias Name = String

let name: Name = "Tory"
let nameString: String = "Tory"

type(of: name)
type(of: nameString)
```

## Type Conversion

```swift
let height = Int8(5)
let width = 10
//let area = height(int8) * width(int) //서로 타입이 다르기때문에 에러남 .
//print(area)


let h = Int8(12)
let x = 10 * h // (let x = 10 * h(int8) //타입을 지정하기 이전에 계산하면 10d이 자연스레 int8로 계산되어 에러발생하지 않음
print(x)
```


 








### Subscribe 

- [https://docs.swift.org/swift-book/LanguageGuide/StringsAndCharacters.html#](https://docs.swift.org/swift-book/LanguageGuide/StringsAndCharacters.html#)


