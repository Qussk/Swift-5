## Enumeration

* 연관된 값의 그룹에 대해 공통 타입을 정의한 뒤 type-safe 하게 해당 값들을 사용 가능

*enum 기본형*

```swift
let north = "north"
let south = "south"
let east = "east"
let west = "west"

//하나의 타입으로 묶을 수 있음
//CompassPoint라는 타입의 값(north,south,east,west)

enum CompassPoint {
  case north
  case south
  case east
  case west
}
// 열거형 타입의 이름은 Pascal Case
// 각각의 case는 Camel Case


//사용법
var directionToHead1 = CompassPoint.west//처음에 타입 지정하면 뒤로부터는 .만 찍어도 목록에 나옴
directionToHead1 = .east

var directionToHead2: CompassPoint = .north


//콤마로 구분해서 쭉 나열해도 됨.
enum Planet {
  case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune, pluto
}

//mercury, venus, earth, mars, jupiter, saturn, uranus, neptune, pluto는 Planet에 속한 값
```

## Matching Enumeration Values

```swift
//컴파스포인트타입.
let directionToHead = CompassPoint.south

switch directionToHead {
case .north:
  print("Lots of planets have a north")
case .south:
  print("Watch out for penguins")
case .east:
  print("Where the sun rises")
case .west:
  print("Where the skies are blue")
}


let enumTypeAnnotation: Planet = .mars
let somePlanet = Planet.earth

switch somePlanet {
case .earth:
  print("Mostly harmless")
default:
  print("Not a safe place for humans")//사람이 살 수 없는 곳
}

```

## Associated Values

- 타입지정, let 이용가능
```swift
enum OddOrEven {
  case odd(Int) //인트타입을 받겠다, 라고 설정가능.
  case even(Int)
}

var number = OddOrEven.even(20) //선언.
number = OddOrEven.odd(13)

number
type(of: number)


switch number {
case .odd(let x): print("홀수 :", x)
case .even(let x): print("짝수 :", x)
}

switch number {
case let .odd(x): print("홀수 :", x)
case let .even(x): print("짝수 :", x)
}

```

```swift
enum Barcode {
  case upc(Int, Int, Int, Int)
  case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP") //1. 값이 무엇인지에 따라서 실행해야할때 case로 분류한 것 .

productBarcode
type(of: productBarcode)


switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check): //(예)고유번호, 바코드, 상품번호, 체크번호)4개의 변수로 받은 후
  print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode): //큐알코드에 관련된 번호 : 연관된 값을 넣을 수 있다. ! 
  print("QR code: \(productCode).")
}

```
### Question

// enum Month { case jan, feb } 정의하되 2월은 윤년인지 아닌지 정보를 저장할 수 있도록 구현

```swift
enum Month1 {
  case jan1, feb1(Bool)
}

let february1 = Month1.feb1(false)

switch february1 {
case .jan1: break
case .feb1(let isLeafYear): print(isLeafYear)
}
//false
```

## Raw Value
- Strings, Characters, or any of the Integer or Floating-point number types
- raw value 는 해당 Enumeration 내에서 반드시 고유한 값이어야 함.
*기본형*
```swift 
enum Weekday: Int { //Int타입 지정
  case sunday, monday, tuesday, wednesday, thursday, friday, saturday
}

Weekday.wednesday
Weekday.wednesday.rawValue// rawValue가 가능
//CompassPoint.로 조회 안됨. Int로 지정하면 위와 같이 rawValue가 가능


enum WeekdayName: String { //String타입 지정
  case sunday, monday, tuesday, wednesday, thursday, friday, saturday
}

WeekdayName.monday
WeekdayName.monday.rawValue


enum Gender: String { //row벨류를 따로 지정해서 구현
  case male = "남자", female = "여자", other = "기타"


Gender.male //
Gender.male.rawValue
```

### Question

-학점(A, B, C, D, F)을 enum 으로 표현하고 각 케이스에 알맞은 0.0 ~ 4.0 까지의 >값 부여

```swift
enum Grade: Double {
  case A = 4.0, B = 3.0, C = 2.0, D = 1.0, F = 0.0
}

Grade.A
Grade.A.rawValue
```

## Implicitly Assigned Raw Values

```swift
enum WeekdayAgain: Int {
 //               5,   6       7          8         9        10        11
    case sunday = 5, monday, tuesday, wednesday, thursday, friday, saturday
//          0
//  case sunday, monday = 100, tuesday = 101, wednesday, thursday, friday, saturday
//  case sunday = 1, monday = 1, tuesday = 2, wednesday, thursday, friday, saturday
}

WeekdayAgain.sunday
WeekdayAgain.sunday.rawValue

WeekdayAgain.wednesday
WeekdayAgain.wednesday.rawValue



enum WeekdayNameAgain: String {
  case sunday, monday = "mon", tuesday = "tue", wednesday, thursday, friday, saturday
}

WeekdayNameAgain.tuesday
WeekdayNameAgain.tuesday.rawValue//tue

WeekdayNameAgain.wednesday
WeekdayNameAgain.wednesday.rawValue

```

