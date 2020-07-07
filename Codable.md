# Codable


## Codable 이해 

- swift에만 제공(오브젝트 -c 사용불가)


![](/image/co1.png)


- 인코딩/디코딩할 때 사용하는 프로토콜
- 외부에 있는 또 다른 표현 자료로 전환 -> 그것을 가져와서 다루기 위한 것. (변환하여 작업)
- Codable = Decodable & Encodable. 두 개의 프로토콜이 합쳐진 것.


## Encoding & Decoding

[ Encoding, 부호화 ]

• 정보의 형태나 형식을 표준화, 보안, 처리 속도 향상, 저장 공간 절약 등을 위해서 목적에 맞는
다른 형태나 형식으로 변환하는 처리 혹은 그 처리 방식.

• Encoder : 인코딩을 수행하는 장치나 회로, 컴퓨터 소프트웨어, 알고리즘

• A type that can encode values into a native format for external
representation.

[ Decoding, 복호화 ]

• Encoding(부호화)된 대상을 원래의 형태로 되돌리는 일

• 예를 들어, 압축 파일을 다시 풀거나 암호화된 내용을 원래 내용으로 되돌리는 일

• A type that can decode values from a native format into in-memory
representations.


![](/image/co2.png)


![](/image/co3.png)

- XML을 해당 형식으로 돌림


### Encoder 사용 code

![](/image/co4.png)

- 데이터 변환-> 유저디폴드에 저장 -> 이상태에서 디코딩만 해주면 됨.


### Encodeing Error 시

```swift
/// An error that occurs during the encoding of a value.
public enum EncodingError : Error {
/// 주어진 값으로 인코딩을 하지 못할 때
case invalidValue(Any, EncodingError.Context)
}
```

### Decoder 사용 code 

![](/image/co5.png)

- **try!** 형식에 안맞거나, 데이터가 없거나, 타입이 틀린경우등의 오류시. 

### Decoding Error시

```swift
/// An error that occurs during the decoding of a value.
public enum DecodingError : Error {
/// 프로퍼티 타입 미스매치
case typeMismatch(Any.Type, DecodingError.Context)
/// 디코딩할 데이터의 키에 해당하는 Value 가 없을 경우
case valueNotFound(Any.Type, DecodingError.Context)]
/// 디코딩할 데이터에 지정한 키가 없는 경우
case keyNotFound(CodingKey, DecodingError.Context)
/// 데이터가 망가졌을 경우
case dataCorrupted(DecodingError.Context)
}
```


## Auto-synthesis example (자동생성)


![](/image/co6.png)


## Auto-synthesis by compiler

![](/image/co7.png)


## Manual Imaplementation

![](/image/co8.png)


## Basic 

```siwft
struct Dog: Decodable {
let age: Int
let name: String
}

let jsonData = """
{
"age": 3,
"name": "Tory"
}
"""
.data(using: .utf8)!

let dog = try? JSONDecoder().decode(Dog.self, from: jsonData)
print(dog)
```

### Decode Manually

- 만약 수동으로 처리 했다면?
```swift
// Decode Manually
struct Dog: Decodable {
let age: Int
let name: String

private enum CodingKeys: String, CodingKey {
case age
case name
}

init(from decoder: Decoder) throws {
let values = try decoder.container(keyedBy: CodingKeys.self)
age = try values.decode(Int.self, forKey: .age)
name = try values.decode(String.self, forKey: .name)
}
}
```

### Array

```swift
//Array
let jsonData = """
[
{
"age": 3,
"name": "Tory"
},
{
"age": 3,
"name": "Tory"
}
]
""".data(using: .utf8)!

let dogs = try! JSONDecoder().decode([Dog].self, from: jsonData)
print(dogs)
```

- dog.self를 array로 감싼다.

### Dictionary

```swift
//Dictionary
let jsonData = """
{
"first": {
"age": 3,
"name": "Tory"
},
"second": {
"age": 3,
"name": "Tory"
}
}
""".data(using: .utf8)!

let decoder = JSONDecoder()
let dogs = try! decoder.decode([String: Dog].self, from: jsonData)
print(dogs)
```


