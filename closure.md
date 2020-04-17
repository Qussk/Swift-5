## closure
* 코드에서 사용하거나 전달할 수 있는 독립적인 기능을 가진 블럭
* 함수도 클로저의 일종 


전역(Global) 함수와 중첩(Nested) 함수는 사실 클로저의 특수한 예에 해당.<br>
클로저는 다음 3가지 중 한 가지 유형을 가짐
  
- Global functions: 이름을 가지며, 어떤 값도 캡쳐하지 않는 클로저
- Nested functions: 이름을 가지며, 감싸고 있는 함수의 값을 캡쳐하는 클로저
- Closure: 주변 문맥(Context)의 값을 캡쳐할 수 있으며, 간단한 문법으로 쓰여진 이름 없는 클로저


## Global functions

*외부함수*

```swift
print(1)
max(1, 2)
func globalFunction() { } //외부, 바깥에서 쓰이는 것.
```

## Nested functions

*중첩함수*

```swift
func outsideFunction() -> () -> () { //함수를 리턴타입으로 다룸.
  var x = 0
  
  func nestedFunction() { //중첩함수: 바깥에서 var선언 (글로벌펑션), 내부에서 이용
    x += 1    // 그 자신의 함수가 가지지 않은 값을 사용
    print(x)
  }
  
  return nestedFunction
}
let nestedFunction = outsideFunction()
nestedFunction()
nestedFunction()
nestedFunction()
```

## Closure
*기본형*
```
 Closure Expression Syntax
 
 { (파라미터) -> 리턴타입 in
   실행구문
 }
```

```swift
func aFunction() { //viod 타입
  print("This is a function.")
}
aFunction()
aFunction()

({
  print("This is a closure.")
})()

```

### Save closure to variable
```swift
// 클로저를 변수에 담아 이름 부여 가능
let closure = { //void타입
  print("This is a closure.")
}
closure()
closure()


// 함수도 변수로 저장 가능
var function/* : () -> () */= aFunction //viod타입
function()


// 같은 타입일 경우 함수나 클로저 관계없이 치환 가능
function = closure
function()
type(of: function)
type(of: closure)
```

### Closure Syntax

```swift


// 파라미터 + 반환 타입을 가진 함수
func funcWithParamAndReturnType(_ param: String) -> String {
  return param + "!"
}
print(funcWithParamAndReturnType("function"))

//스트링을 반환하는 함수, return 내가원하는 파라미터 전달.



// 파라미터 + 반환 타입을 가진 클로저
// Type Annotation
let closureWithParamAndReturnType1: (String) -> String = { param in
  return param + "!"
}
print(closureWithParamAndReturnType1("closure"))

// Argument Label은 생략. 함수의 Argument Label을 (_)로 생략한 것과 동일


// 파라미터 + 반환 타입을 가진 클로저 // 타입을 내부에 쓸 수도 있음.
let closureWithParamAndReturnType2 = { (param: String) -> String in
  return param + "!"
}
print(closureWithParamAndReturnType2("closure"))


// 파라미터 + 반환 타입을 가진 클로저
// Type Inference //리턴과 소괄호를 생략할수도 있음.
let closureWithParamAndReturnType3 = { param in
  param + "!"
}
print(closureWithParamAndReturnType3("closure"))
```

### Question

* 문자열을 입력받으면 그 문자열의 개수를 반환하는 클로져 구현
* 숫자 하나를 입력받은 뒤 1을 더한 값을 반환하는 클로져 구현

```swift
// 1번 문제 예.   "Swift" -> 5

let comString = { (origin: String) -> Int in
   return origin.count
}
print(comString("swift"))

//1번에 3번 적용하려면 타입 명시해줘야함.
let counting: (String) -> Int = { param in
    param.count
}
counting("swift")

// 2번 문제 예.   5 -> 6

let comInt = {(master: Int) -> Int in
    return master + 1
}
print(comInt(5))

//
let byInt = { origin in
    origin + 1
}
print(byInt(4))

```

### Answer

```swift
/// 문자열을 입력받으면 그 문자열의 개수를 반환하는 클로져 구현

// 1단계 - 함수로 생각
func stringCount(str: String) -> Int {
  return str.count
}
print(stringCount(str: "Swift"))

// 2단계 - 클로저로 변형
let stringCount = { (str: String) -> Int in
  return str.count
}
stringCount("Swift")

// 3단계 - 문법 최적화
let stringCount2: (String) -> Int = { $0.count }



/// 숫자 하나를 입력받은 뒤 1을 더한 값을 반환하는 클로져 구현
//func addOne = (num: Int) -> Int
//return num + 1

let addOne = { (num: Int) -> Int in
  return num + 1
}
addOne(5)

let addTwo: (Int) -> Int = { $0 + (5) }
addTwo(5)
```

### Closure장점

