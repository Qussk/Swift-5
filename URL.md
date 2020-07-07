## Url Components

![](/image/url.png)


- URL : 주소( n행 n열 등으로 찾아감.)
- URN : 주민번호(이름 부르기.)
- URI : URL, URN을 모두 합친 개념. 



### 구조 

![](/image/url1.png)

### 확인

```
http://usernamdde:password@www.example.com:80/index.html?key1=value1&key2=value2#myFragment
```

```swift
var components = URLComponents()
components.scheme = "http"
print(components)
components.user = "username"
print(components)
components.password = "password"
print(components)
components.host = "www.example.com"
print(components)
components.port = 80
print(components)
// path의 경우에는 다른 것들과 달리 /로 시작해야 함
components.path = "/index.html"
print(components)
components.query = "key1=value1&key2=value2"
print(components)
components.fragment = "myFragment" //해당 위치로 가는것.
print(components)

// query만 교체하기
var comp = URLComponents(string: "http://www.example.com/index.html?key1=value1#frag")
comp?.queryItems = [
  URLQueryItem(name: "name", value: "tory"),
  URLQueryItem(name: "breed", value: "poodle"),
  URLQueryItem(name: "age", value: "5"),
]
print(comp?.url?.absoluteString ?? "")

```


## URL Encoding


```swifr
// 영어 주소
let urlStringE = "https://search.naver.com/search.naver?query=swift"
print("영문 주소 변환 :", URL(string: urlStringE) ?? "Nil")


// 한글 주소
let urlStringK = "https://search.naver.com/search.naver?query=한글"
print(URL(string: urlStringK) ?? "Wrong URL")


// Percent Encoding
//한글부분을 제외한 모든 부분을 변환,
//허용되지 않는 부분을 Percent Encoding으로 변환해서 사용하겠다. 

let str = "https://search.naver.com/search.naver?query=한글"
let queryEncodedStr = str.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
let convertedURL = URL(string: queryEncodedStr)!
print("Encoded 한글 :", convertedURL)  // %ED%95%9C%EA%B8%80


/*
 CharacterSet.urlUserAllowed
 CharacterSet.urlPasswordAllowed
 CharacterSet.urlHostAllowed
 CharacterSet.urlPathAllowed
 CharacterSet.urlQueryAllowed
 CharacterSet.urlFragmentAllowed
 */
```

```let urlStringK = "https://search.naver.com/search.naver?query=한글"
print(URL(string: urlStringK) ?? "Wrong URL")
```
- **query = 한글"**(브라우저에서는 되는데)영어가 아닌 다른 언어의 경우, Wrong URL.(허용 안됨)
- 위의 이유로 percent Encoding으로 변환된 모습. -> %ED%95%9C%EA%B8%80 (이렇게 사용해야함)
- 브라우저에서 되는 이유? -> 브라우저 상에서 알아서 처리해줌. 


###  URL로 사진가져오기 

(Sync method)

![](/image/url3.png)

```swift
import UIKit

final class ViewController: UIViewController {
  
  @IBOutlet private weak var imageView: UIImageView!
  private let imageUrlStr = "https://loremflickr.com/860/640/cat"
  
  
  // MARK: - Sync method
  
  @IBAction private func asyncMethod() {
    print("\n---------- [ asyncMethod ] ----------\n")
    //1-0.URL로 변환
    guard let url = URL(string: imageUrlStr) else { return }
    

    //(택1)
    //2-1. 고양이 사진 가져오기(Sync)
//.    if let data = try? Data(contentsOf: url) {
//      imageView.image = UIImage(data: data)
//    }


    
    //2-2. 고양이 사진 가져오기(DispatchQueue)
//    DispatchQueue.global().async {
//      if let data = try? Data(contentsOf: url) {
//        DispatchQueue.main.async {
//          self.imageView.image = UIImage(data: data) //반드시 main에 넣어라.
//        }
//      }
//    } //단점 : 시간설정 불가.
    
    //2-3. 고양이 사진 가져오기.(URLSession) 데이터만 받아서 처리.
    let task = URLSession.shared.dataTask(with: url) { data, responds, error in
      guard let data = data else {return}
      DispatchQueue.main.async {
        self.imageView.image = UIImage(data: data) //task에 data저장.
      }
    }
    task.resume() //중요:실질적으로 이걸 통해서 실제로 실행하는 것이므로 빠뜨리면 안됨.
  }
  

```
- **Sync**는 동기방식으로 하기 때문에, 시간이 지체됨. 맨 위 **Asynchronous**를 누르면 다음 행동을 할 수 없음
- 네트워크는 보통 방법3으로 가져옴. 

- DispatchQueue는 그냥 가져오기만 
- URLSession는 네트워크에서 가져오기 위한 클래스 그룹을 조정하는 객체 **(비동기방식)** 으로, 다양한 동작 방식을 결정 할 수 있음. 



## URL Session

- 네트워크 데이터 전송 작업에 관련된 클래스 그룹을 조정하는 객체
- 비동기 방식으로 Data, Download, Upload, Stream 4가지 유형의 작업 지원
- SessionConfiguration에 의해 대부분의 기능과 동작 방식 결정 (shared, default 등)
- ComplectionHandler 또는 Delegate 방식 택일


### URL Session으로 API 가져오기 

참고: open Notify

