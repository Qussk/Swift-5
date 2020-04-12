# Swift Basice

## Function

*Functions are self-contained chunks of code that perform a specific task*
*일련의 작업을 수행하는 코드 묶음을 식별할 수 있는 특정한 이름을 부여하여 사용하는 것*
유형

  * Input 과  Output 이 모두 있는 것 (Function)
  * Input 이 없고 Output 만 있는 것 (Generator)
  * Input 이 있고 Output 은 없는 것 (Consumer)
  * Input 과 Output 이 모두 없는 것

```swift 
 func 함수이름(매개변수: 타입) -> 변경할 타입 {
   결과값/출력/리턴
 }
``` 

반복문(for..in)을 이용한 메소드

```swift
func timesTable(num: Int) {
  for i in 1...3 {
    print("\(num) * \(i) = \(num * i)")
  }
}
timesTable(num: 4)
timesTable(num: 3)
timesTable(num: 2)
timesTable(num: 1)
```


## Functions without parameters

```swift
func hello1() {
  print("Hello, world!")
}

hello1()   // 함수를 호출한 코드가 돌려받는 값이 없음 print


func hello2() -> String {
  return "Hello, world!"
}

hello2()   // 함수를 호출한 코드가 String 타입의 값을 돌려받음 retu
```

## Functions without return values

*void의 표기 (모두 같은 의미)*

```swift
func say(number: Int) {
  print(number)
}
func say(word: String) -> Void {//void (비어있는) 아무것도 반환하지 않는다. //위와 동일한 의미
  print(word)
}
func say(something: String) -> () { // 위와 동일한 의미
  print(something)
}

say(number: 33)
say(word: "1")
say(something: "1")
```

## Functions with params and return values

```swift
func addNumbers(a: Int, b: Int) -> Int {
 a + b
    // return a + b
}

addNumbers(a: 10, b: 20) //30
addNumbers(a: 3, b: 5) //8


func greet(person: String) -> String {
  let greeting = "Hello, " + person + "!"
  return greeting  //변수이용
  
    //변수이용하지 않으면
  // return "Hello, " + person + "!"
}

greet(person: "Anna")
greet(person: "Brian")
```

## Omit Return
*누락해도 실행은 된다.* 

```swift
func addTwoNumbers(a: Int, b: Int) -> Int {
  a + b
//  return a + b   //과 동일
}

addTwoNumbers(a: 1, b: 2)
```

## Function Scope
*메소드 범위*

```swift
let outside = "outside"
//let inside = "inside" 여기로 와야 출력됨

func scope() {
  print(outside)

    let inside = "inside" //범위 내부에 있는 것은 출력안됨
  print(inside)
}

//print(inside)
```

## Argument Label

```swift
func someFunction(first: Int, second: Int) {
  print(first, second)
}
someFunction(first: 1, second: 2)


/*
 func 함수이름(매개변수1, 매개변수2 : 타입) {}
 */


// Specifying Argument Labels (모두쓰기)

func multiplyNumber(lhs num1: Int, rhs num2: Int) {
  num1 + num2
}

multiplyNumber(lhs: 10, rhs: 10)



// Omitting Argument Labels (생략기능: _)

func someFunction(_ first: Int, second: Int) {
  print(first, second)
}

//someFunction(first: 1, second: 2)
someFunction(1, second: 2)    //_쓰게 되면 앞의 것 생략가능

func someFunction(_ first: Int, _ second: Int) {
  print(first, second)
}

//someFunction(first: 1, second: 2)
someFunction(1, 2)    //_두개 다 생략가능

* Argument Label을 별도로 지정해야하는 경우
```swift
// argumentLabel 지정 예시
func use(item: String) {
  print(item)
}
use(item: "Macbook")

//parameterName
func speak(to name: String) {
  print(name) //내부에서는 네임
}
speak(to: "Tory") //호출할때는 to
```

### Question

* 이름을 입력 값으로 받아서 출력하는 함수 (기본 형태)
* 나이를 입력 값으로 받아서 출력하는 함수 (Argument Label 생략)
* 이름을 입력 값으로 받아 인사말을 출력하는 함수 (Argument Label 지정)


```swift
func printName(inputName: String) {
      print(inputName)
}
printName(inputName: "홍길동")
```

```swift
func printAge(inputAge: Int){
    print(inputAge)
}
printAge(inputAge: 29)
```

```swift
func sayToHello(to inputName: String){
    print("Hi! How are you? \(inputName)?")
}
sayToHello(to: "요요")
```

## Default Parameter Values
*(불이행)아래에 값을 지정한 경우 위는 동작하지 않음* 

```swift
func functionWithDefault(param: Int = 12) -> Int {
  return param
}

functionWithDefault(param: 6)
// param is 6

functionWithDefault()
// param is 12
```

## Variadic Parameters
*가변인자 파라미터*

```swift
//평균구하기(Int버전) 

func average(num1: Int, num2: Int){
}
average(num1: 1, num2: 2)
//average(num1: 1, num2: 2, num3: 3)


//평균 구하기(Double이용)
func arithmeticAverage(_ numbers: Double...) -> Double {//...은 여러개의 값을 받을 수 있다는 것
  var total = 0.0
  for number in numbers {
    total += number
  }
  return total / Double(numbers.count)
}

arithmeticAverage(1, 2, 3)
arithmeticAverage(1, 2, 3, 4, 5)
arithmeticAverage(3, 8.25, 18.75)

//print(10,20,30,40,50)
//print(1,2,3,4,5,6,7)


//오류의 원인? (아래참조) 
//func arithmeticAverage2(_ numbers: Double..., _ last: Double) {
//  print(numbers)
//  print(last)
//}
//
//arithmeticAverage2(1, 2, 3,5)

//두개의 변수 필요시 and 이용
func arithmeticAverage3(_ numbers: Double..., and last: Double) { (and를 이용)
  print(numbers)
  print(last)
}

arithmeticAverage3(1, 2, 3, and: 5)
```

## Nested Functions
*외부에는 숨기고 함수 내부에서만 사용할 함수를 중첩하여 사용가능*

```swift func chooseFunction(plus: Bool, value: Int) -> Int {
  func plusFunction(input: Int) -> Int { input + 1 }
  func minusFunction(input: Int) -> Int { input - 1 }
  
  if plus {
    return plusFunction(input: value)
  } else {
    return minusFunction(input: value)
  }
}
```

### Answer

```swift
var value = 4
chooseFunction(plus: true, value: value)
chooseFunction(plus: false, value: value)
```

```swift
func print(name: String) {
  print(name)
}
print(name: "Tory")


func printAge(_ age: Int) {
  print(age)
}
printAge(4)


func sayHello(to name: String) {
  print(name)
}
sayHello(to: "Lilly")
```




