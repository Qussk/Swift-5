# OOP
- 구조체/ 객체지향

- Objective-c : OOP
- Swift : POP를 지향하는 멀티 패러다임 언어 

- 함수. (Function)? 
- 메서드. (Methood)? 

## Class

*기본형*

```
 class 클래스네임 : SuperClassName, 프로토콜네임 {
   <#PropertyList#>
   <#MethodList#>
 }
 
 let 객체명 = 클래스네임
 objectName.<#propertyName#>
 objectName.<#functionName()#>
 ```

```swift
class Dog { //정의, 선언, 설계도
  var color = "White"
  var eyeColor = "Black"
  var height = 30.0
  var weight = 6.0
  
  func sit() {
    print("sit")
  }
  func layDown() {
    print("layDown")
  }
  func shake() {
    print("shake")
  }
}


let bobby: Dog = Dog() // Dog.init //bobby = 0x1234 주소만저장(화살표 의미)
bobby.color //화이트  //컬러 메모리값저장
bobby.color = "Gray" //그레이
bobby.color
bobby.sit()
//bobby 는 참조타입


let tory = Dog()
tory.color = "Brown" //개별적인 속성을 가질 수 있음
tory.layDown()

tory.color
bobby.color
```
bobby값은 참조타입이며 class 바깥에 써야함. 

### Question

* 자동차 클래스 정의 및 객체 생성하기

```swift
class CarCass {
    
    var model = "HYUNDIE"
    var modelYear = "2019"
    var carColor = "black"
    
    func drive() {
        print("운전하기")
    }
    
    func reverse() {
        print("후진하기")
    
    }
}

    let bobby1: CarCass = CarCass()
    bobby1.model = "KIA"
    bobby1.modelYear = "2020"
    bobby1.carColor = "brown"
```

## Class Initialize
class의 초기화 메서드
- 초기화(init)가 불필요한 경우 : 모든 저장 프로퍼티에 초기값이 설정되어 있음
- 초기화(init)가 필요한 경우 : 저장 프로퍼티 중 하나 이상이 초기값 미설정됨

```swift
/*
 모든 저장 프로퍼티 (Stored Properties)에 초기값이 설정된 경우 Init 메서드 작성 불필요
 객체 생성시 단순히 ClassName() 만으로 생성 가능
 */

class Dog1 {
  let name = "Tory"
  let color = "Brown"
  
   // init() {} 기본값으로 설정되어있어 안써도 됨.
    
   //init() { //초기화 메서드가 필요한경우(초기화 메서드는 여러개 작성할 수 있음)
    // name = "Tory"
    // color = "Brown"
  // }
 
    
    func bowwow() {
    print("Dog1 Bowwow!")
  }
}

let tory = Dog1()
// let tory = Dog1.init()
tory.bowwow()



/*
 초기화 메서드가 필요한 경우 - 저장 프로퍼티 중 하나 이상이 초기값 미설정
 ==> init 메서드를 통해 설정
 */

// 파라미터 없는 경우

class Dog2 {
  let name: String
  let color: String
  
  init() {
    name = "Tory"
    color = "Brown"
  }
  
  func bowwow() {
    print("Dog2 Bowwow!")
  }
}

let tory2 = Dog2()
tory2.bowwow()




// 파라미터를 통해 설정하는 경우

class Dog3 {
  let name: String
  let color: String

  init(name: String) {
    self.name = name
    color = "Brown"
  }
  init(name: String, color: String) {
    self.name = name
    self.color = color
  }
  
  func bowwow() {
    print("Dog3 Bowwow!")
  }
}

var tory3 = Dog3(name: "Tory")
var tory4 = Dog3(name: "Tory", color: "White") //별도로 내가 지정하지 않아도 파라미터로 초기값 설정이 가능. 

tory3.name
tory3.color

tory4.name
tory4.color
```


## Lazy Stored Property

- 초기값이 인스턴스의 생성이 완료 될 때까지도 알 수 없는 외부 요인에 의존 할 때
- 초기값이 복잡하거나 계산 비용이 많이 드는 설정을 필요로 할 때
- 필요한 경우가 제한적일 때
- Class ⭕️   Structure ⭕️   Enumeration ❌

