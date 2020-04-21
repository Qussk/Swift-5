# OOP -2 

## OOP 4대 특징

- 추상화 (Abstraction)
- 캡슐화 (Encapsulation) 
  - ※ 은닉화 (Information Hiding) 
- 상속성 (Inheritance)
- 다형성 (Polymorphism) 


## Abstraction (추상화)

```swift
//프로토콜을 통해 추상화 표현.

protocol Human {
    //정의되어 있지 않고,Human이 가져야할 최소한의 속성만 만들어져있음.
  var name: String { get }
  var age: Int { get }
  var gender: String { get }
  var height: Double { get }
  
    //함수 미리 선언.
  func sleep()
  func eat()
  func walk()
}

//class User: Human { //미리 프로토콜 만들후 클래스에 User상속. //에러시 픽스누르게 되면, 필요 틀이 나타남.('적어도 이정도는 가져와야한다.' 틀제공. 구현을 꼭 해줘야하는 부분.)
//}
```

```swift
protocol Jumpable {
  var canJump: Bool { get set } //get set의 경우 var이용.
  var jumpHeight: Double { get }
}


class Cat: Jumpable {
//  let canJump = true  // get ////let- 한번저장한건 변경할 수 없음.
  var canJump = true  // get set

  private var _jumpHeight = 30.0
  var jumpHeight: Double { //연산프로퍼티
    get { _jumpHeight } //get을 통해서 _jumpHeight리턴. //set추가.
    set { _jumpHeight = newValue }
  }
}

let cat = Cat()
if cat.canJump {
  print(cat.jumpHeight)
}

//프로토콜 : 기본적으로 요구하는 조건 맞춰주기.  (get, set 맞추기)

```

### Question

- 추상화 적용해보기 (Protocol 로 표현)

  - 사람(Human)을 표현하는 속성과 동작 정의
  - 레스토랑을 운영하는 오너(Owner)의 속성과 동작 정의
  - 요리사(Chef)의 속성과 동작 정의
  - 손님(Customer)의 속성과 동작 정의

```swift
// 사람을 표현하는 속성과 동작 정의
protocol Human1 {
  var name: String { get }
  var age: Int { get }
  var gender: String { get }
  var height: Double { get }
  
  func sleep()
  func eat()
  func walk()
}

// 레스토랑을 운영하는 오너의 속성과 동작 정의
protocol Owner1 {
  var name: String { get }
  
  func promote()
  func hire()
  func fire()
}


// 요리사의 속성과 동작 정의
protocol Chef1 {
  var position: String { get }
  
  func cook()
  func decorate()
  func buyFoodIngredients()
}

// 손님의 속성과 동작 정의
protocol Customer1 {
  var money: Int { get }
  
  func order()
  func eat()
  func rateRestaurant()
}

```

## Encapsulation(캡슐화)

*추상화가 디자인 레벨에 해당하는 개념이라면 캡슐화는 구현 레벨에서의 개념*

- 데이터 캡슐화 (Data Encapsulation): 연관된 상태와 행동을 하나의 단위 (객체) 로 캡슐화

- 정보 은닉화 (Information Hiding): 외부에 필요한 것만 알리고 불필요하거나 감출 정보는 숨김

예시) 하나의 관련있는, 필요한 내용들을 묶는 것. 또, 외부에서 불필요한 내용은 숨기는 것.(프라이빗 통해서 숨김) - 객체가 독립적으로 자신의 상태와 역할을 책임지고 수행할 수 있도록 자율성 부여 (선풍기, 핸드폰, 리모콘,카메라, 캡슐등)

```swift 
class 회사 {
  let 직원1: 직원 = 직원()
  let 직원2: 직원 = 직원()
}
class 직원 {
  private func 밤샘() {} //
  private func 코피() {}
  
  func 결과물산출() {}
}

let company = 회사()
company.직원1.결과물산출()
//밤샘과 코피는 회사가 요구하는 것이 아니라, 직원이 알아서하는 것이고 회사입장에서는 불필하므로 private으로 표현.
company.직원2.결과물산출()
```

