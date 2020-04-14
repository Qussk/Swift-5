# Swift Basics - 4
## 조건문 
* if
* swhich 
* guard 
 
## if Statements
*if의 기본형*
* if는 반드시  Bool 값 (true, false)을 사용한다.

```if 조건  { 
   실행구문
}

if 조건  {
   실행구문
  } else {
   실행구문
}
``` 

```swift
// if

var temperatureInFahrenheit = 30

if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
}


// if - else

temperatureInFahrenheit = 40

if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
} else {
  print("It's not that cold. Wear a t-shirt.")
}


// if - else if - else

temperatureInFahrenheit = 90

if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
  print("It's really warm. Don't forget to wear sunscreen.")
} else {
  print("It's not that cold. Wear a t-shirt.")
}


// if - else if

temperatureInFahrenheit = 72
if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
  print("It's really warm. Don't forget to wear sunscreen.")
}
```

### if ~ else if   /  if 문을 2개 하는 것과 차이점?

```swift
var number = 9
if number < 10 {
  print("10보다 작다")
} else if number < 20 {
  print("20보다 작다")
}
// 앞에 것만 실행됨(선행)

if number < 10 {
  print("10보다 작다")
}
if number < 20 {
  print("20보다 작다")
}

//두개 구분지어 놓으면 둘 다 실행됨
```

## switch Statements
*switch 기본형*

* switch 문은 가능한 모든 사례를 반드시 다루어야 한다. (Switch must be exhaustive) 

``` 
switch 값 {
case 비교값 1: 
     실행구문
case 비교값 2:
     실행구문 
fallthrough // 다음 case까지만 마치고 종료. 
case 비교값1, 비교값2, 비교값3 : //다중의 경우  
     실행구문
default: //해당되지 않는 값 반환(else) 
```

* Without default case

*default을 사용하지 않는 경우* 

```swift
let isTrue = true
type(of: isTrue)

switch isTrue {
case true:
  print("true")
case false:
  print("false")
}
```

* Interval Matching

* 범위와 매칭*

```swift 
let approximateCount = 30

switch approximateCount {
case 0...50:
  print("0 ~ 50")
case 51...100:
  print("51 ~ 100")
default:
  print("Something else")
}```
    
```swift
switch temperatureInFahrenheit {
case 0...32 :
    print("It's very cold. Consider wearing a scarf.")
case 86... :
    print("It's really warm. Don't forget to wear sunscreen.")
default:
    print("It's not that cold. Wear a t-shirt.")
}
```

* Compound Cases

* if문은 콤마(,)가 And(&&)연산인 것과 반대로 switch문은 콤마(,)가 Or(||) 연산

```swift
let someCharacter: Character = "e"

switch someCharacter {
case "a", "e", "i", "o", "u": //이거나(OR)
  print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
  print("\(someCharacter) is a consonant")
default:
  print("\(someCharacter) is not a vowel or a consonant")
}
```

* value binding

*x, y 좌표(x축, y축 활용)*

```swift
let somePoint = (9, 0)

switch somePoint {
case (let distance, 0), (0, let distance): //x좌표가 0이거나 y좌표가 0
  print("On an axis, \(distance) from the origin") //distance만큼 떨어진 좌표에 있다.
default:
  print("Not on an axis") //축에 해당하지 않는다
}

* where clause

```swift 
let anotherPoint = (1, -1)
switch anotherPoint {
case let (x, y) where x == y: //x가 y랑 같을때
    //(let x, let y, let z)와 동일한 의미.
  print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y: // x가 -y와 같을때
  print("(\(x), \(y)) is on the line x == -y")
case let (x, y)://해당없음
  print("(\(x), \(y)) is just some arbitrary point")
}
```

### Question

* 어떤 숫자가 주어졌을 때 짝수인지 홀수인지 출력 (switch의 where 절 이용)

```swift
let even = 4
switch even {
case let x where x.isMultiple(of: 2):
                  //2 == 0 와 동일한 의미
  print("\(x)는 짝수")
default:
  print("홀수")
}
```

* fallthrough 작동방식 

```swift
let integerToDescribe = 3
var description = "The number \(integerToDescribe) is"

switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
  description += " a prime number, and also" //
//  fallthrough
default:
  description += " an integer."
}
print(description)

//fallrhrough 를 추가하면 한단계 아래까지만 실행됨
```

## Early Exit
* guard statement
* _if_문의 경우 특정 조건을 만족하면 해당 분기문을 실행하였으나, _guard_구문의 경우 조건에 맞지 않으면 바로 종료됨.  

```swift