```
 http://open-notify.org/Open-Notify-API/
```
```swift
let astronauts = "http://api.open-notify.org/astros.json"  // 우주비행사 정보
let apiURL = URL(string: astronauts)!

struct Astronaut {
  let craft: String
  let name: String
}

let dataTask = URLSession.shared.dataTask(with: apiURL) { data, response, error in
  guard error == nil else {return print(error!)}
  guard let response = response as? HTTPURLResponse, //HTTPURLResponse로 타입변환
    (200..<400).contains(response.statusCode) //성공 : 200 , error 400.
    else {return print("Invalid response")}
  guard let data = data else {return}
  
  print(data) //JSON
}
dataTask.resume()
```

### 우주비행사 명단 print하기

data는 JSON임
```
// http://open-notify.org/Open-Notify-API/
```

```swift
let astronauts = "http://api.open-notify.org/astros.json"  // 우주비행사 정보
let apiURL = URL(string: astronauts)!

struct Astronaut {
  let craft: String
  let name: String
}

let dataTask = URLSession.shared.dataTask(with: apiURL) { data, response, error in
  guard error == nil else {return print(error!)}
  guard let response = response as? HTTPURLResponse, //HTTPURLResponse로 타입변환
    (200..<400).contains(response.statusCode) //성공 : 200 , error 400.
    else {return print("Invalid response")}
  guard let data = data else {return}
  
  guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String : Any] else {
    return
  }
  print(jsonObject)
  
  guard (jsonObject["massage"] as? String) == "success",
    let people = jsonObject["people"] as? [[String:String]],
    let peopleCount = jsonObject["number"] as? Int
    else {return print("parsing error")}
  
  print("----[Parsing Success]----")
  print("총 \(peopleCount)명의 우주비행사가 탑승중입니다.")
  print("---우주 비행사 명단---")
   people
      .compactMap {
        guard let craft = $0["craft"], let name = $0["name"] else { return nil }
        return Astronaut(craft: craft, name: name)
      }
      .forEach { print($0) }
  }
  dataTask.resume()
```


## URL SessionConfiguration

- Shared: 별도의 구성 객체나 Delegate를 사용하지 않는 싱글톤 객체. 간단한 기본 설정으로 충분한 경우 사용
- Default: 기본 세션. 캐시, 쿠키 등을 디스크에 기록해두었다가 이후 활용
- Ephemeral: 임시 세션. 캐시, 로그인 정보 등을 메모리에만 기록하고 있다가 세션 종료 시 제거(시크릿 정보)
- Background: 백그라운드 세션. 앱이 실행 중이지 않은 상태에서도 데이터 전송이 필요한 경우


```swift
_ = URLSession.shared
_ = URLSessionConfiguration.default
_ = URLSessionConfiguration.ephemeral
_ = URLSessionConfiguration.background(withIdentifier: "kr.giftbot.example.backgroundConfig")

// 세션 설정
let sessionConfig = URLSessionConfiguration.default
//wifi만 가능하도록
sessionConfig.allowsCellularAccess = false
//타임아웃 대기시간 
sessionConfig.timeoutIntervalForRequest = 20 
//캐시처리 정책
sessionConfig.requestCachePolicy = .returnCacheDataElseLoad
//연결 실패시 즉각 실패를 반환할 것인지 더 기다릴 것인지 여부 
sessionConfig.waitsForConnectivity = true
//캐시설정
sessionConfig.urlCache = URLCache.shared


// * 주의 *
// URLSession 생성 시 Configuration의 값을 복사하는 것이므로 이후의 변경 사항은 반영되지 않음

//URLSession.shared 
let defaultSession = URLSession(configuration: sessionConfig)
defaultSession.dataTask(with: apiURL) { (_, _, _) in }

```
- URLSession.shared 


### 실습 

```swift

/*
 [ 실습1 ]
 다음 주소를 통해 얻은 json 데이터(국제정거장 위치 정보)를 파싱하여 출력하기
 http://api.open-notify.org/iss-now.json
 */

func practice1() {
  let apiURL = URL(string: "http://api.open-notify.org/iss-now.json")!
  
  let dataTask = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
    guard let data = data,
      let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
      else { return print("No Data") }
    
    guard let coordinate = jsonObject["iss_position"] as? [String: String],
      let latitude = coordinate["latitude"],
      let longitude = coordinate["longitude"]
      else { return }
    
    print("\n---------- [ 국제 정거장 위치 ] ----------\n")
    print(latitude, longitude)
  }
  dataTask.resume()
}

practice1()

```

```swift
/*
 [ 실습2 ]
 Post 구조체 타입을 선언하고
 다음 주소를 통해 얻은 JSON 데이터를 파싱하여 Post 타입으로 변환한 후 전체 개수 출력하기
 "https://jsonplaceholder.typicode.com/posts"
 */

struct Post {
  let userId: Int
  let id: Int
  let title: String
  let body: String
}

func practice2() {
  let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
  
  let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
    guard let data = data,
      let postList = try? JSONSerialization.jsonObject(with: data) as? [[String: Any]]
      else { return print("No Data") }

    var posts: [Post] = []
    for post in postList {
      guard let userId = post["userId"] as? Int,
        let id = post["id"] as? Int,
        let title = post["title"] as? String,
        let body = post["body"] as? String
        else { continue }
      let post = Post(userId: userId, id: id, title: title, body: body)
      posts.append(post)
    }

    print("\n---------- [ 포스트 ] ----------\n")
    print("총 \(posts.count)개")
  }
  dataTask.resume()
}

practice2()

```


