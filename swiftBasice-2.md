#Swift Basics-2

## Basic Operators

### Terminology(용어)

```swift
let a = 123
let b = 456
let c: Int? = 789
```

* Unary Operator (단항 연산자)
: -a
  *  Prefix (전위 표기법)
: -a
  * Postfix (후위 표기법)
: c!


* Binary Operator (이항 연산자)
: a + b
 * Infix (중위 표기법)
: a + b


* Ternary Operator (삼항 연산자)  
(Swift 에서 삼항 연산자는 단 하나)
```swift
a > 0 ? "positive" : "zero or negative"

if a > 0 {
  "positive"
} else {
  "negative"
}
``` 

## Assignment Operators

```swift
var value = 0
value = value + 10
value = value - 5
value = value * 2
value = value / 2
value = value % 2

10 % 2 // 나머지 0
11 % 2 // 나머지 1
13 % 3 // 나머지 1

// Compound assignment Operators
```swift
value += 10 //더한 값이 10과 같을 때
value -= 5 //뺀 값이 5와 같을 때
value *= 2 //곱한 값이 2와 같을 때
value /= 2 //나눈 값이 2와 같을 때 
value %= 2 //나머지가 2와 동일

// 미지원 : value++ , value--
// value ++
// value += 1
// value = value + 1

var (x, y) = (1, 2)
print(x, y)
```

## Precedence

_연산자 우선순위_

1 + 2 * 3
1 + (2 * 3)
(1 + 2) * 3

1 + 2 * 3 + 3
1 + (2 * 3) + 3
1 + 2 * (3 + 3)


## Comparison Operators

write | mean 
----------- | -----------
a == b | Equal to operator
a != b | Not equal to operator
a > b | Greater than operator
a >= b | Greater than or equal to operator
a < b | Less than operator
a <= b | Less than or equal to operator


### Question

* "iOS" > "Apple" //true  아스키, 유니코드로 계산, i가 더큼
* "Application" > "Steve Jobs"  //false A가 더 큼
* "Swift5" <= "Swift4" //false Swft까지 모두 동일하다가 마지막 수에서 갈림
* "Playground" == "Playground" //true

## Logical Operators





