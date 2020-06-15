## Higher-Oder-Function(고차함수)

- 하나 이상의 함수를 인자로 취하는 함수 
- 함수를 결과로 반환하는 함수 


(※ Higher-order Function이 되기 위해서는 함수가 First-class Citizen 이어야 한다.)


###  1급 객체 (First-class citizen)

- 변수나 데이터에 할당할 수 있어야 한다.
- 객체의 인자로 넘길 수 있어야 한다.
- 객체의 리턴값으로 리턴할 수 있어야 한다.

```swift
func firstClassCitizen() {
  print("function call")
}

func function(_ parameter: @escaping ()->()) -> (()->()) {
  return parameter
}

let returnValue = function(firstClassCitizen)
returnValue
returnValue()
```


### forEach
- 컬렉션의 각 요소(Element)에 동일 연산을 적용하며, 반환값이 없는 형태

```swift
let immutableArray = [1, 2, 3, 4]

for num in immutableArray {
  print(num, terminator: " ")
}
print()


immutableArray.forEach { num in
  print(num, terminator: " ")
}
print()


immutableArray.forEach {
  print($0, terminator: " ")
}
print()


func printParam(_ num: Int) {
  print(num, terminator: " ")
}
immutableArray.forEach(printParam(_:))
print()
```

### Question

- forEach 와 for 문의 차이점은?
- 1~10 까지의 숫자 중 짝수만 출력하다가 9가 되면 종료되도록 forEach를 이용해 구현

```swift
print("\n---------- [ A. for vs forEach ] ----------")

/*
 for문은 반복문이므로 break, continue 키워드 사용
 forEach문은 함수(클로져)이므로 break, continue 대신 return 키워드 사용
 */

for i in 1...10 {
  guard i != 9 else { break }
  guard i % 2 == 0 else { continue }
  print(i, terminator: " ")
}
print()

(1...10).forEach {
  guard $0 < 9 else { return }
  guard $0 % 2 == 0 else { return }
  print($0, terminator: " ")
}
print()

```


### map

- 컬렉션의 각 요소(Element)에 동일 연산을 적용하여, 변형된 새 컬렉션 반환

```swift
rint("\n---------- [ Map ] ----------")

let names = ["Chris", "Alex", "Bob", "Barry"]
names
  .map { $0 + "'s name" } // [String]
  .forEach { print($0) } //forEach연결해서 쓸 수 있음.


let names2 = names.map { $0 + "'S mame"} // [String]
print(names2) //dlfjstlrdmfheh rksmd


let intArr = Array<Int>(repeating: 2, count: 10)
for (idx, value) in intArr.enumerated() {
  print(idx + value)
}
// 이 값을 새로운 변수에 담고 싶을 때


// for문을 사용한 방법
var numArr = [Int]()
for (idx, value) in intArr.enumerated() {
  numArr.append(idx + value)
}
print(numArr)

// map을 사용한 방법
let indexPlusElement = intArr.enumerated().map {
  return $0 + $1 //$0은 인덱스 $1은 벨류.
}
print(indexPlusElement)

//map:새로운 배열을 반환하도록하는 함수
//map을 쓰면 배열이 처음부터 끝까지 모두 실행이 되면서, 전달되는 값에 따라서 반환값이나 타입이 달라짐.  //완전히 다른 타입으로 변형 가능.
//intArr.map(<#T##transform: (Int) throws -> T##(Int) throws -> T#>) int면, map입력시 자동으로 transform값(반환타입이)이 (Int)로 변형되어 나옴.
//[""].map(<#T##transform: (String) throws -> T##(String) throws -> T#>) string

```

- 1~9까지의 숫자를 각각 2배씩 곱한 배열을 반환 
	
```swift

Array(1...9)
  .map{ $0 * 2 }

//결과 : [2,4,6,8,10,12]
```

### filter

- 컬렉션의 각 요소를 평가하여 조건을 만족하는 요소만을 새로운 컬렉션으로 반환

```swift
print("\n---------- [ filter ] ----------")

//let names = ["Chris", "Alex", "Bob", "Barry"]

let containBNames = names
  .filter { (name) -> Bool in
    return name.contains("B")
  }
print(containBNames)

names.filter { $0.contains("B") }

let names1 = names.filter { _ in true }
names1


var countAlexName = names.filter { $0 == "Alex" }.count
print(countAlexName)


let anotherNames = ["Alex", "Bob", "Alex", "Alex"]
countAlexName = anotherNames.filter { $0 == "Alex" }.count
print(countAlexName)



// for 문을 사용하는 경우
var count = 0
for name in anotherNames {
  if name == "Alex" {
    count += 1
  }
}
print(count)
```

