# Swift-5.0


- [x] You can refer to it through the playground
- [x] You can use swift
- [x] Now Submit to Swift



### ios List
- [Objective-C 와swift차이](#Objective-C와swift차이 )
- [ios Fonts](http://iosfonts.com/)
 


### Swift List
**[문법]**

**[]**
- [initializer](#initializer)
- [MVC](#MVC)
- [bundle](#bundle) 


  - [보여지는 텍스트](#이동할위치의텍스트)
  - ~생략~
  - #이동할위치의텍스트



## Language house(in Swift)


## [들어가기]

### Objective-C와swift차이 

- swift는 ios8에 개발에 사용됨.
- swift는 타입 추정, 타입 세이프가 제공됨.(명시할 필요 없어짐)
- swift는 isEqual메서드를 이용할 필요없이 == 연산자만으로 비교가능.
- swift는 switch문으로 분기가 가능함. objective-c는 if문으로 처리해야했음. 
- swift는 Generic타입 제공. 

## [기타] 


### initializer
swift의 객체는 사용하기 전 모든 저장 프로퍼티에 대해 초기화 필수
  - 초기값 지정
  - 옵셔널 타입 - nil값으로 초기화
  - 초기값이 없고, 옵셔널 타입이 아닌 프로퍼티에 대해서는 초기화 메서드에서 설정 
  
**designated initializer(지정생성자)**

모든 프로퍼티(객체)를 초기화 시키는 생성자
- 클래스에 반드시 1개이상 필요
- 단독으로 초기화 가능 
- (모든 초기화값을 끝낸다)

**convenience initializer(편의생성자)**

일부만 처리한 뒤 다른 생성자에게 나머지 부분 위임
- 단독으로 모두 초기화 불가
- 중복되는 초기화 코드 줄이기위해 사용
- 초기화가 끝나야만 접근가능(designated initialize인 self.init() )아래에 작성
- (모든 초기화값을 끝내지는 않음. 하지만 최종적으로 designated에 접근(프로퍼티 불러와)하여 마무리지음.)
*convenience init -> designated init -> overwrite*
```swift
convenience init(xPosition: Int){
self.init() <- init호출.
self.xPosition = xPosition <- 단독처리할 것 호출 
}
```
*convenience init -> designated init*
```swift
convenience init(width: Int, height: Int, cornerRedius: Int){
self.init(width: width, height: height, xPosition:10, yPosition:30, cornerRadius: conrnerRedius) -> designated initializer를 부를 때 값을 변경할 수도 있음.  
}
```
*convenience init -> convenience init*
```swift
convenience init(cornerRadius: Int){
self.init(width: 20, height: 20, cornerRadius: cornerRadius)
}
```
- 초기화 과정은 (convenience -> convenience -> ... -> designated (최종) 순서로 동작. designated -> designated는 호출불가)

**failable initializer**
- 생성시 실패할 수도 있음. 
- 인스턴스 생성시 특정 조건을 만족하지 않으면 객체를 생성하지 않음.
- 생성이 되면 옵셔널 타입을 반환, 생성실패시 nil반환
```swift
class Person{
let name: String 
let age: Int

init?(name: String, age: Int){
guard age > 0 else {return nil} //실패하면 nil반환
self.name = name                //성공하면 초기화
self.age = age
 }
}

//failable initializer
if let person = Person(nmae: "James", age : 20) {
person
} //person

if let person = Person(name: "James", age : -5) {
person
} else {
"Failed"
}//Failed
```
**Super class initializing**
자식클래스에서 부모클래스를 호출할때는 designated를 써야함
- 서브 클래스는 자기 자신 이외에 수퍼 클래스의 저장 프로퍼티까지 초기화 해야함
- 서브 클래스는 수퍼 클래스의 지정 생성자(designated initializer) 호출 필요 (convenience는 호출 불가)
- 수퍼 클래스의 지정 생성자가 기본 init 함수 하나만 있을 경우는 별도로 작성하지 않아도 자동으로 **super.init()**메서드 호출
- 생성자가 여러 개인 경우, 어떤 초기화 메서드를 선택해야 할지 알 수 없으므로 선택해주지 않으면 오류. 이 때는 서브 클래스에서 수퍼 클래스의 생성자를 명시적으로 선택해주어야 함. 
편의 생성자(convenience initializer)와는 무관
```swift
class Base {
var someProperty: String

init(){
someProperty = "someProperty"
}

//1-0.designated 추가시
//init(_ avlue: String){
//self.someProperty = "someProperty"
}
convenience init(someProperty: String){
self.init()
self.someProperty = someProperty
}
}

class Rectangle : Base { //자식
var width : Int
var heigth : Int

override init()
width = 10
height = 5

//1-1.
//super.init() //수퍼 클래스의 지정 생성자가 기본 생성자 하나만 있을 경우 자동 호출  
//super.init("생성자 내에서 수퍼 클래스의 편의 생성자 호출 시 오류") 

init(width: Int, height: Int) {
self.width = width
self.height = height
//1-3.
//super.init() 둘중에 하나 선택하라고 오류남. 
}
}
```
- 자식클래스(Rectangle)에는 designated가 잘 되어있으나, 부모클래스(Base)인 someProperty에 대한 designated가 없음. 그럼에도 오류나지 않는 이유는? 어차피 생성자가 1개 이기 때문.. 1개 인경우 **super.init()** 가 자동 호출되어 표현할 필요 없음. 부모클래스에서 init이 여러 개인 경우 자식 쪽에 super.init() 써줘야함.   
**override init**
- 생성자도 일반 함수처럼 override이용하여 덮어 쓸 수 있음. 
```swift
class Human { //부모
var name: String

//1-2.그냥 사용시 충돌가능
init(){
self.name = "홍길동"
}
init(name : String){
self.name = name
 }
}

class Student : Human { //자식 //1-1.Student가 Human을 상속받고 있으니까. 그냥 init쓰면 위 부모의 designated와 충돌함.  
var school: String

//1-0.override init 쓰는 이유 
override init() {
self.school = "University"
  
 super.init() //두 개의 지정 생성자 중 하나 호출
 //super.init(name:"이순신")
}

//각각하기.
//2-1.이 메서드를 사용하고
init(school: String){ //school만 받아서 
self.school = school  //자기 자신을 초기화 하고
super.init()          //부모 클래스를 초기화 하겠다. 

}

//수퍼 클래스의 지정 생성자 오버라이드와 편의 생성자 기능 동시 사용 가능
convenience override init(name:String) {  //2-0.똑같은 이름의 생성자를 사용하면서도 convenience을 사용할 수 있는 경우.
self.init(school: "Univ")
self.name = name //2-2.name은 덮어 쓰고 있는 구조. 
//2-3. 많이 쓰이는 구조는 아님 ㅎㅎ..
 }
}

let student1 = Student()
let srudent2 = Student(name: "철수")
let student3 = Student(school: "higt school")

//값출력시
student1.school  //University
seudent1.name    //홍길동

```
- 자기 자신부터 초기화 하는 건 항상 같음. 
- 상속받았을 때, 생성자의 같은 이름을 가진 생성자를 바꿔주고 싶을때는 override를 해줘야함. 


### MVC 

Model View Controller 
- Model : data&logic
- View : user inter face 
- Controller : Mediator

모델과 뷰는 절대 서로 직접적인 수신호를 주고 받지 않고 컨트롤러를 통해서 함.
장점은 어플의 새로운 버전을 만들때 다른 테마 등의 데이터 변경 용이. 


### Bundle 
번들 오브젝트는 번들 구조, 사용자 환경설정, 사용 가능한 현지화 및 기타 관련 요소를 고려하여 항목을 찾기 위한 단일 인터페이스 제공. 앱 내부, 다른 위치의 번들에서 리소스할 수 있음.

**[번들객체 사용시 일반적 패턴]**

- 원하는 번들디렉토리에 대한 오브젝트 작성.
- 번들 오브젝트의 메소드를 사용하여 필요한 자원을 찾거나 로드 
- 다른 시스템 API를 사용하여 상호작용 

*번들찾기 및 열기*
```swift
// Get the app's main bundle
let mainBundle = Bundle.main

// Get the bundle containing the specified private class.
let myBundle = Bundle(for: NSClassFromString("MyPrivateClass")!)
```
*번들에서 다른 리소스 찾기* 
```swift
NSBundle *main = [NSBundle mainBundle];
NSString *resourcePath = [main pathForResource:@"Seagull" ofType:@"jpg"];
```
*현재 프로젝트에 해당되는 이름과 타입의 파일을 가져온다.*
```swift
let path: Bundle.main.path(forResource: "CafeList", ofType: "json")
//리소스 - "CafeList" ,데이터 형태 - "json타입"
```