### Q. 캡슐화 적용해보기

 - A가 서울에서 부산까지 여행을 가기로 함
 - A의 현재 위치는 currentLocation 이라는 메서드를 통해서만 확인 가능
 - 부산으로 이동하는 동작(메서드)을 구현하고 위치의 변경은 이 메서드를 통해서만 가능
 - 부산까지 이동하는 도중에 다른 일들을 할 수 있지만 A 클래스 외부에서는 자세한 내용은 알거나 직접 건드리지 못 함

```swift
class A {
    private var Location = "서울"
    
    //대전, 대구, 놀다가 -외부에서 몰라도 되는 내용.(프라이빗 이용하여 내용 넣기)
    private func 대전() {
        print ("대전에 빵집들림")
    }
    private func 부산() {
        print("돼지국밥먹음")
    }
    private func 놀다가() {
        print("잠시 졸음")
    }

  func currentLocation() {
    print("현재위치 \(Location)")
  }
  func goToBusan() { //결과물 산출
    }
}

let a = A()
a.currentLocation() //서울
a.goToBusan() //목적 : 고투부산
a.currentLocation() //부산

//관련있는 것들만 모아서 표현 - 캡슐화 
/*
 > B의 현재 위치 확인 - 부산으로 이동 (이동한다는 사실 외의 일은 모름) - 현재 위치 확인
 > 선풍기 현재 상태 확인 - 선풍기 풍속 조절 (내부의 일은 모름) - 현재 상태 확인
 - 두 가지는 동일함. 정보 은닉화의 개념
 
 B 라는 사람에 관련된 상태값(프로퍼티), 그리고 그 사람에게 관련된 행동(메서드)만 모아서
 B 라는 클래스로 저장하는 것
 - 데이터 캡슐화의 개념
*/
```

## Inheritance(상속화)

- 하나의 클래스의 특징(부모 클래스)을 다른 클래스가 물려받아 그 속성과 기능을 동일하게 사용하는 것 범용적인 클래스를 작성한 뒤 상속을 이용해 중복되는 속성과 기능을 쉽게 구현 가능
- 주요 목적 : 재사용과 확장 (상속은 수직 확장, Extension 은 수평 확장)
- 부모 클래스와 자식 클래스는 IS-A 관계. Bird is a Animal / Human is a Animal 

### 다이아몬드 상속 

인어
-----------
사람|물고기 

- 다이아몬드 상속 문제로 인해 언어에 따라 다중 상속을 허용하기도 하고 비허용 하기도 함 Swift 에서는 다중 상속을 비허용하고 대신 Protocol 을 이용하여 유사 기능 구현

```swift
//상속성.

class Cat {
  let leg = 4
  
  func cry() {
    print("miaow")
  }
}

let cat = Cat()
print(cat.leg)
cat.cry()

//세분화하여 나눔.(예시:품종)
class KoreanShortHair: Cat { //KoreanShortHair는 Cat을 상속받음.
  let color: String = "black"
}

let koshort = KoreanShortHair()
koshort.leg //이미 위에서 Cat을 상속받았기 때문에 아래에 leg, cry모두 사용가능.
koshort.cry()

koshort.color
//cat.color // 부모클래스에서는 color을 정의하지 않았기 때문에 사용할 수 없음

//cat - 부모클래스/ KoreanShortHair- 자식클래스
//클래스는 여러개 상속받을 수 없고 아래로 하나씩 추가해야함. class KoreanShortHair: Cat, Dog { -> 불가
```

### Question

- Person, Student, University Student 클래스 구현하고 관련 속성 및 메서드 구현

- 상속을 하지 않고 각각 개별적으로 만들면 어떻게 구현해야 하는지 확인
- 상속을 적용하면 어떻게 바뀌는지 확인