## Initializing from a Raw Value

```swift
enum PlanetIntRaw: Int {
  case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune, pluto
}

PlanetIntRaw.venus
PlanetIntRaw.venus.rawValue

PlanetIntRaw(rawValue: 5)
PlanetIntRaw(rawValue: 7)

//PlanetIntRaw(rawValue: 0)
//PlanetIntRaw(rawValue: 15)



let positionToFind = 7
//let positionToFind = 11

if let somePlanet = PlanetIntRaw(rawValue: positionToFind) {
  switch somePlanet {
  case .earth:
    print("Mostly harmless")
  default:
    print("Not a safe place for humans")
  }
} else {
  print("There isn't a planet at position \(positionToFind)")
}


```

## Nested

```swift
//함수나 변수도 선언가능.
//Device라는 특정한 값이 이것을 호출할 수 있음.


enum Device: String {
  case iPhone, iPad, tv, watch //Device는 iPhone, iPad, tv, watch 라는 case값을 갖고 있음.
  
  func printType() {
    switch self { //self현재 디바이스값이 가지고 있는 현재값. //iphone이 가지고 있는 값()// 인스턴스// self = iphone
    case .iPad, .iPhone, .tv:
      print("device :", self)
    case .watch:
      print("apple Watch")
    }
  }
}

let iPhone = Device.iPhone //Device에는printType이라는 함수를 실행시킬 수 있음.
iPhone.printType()

//내부에서 쓸때는 이미 값을 알고있음. 그래서 self쓰면됨
//외부에서는 파라미터 지정해서 써야함. 그래서 바깥에 벨류값 따로 지정하고 self자리에 value 써야함

```

* Wearable

```swift
//웨어러블 이넘 
enum Wearable {
  case helmet(weight: Weight) //1-1.네이밍 넣을 수 있음. 튜플처럼.
  case boots
 
    enum Weight: Int { //1-2. 여기는 Weight 함수 
     case light = 1
     case heavy = 3
  }
  
  func info() -> Int { //2.이곳
    switch self { //3. self = boots
    case .helmet(let weight):
      return weight.rawValue * 2
    case .boots:
      return 3 //4.return // 3
    }
  }
}


let boots = Wearable.boots //1. boots에 info()라는 함수 실행.
boots.info()

var woodenHelmet = Wearable.helmet(weight: .light) // 5. Wearable.helmet에 값이 들어오게 되면
woodenHelmet.info()

var ironHelmet = Wearable.helmet(weight: .heavy)
ironHelmet.info()


// 이넘 안에는 또다시 이넘을 넣을 수 있고, 함수도 쓸수 있다. 
// 프로퍼팀 같은 것도 쓸수 있다. 
```

## Mutating
* enum 타입 내부 함수에서 자기 자신의 값을 변경해야 할 경우 mutating 키워드 필요

```swift
//내부함수에서 자신의 값 변경 = mutating/뮤테이팅
enum Location {
  case seoul, tokyo, london, newyork
  
//  func travelToLondon() {
//    self = .london
//  } //바로 바꿀 수 없음.
  
  mutating func travelToTokyo() {
    self = .tokyo
  } //2. 이넘 내부에서 바꾸기 위한 키워드 작성 필요.
  
  mutating func travel(to location: Location) {
    self = location
  } //3. 로케이션 타입을 새로 만듬.
  
  mutating func travelToNextCity() { //4. 서울이면 도쿄로가고, 도쿄면 뉴욕으로가고, 뉴욕이면 런던으로가고, 런던이면 서울.
    switch self {
    case .seoul: self = .tokyo
    case .tokyo: self = .newyork
    case .newyork: self = .london
    case .london: self = .seoul
    }
  }
}

var location = Location.seoul //1.타입은 로케이션이고 값은 서울인. // 2-0. 로케이션 서울에서 ~ 2-1. 도쿄로 바꿨다.
location //seoul

location.travelToTokyo() //2-1. 도쿄로 바꿔버림.
location

location.travel(to: .newyork) //3-1. 로케이션타입의 값은 뉴욕이다.
location

//location.travelToNextCity()
//location.travelToNextCity()
//location.travelToNextCity()
//location
```

### Question

* on 과 off 값을 가진 enum 타입 RemoteControl 을 정의하고, 그 내부에 호출 시마다 on, off 값을 바꿔주는 함수 구현

```swift
enum RemoteCon {
    case on, off
    
    mutating func travelOff() {
        switch self {
        case .on: self = .off
        case .off: self = .on
        }
    }
}
var remote = RemoteCon.off //off로 시작했으니까 off
remote.travelOff()    //off였다가 토글하면 바로 바뀌도록..
remote.travelOff()
```