- 문법 간소화 /가독성
- 지연생성  / 실제로 코드를 사용할 시기가 왔을때, 메모리에 올라가는것. 
- 주변 컨텍스트의 값을 캡쳐하여 작업 수행가능

## Syntax Optimization

###Swift 클로저 문법 최적화

  - 문맥을 통해 매개변수 및 반환 값에 대한 타입 추론
  - 단일 표현식 클로저에서의 반환 키워드 생략 /(return생략)
  - 축약 인수명 //($0)
  - 후행 클로저 문법

```swift
// 입력된 문자열의 개수를 반환하는 클로저를 함수의 파라미터로 전달하는 예
func performClosure(param: (String) -> Int) { //param: 함수를 매개변수로 받는 함수. param은 input을 string으로 받고, 반환을 int로 한다는 뜻.
  param("Swift")
}

performClosure(param: { (str: String) -> Int in //모든 내용을 다 적은 것.
  return str.count
})

performClosure(param: { (str: String) in //.count가 Int이기 때문에 생략가능.
  return str.count
})

performClosure(param: { str in //펑션에 이미 String을 받고 있다는 걸 알수 있어서 Sting도 생략가능.
  return str.count
})

performClosure(param: { //매개변수명도 생략가능. $0,$1,$2 등으로 표현가능.
  return $0.count
})

performClosure(param: { //return 생략가능.
  $0.count
})

performClosure(param: ) { //param가 한개일 경우. 괄호 닫으면, param을 마지막 파라미터 값으로 받아들임.
  $0.count
}

performClosure() { //마지막 파라미터라면, (param: )을 생략해도 됨.
  $0.count
}

performClosure { $0.count } //소괄호도 생략가능.


//타입추론을 못하는 경우에는 타입을 모두 적어줘야하지만, 추론이 가능하다면 줄여나갈 수 있음.
//파라미터가 1개인경우 최종까지 가능하지만, 파라미터가 다수일 경우, 최종까지는 불가.($0,$1등으로 활용하거나 return 생략..) 

//펑션 다음에, 클로저 쓰이는 경우, 함수가 들어가는건지, 클로저가 들어가는 건지 구분해야함. 

```

## Inline closure

- 함수의 인수(Argument)로 들어가는 클로저 

*함수이용 버전*
```swift
func closureParamFunction(closure: () -> Void) {
  closure()
}
func printFunction() {
  print("Swift Function!")
}
let printClosure = {
  print("Swift Closure!")
}

closureParamFunction(closure: printFunction)
closureParamFunction(closure: printClosure)
```
*인라인 클로저 버전*

```swift
// 인라인 클로저 - 변수나 함수처럼 중간 매개체 없이 사용되는 클로저
closureParamFunction(closure: {
  print("Inline closure - Explicit closure parameter name")
})
```

## Trailing Closure

- 함수의 괄호가 닫힌 후에도 인수로 취급되는 클로저
- 함수의 마지막 인수(Argument)에만 사용 가능하고 해당 인수명은 생략
- 하나의 라인에 다 표현하지 못할 긴 클로져에 유용

*기본형*

```swift
//마지막 인수를 생략할 수 있는것 - 트레이닝 클로저 
// 후위 또는 후행 클로저
// closureParamFunction { <#code#> }

closureParamFunction(closure: {
  print("Inline closure - Explicit closure parameter name")
})
closureParamFunction() {
  print("Trailing closure - Implicit closure parameter name")
}
closureParamFunction {
  print("Trailing closure - Implicit closure parameter name")
}
```

```swift

func multiClosureParams(closure1: () -> Void, closure2: () -> Void) {
  closure1()
  closure2()
}

//인라인 형식
multiClosureParams(closure1: {
  print("inline")
}, closure2: {
  print("inline")
})

//트레이닝 형식
//마지막 인수가 시작하기 직전에 닫아버림.  
multiClosureParams(closure1: {
  print("inline")
}) {
  print("trailing")
}
```

### Question

- 정수를 하나 입력받아 2의 배수 여부를 반환하는 클로져
- 정수를 두 개 입력 받아 곱한 결과를 반환하는 클로져

```swift
//정수를 하나 입력받아 2의 배수 여부를 반환하는 클로져
let Question = { (origin: Int) -> Bool in
    return origin % 2 == 0
}

//
let Question1 = {$0 % 2 == 0}
Question1(5)
Question1(6)
```

```swift
/// 정수를 두 개 입력받아 곱한 결과를 반환하는 클로져
let multiplyTwoNumbers = { (op1: Int, op2: Int) -> Int in
  return op1 * op2
}
// Optimization
let multiplyTwoNumbers2: (Int, Int) -> Int = { $0 * $1 }

multiplyTwoNumbers(20, 5)
multiplyTwoNumbers(5, 10)
multiplyTwoNumbers2(5, 10)
```