```swift
class BasicStoredProperty {
  var width = 10.0
  var height = 20.0
  
  var area = 200.0
//  var area = self.width * self.height //self 객체, 자기자신. //self쓰려면 모든 값이 초기화되어야함.
}

let basicStored = BasicStoredProperty()
basicStored.area
basicStored.width = 30
basicStored.area



class LazyStoredProperty {
  var width = 10.0
  var height = 20.0
  
  // 1. 외부 요인이나 다른 설정에 기반
//  var area = self.width * self.height
  lazy var area = width * height //lazy //self생략하고 lazy로 이용가능/ 지연생성: 실제 프로퍼티가 나중에 사용될 때, 그때 초기화 하겠다.
  
  // 2. 계산 비용이 많이 드는 상황
//  var hardWork = "실행하면 약 10초 이상 걸려야 하는 작업"
  
  // 3. 필요한 경우가 제한적인 상황
//  func ifStatement() {
//    if true {   // 5%
//      print(area)
//    } else {    // 95%
//      print(width)
//    }
//  }
}

let lazyStored = LazyStoredProperty() //2-1. 2에 laze 사용하면 오래걸리는 작업 줄일수 있음.
lazyStored.width = 30
lazyStored.area//laze적용하여 값이 200이 아닌 600으로 변경됨.


// *주의사항* 순서 주의
let lazyStored1 = LazyStoredProperty()
lazyStored1.area
lazyStored1.width = 30
lazyStored1.area //왜 600이 아닌 200인가? 지연저장프로퍼티.. 저장된 상태 그대로 남는것. 이미 200이라는 값이 한번 저장됐으면 위의 30이 적용되지 않고 그대로 적용되어 200이나옴.

//지연생성한다 : 사용하기 전까지 최대한 지연해놓았다가 사용시 적용함.
```

## Computed Property
- 자료를 저장하지 않고 매번 호출할 때마다 새로 계산
-Class ⭕️   Structure ⭕️   Enumeration ⭕️

*기본형*
```
var <#variable name#>: <#type#> {
      get { //값을 읽어올때
          <#statements#>
      }
      set { //값을 저장할때
        <#variable name#> = newValue
      }
  }
```

```swift
//호출할때마다 새롭게 계산해서, 반환하는 것.
class ComputedProperty {
  var width = 5.0
  var height = 5.0
  
  lazy var lazyArea = width * height
  var area: Double {
    width * height
  }
  
  // Stored + Computed get(read), set(write)
  private var _koreanWon = 0.0
  var wonToDollar: Double {
    get { //읽기전용 : get이 하나일 경우 생략할 수 있음 //wonToDollar는 _koreanWon를 참조하여 가져옴.
      return _koreanWon / 1136.5 //1-2. 만원을 1136.5로 계산된 값이 _koreanWon...
    }
    set {
      // newValue: 새로 들어오는 값
      _koreanWon = newValue
    }
  }
}

var computed = ComputedProperty()
computed.area //25
computed.lazyArea //25

computed.width = 10
computed.area //50
computed.lazyArea//25 /값을 직접바꾸지 않는 이상 값이 변하지 않음 //

computed.lazyArea = 50.0
computed.lazyArea

computed.width = 20
computed.height = 20
computed.area //400
computed.lazyArea

//computed.area = 300 //오류나는이유: set이 없기때문. 저장하기 위한 별도의 프로퍼티가 필요함.

computed.wonToDollar
computed.wonToDollar = 10000 //1-1. 8.798944126704795로 나오는 이유?
computed.wonToDollar

//값을 저장하고, 계산해야하는 순간이 오게되면  set이 필요함.
```

## Property Observer
- 프로퍼티를 관찰하고 있다가 값이 변경되는 순간에, 어떤 작업을 하도록 만드는 것.
- Class ⭕️   Structure ⭕️   Enumeration ❌

*기본형*
```
var <#variable name#>: <#type#> = <#value#> {
     willSet {
         <#statements#>
     }
     didSet {
         <#statements#>
     }
 }
```
```swift
class PropertyObserver {
  var height = 0.0
  
  var width = 0.0 {
    willSet {
      print("willSet :", width, "->", newValue) //1.1 0에서 50이라는 값으로 바뀐다.
      // width = 0.0,  newValue = 50.0
    }
    
    // 변경되는 시점  willSet <-> didSet 중간
    
    didSet {
      height = width / 2 //1.2 willSet이 바뀌고 난후.
      print("didSet :", oldValue, "->", width)
      // oldValue = 0.0,  width = 50.0
    }
  }
}

var obs = PropertyObserver()
obs.height = 50
obs.width = 50

//바뀌기 전은 newValue, 바뀌고 난 후 값은 oldValue
```

