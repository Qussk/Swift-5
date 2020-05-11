## ARC Basic

```swift
class Person {
  let testCase: String
  init(testCase: String) {
    self.testCase = testCase
  }
  deinit {
    print("\(testCase) is being deinitialized")
  }
}
```

### case 1. Allocation & Release

```swift
print("\n---------- [ Case 1 ] ----------\n")

var obj1: Person? = Person(testCase: "case1") //count 1
obj1 = nil //count 0
```

### case 2. 참조 카운트 증가

```swift
print("\n---------- [ Case 2 ] ----------\n")

var obj2: Person? = Person(testCase: "case2") //count 1
var countUp = obj2  //count2


obj2 = nil   //count 1
countUp = nil  //count 0

/*
 ---------- [ Case 2 ] ----------

 case2 is being deinitialized //사라짐
 */
```

### case 3. Collection 에 의한 참조 카운트

```swift
print("\n---------- [ Case 3 ] ----------\n")

var obj3: Person? = Person(testCase: "case3") //count 1
var array = [obj3, obj3]  //count 3

obj3 = nil //count 2
array.remove(at: 0) //count 1
array.remove(at: 0) //count 0
```

### case 4. 강한 참조, 약한 참조

- strong : 기본값. 강한 참조. Reference Count 1 증가
- unowned : 미소유 참조. Count 증가하지 않음. 참조 객체 해제 시에도 기존 포인터 주소 유지
- weak : 약한 참조. Count 증가하지 않음. 참조하던 객체 해제 시 nil 값으로 변경

```swift
print("\n---------- [ Case 4 ] ----------\n")

var strongObj4 = Person(testCase: "case4") //count 1
print(strongObj4)

//weak var weakObj4 = Person(testCase: "case4") //weak -> count 0 // 만들자마자 바로 파괴 nil
//print(weakObj4)

//unowned var unownedObj4 = Person(testCase: "case4") //오류발생 : count 0 -> 만들자마자 바로 해제, 하지만, unowned는 참조객체 해제했어도 기존 포인터주솔르 참조함. 그래서 접근시 해당주소로 접근했을때 오류발생. 기존포인터에 값이 없어서 오류.
//때문에, unowned을 쓸때는 절대로 해제되지 않을 때만 써야함.
//print(unownedObj4)
```

###  unowned. weak  -  let , var

### Q.다음 4줄의 코드 중 사용 불가능한 것은?


```swift
unowned let unownedLet = strongObj4
unowned var unownedVar = strongObj4
weak let weakLet = strongObj4 //weak은 nil. let으로 하게되면 변수가 될수 없음. nil로 바뀔 수 없기 때문에 꼭 var 를 써야함.
weak var weakVar = strongObj4
```
- weak은 옵셔널이기 때문에 사용할때는 꼭 옵셔널을 벗기고 사용. 

### Q.unowned 와 weak 의 타입은?

```swift
print("Unowned type: ", type(of: unownedVar))
//Unowned type:  Person
print("Weak type: ", type(of: weakVar))
//Weak type:  Optional<Person>
```

## Scope

- 스코프 범위에 의한 할당 및 해제

