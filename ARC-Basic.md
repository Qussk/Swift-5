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
```swift
class LocalScope {
  func doSomething() {}
  deinit {
    print("LocalScope is being deinitialized")
  }
}

class ClassProperty {
  func doSomething() {}
  deinit {
    print("ClassProperty is being deinitialized")
  }
}

class Application {
  var prop = ClassProperty()
  
  func allocateInstance() {
    let local = LocalScope() //count1
    local.doSomething()
  }//count 0 메소드가 끝날때.
  
  deinit {
    print("Application is being deinitialized")
  }
}

```
### Q. 아래의 코드 실행 시 출력되는 메시지는?

```swift
var app: Application? = Application()
app?.prop.doSomething()
app?.allocateInstance()
```


### Q. ClassProperty 객체의 deinit 메서드가 호출되려면 어떻게 할까요?

```swift
app = nil//을 넣게 되면 자동으로 사라짐.
app?.prop = nil //프로퍼티만 nil로 바꾸는 경우도 있음.

```

## Strong Reference Cycles

```swift
class Person {
  var pet: Dog?
  func doSomething() {}
  deinit {
    print("Person is being deinitialized")
  }
}

class Dog {
  var owner: Person?
  func doSomething() {}
  deinit {
    print("Dog is being deinitialized")
  }
}



var giftbot: Person? = Person() //count1
var tory: Dog? = Dog() //count 1

giftbot?.pet = tory //Dog - count 2
tory?.owner = giftbot //Person - count 2

//왜 안될까?
//giftbot = nil //Person - count 1
//tory = nil //Dog - count 1


//이미 앞에 nil을 줬기 때문에 또 nil을 줄 수 없음
giftbot?.pet

```
### Q.두 객체를 메모리에서 할당 해제하려면 어떻게 해야 할까요?

```swift
// 순서 주의

giftbot?.pet = nil //() dog - count 1
tory?.owner = nil //() Person - count 1

giftbot = nil //nil //Person - count 0
tory = nil //nil  //Dog - count0

//순서바뀌면 모두 nil로 나옴.

//반환순환 참조.

```

## Strong, Unowned, Weak

```swift
class Teacher {
  var student: Student?
  deinit {
    print("Teacher is being deinitialized")
  }
}

class Student {
  // strong, unowned, weak
  let teacher: Teacher //(strong)
//  unowned let teacher: Teacher //(unowned: 참조카운트 증가하지 않음. )
//  weak var teacher: Teacher?
  
  init(teacher: Teacher) {
    self.teacher = teacher
  }
  deinit {
    print("Student is being deinitialized")
  }
}

var teacher: Teacher? = Teacher() // T- count 1
var student: Student? = Student(teacher: teacher!) // S- count 1, T - count 2.(unowned로 넣을 경우 count 1)
teacher?.student = student


print("\n---------- [ teacher release ] ----------\n")
teacher?.student = nil //Unowned와 weak을 썼을 경우는 해당 코드 제외하고 아래것 (teacher = nil)만으로도 해제됨. 
teacher = nil //자동으로 해제하고 싶어 ! // T - count 0

print("\n---------- [ student release ] ----------\n")
student = nil //S - count 0

```

```
 1) strong  : 명시적으로 nil 대입 필요. teacher?.student = nil
 2) unowned : 자동으로 deinit. nil 처리 된 속성에 접근하면 런타임 에러 발생
 3) weak    : 자동으로 deinit. nil 처리 된 속성에 접근하면 nil 반환
```



```swift
import UIKit

final class MemoryViewController: UIViewController {
  
  final class Person {
    var apartment: Apartment?
    let name: String
    
    init(name: String) {
      self.name = name
    }
    deinit {
      print("\(name) is being deinitialized")
    }
  }
  
  final class Apartment {
    var tenant: Person?
    let unit: String
    
    init(unit: String) {
      self.unit = unit
    }
    deinit {
      print("Apartment \(unit) is being deinitialized")
    }
  }
  
  var person: Person? = Person(name: "James") //count 1
  var apartment: Apartment? = Apartment(unit: "3A") //count 1
  
  func loadClass() {
    person?.apartment = apartment
    apartment?.tenant = person
  }
  
  deinit {
    print("MemoryViewController is being deinitialized")
  }
}


var memoryVC: MemoryViewController? = MemoryViewController()
memoryVC?.loadClass()
memoryVC = nil

```
```
1. 문제가 있는지 없는지 확인
2. 문제가 없다면 참조카운트가 어떻게 바뀌면서 잘 해결이 되었는지 정리하고
    문제가 있다면 어떤 부분이 그런지 알아보고 직접 해결해 볼 것
```