```swift
let jsonData = """
{
"latitude": 30.0,
"longitude": 40.0,
"additionalInfo": {
"elevation": 50.0,
}
}
""".data(using: .utf8)!

let decoder = JSONDecoder()
let coordinate = try! decoder.decode(Coordinate.self, from: jsonData)
print(coordinate)
```
- additionalInfo의 키값인 elevation에 오토로 접근할 수 없음. 
- 컴파일러한테 직접 알려줘야 가능. 


[Key로부터 값을 꺼내서 알려주기.] 

```swift
struct Coordinate {
var latitude: Double
var longitude: Double
var elevation: Double

enum CodingKeys: String, CodingKey {
case latitude
case longitude
case additionalInfo
}
enum AdditionalInfoKeys: String, CodingKey {
case elevation
}
}
extension Coordinate: Decodable {
init(from decoder: Decoder) throws {
let values = try decoder.container(keyedBy: CodingKeys.self)
latitude = try values.decode(Double.self, forKey: .latitude)
longitude = try values.decode(Double.self, forKey: .longitude)

let additionalInfo = try values.nestedContainer(
keyedBy: AdditionalInfoKeys.self, forKey: .additionalInfo
)
elevation = try additionalInfo.decode(
Double.self, forKey: .elevation
)
}
}
```
- 불필요한 값을 바로 사용할 수 있게. 


## Container Protocols

**KeyedContainer** - 딕셔너리 타입의 데이터에 사용
**UnkeyedContainer** - 배열 타입의 데이터에 사용
**SingleValueContainer** - 단일 값을 가진 데이터에 사용

참고* JSON은 KeyedContainer 임



## **JSON**

```swift
struct MacBook: Codable {
  let model: String
  let modelYear: Int
  let display: Int
}

let macBook = MacBook(
  model: "MacBook Pro", modelYear: 2020, display: 16
)

// Codable 이전 - JSONSerialization //53bytes
// Codable 이후 - JSONEncoder / JSONDecoder
```

## **Encoder**
- 부호화
- write 에 잠깐 저장. 
```swift
let jsonEncoder = JSONEncoder()
let encodedMacBook = try! jsonEncoder.encode(macBook)
print(encodedMacBook)

// JSON파일로 저장
let documentDir = FileManager.default.urls(
  for: .documentDirectory, in: .userDomainMask
  ).first!
let archiveURL = documentDir
  .appendingPathComponent("macBookData")
  .appendingPathExtension("json")

do {
  try encodedMacBook.write(to: archiveURL)
} catch {
  print(error.localizedDescription)
}
```

## **Decoder**
- 꺼내오기. 
- 도포화 
```swift
let jsonDecoder = JSONDecoder()
if let decodedMacBook = try? jsonDecoder.decode(MacBook.self, from: encodedMacBook) {
  print(decodedMacBook)
}

// 파일에서 불러오기
if let retrievedData = try? Data(contentsOf: archiveURL),
  let decodedMacBook = try? jsonDecoder.decode(MacBook.self, from: retrievedData) {
  print(retrievedData)
  print(decodedMacBook)
}

/*
 Array의 경우
 */
print("\n---------- [ Array ] ----------\n")
let arr = [macBook, macBook, macBook]

let encodedArr = try! jsonEncoder.encode(arr) //arr로 불러오기
try? encodedArr.write(to: archiveURL) //저장

if let decodedArr = try? jsonDecoder.decode([MacBook].self, from: encodedArr) { //꺼낼때, [MacBook]의 배열형태에 .self주기.
  print(decodedArr) 
}

if let retrievedData = try? Data(contentsOf: archiveURL),
  let decodedArr = try? jsonDecoder.decode([MacBook].self, from: retrievedData) {
  print(retrievedData)
  print(decodedArr)
}

/*
 Dictionary의 경우
 */
print("\n---------- [ Dictionary ] ----------\n")
let dict = ["mac": macBook, "mac1": macBook, "mac2": macBook]
let encodedDict = try! jsonEncoder.encode(dict)
try? encodedDict.write(to: archiveURL)

//메모리에서 꺼내오는 방법
if let decodedDict = try? jsonDecoder.decode([String: MacBook].self, from: encodedDict) {
  print(decodedDict)
}

//파일에서 불러오는 방법
if let retrievedData = try? Data(contentsOf: archiveURL),
  let decodedDict = try? jsonDecoder.decode([String: MacBook].self, from: retrievedData) {
  print(retrievedData)
  print(decodedDict)
}
```