- filter를 이용해서 1~50의 숫자중 3의 배수만 출력하기

```swift

Array(1...50)
  .filter {$0.isMultiple(of: 3) }
```


### reduce

- 컬렉션의 각 요소들을 결합하여 단 하나의 타입을 지닌 값으로 반환.   e.g. Int, String 타입

```swift
print("\n---------- [ reduce ] ----------\n")

/*
 (1...100)
   .reduce(<#T##initialResult: Result##Result#>, <#T##nextPartialResult: (Result, Int) throws -> Result##(Result, Int) throws -> Result#>)
 
 Result Type - 결과로 얻고자하는 값의 타입
 
 initialResult - 초기값
 nextPartialResult - (이전 요소까지의 결과값, 컬렉션이 지닌 현재 요소)
 */

let sum1to100 = (1...100).reduce(0) { (sum: Int, next: Int) in
  return sum + next
}
print(sum1to100)
// 0 + 1 = 1
// 1 + 2 = 3
// 3 + 3 = 6
// 6 + 4 = 10
// ....

print((1...100).reduce(0) { $0 + $1 })


// for문을 사용하는 경우
var sum = 0
for i in 1...100 {
  sum += i
}
print(sum)


//직접 더하는 형태 X
//(1...100).reduce(0) { (sum, next) in
//  sum += next
//}


// 문자열을 숫자로
["100", "200"].reduce(50) { //초깃값 50. 문자열 -> 숫자열
  $0 + Int($1)! // 150 + 200 = 350
}
// 50 + 100 = 150
// 150 + 200 = 350
```

### Question

- 문자열 배열을 reduce를 이용해 하나의 문자열로 합치기
- 숫자 배열을 reduce를 이용해 하나의 문자열로 합치기

```swift
// 아래 둘 모두 reduce를 이용해 "123" 이라는 문자열이 되도록 만들기

let merge1 = ["1", "2", "3"].reduce("") { $0 + $1 }
print(merge1)

let merge2 = [1, 2, 3].reduce("") { $0 + String($1) }
print(merge2)

//위 내용을 Full Syntax 로 표현했을 때
//[1, 2, 3]
//  .reduce("") { (str: String, num: Int) in
//    return str + String(num)
//  }
```

### compactMap

- 컬렉션의 각 요소(Element)에 동일 연산을 적용하여 변형된 새 컬렉션 반환
- 옵셔널 제거

```swift
let optionalStringArr = ["A", nil, "B", nil, "C"]
print(optionalStringArr)
print(optionalStringArr.compactMap { $0 })


let numbers = [-2, -1, 0, 1, 2]
let positiveNumbers = numbers.compactMap { $0 >= 0 ? $0 : nil }
print(positiveNumbers)

print(numbers.map { $0 >= 0 ? $0 : nil })

```


### flatMap

- 중첩된 컬렉션을 하나의 컬렉션으로 병합

```swift
let nestedArr: [[Int]] = [[1, 2, 3], [9, 8, 7], [-1, 0, 1]]
print(nestedArr)
print(nestedArr.flatMap { $0 })


let nestedArr2: [[[Int]]] = [[[1, 2], [3, 4], [5, 6]], [[7, 8], [9, 10]]]
let flattenNumbers1 = nestedArr2.flatMap { $0 }
print(flattenNumbers1)

let flattenNumbers2 = flattenNumbers1.flatMap { $0 }
print(flattenNumbers2)

nestedArr2
  .flatMap { $0 }
  .flatMap { $0 }
```



### 정리 

• forEach
- 컬렉션의 각 요소(Element)에 동일 연산을 적용하며, 반환값이 없는 형태

• map
- 컬렉션의 각 요소(Element)에 동일 연산을 적용하여, 변형된 새 컬렉션 반환

• filter
- 컬렉션의 각 요소를 평가하여 조건을 만족하는 요소만을 새로운 컬렉션으로 반환

• reduce
- 컬렉션의 각 요소들을 결합하여 단일 타입으로 반환. e.g. Int, String

• flatMap
- 중첩된 컬렉션을 하나의 컬렉션으로 병합

