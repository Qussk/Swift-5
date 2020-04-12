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

_**연산자 우선순위**_
```
1 + 2 * 3
1 + (2 * 3)
(1 + 2) * 3

1 + 2 * 3 + 3
1 + (2 * 3) + 3
1 + 2 * (3 + 3)
```

## Comparison Operators

write | mean 
----------- | -----------
a == b | Equal to operator
a != b | Not equal to operator
a > b | Greater than operator
a >= b | Greater than or equal to operator
a < b | Less than operator
a <= b | Less than or equal to operator


## ASCII and Unicode

![ASCII](https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F2603F94857541B3621)
출저 : https://ndb796.tistory.com/3

* "iOS" > "Apple" = **true**  (아스키, 유니코드로 계산, i가 더큼)
* "Application" > "Steve Jobs" = **false** (A가 더 큼)
* "Swift5" <= "Swift4" = **false** (Swft까지 모두 동일하다가 마지막 수에서 갈림)
* "Playground" == "Playground" **true**

## Logical Operators

```swift
// Logical AND Operator
true && true  //t
true && false //f
false && true //f
false && false //f 

// Logical OR Operator
true || true //t
true || false //t
false || true //t
false || false //f

// Logical Negation Operator
!true  //f
!false //t


// Combining Logical Operators
let enteredDoorCode = true  //t
let passedRetinaScan = false  //f
let hasDoorKey = false  //f
let knowsOverridePassword = true //t



// 다음 논리식에서 어떤 상황일 때 "Open the door"가 출력될까요?

if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
  print("Open the door")
} else {
  print("Can't open the door")
}

// Explicit Parentheses
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
  // ...
} else {
  // ...
}
```

### Question

* 예시를 통해 작동순서를 알아봅시다. 
* 우선순위 : && > ||

```swift
func returnTrue() -> Bool {
  print("function called")
  return true
}

// 아래 3개의 케이스에서 returnTrue 메서드는 각각 몇 번씩 호출될까?

print("\n---------- [ Case 1 ] ----------\n")
returnTrue() && returnTrue() && false || true && returnTrue()
//3번.------------- 두개먼저 계산되어 펄스, 뒤에 펄스 참, 뒤에 or 그 전에 참||참 = 참
print("\n---------- [ Case 2 ] ----------\n")
returnTrue() && false && returnTrue() || returnTrue()
//2번. ------------------------------3개 먼저 트루로 계산, 결과적으로 참||참 = 참
print("\n---------- [ Case 3 ] ----------\n")
returnTrue() || returnTrue() && returnTrue() || false && returnTrue()
//3번.---------------------------------------맨 앞에 참이면 뒤에 ||뒤에 $$가와도 참 이후 &&에서 참갈림.
// (1+2+3)*4 = 이런식으로.
```

## Range Operators

```swift
print("\n---------- [ Range Operators ] ----------\n")

// Closed Range Operator
0...100

for index in 1...5 {
  print("\(index) times 5 is \(index * 5)")
}


// Half-Open Range Operator
0..<100

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {   // 0, 1, 2, 3
  print("Person \(i + 1) is called \(names[i])")
}

// One-Sided Ranges
1...
...100
..<100


//               0       1        2       3
//let names = ["Anna", "Alex", "Brian", "Jack"]
names[2...] //2이상
names[...2] //2이하
names[..<2] //2보다 작은 인덱스



//  순서를 반대로 적용하는 방법
for index in (1...5) {
  print("\(index) times 5 is \(index * 5)")
}

// 1) reversed
for index in (1...5).reversed() {
  print("\(index) times 5 is \(index * 5)")
}
print()

// 2) stride
for index in stride(from: 5, through: 1, by: -1) {
  print("\(index) times 5 is \(index * 5)")
}
print()


```

* reversed 같은 메서드를 쓰지 않고 역순으로 출력되게 하기

```swift
let range = 1...5
range.lowerBound   // 하한선
range.upperBound   // 상한선

for index in range {
  // 1 : 5 - 1 + 1 = 5
  // 2 : 5 - 2 + 1 = 4
  // ...
  let num = range.upperBound - index + range.lowerBound
  print("\(num) times 5 is \(num * 5)")
}
```