##  실습 (Versus Serialization)

```swift
import Foundation

struct Dog: Codable {
  let name: String
  let age: Int
}
```
- JSONSerialization을 이용해 Dog객체 생성
- JSONDecoder를 이용해 Dog객체 생성

### Basic

```swift
let jsonData = """
  {
    "name": "Tory",
    "age": 3,
  }
  """.data(using: .utf8)!
```
### Basic - 1. JSONSerialization
```swift
//1. JSONSerialization

if let json = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any],
let name = json["name"] as? String,
  let age = json["age"] as? Int {
  print(age)
  print(name)
}
```
### Basic - 2. JSONDecoder

```swift
let jsonDecoder = JSONDecoder()
if let decodeDog = try? jsonDecoder.decode(Dog.self, from: encodeDog) {
  print(decodeDog)
}

if let retrievedData = try? Data(contentsOf: archiveURL),
  let decodeDog = try?
    jsonDecoder.decode(Dog.self, from: retrievedData) {
  print(retrievedData)
  print(decodeDog)
}
```
### Basic - [ Answer ]
```swift
extension Dog {
  init?(from json: [String: Any]) {
    guard let name = json["name"] as? String,
      let age = json["age"] as? Int
      else { return nil }
    self.name = name
    self.age = age
  }
}

/*
 Basic
 */
print("---------- [ Basic ] ----------")
// JSONSerialization
if let jsonObject = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any] {
  if let dog = Dog(from: jsonObject) {
    print("Serialization :", dog)
  }
}
```


## Change Key Names

**CodingKey**
- 인코딩 및 디코딩을 위한 Key로 사용할 수 있는 타입. 

```swift
import Foundation

let jsonData = """
{
  "user_name": "James",
  "user_email": "abc@xyz.com",
  "gender": "male",
}
""".data(using: .utf8)!


struct User: Decodable {
  let name: String
  let email: String
  let gender: String
  
  //추가됨 - (jsonData으로부터 변환할 때, 이 부분은 필요한 것만 가져와서 써도됨)
  private enum CodingKeys: String, CodingKey {
    case name = "user_name"
    case email = "user_email"
    case gender
  } // 컴파일러가 자동생성해줌.
}
//프로퍼티와 이름을 같게 만든다. 
let decoder = JSONDecoder()
let user = try decoder.decode(User.self, from: jsonData)
print(user)
//User(name: "James", email: "abc@xyz.com", gender: "male")

```
- User을 JSON으로 만들기
```let decoder = JSONDecoder()```


## Nested Codable

우주비행사 정보
```swift
import Foundation

let jsonData = """
{
  "message": "success",
  "number": 3,
  "people": [
    { "craft": "ISS", "name": "Anton Shkaplerov" },
    { "craft": "ISS", "name": "Scott Tingle" },
    { "craft": "ISS", "name": "Norishige Kanai" },
  ]
}
""".data(using: .utf8)!

// 개별적으로 Codable을 적용하는 것과 동일
//[
//  { "craft": "ISS", "name": "Anton Shkaplerov" },
//  { "craft": "ISS", "name": "Scott Tingle" },
//  { "craft": "ISS", "name": "Norishige Kanai" },
//]

struct Astronauts: Decodable {
  let message: String
  let number: Int
  let people: [Person]
  
  struct Person: Decodable { //타입이 명시되어 있으면 Decodable할때, 자동으로 처리됨. 
    let name: String
  }
}

do {
  let astronauts = try JSONDecoder().decode(Astronauts.self, from: jsonData)
  print(astronauts.message)
  print(astronauts.number)
  astronauts.people.forEach { print($0)}
} catch {
  print(error.localizedDescription)
}
```
- 데이터가 뭉탱이로 있다 해도, 타입이 제대로 명시되어 있으면 잘 처리됨. 

