# Swift Basics - 5 

## Loops (반복문)
* For-In Loops
* While Loops
  * while
  * repeat-while

### For-In Loops

*기본형*

```
for 임의공간 in 범위(횟수,배열등) {
    실행구문
 }
```
*예제*

```swift
for index in 1...4 { //1...4번 실행
  print("\(index) times 5 is \(index * 5)")
}
/*
1 times 5 is 5
2 times 5 is 10
3 times 5 is 15
4 times 5 is 20
*/
```

```swift
// Wildcard Pattern

for _ in 0...3 { //3번 실행
  print("hello")
}

/*
 hello
 hello
 hello
 hello
  */
```

```swift
for chr in "Hello" {
  print(chr, terminator: " ") // " "\n와 동일한 의미
    //print(chr)//캐릭터 형태로 다루게됨
}
print()
/* H E I I O*/
```

```
let list = ["Swift", "Programming", "Language"]
for str in list {
  print(str)
}
/*
Swift
Programming
Language
*/
```

### Question
* for 문을 이용하여 3 의 10 제곱에 대한 결과값을 표현하는 코드 구현
```swift
let base = 3
let power = 10
var answer = 1

for _ in 1...power {
  answer *= base
}
print("\(base) to the power of \(power) is \(answer)")
```


* for 문을 이용하여 10부터 1까지 내림차순으로 출력하는 코드 구현
```swift
for num in (1...10).reversed() {
  print(num, terminator: " ")
}
print()
```

## While Loops

*조건이 거짓이 될 때까지 일련의 명령문 수행
*첫 번째 반복이 시작되기 전에 반복 횟수를 알지 못할 때 많이 사용
* while  /  repeat-while

*기본형*
```while <#condition#> {
   <#code#>
 }

 - 루프를 통과하는 각 패스의 시작 부분에서 조건을 평가
```

```swift
var num = 0
var sum = 0

while num <= 100 {
  sum += num //참
  num += 1 // 100보다 커지면 거짓이기때문에 실행 종료됨
}

sum
```

### Question

* 2 ~ 9 사이의 숫자를 입력받아 해당 숫자에 해당하는 구구단 내용을 출력하는 함수

```
let base = 3
let power = 10
var answer = 1

for _ in 1...power {
  answer *= base
}
print("\(base) to the power of \(power) is \(answer)")

```

### repeat while
* 루프를 통과하는 각 패스의 끝 부분에서 조건을 평가
* 다른 언어에서는 do - while문으로 주로 사용

*기본형*
```
 repeat {
   [실행구문]
 } while [조건]
```

```swift 
func printMultiplicationTable1(for number: Int) {
  var i = 1
  repeat {
    print("\(number) * \(i) = \(number * i)")
    i += 1
  } while i <= 9
}

printMultiplicationTable1(for: 3)

```

### Question

* 자연수 하나를 입력받아 1부터 해당 숫자 사이의 모든 숫자의 합을 구해 그 합을 반환하는 함수

```swift
func sumNumbers(max: Int) -> Int {
  var num = 1
  var sum = 0
  repeat {
    sum += num
    num += 1
  } while num <= max //맥스가 넘보다 작아질때까지
  
  return sum
}

sumNumbers(max: 10)
sumNumbers(max: 50)
sumNumbers(max: 100)
```