func someFunction() {
  // ...
  // ...
  
  // if 문의 조건이 맞으면 어떤 코드를 수행할 것
  if Bool.random() { //불값중. 참,거짓중 하나면,
    // ...
  }
//print(1) 출력
    
  // gaurd문의 조건을 만족할 때만 다음으로 넘어갈 것
  guard Bool.random() else { return }

    //print(1) //가드문의 경우 , 트루면 출력 , 펄스면 출력 안됨
```
* 가드문은 들여쓰기를 하지 않는다. (일렬로 쭉 나열)

*guard문 예시*

```swift 
func update(age: Int) {
  guard 1...100 ~= age else { return }//종료코드
  print("Update")
}

update(age: -1)
update(age: 2)
update(age: 100)
```


## Tuples

* Unnamed Tuple 

```swift
let number: Int = 10

let threeNumbers: (Int, Int, Int) = (1, 2, 5)
type(of: threeNumbers)

threeNumbers

threeNumbers.0//1
threeNumbers.1//2
threeNumbers.2//5


var threeValues: (Int, Double, String) = (10,  100.0,  "이름")
type(of: threeValues)//타입추출

threeValues

threeValues.0 = 5
threeValues
```
* Tuples의 장점
  
  * 임의의 이름과 순서 활용
  * 타입 혼합하여 이용가능 

* Decomposition

```swift
let numbers = threeNumbers
numbers
numbers.0 //1
numbers.1 //2


let (first, second, third) = threeNumbers
first//1
second//2
third//3


// wildcard pattern

let (_, second1, third1) = threeNumbers //_와일드카드패턴 : 첫번째 것은 받고 싶지. 않고 생략하고 싶다.
second1 //2
third1 //5
```

* Named Tuple 
  *기본구조*
```swift
let iOS: (language: String, version: String) = (language: "Swift", version: "5")
let iOS: (language: String, version: String) = ("Swift", "5")
let iOS = (language: "Swift", version: "5")
```
  *활용*
```swift
let iOS = (language: "Swift", version: "5")

iOS.0//swift
iOS.1//5

iOS.language
iOS.version


func 튜플(a: Int, b: (Int, Int)) -> (first: Int, second: Int) {
  return (a + b.0,  a + b.1)
}//10+20 , 10+30

let result = 튜플(a: 10, b: (20, 30))
result.first //30
result.second //40

result.0 //30
result.1 //40
```

### Comparison Operators 
*Tuple 은 7개 미만 요소에 대한 비교 연산자가 포함되어 있음(6개까지만 쓸 수 있음).7개 이상의 요소를 비교하기 위해서는 비교 연산자를 직접 구현해야 함*

```swift
var something1: (Int, Int, Int, Int, Int, Int) = (1,2,3,4,5,6)
var something2: (Int, Int, Int, Int, Int, Int) = (1,2,3,4,5,6)
something1 == something2
```

* 튜플 비교 연산에 대한 결과는? 

```swift
(1, "zebra") < (2, "apple") //true
(3, "apple") > (3, "bird")  //false 아스키
("blue", 1) > ("bluesky", -1) //false
("일", 1) > ("이", 2.0) //true //한글 : 초성,중성,종성 ㅇ+ㅣ+ㄹ > ㅇ+ㅣ

//(1, "zebra") < ("2", "apple")// 비교불가 -> 타입이 달라서 error
//("blue", false) < ("purple", true)// 트루,펄스는 대소비교불가 error
```

### Tuple Matching

```swift
let somePoint = (1, 0)

switch somePoint {
case (0, 0):
  print("\(somePoint) is at the origin") //x, y가 0일 때
case (_, 0):
  print("\(somePoint) is on the x-axis") //y가 0일 때
case (0, _):
  print("\(somePoint) is on the y-axis") //x가 0일 때
case (-2...2, -2...2):
  print("\(somePoint) is inside the box")//각각의 값 모두 충족
default:
  print("\(somePoint) is outside of the box") //외
}

// 맨 위부터 검사하므로 순서중요
```


### Dictionary Enumeration

*기본형*

```딕셔너리
let 함수 = ["키":"값"] ```

```swift
let fruits = ["A": "Apple", "B": "Banana", "C": "Cherry"]

for (key, value) in fruits {
  print(key, value)
}
print()


for element in fruits {
    // 어떤 식으로 출력해야 할까요?
  //print(element.0,element.1) //튜플넘버 이용
    //prein(element.key, element.value) //튜플네임 이용
}
```








