# JSON

(Javascript Object Notation)

• Javascript 언어로부터 파생 (JavaScript Object Notation)

• 프로그래밍 언어와 플랫폼 간 독립적이고 가벼워서 XML 방식을 대체하여
현재 거의 표준으로 사용되고 있는 데이터 교환 형식

• 두 개의 구조를 기본으로 가짐
- 'Name : Value' 형태의 쌍을 이루는 콜렉션 타입. 각 언어에서 Hash table, Dictionary 등으로 구현
- 값들의 순서화된 리스트. 대부분의 언어들에서 Array, Vector, List 또는 Sequence 로 구현

• XML 에 비해 기능이 적고 구조가 단순하여 파싱이 쉽고 빠르며 적은 용량으로 저장 가능
따라서 사람이 읽고 쓰는 것뿐 아니라 기계가 분석하고 생성하는 것에도 (상대적으로) 더 용이

• contents type 은 application/json 이며, 파일 확장자는 .json, 기본 인코딩은 UTF-8 을 사용


## JSON Format Example


![](/image/json1.png)

- 딕셔너리의 시작과 끝이 다름.
- key value로 구성

## JSON va XML 

![](/image/json2.png)


## JSON in Swift 

![](/image/json4.png)


(문자열을 데이터로 변환해서, JSON을 다시 swift에서 다룰 수 있는 배열로 반환등..)




## JSON Bascie

- JSONSerialization (swift 4이상가능)
- 파싱하기

### JSON Parsing (1)

*기본형*

```swift 
let jsonData1 = """
{ //딕셔너리
  "greeting": "hello world",
  "foo": "bar",
  "iOS": "Swift"
}
""".data(using: .utf8)!

//1. 위의 json을 만들어줌.
do { //2.JSONSerialization// 3.try: 에러처리할 수 있도록. (혹시 위 데이터값이 잘못된 경우를 대비)
  if let json = try JSONSerialization.jsonObject(with: jsonData1) as? [String: String],
    let greeting = json["greeting"],
    let foo = json["foo"],
    let iOS = json["iOS"] {
    print(greeting)
    print(foo)
    print(iOS)
  }
} catch {
  print(error)
}
//4.타입이 잘못된 경우 종료됨. [String: String]
```
- **throws**(내가 오류처리 안하고 네가 해.)가 있는 경우 try를 사용함. (함수 안에서 오류가 발생할 가능성이 있는 경우, 바깥으로 )
- 만약, 이 과정이 실패하면 **catch** 
- 안쓰게 될 경우, Fix 뜸. (결국, 오류처리를 위해 해야하는 과정.)


### JSON Parsing (2)

*서로 데이터 타입이 다른 경우.*

```swift

let jsonData2 = """
{
  "greeting": "hello world",
  "iOS": true,
  "SwiftVersion": 5
}
""".data(using: .utf8)!

//1.위의 내용 json만듦.
if let json = try? JSONSerialization.jsonObject(with: jsonData2) as? [String: Any], //2.Any:모든타입가능
  let greeting = json["greeting"] as? String, //(각각, 값을 꺼낼 때) 3.애니타입이었기 때문에, 각각 원하는 특정타입으로 타입캐스팅 따로 해줘야함.
  let iOS = json["iOS"] as? Bool,
  let version = json["SwiftVersion"] as? Int {
  print(greeting)
  print(iOS)
  print(version)
}

```

- **[에러핸들링]**
- **do catch** 는 **try** 써야함.
- **try?** 는  ~~do catch를 쓰지 않을 경우~~ . **try?** 일 때 실패하면 **nil**,
- **try!** 일 때 실패하면 **앱 종료**.



### JSON Parsing (3) 

*딕셔너리가 배열 안에 들어간 경우*

```swift
let jsonData3 = """
[
  {
     "postID": 1,
     "title": "JSON",
     "body": "Javascript Object Notation"
  },
  {
    "postID": 2,
    "title": "JSON 파싱",
    "body": "JSONSerialization을 이용한 방법"
  }
]
""".data(using: .utf8)!

//1.Post 스위프트에서 다루기 위해 모델 변환.
struct Post {
  let postID: Int
  let title: String
  let body: String
}
//2. try
if let jsonObjects = try? JSONSerialization.jsonObject(with: jsonData3) as? [[String: Any]] {
  for json in jsonObjects { //3. json을 for문으로 돌려서 자료구조 변환.
    if let postID = json["postID"] as? Int,
      let title = json["title"] as? String,
      let body = json["body"] as? String {
      let post = Post(postID: postID, title: title, body: body) //4.Post타입으로 가져옴.
      print(post)
    }
  }
}

```


### Q.  User 구조체 타입을 선언하고, 다음 JSON 형식의 데이터를 User 타입으로 변환하여 출력하기

- JSON 결과
```swift
User(id: 1, firstName: "Robert", lastName: "Schwartz", email: "rob23@gmail.com")
User(id: 2, firstName: "Lucy", lastName: "Ballmer", email: "lucyb56@gmail.com")
```

- 문제
```
// 힌트: TopLevel의 타입 - Dictionary
let userJSONData = """
{
  "users": [
    {
      "id": 1,
      "first_name": "Robert",
      "last_name": "Schwartz",
      "email": "rob23@gmail.com"
    },
    {
      "id": 2,
      "first_name": "Lucy",
      "last_name": "Ballmer",
      "email": "lucyb56@gmail.com"
    },
  ]
}
""".data(using: .utf8)!

```

- 풀이 

```swift 
let userJSONData = """
{
  "users": [
    {
      "id": 1,
      "first_name": "Robert",
      "last_name": "Schwartz",
      "email": "rob23@gmail.com"
    },
    {
      "id": 2,
      "first_name": "Lucy",
      "last_name": "Ballmer",
      "email": "lucyb56@gmail.com"
    },
  ]
}
""".data(using: .utf8)!

struct User {
  let id: Int
  let firstName: String
  let lastName: String
  let email: String

//init?: 생성자에서 생성이 실패할 가능성이있는경우 ?를 붙임.
init?(from json: [String: Any]) { //json데이터 넘겨받음.
    guard let id = json["id"] as? Int,
      let firstName = json["first_name"] as? String,
      let lastName = json["last_name"] as? String,
      let email = json["email"] as? String
      else { print("Parsing error"); return nil }

    self.id = id
    self.firstName = firstName
    self.lastName = lastName
    self.email = email
  }
}

func answer(jsonData: Data) {
  guard let json = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any],
    let userList = json["users"] as? [[String: Any]]
    else { return }

//compactMap: 혹시 실패할경우 nil이라는 제대로된 값을 받기위해 씀. 
let users: [User] = userList.compactMap { User(from: $0) } //User(from: $0)는 users와 같은 것.
  users.forEach { print($0) }
}

answer(jsonData: userJSONData)

```