## Type Property

- Shared
- Lazily Initialized
- Class ⭕️   Structure ⭕️   Enumeration ⭕️
- 타입 전체가 모든 값을 공유해야할떄. 

*기본형*
```
선언 - static let(var) <#propertyName#>: <#Type#>
       class var <#propertyName#>: <#Type#> { return <#code#> }
사용 - <#TypeName#>.<#propertyName#>
 
 static: override 불가
 class: 클래스에서만 사용 가능하고 computed property 형태로 사용. 서브클래스에서 override 가능
```
```swift
class TypeProperty {
  static var unit: String = "cm"
  var width = 5.0
}

let square = TypeProperty()
square.width

let square1 = TypeProperty()
square1.width = 10.0
square1.width

TypeProperty.unit
print("\(square.width) \(TypeProperty.unit)")
print("\(square1.width) \(TypeProperty.unit)")

TypeProperty.unit = "m" //1.1 전체가 전부 m단위로 바뀜.
print("\(square.width) \(TypeProperty.unit)")
print("\(square1.width) \(TypeProperty.unit)")
```

## Equatable, Identical

```swift
// 동등 연산자
1 == 1
2 == 1
"ABC" == "ABC"


class Person {
  let name = "이순신"
  let age = 30
}

let person1 = Person()
let person2 = Person()

//person1 == "이순신"    // error
//person1 == person2   //  error. 뭘 비교해야할지 알려주는 게 없음. name? age?

```
*비교연산자, 왜 사용할 수 없을까?*

## Equatable Protocol

- Equatable은 어떤걸 비교할지 지정해주고 계산.
```swift
//두개가 같은지를 비교해보는 연산자.
class User: Equatable {
  var name = "이순신"
  let age = 30
  
  static func ==(lhs: User, rhs: User) -> Bool {//1.2 연산자 정의.
    return lhs.name == rhs.name //1.3나는 name을 비교하겠다. //같으면 트루, 다르면 펄스
  }
}

let user1 = User()
var user2 = User()
user1 == user2
```

## Identical

```swift

user1.name
user2.name
user1 == user2  //true
user1 === user2 //false //1.1 === 은 왜 false일까? ===는 참조타입이 아니라, 참조주소를 물음. Heap 주소, 완전히 같은 녀석인지 물어봄. //서로다른 객체이므로 false


// let user1 = User() // 0x1234
// let user2 = User() // 0x1237 //1.2 이런느낌.

//같은걸 구분할때,

/*
 Value Type => struct, enum  (Stack 에 저장)
 Reference Type => class  (Heap 에 저장)
 */

/*
 let x = 5
 let y = User()
 let z = User()
 
           x   y        z
 [ Stack ] | 5 | 0x5F17 | 0x2C90 |
                   |        |
                   ---------|----------
           ------------------         |
           |                          |
         0x2C90          0x5F16     0x5F17
 [ Heap ]  | z's user data | SomeData | y's user data |
             ----------                   ----------
              *여기가 같아야 === 도 true가 됨. (데이타 위치)
              * ==는 값만 같으면 true
 
 --- in Memory ---
 값 타입(Value Type) - Stack
 참조 타입(Reference Type) - Stack -> Heap
 */


user1.name = "홍길동"
user1.name   // 홍길동
user2.name   // 이순신. <- 차이1.다른 값이라 안바뀜
user1 == user2 // false
user1 === user2 //false


user2 = user1 // 차이. 1-1. user1이 가지고 있는 메모리 주소값을 user2에 전달.

//위치 및 방향
// user1 -> 0x00001   user2  ->   0x00002 // user2  ->   0x00002이었던 값을
//user1 -> 0x00001   <-- user2     0x00002 //0x00002을 없애고 user1의 0x00001값을 가지게됨


//user1.name
//user2.name
//user1 == user2    //
//user1 === user2   //
//
user2.name = "세종대왕"
user2.name //세종대왕
user1.name //세종대왕 <- 차이2,값이 바뀜.


/*
 Identity Operators
 === : 두 상수 또는 변수가 동일한 인스턴스를 가르키는 경우 true 반환
 */

//1 === 1
//"A" === "A"

// 5 == 5

```
* === 참조타입에만 쓰는것. 값타입은 참조하지 않기 때문에 주소가 없으므로 비교할 것이 없음. 