## Nested Keys

```swift
import Foundation

let jsonData = """
[
{
  "latitude": 30.0,
  "longitude": 40.0,
  "additionalInfo": {
    "elevation": 50.0,
  }
},
{
  "latitude": 60.0,
  "longitude": 120.0,
  "additionalInfo": {
    "elevation": 20.0
  }
}
]
""".data(using: .utf8)!

struct Coordinate {
  var latitude: Double //Double type으로 하여 바로 꺼내올 수 있도록
  var longitude: Double
  var elevation: Double //**이부분.

  enum CodingKeys: String, CodingKey {
    case latitude
    case longitude
    case additionalInfo
  }
  enum AdditionalInfoKeys: String, CodingKey {
    case elevation
  }
}

```
### Decodable & Encodable

```swift
//직접 만들어야 하는 부분
extension Coordinate: Decodable {
  init(from decoder: Decoder) throws {
    let keyedContainer = try decoder.container(keyedBy: CodingKeys.self) // -enum CodingKeys 부분 //딕셔너리 안에 있는 코드를 뽑겠다! (key에 접근하여)
    latitude = try keyedContainer.decode(Double.self, forKey: .latitude) //값
    longitude = try keyedContainer.decode(Double.self, forKey: .longitude) //값
    //try로 처리
    
    //성공하면,additionalInfo로 넣고, 실패하면
    let additionalInfo = try keyedContainer.nestedContainer( //딕셔너리 안에 있는 딕셔너리로 접근(중첩된 컨테이너 안으로 들어감)
      keyedBy: AdditionalInfoKeys.self, // 사용하겠다고 알려줌.
      forKey: .additionalInfo //additionalInfo으로부터 가져옴.
    )
    elevation = try additionalInfo.decode(Double.self, forKey: .elevation) // -enum AdditionalInfoKeys 부분// elevation에 접근하여 값을 가져오겠다.
  }
}

// 
extension Coordinate: Encodable { //Encodable : 이미 프로퍼티로 있는 값을 변환.
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(latitude, forKey: .latitude)
    try container.encode(longitude, forKey: .longitude)

    var additionalInfo = container.nestedContainer(
      keyedBy: AdditionalInfoKeys.self,
      forKey: .additionalInfo
    )
    try additionalInfo.encode(elevation, forKey: .elevation)
  }
}

do {
  let coordinates = try JSONDecoder().decode([Coordinate].self, from: jsonData)
  coordinates.forEach { print($0) }
} catch {
  print(error.localizedDescription)
}

```
- Codable 채택은 Class, Struct, Enum을 serialize / deserialize할 수 있다.  모두 사용가능 



**참고 사이트**

[decoding 링크](https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types) 
[JSON Custom Types 링크](https://developer.apple.com/documentation/foundation/archives_and_serialization/using_json_with_custom_types)

[Zedd - decoding](https://zeddios.tistory.com/373)
[Zedd - CodingKey](https://zeddios.tistory.com/394)

### Color 의 경우(정확하지 않음.. 메모용)

```swift
(...중략)
{ 
r: 255
g: 211
b: 150
}
]
```
json의 경우 이런식이거나,
```swift
struct Color {
let r: Double
let g: Double
let b: Double
}

let data = JSONSerialization.jsonObject(with: jsonData1) as! [string: Double]
ULColor(red: data["r"], green: data["g"], blue["b"])

//채택한 경우
try? JSONEncoder().encode(UIColor.black)
```
커스텀해서 쓰는 경우