• compactMap
- 컬렉션의 요소 중 옵셔널이 있을 경우 제거
- (flatMap으로 사용하다가 Swift 4.1 에서 compactMap 으로 변경됨)



### Practice 1

```
Input : myPet 배열 이용

[ 1번 문제 ]
Pet 타입의 배열을 파라미터로 받아 그 배열에 포함된 Pet 중
강아지의 나이만을 합산한 결과를 반환하는 sumDogAge 함수 구현
func sumDogAge(pets: [Pet]) -> Int

[ 2번 문제 ]
Pet 타입의 배열을 파라미터로 받아 모든 Pet이 나이를 1살씩 더 먹었을 때의
상태를 지닌 새로운 배열을 반환하는 oneYearOlder 함수 구현
func oneYearOlder(of pets: [Pet]) -> [Pet]
```


```swift
print("\n---------- [ Practice 1 ] ----------\n")

struct Pet {
  enum PetType {
    case dog, cat, snake, pig, bird
  }
  var type: PetType
  var age: Int
}

let myPet = [
  Pet(type: .dog, age: 13),
  Pet(type: .dog, age: 2),
  Pet(type: .dog, age: 7),
  Pet(type: .cat, age: 9),
  Pet(type: .snake, age: 4),
  Pet(type: .pig, age: 5),
]
```

- 1번 문제
```swift
//case1

//func sumDogAge(pets: [Pet]) -> Int {
//var ageSum = 0
//for pet in pets {
//guard pet.type == .dog else { continue }
//ageSum += pet.age
//}
//return ageSum
//}

//case2
func sumDogAge(pets: [Pet]) -> Int {
  return pets
    .filter{ $0.type == .dog}
    .reduce(0) {$0 + $1.age}
  sumDogAge(pets: myPet)
  
```
- 2번 문제
```swift
//case1
  
  //  func oneYearOlder(of pets: [Pet]) -> [Pet] {
  //  var oneYearOlderPets = [Pet]()
  //  for pet in pets {
  //  let temp = Pet(type: pet.type, age: pet.age + 1)
  //  oneYearOlderPets.append(temp)
  //  }
  //  return oneYearOlderPets
  //  }

  //case 2  
  func oneYearOlder(of pets: [Pet]) -> [Pet] {
    return pets.map {
      Pet(type: $0.type, age: $0.age + 1)
    }
  }
```

### Practice 2 

```
let immutableArray = Array(1...40)

[ 문제 ]
immutableArray 배열의 각 인덱스와 해당 인덱스의 요소를 곱한 값 중
홀수는 제외하고 짝수에 대해서만 모든 값을 더하여 결과 출력

단, 아래 1 ~ 3번에 해당하는 함수를 각각 정의하고
이것들을 함께 조합하여 위 문제의 결과를 도출할 것
1. 배열의 각 요소 * index 값을 반환하는 함수
2. 짝수 여부를 판별하는 함수
3. 두 개의 숫자를 더하여 반환하는 함수
```

```swift

let immutableAttay = Array(1...40)

//1.
func multiplyByIndex(index: Int, number: Int) -> Int {
return index * number
}
//2.
func isEven(number: Int) -> Bool {
return number & 1 == 0
}
//3.
func addTwoNumbers(lhs: Int, rhs: Int) -> Int {
return lhs + rhs
  
}
```

- 고차함수 사용하지 않은 예제 

```swift
var sum = 0
for (index, num) in immutableArray.enumerated() {
let multipliedNum = multiplyByIndex(index: index, number: num)

if isEven(number: multipliedNum) {
sum = addTwoNumbers(lhs: sum, rhs: multipliedNum)
}
}
```

- 고차함수 사용
(Function as argument)
```swift
immutableArray.enumerated()
.map(multiplyByIndex(index:number:))
.filter(isEven(number:))
.reduce(0, addTwoNumbers(lhs:rhs:))
```
- Closures 이용
```swift
immutableArray.enumerated()
.map { (offset, element) -> Int in
return offset * element
}.filter { (element) -> Bool in
return element & 1 == 0
}.reduce(0) { (sum, nextElement) -> Int in
return sum + nextElement
}
```

- 더 줄일 수 있음(Shorthand Argument Names)
```swift
immutableArray.enumerated()
.map { $0 * $1 }
.filter { $0 & 1 == 0 }
.reduce(0) { $0 + $1}

//map, reduce를 줄일 수 있는 이유. 
//무조건 2개일때 가능.
// 2개의 값을 더하는 것. 
```