```swift
//class Student1 {
//  let name = "홍길동"
//  let age = 20
//  let grade = "A"
//
//  func eat() {
//    print("eat")
//  }
//  func study() {
//    print("study")
//  }
//}

//class UniversityStudent1 {
//  let name = "홍길동"
//  let age = 20
//  let grade = "A"
//  let major = "Computer Science"
//
//  func eat() {
//    print("Eat")
//  }
//  func study() {
//    print("Study")
//  }
//  func goMT() {
//    print("Go membership training")
//  }
//}


print("\n---------- [ Subclassing ] ----------\n")

class Student1: Person1 {
  let grade = "A"
  
  func study() {
    print("study")
  }
}

class UniversityStudent1: Student1 {
  let major = "Computer Science"
  
  func goMT() {
    print("Go membership training")
  }
}

```

### final

- 상속을 받고 싶지 않을 떄

```swift
class Shape {
}

final class Circle: Shape {
}

//class Oval: Circle {
//}
//상속이 필요없다면 final 붙이기. 속도 빨라짐. 
//상속이 불필요한 클래스가 따로있다면 따로 만들어줘야함. 

```
 
## Polymorphism (다양성)

- 다양한 형태로 나타날 수 있는 능력 / 여러 형태(many shapes)를 가진다는 의미의 그리스어에서 유래 동일한 요청에 대해 각각 다른 방식으로 응답할 수 있도록 만드는 것

- 오버라이딩(상속과 관련)과 오버로딩(상속과 무관)이 있으며 언어에 따라 오버라이딩만 지원하기도 함



### 오버라이딩 (Overriding) 

- 상위 클래스에서 상속 받은 메서드를 하위 클래스에서 필요에 따라 재정의하는 것  

- 동일 요청이 객체에 따라 다르게 응답

```
class Shape {
 } } }
func draw() {}
 class Circle: Shape {
override func draw() { print("draw circle") }
 class Triangle: Shape {
override func draw() { print("draw triangle") }
```
부모것을 덮어써서 각각 실행되도록 함. 

```swift


class Shape {
  var title = "Shape"
  var color: UIColor
  // 오버라이딩 불가
  final var lineWidth = 3 //final붙였기 때문.
  
  init(color: UIColor) {
    self.color = color
  }
  func draw() {
    print("draw shape")
  }
}

let shape = Shape(color: .cyan)
shape.color
shape.draw()


print("\n---------- [ Rectangle ] ----------\n")

//부모클래스 가진것 오버라이드 하려면 get, set 필요

class Rectangle: Shape {
  var cornerRadius: Double
  
  // 저장 프로퍼티 X 사용할 수 없음.
//  override var color: UIColor  = .green
  
  // 계산 프로퍼티 O
  override var color: UIColor {
    get { super.color }
    set { super.color = newValue }
  }
  override var title: String {
//    get { "Rectangle" }
    get { super.title + " => Rectangle" }
    set { super.title = newValue }
  }
  
  init(color: UIColor, cornerRadius: Double = 10.0) { // 1-1.파라미터에 기본값 넣게되면, cornerRadius은 초깃값으로 됨.
    self.cornerRadius = cornerRadius //내가 가지고 있지 않는 값을 self로 만들기.
    super.init(color: color) //부모클래스의 컬러
  }
}

let rect = Rectangle(color: UIColor.blue) // 2-1.블루를 기본값으로 넣음
rect.color //2-2.blue
rect.color = .yellow //2-3.노란색으로 바꾼후 조회해보면
rect.color //2-4. yellow으로 바뀜

rect.cornerRadius //1-2. 10
rect.lineWidth
rect.draw()

shape.title //3-1.Shape
rect.title // Shape => Rectangle //3-2.오버라이드로 내 마음대로 바꿔버린값.



print("\n---------- [ Triangle ] ----------\n")

class Triangle: Shape {
  override func draw() {
    super.draw()   // <- 부모가 가진 메서드 호출 //1-1. 부모의 것을 가져오고 싶을떄. super이용.
    print("draw triangle")
  }
}

let triangle = Triangle(color: .gray)
triangle.title
triangle.lineWidth
triangle.color

triangle.draw() //1-2.super의 결과. //draw triangle

```


