## UserDefaults

- iOS 에서 데이터를 파일에 저장하기 위해 사용하는 대표적인 클래스 중 하나
- 간단한 정보를 저장하고 불러올 때 사용하며 내부적으로 pList 파일로 저장


### Memory 

- 메모리 기본형 

```swift

// Memory
var inMemory = 10
inMemory
```

### Question 

- 메모리와 파일로 저장하는 형태의 차이점은?

### UserDefaults

- 싱글톤 - 인스턴스 한 개만 만들어서 모두가 공유해서 쓰는 것

```swift
// UserDefaults 는 일반적으로 싱글톤 형태로 사용
let newUserDefaults = UserDefaults()
let singletonUserDefaults = UserDefaults.standard
//동일한 메모리를 사용할 때, 싱글톤이라고 함. //생성자 형태가 아니라 .찍어서 가져오는 것.
```

- 기본형 

```swift
var dict = ["Ten":10]
dict["Ten"] = 10
```


- set이용

```swift
//set 이용, 내가 필요한 타입으로 선택 후 가져오기.
UserDefaults.standard.set(10, forKey: "Ten")
UserDefaults.standard.integer(forKey: "Ten") //integer 키를 부르면, 키 안의 벨류를 10을 가져옴.

UserDefaults.standard.set(Double.pi, forKey: "Double Pi")
UserDefaults.standard.double(forKey: "Double Pi")//키에 해당하는 값을 가져옴.//3.141592653589793

UserDefaults.standard.set(true, forKey: "True")
UserDefaults.standard.bool(forKey: "True") //true


//하지만 모든 타입을 가져올 수 는 없음. 안되는 경우 .
//일단 date에 넣었다가, object(forKey: 로 가져옴)
let date = Date()
UserDefaults.standard.set(date, forKey: "Date")
UserDefaults.standard.object(forKey: "Date")



// object로 가져올 때는 Any 타입이므로 타입 캐스팅 필요(중요)
if let someType = UserDefaults.standard.object(forKey: "Date") as? Date {
  someType
}
```

### Q. 저장하지 않은 키를 불러올 때 결과는?

```swift
UserDefaults.standard.integer(forKey: "WrongKey") //0
UserDefaults.standard.bool(forKey: "WrongKey")    //false
UserDefaults.standard.object(forKey: "WrongKey")  //nil
```

### 결과보기 

```swift
let userDefaults = UserDefaults.standard
print(userDefaults)


//저장한 값이 딕셔너리 형태로 저장되어 있음.
print("\n---------- [ dictionaryRepresentation ] ----------\n")
//print(userDefaults.dictionaryRepresentation())



//키값만 보고싶다면.
print("\n---------- [ keys ] ----------\n")
//print(Array(UserDefaults.standard.dictionaryRepresentation().keys))


//값만 보고 싶으면.
print("\n---------- [ values ] ----------\n")
print(Array(UserDefaults.standard.dictionaryRepresentation().values))

```

```
---------- [ dictionaryRepresentation ] ----------

 ["NSInterfaceStyle": macintosh, "AKLastIDMSEnvironment": 0, "DVTDeviceRunExecutableOptionREPLMode": 1, "True": 1, "AppleITunesStoreItemKinds": <__NSCFArray 0x600000ea84e0>(
 itunes-u,
 movie,
 album,
 ringtone,
 software-update,
 booklet,
 tone,
 music-video,
 tv-episode,
 tv-season,
 song,
 podcast,
 software,
 audiobook,
 podcast-episode,
 wemix,
 eBook,
 mix,
 artist,
 document
 )
 , "NSLanguages": <__NSSingleObjectArrayI 0x600003784340>(
 en
 )
 , "Date": 2020-05-08 06:18:57 +0000, "Ten": 10, "AppleLanguages": <__NSSingleObjectArrayI 0x600003784370>(
 en
 )
 , "Double Pi": 3.141592653589793]



---------- [ keys ] ----------

 ["DVTDeviceRunExecutableOptionREPLMode", "AppleLanguages", "NSInterfaceStyle", "Double Pi", "Ten", "AKLastIDMSEnvironment", "Date", "NSLanguages", "True", "AppleITunesStoreItemKinds"]


---------- [ values ] ----------

[2020-05-08 06:20:26 +0000, 1, 0, 3.141592653589793, macintosh, 1, <__NSCFArray 0x600001d8c1a0>(
itunes-u,
movie,
album,
ringtone,
software-update,
booklet,
tone,
music-video,
tv-episode,
tv-season,
song,
podcast,
software,
audiobook,
podcast-episode,
wemix,
eBook,
mix,
artist,
document
)
, 10, <__NSSingleObjectArrayI 0x600002498490>(
en
)
, <__NSSingleObjectArrayI 0x6000024984a0>(
en
)
]

```



