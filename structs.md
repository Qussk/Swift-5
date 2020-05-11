# Comparing Structures and Classes


```
 [ 클래스와 구조체 공통점 ]
 - 값을 저장하기 위한 프로퍼티
 - 기능을 제공하기 위한 메서드
 - 초기 상태를 설정하기 위한 생성자
 - 기본 구현에서 기능을 추가하기 위한 확장(Extension)
 - 특정 값에 접근할 수 있는 첨자(Subscript)
 - 특정한 기능을 수행하기 위한 프로토콜 채택
 - Upper Camel Case 사용
```

```swift
class SomeClass {
  var someProperty = 1
  func someMethod() {}
}
struct SomeStruct {
  var someProperty = 1
  func someMethod() {}
}

let someClass = SomeClass()
let someStruct = SomeStruct()

```

```
[ 클래스만 제공하는 기능 ]
 - 상속 (Inheritance)
 - 소멸자 (Deinitializer)
 - 참조 카운트 (Reference counting)
```

```swift
// 상속
struct ParentS {}
//struct Child: Parent {}   // 오류


// 소멸자
struct Deinit {
//  deinit { }    // 오류
}

// 참조 카운트(Reference Counting)  X
```

## 값 타입 vs 참조 타입

```swift
class Dog {
  var name = "토리"
}
struct Cat {
  var name = "릴리"
}

let dog = Dog()
let cat = Cat()

//dog.name = "릴리"
//cat.name = "토리"////struct는 var로 바꿔야 값이 바뀔 수 있음.





let dog1 = dog
var cat1 = cat
dog1.name = "뽀삐"
cat1.name = "뽀삐"
dog.name
cat.name

//주소값 비교 (삼항연산자)
//dog === dog1
//cat === cat1 //힙을사용하지 않는 값타입이기 때문에 오류발생.
```

## 생성자 비교

- 기본형 

```swift
/*
 var로 선언된 변수
 */

//클래스는 init필요하지만 struct은 편의하게 그냥 쓸 수 있음.
class UserClass1 {
  var name = "홍길동"
  
  init (name: String) {
    self.name = name
  }
}


struct UserStruct1 {
  var name = "홍길동"
}

//let userC1 = UserClass1()
let userS1_1 = UserStruct1()
let userS1_2 = UserStruct1(name: "깃봇") //저장프로퍼티 생성자를 바꿀 수 있도록 최초에 제공.
userS1_1.name
userS1_2.name

```

- 프로퍼티에 초기화 값이 없을 때 

```swift
class UserClass2 {
  var name: String
  // 초기화 메서드 없으면 오류
  init(name: String) { self.name = name }
}

struct UserStruct2 {
  var name: String
  var age: Int
  
  // 초기화 메서드 자동 생성
  // 단, 생성자를 별도로 구현했을 경우 자동 생성하지 않음
//  init(name: String) {
//    self.name = name
//    self.age = 10
//  }
}

let userC2 = UserClass2(name: "홍길동")
let userS2 = UserStruct2(name: "홍길동", age: 10)


```

- 저장 프로퍼티 중 일부에만 초기화 값이 있을 때
```swift
/*
 저장 프로퍼티 중 일부에만 초기화 값이 있을 때
 */

class UserClass3 {
  let name: String = "홍길동"
  // 저장 프로퍼티 중 하나라도 초기화 값이 없는 경우 생성자를 구현해야 함
//  let age: Int
}

struct UserStruct3 {
  let name: String = "홍길동"
  let age: Int
}
// 초기화 값이 없는 저장 프로퍼티에 대해서만 생성자로 전달
let userS3 = UserStruct3(age: 10)




/*
 지정(Designated) 생성자, 편의(Convenience) 생성자
 */
class UserClass4 {
  let name: String
  let age: Int

//지정생성자는 모든 저장 프로퍼티를 초기화 해야함 
  init(name: String, age: Int) {
    self.name = name
    self.age = age
//얘는 무조건 자기자신만 가능한데,   
}
  convenience init(age: Int) {//convenience는 이 외에 것도 가능. 
    self.init(name: "홍길동", age: age)
  }
}

struct UserStruct4 {
  let name: String
  let age: Int
  init(name: String, age: Int) {
    self.name = name
    self.age = age
  }
  
  // Convenience 키워드 사용 X, 지정과 편의 생성자 별도 구분 없음
//  convenience init(age: Int) {
  init(age: Int) {
    self.init(name: "홍길동", age: age)
  }
}

// 따라서 extension에서도 생성자 추가 가능 //extension을 이용하면 기존 class	에다가 내가 원하는 것 추가가능. 
extension UserStruct4 {
  init(name: String) {
    self.name = name
    self.age = 10
  }
}

let userS4_1 = UserStruct4(name: "홍길동")
let userS4_2 = UserStruct4(age: 20)


//값타입과 참조타입 확실히 구분하기 !!
```


## 프로퍼티 변경

- 구조체의 경우 

```swift
struct PointStruct {
  var x = 0
  
 mutating func updateX() { //mutating을 해야만 값을 바꿀 수 있음.
    self.x = 5
  }

  var updateProperty: Int {
    get { x }
    set { x = newValue }    // 연산 프로퍼티의 setter는 기본적으로 mutating 이기때문에 앞에 mutating을 쓸 필요없음. 함수일 경우 쓰고, 연산프로퍼티일 경우 생략가능.
  }
}


//var p2 = PointStruct()
//p2.updateX()
//p2.updateProperty = 3
//p2.updateProperty

```

- class의 경우 

```swift
class PointClass {
  var x = 0
  
//  mutating //class의 경우 mutating을 붙여주지않아도 쉽게 바뀜.
  func updateX() {
    self.x = 5
  }
}

let p1 = PointClass()
p1.updateX()
```

```
[애플 권장사항] 
- 구조체를 기본으로 사용
- 클래스를 사용해야 할 때
  > Objective-C와 호환성이 필요할 때
  > equality(동등성) 외에 identity(정체성, 동일성)를 제어해야 할 때
  > RC(Reference Counting)와 소멸자(deinitialization)가 필요할 때
  > 값이 중앙에서 관리되고 공유되어야 할 때
```
- 새로 등장한  swiftUI의 경우 거의 구조체로 이루어져있기 때문에, class보다 구조체를 선호하는 것이 좋음. 
- 데이터는 구조체, 뷰등은 클래스를 이용할 것. 


