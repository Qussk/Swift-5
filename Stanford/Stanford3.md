## Sranford3 - Array, Dictionary, String

### [[영상보기]](https://www.youtube.com/watch?v=9Q4ckFL3ak0&list=PLE0Is7fZwoLB0KbRqbDRed1QqRpNzIaPl&index=3)


## [Array]

```swift
var a = Array<String>()
//위가 기본형이지만 아래의 약어를 많이 쓰게될거임.

var a = [String]()
```

## [filter]

```swift
//filter(includeElement: (T) -> Bool -> [T]
//선택한 내용 참이면, 필터한다.
let bigNumbers = [2,47,118,5,9].filter({ $0 > 20})
print(bigNumbers) // [47, 118]
```

## [map]

```swift
//map(transform: (T) -> U) -> [U]
//map은 클로저를 받고 클러저는 Array안에 있는 요소들을 다른 것으로 바꿔버림.
let stringified: [String] = [1,2,3].map { String($0)}
print(stringified)
```

## [reduce]
```swift
//reduce(initial: U, combine: (U,T) -> U) -> U
//reduce는 Array를 하나의 결과로 줄일 수 있음.(숫자를 더해가는 방식. 이것은 단지 0으로 시작해서 줄이고 지금까지 한 것들로 수행한 다음 거기에 다음 요소를 수행한다음 거기에 다음요소를 추가해 번호를 더해가는 것.)
let sum: Int = [1,2,3].reduce(0) { $0 + $1 }
```

1.reduce가 initial과 클로져 두개의 인자를 가지고 있고 (*{$0+$1}는 클로져, reduce(0)의 '0'은 initial을 의미.
2.첫번째 인자는 *소괄호 안에 있는데, 클로져는 바깥에 있음. (위 map메소드는 첫번째 인자가 따로 없고 클로져만 인자로있는 것과 차이.그러니까 map은 첫번째 인자를 위한 ()가 없음.) - 이것을 트레일링 클로져 문법이라고 부름


## [Dictionary]

```swift
var pac10reamRankings = Dictionary<String, Int>()
//위가 기본이지만 아래의 약어를 많이 쓰게될거임.
var pac10reamRankings = [String: Int]()

pac10reamRankings = ["Stanford":1, "Cal":10]
let ranking = pac10reamRankings["Ohio state"]
print(ranking) //pac10reamRankings에는 "Ohio state"가 없을 테니까, nil.
```

* Dictionary를 통해 열거하는 법
```swift
//use a tupl with for-in to enumerate a Dictionary
for (key, value) in pac10reamRankings {
  print("\(key) = \(value)") //Cal = 10  Stanford = 1
}
//value만 원한다면 key에 _(언더바) 넣으면 됨.
```

## [String]

Tne simplest way to deal with the characters in a string is via this property...  <br>
String이 복잡한 이유는 전부 유니코드이기 때문.(문자 하나는 하나의 코드가 아니기때문에 String에 문자 단위로 순서를 매길 때 Int로 나타내지 않는 이유.
String은 String안에서 어떻게 움직이는지 알고 있는 index로 구성됨.(마치 이모지처럼)

```
//var characters: String.CharacterView { get }
```

you can think of this as an [Character] (it's not actually that, but it works like that) A Character is a "human understadable idea of a character". That will make it easier to index into the characters.

```
방법1. int로 찾아 문자를 가져올 수 있음
방법2. initializer(초기화 함수)중 하나로 Array를 생성할 수 있음.-> 그건 String이 될거고, 그러면 그것은 문자들의 배열이 됨.다만, CharacterView만큼의 효과적인 방법은 아님. String 이 길때 사용,(String index찾아보기.)

Indexing into a String itself is quite a bit more complicated. Your reading assignment goes over it all.
```

## [Other String Methods] (다른 String 메소드들)

String is automatically "bridged" to the old Objective-C class NSString. So there are some methods that you can invoke in String that are not in String's doc You can find them in the documentation for NSSting instead. Here are some other interesting String methods ...

```
startIndex -> String.Index
 endIndex -> String.Index
 hasPrefix(String) -> Bool //hasPrefix는 하나의 String이 다른 string의 접두사(prefix)를 가지고 있는 지 아닌지 알려줄 것이고, 일괄적으로 소문자로 바꾸거나 대문자로 바꿀 수 있음. 이 외에도 정교한 처리가 가능한데, 다른 String을 기준으로 하나의 String의 모든 구성요소를 별개의 String으로 구분할 수 있다는 것.
 hasSuffix(String) -> Bool
 capitalizedString -> String
 lowercaseString -> String
 uppercaseString -> String
 componentsSepararedByString(String) -> [String] // "1,2,3".csbs(",") = ["1","2","3"] //componentsSepararedByString은 String에 보내는 메소드. 여기에 있는 것처럼 이건 컴마로 표현됨. ,로 모든 String을 구분해서 추출해낼 것임.
 
 (위의 것들과 친숙해져 이미 있거나 이와 비슷한 메소드들을 적는데에 시간낭비를 하지 않도록. )
```

## [Other classes] (*또 다른 클래스)


### NSObject

```Base class for all ObjectiveC classes
Some advanced features wil require you to subclass from NSObject//일부 고급 기능을 사용하려면 NSObject에서 서브 클래스를 사용해야합니다. (and it can't hurt to be so)
```

### NSNumber :숫자인 값을 저장하여 불러올 수 있음.
```swift
//Generic number-holding class
let n = NSNumber(35.5)
let intversion: Int = n.intValue // also doubleValue, boolValue, etc.
print(intversion) //35

let f = NSNumber(4.5)
let inf: Int = f.intValue
print(inf) //4


let f2 = NSNumber(5.5)
let inf2:Double = f2.doubleValue
print(inf2) //5.5

//어떻게 이것이 가능한가? Array, Dictionary, Int, Double, NSNumber는 마법처럼 자동으로 모두 연결이 됨(*브리징)
```

### NSDate: 현재 날짜와 현재 시간을 알 수 있음(현지화 주의, 중국버전이 필요할 경우 이것을 고쳐야할 것임.)
```
//Used to find out the date and time right now or to store past or futuer dates. See also NSCalendat, NSDateFormatter, NSDateComponents. If you atr displaying a date in your UI, there are localization ramifications, so check these out!
//현재 날짜 및 시간을 찾거나 과거 또는 미래 날짜를 저장하는 데 사용됩니다. NSCalendat, NSDateFormatter, NSDateComponents도 참조하십시오. UI에 날짜를 표시 할 경우 현지화로 인한 영향이 있으므로 확인하십시오!
```

### NSData: "bag o' bits"(비트단위의 데이터 모음) - 구조화되지 않은.//비트를 달라고 하면 비트를 줘야하는
```
A "bag o' bits". Used to save/restore/transmit raw data throughout the ios SDK.
```