### 오버로딩 (Overloading) 

- 동일한 이름의 메서드가 매개 변수의 이름, 타입, 개수 등의 차이에 따라 다르게 동작하는 것  

- 동일 요청이 매개 변수에 따라 다르게 응답

```
func someFunction(param: Int) {
 } }
print(param)
 func someFunction(param: String) {
print(param)
someFunction(param: 10)
 someFunction(param: "10")
```
이름을 다르게 하더라도 실행됨. 

```swift
/***************************************************
 1. 다른 파라미터 이름
 2. 다른 파라미터 타입
 3. 다른 파라미터 개수
 ***************************************************/

print("\n---------- [ Overloading ] ----------\n")

func printParameter() {
  print("No param")
}

//func printParameter() -> String {   // Error //1-1.
//  "No param"
//}
//printParameter()

func printParameter(param: Int) { //2-1.
  print("Input :", param)
}

func printParameter(_ param: Int) { //3-1.
  print("Input :", param)
}

print("=====")
printParameter() // 1-2.둘중에 뭘 해야하는지 구분할 수 없기 때문에 오류발생.
printParameter(param: 1) //2-2.같은이름이라도 파라미터로 구분하기때문에 실행될 수 있음
printParameter(1) //3-2. _와일드카드로 구분하여도 구분할수있어 실행할 수 있음


// ---------

func printParameter(param: String) { //1-1
  print("Input :", param)
}

func printParameter(_ param: String) { //2-1
  print("Input :", param)
}

func printParameter(name param: String) { //3-1
  print("Input :", param)
}

//func printParameter(param name: String) {   // 4-1 .Error
//  print("Input :", name)
//}
//에러나는 이유 : 파라미터가 name, 1-1와 충돌함.

print("=====")
printParameter(param: "hello") //1-2 .들어오는 값이 Int인지 String인지 알수있기 때문에, 이름이 같아도 타입이 다르기 때문에 구분할 수 있음.
printParameter("hello") //2-2. _로 구분
printParameter(name: "Hello") // 3-2 파라미터로 구분
//printParameter(param: "Hello") //4-2. 파라미터이름으로는 구분안됨. name으로 해야 알아들음. 1-1과 충돌


/////////

func printParameter(param: String, param1: String) {
  print("Input :", param, param1)
}

func printParameter(_ param: String, _ param1: String) {
  print("Input :", param, param1)
}

func printParameter(_ param: String, param1: String) {
  print("Input :", param, param1)
}

func printParameter(param: String, _ param1: String) {
  print("Input :", param, param1)
}


print("=====")
printParameter(param: "hello", param1: "world")
printParameter("hello", "world")
printParameter("hello", param1: "world")
printParameter(param: "hello", "world")



//오버로딩 : 매개변수명 달라도 , 아귀먼트부분 달라서 동일하게 써도됨.
//명령네임은 같아도 호출하는 놈은 다름.
```


### Question

- bark() 메서드를 가진 Dog 클래스를 상속받아 Poodle, Husky, Bulldog 이 서로 다르게 짖도록 구현

```swift
class Dog1 {
  func bark() {
    print("멍멍")
  }
}

class Poodle1: Dog1 {
  override func bark() {
    print("왈왈")
  }
}

class Husky1: Dog1 {
  override func bark() {
    print("으르르")
  }
}

class Bulldog1: Dog1 {
  override func bark() {
    super.bark()
    print("bowwow")
  }
}

// Dog 타입의 객체에 bark 메서드를 실행하라는 메시지 전달
// override 된 경우 해당 메서드를 찾아서 실행

print("\n---------- [ Dog ] ----------")
var dog1: Dog1 = Dog1()
dog1.bark()

print("\n---------- [ Poodle ] ----------")
dog1 = Poodle1()
dog1.bark()

print("\n---------- [ Husky ] ----------")
dog1 = Husky1()
dog1.bark()

print("\n---------- [ Bulldog ] ----------")
dog1 = Bulldog1()
dog1.bark()

```



