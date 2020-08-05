# Swift-5.0


- [x] You can refer to it through the playground
- [x] You can use swift
- [x] Now Submit to Swift



## ios List
- [Objective-C 와swift차이](#Objective-C와swift차이 )
- [iOS Fonts](http://iosfonts.com/)
- [App Store 심사지침](https://developer.apple.com/kr/app-store/review/guidelines/)
- [Apple ID](https://developer.apple.com/library/archive/documentation/General/Conceptual/DevPedia-CocoaCore/AppID.html#//apple_ref/doc/uid/TP40008195-CH64-SW1)
- [Apple Update News](https://developer.apple.com/kr/news/)


## WWDC 

- [ios-14](https://www.hackingwithswift.com/articles/221/whats-new-in-swiftui-for-ios-14)
- []

## Swift List

- [AppDelegate](#AppDelegate)
- [iOS Application State](#iOSApplicationState)
- [ViewController Life Cycle](#ViewControllerLifeCycle(생명주기))


**[문법]**
- [then(with: 전수열)](#then)


**[]**
- [메모리 구조&관리](#메모리구조&관리)
- [func](#func)
- [inout](#inout)
- [Optional Chaining](#OptionalChaining)
- [mutable/Immutable](#mutable)
- [initializer](#initializer)
- [MVC](#MVC)
- [bundle](#bundle) 
- [Nib/Xib](#Nib와Xib)
- [SDK와 API차이](#SDK와API차이)


**[Xcode]**

- [Debugging](#Debugging)


**[SwiftUI]**

- [SwiftUI](#SwiftUI)
- [SwiftUI사용](#SwiftUI사용)


## 알고리즘






## Language house(in Swift)


### Objective-C와swift차이 

- swift는 ios8에 개발에 사용됨.
- swift는 타입 추정, 타입 세이프가 제공됨.(명시할 필요 없어짐)
- swift는 isEqual메서드를 이용할 필요없이 == 연산자만으로 비교가능.
- swift는 switch문으로 분기가 가능함. objective-c는 if문으로 처리해야했음. 
- swift는 Generic타입 제공. 
- Objective-C는 class, swift는 struct 기반임. 


***
### AppDelegate

**UIResponder** 
- [http://blog.naver.com/hobin1019/221302910865](http://blog.naver.com/hobin1019/221302910865) 
- UIKit app의 이벤트핸들링을 위해 있는 것.
- UIApplication, UIViewController, UIView(UIWindow의 일종)이 모두 이벤트 responder에 포함됨.
- 이벤트가 발생하면, UIKit는 각각의 responder오브젝트로 처리하게 시킴

*event*
- 이벤트에는 터치이벤트, 모션이벤트, 리모트콘트롤이벤트, 누르는 이벤트가 있는데, 특정 이벤트를 처리하기 위해 responder는 반드시 특정 메소드를 override해야함. 
- 예를들면, 터치이벤트를 처리하기 위해 responder는 touchesBegan, touchesMoved, touchesEnded, touchesCancelled를 구현해야함.
- 터치의 경우 responder는 UIKit로부터 제공되는 이벤트 정보를 사용. 
- 터치에 대해 바뀐 점을 찾을 수 있고, 적절하게 앱의 인터페이스에 반영할 수 있게됨. 

*UIkit responder* 
- UIkit responder들은 처리되지 않은 이벤트를 당신의 app의 다른 부분으로 전달 되기도 함. 
- 주어진 respinder이 이벤트를 처리하지 않으면, 다음 이벤트 responder 체인으로 그 이벤트를 넘김. UIKit는 responder체인을 동적으로 관리하며, 미리 정해진 규칙에 따라 다음에 이벤트를 받게 될 오브젝트를 결정한다. 
- 예를 들면, view는 super view로 전달하고, root view는 ViewController로 전달함.

reponders는 UIEvent오브젝트를 처리하며, input view를 통한 custom input을 처리하기도 한다. 키보드가 input view의 한 예이다. 유저가 UITextField나 UITextView를 화면에 탭한 경우, view는 최초의 responder가 되고, 그것의 Input view(keyboard)를 보여준다. 

*Respinding to touch events*
- touchesBegan
- touchesMoved
- touchesEnded
- touchesCancelled

*Respinding to Motion events*
- motionBegan
- motionEnded
- motionCancelled

*Respinding to press events*
- pressesBegan
- presserChanged
- presserEnded
- presserCancelled

*Respinding to remote-control events*
- remoteControlRecieved


**application**: 앱 시작 전에 필요한 작업들을 여기에 작성

**applicationWillResignActive** : 앱이 비활성화 되는 단계에 들어갈 때 실행되는 메소드

**applicationDidEnterBackground**: 앱이 백그라운드 상태에 들어갔을 때 실행되는 메소드 

**applicationWillEnterForeground** :앱이 백그라운드에서 다시 화면으로 나올 때 실행되는 메소드 

**applicationDidBecomeActive** : 앱이 화면으로 나오고 나서 실행되는 메소드

**applicationWillTerminate** : 앱이 종료할 때 실행되는 메소드 

***

### iOSApplicationState

**Not Running** : 앱이 실행되지 않았거나, 시스템에 의해 종료된 상태.

**Active** : 앱이 Foreground에서 실행되고 있고, 이벤트를 받을 수 있는 상태. 

**Inactive** : 앱이 Foreground에서 실행되고 있으나, 이벤트를 받지 못하는 상태

**Background** : 앱이 Foreground에서 실행중인 상태, Home버튼을 눌렀을 때 일시적으로 Background상태가 됨

**Suspended** : 실행이 중단되어 대기중인 상태, 잠시동안 Background상태를 거친 후에 이 상태가 됨

***

### ViewControllerLifeCycle(생명주기)

- ViewController에서의 생명주기는 화면에 보여졌다가 사라지는 주기를 일컬음.
![](https://static.packt-cdn.com/products/9781783550814/graphics/0814OT_06_02.jpg)

**loadView()** 
- 화면에 띄워줄 view를 만드는 메소드로 view를 만들고 메모리에 올림.
- 설명서 보면, 이 메소드는 직접 호출하지 말라고 쓰여있음. 
- 모두를 직접적으로 코딩하여 만드는 경우를 제외하고는 override하지 않는 것이 좋음. 자세한 설명은 아래 링크
- [https://leehonghwa.github.io/blog/loadView/](https://leehonghwa.github.io/blog/loadView/)

**viewDidLoad**
- 뷰의 컨트롤러가 메모리에 로드 된 후 호출되며 시스템에 의해 자동으로 호출됨.
- 사용자가 화면이 보여지기 전에 데이터를 뿌려주는 행위에 대한 코드를 작성 할 수 있음.
- 일반적으로 리소스를 초기화하거나, 초기화면을 구성하는 용도로 쓰임
- ViewController생에 **딱 한 번** 호출 되는 것이 특징.

**viewWillAppear**
- 뷰 컨트롤러의 화면이 올라오고 난 후 뷰가 화면에 나타가기 직전에 호출됨.
- 즉, 뷰가 로드된 후 눈에 보이기 전에 컨트롤러에게 알리는 역할.
- 다른 뷰로 이동했다가 되돌아올 때 재 호출되는 메소드로 화면이 나타날 때 마다 수행해야하는 작업을 정의하기 좋음. 
- 처음 어플리케이션이 수행 되고 첫 화면이 띄워질 때 호출되는 것은 viewDidLoad()와 동일하지만, 화면 전환을 통해 **다시 현재의 화면으로 돌아올 때 viewDidLoad가 아닌 viewWillAppear가 호출됨.** 

**viewDidAppear**
- view가 데이터와 함께 완전히 화면에 나타난 후 호출 되는 메소드

**viewWillDisappear**
- 다음 ViewController화면이 전환하기 전이거나, viewController가 사라지기 직전에 호출되는 메소드
**viewDidDisappear**
- ViewController들이 화면에서 사라지고 나서 호출되는 메소드
- 화면이 사라지고 나서 필요없어지는 (멈춰야하는) 작업을을 이곳에서 함.


***

### then
- ios개발자 전수열님이 만든 라이브러리.
- [https://github.com/devxoul/Then](https://github.com/devxoul/Then)
-  Swift Package Manager 이용. 

*UIView*
```siwft
/*
보통의 예
 private let backImage : UIImageView = {
   let i = UIImageView()
   i.contentMode = .scaleAspectFill
 return i
 }()
  
  private let backImage : UIImageView = {
     $0.contentMode = .scaleAspectFill
   return $0
  
  위 형태를 then으로 처리 -> 클로져화
 */

private let backgroundImageView = UIImageView(frame: .screenBounds).then {
  $0.image = UIImage(named: "sunny")
  $0.contentMode = .scaleAspectFill
}

private let blurView = UIVisualEffectView(frame: .screenBounds).then {
  $0.effect = UIBlurEffect(style: .dark)
}

private let topInfoView = UIView()
private let locationLabel = UILabel().then {
  $0.textColor = .white
  $0.textAlignment = .center
  $0.font = .systemFont(ofSize: 18, weight: .black)
}
private let timeLabel = UILabel().then {
  $0.textColor = .white
  $0.textAlignment = .center
  $0.font = .systemFont(ofSize: 12, weight: .black)
}

let reloadButton = UIButton(type: .system).then {
  $0.setTitle("↻", for: .normal)
  $0.setTitleColor(.white, for: .normal)
  $0.titleLabel?.font = .preferredFont(forTextStyle: .title1)
  $0.alpha = 0
}
let tableView = UITableView().then {
  $0.rowHeight = Layout.currentWeatherCellHeight
  $0.tableFooterView = UIView()
  $0.backgroundColor = .clear
  $0.separatorColor = .white
  $0.allowsSelection = false
  $0.showsVerticalScrollIndicator = false
}
```
- $0으로 view에 대한 내용 간단하게 처리 

*Foundation*

```swift
import Foundation

protocol Then {}
extension NSObject: Then {}

extension Then where Self: AnyObject {
  func then(_ configure: (Self) -> Void) -> Self {
    configure(self)
    return self
  }
}

```
- 예시는 backgroundImageView로 듦.
-  **then**을 사용시, **configure**에 **self**를 넣고, **self**를 반환한다는 뜻. 
- 클로저의 내용은 configure -> then 이후의 **$0.어쩌구** 부분.

아래

- **configure(self)** 부분에 **$0**이 무엇인지 알려주어야함.
- self의 type은 imageView()
- return 은 imageView를 반환하게 됨.

***
### 메모리구조&관리
```
alloc, new, copy로 시작하지 않는 메세지로 생성된 오브젝트는 내버려두면 자동적으로 해제 된다.
만약, 그런 오브젝트 중에서 가종으로 해제되면 곤란한 경우는 retain을 호출한다.
alloc, new, copy로 시작하는 메세지로 생성된 오브젝트를 자동으로 해제하고 싶을 땐, autorelease메세지를 보낸다.
retain, release는 레퍼런스 카운트를 즉석에서 증감시키지만, autorelease는 지연하면서 레퍼런스 카운트를 감소 시킨다. 
```

*메모리 누수(memory leak)와 댕글링 포인터(deangling pointer)*
메모리를 불필요하게 많이 할당하고 있는 경우 메모리 누수 현상이 발생하고, 데이터 값이 없는 껍데기 포인터가 생성되면, 그 포인터는 댕글링 포인터가 된다. 

*메모리 구조*
Stack / Heap / Data / Code(Data)로 나누어짐

- Stack : 지역변수, 매개변수 저장공간. os가 메모리 관리. 사용량 변동 있음. 
- **Heap** : 동적할당. 객체 생성시 여기에 저장. 메모리 관리 대상. 사용량 변동 있음. 
- Data : 초기값이 있는 전역변수. 프로그램 종료시 해제. 메모리 사용량 일정.
- Code(Text) : 프로그램 코드. 프로그램 종료시 해제. 메모리 사용량 일정.

*객체 인스턴스*
- Stack에 할당 된 객체의 포인터를 참조해서 Heap영역에 있는 인스턴스에 접근할 수 있음.
- Stack에 저장되어 있는 객체의 포인터 주소로는 Heap영역에 저장되어 있는 메모리주소값과 해당 주소의 객체가 유효한지 알 수 없음.
- Stack에 이미 해제된 객체의 메모리 주소값이 저장되어 있을 수 있음 -> regerence count로 관리 

*스택 오버플로우*
- 호출 스택은 프로그램 시작시 일정 크기의 메모리가 제공됨. 
- 하지만 제안된 양의 주소 공간 이상을 사용할 떄, '스택 오버플로우'가 발생함. (프로그램 충동 발생)
- 무한 루프 혹은 재귀함수가 있는 경우나 Exception발생으로 지역변수가 매개변수가 제대로 unwind되지 않은 경우임

*함수(메소드)의 메모리 할당 방식*

각각의 함수는 실행될 때, 스택에 프레임의 형태로 Push 됨. 각 함수가 끝날 때마다 해당 프레임은 스택의 꼭대기에서 pop됨


**MMR(MRC)**
: 수동 메모리 관리
- init 계열함수 + alloc, retain, copy = > reference count + 1 시킴
- release, autorelease => regerence count - 1 시킴

*==> alloc, retain, copy의 갯수와 release, autorelease의 갯수가 동일해야함* 

- alloc : 해당 객체 생성돠 동시에 메모리 할당 (rc + 1)
- retain : rc + 1
- copy : 객체의 복사본을 만든 후 복사본의 rc + 1

- release: rc - 1
- autorelease: autoreleasepool 이 메모리에서 사라질 때 객체도 동시에 사라짐. 


**reference Count(Retain Count)**
- 각각의 객체에 레퍼런스 카운트 값을 부여해 해당 객체가 몇 번 참조 되고 있는지를 판단 할 수 있음. 
- 레퍼런스 카운트 값이 0이 되는 즉시 해당 객체를 메모리에서 해제 시킴

*Swift 예시*
- let firstinst = myClass() //새로운 객체 생성됨 (rc1 = 1)
- let secondinst = myClass() // 새로운 객체 생성됨 (rc2 = 2)
- let thirdinst = firstinst //객체 참조함(rc1 = 2)
메소드의 파라미터로 객체가 사용될 때에서 해당 객체의 rc + 1되며, 메소드 종료시 rc - 1 된다.

**autoreleasepool**
- 각각의 autorelease된 참조객체를 pool에서 보관하고 있다가 rc가 0 이되는 시점에서 모든 참조객체로 한번에 release메세지를 보내는 것
- 함수에서 객체를 반환할 때, 요용하게 쓰임

**NSString**
*stringWithFormat*
- alloc 이나 init을 사용하지 않아 별도의 retatin을 통해 rc + 1해줘야 함
- 단, 이런 간편 생성자는 오브젝트 내에서 release할 책임이 있으므로 개발자가 release해 줄 필요는 없음(stringWithFormat함수 내에서 aytorelease해서 autoreleasepool이 release처리)
*alloc + initWithFormat*
- 객체 생성돠 동시에 이미 rc가 1로 설정되므로 별도의 retain작업 필요 없
- 단, 개발자가 생성한 객체이므로 release할 의무가 개발자에게 있음


**ARC**
: 자동 메모리 관리
- release, retain, reatinCount, autorelease를 사용할 수 없음.
- 자동으로 관리해줌. 

*메모리 관리 : strong & weak & unwend*
*멀티스레드 속성: atomic & nonatomic*
*읽기/쓰기 속성: readOnly, readWrite*

Swift는 ARC방식을 채택하고 있고, Objective-c도 최신버전은 ARC방식을 사용할 수 있는 듯함. Objective-c에서 MRC방식을 사용하고 싶다면, 

Xcode -> Build Settings > Apple LLVM 9.0 - Language - Objective C > Objective -C Automatic Reference Counting > NO로 설정하면 됨.

[참고 : https://www.clien.net/service/board/cm_app/1254304](https://www.clien.net/service/board/cm_app/1254304)


***
### func
- [https://docs.swift.org/swift-book/LanguageGuide/Functions.html#//apple_ref/doc/uid/TP40014097-CH10-ID158](https://docs.swift.org/swift-book/LanguageGuide/Functions.html#//apple_ref/doc/uid/TP40014097-CH10-ID158)
- 수학에서 y = x +1 과 같은 공식들을 함수라고 칭함.
- 어떤 입력값(Argument, 인자)을 받아 이를 재료로 특정 계산을 수행하고, 계산의 결과값(Return Value)을 도출하는 일련의 과정. 
- 마치, 공장에서 기계(함수)애 원재료(인자)를 넣고, 기계를 돌려 완성품(결과값)을 만드는 과정과 유사함. -> 어떤 일을 수행하는 코드 묶음
- Class의 함수는 특별히 구분짓기 위해 Method라고 부름. 
- 예시)
```swift
func sayHello(name : String) -> String {
let qussk = "Hello, " + name
return qussk
}

func 함수명(파라미터명: 자료형) -> 리턴자료형 { 
파라미터로 받은 인자들로 수행할 코드들
return 리턴값 
}
```
- func, 함수명, 파라미터, 리턴자료형, 코드블럭등 5가지 요소 존재.

*func 함수명*
- **func** 함수임을 선언. 함수명이 있는 이유는 나중에 함수를 사용할 때 함수명을 통해 부르기 위함.
- Swift에서는 CamelCase 권장. (예)myCamelCase)

*parameter / argument*
- 함수명 뒤에 오는 소괄호는 함수의 원재료(인자)가 되는 파라미터(Parmaeter)를 표현하는 곳. 
- 파라미터명과 각 파라미터 자료형(type)을 지정함. 함수가 입력값을 받는지 유무에 따라 파라미터는 아예 없을 수도 있고, 여러 개일 수도 있음. 이렇게 선언한 함수를 사용할 때 파라미터에 들어오는 값들을 인자(Argument)라고 부름. 

*return*
- **->** 키워드는 출력값 (return값)을 표현하기 위한 구분자.
- 자료형을 지정할 때, 파라미터처럼 아예없거나, 여러 개 일 수 있으며, 임의의 이름을 지정해줄 수도 있음. 
- 만약, ->을 통해 리턴 자료형(return type)을 지정해줬다면, 코드 블럭의 맨 마지막에는 반드시 return이 있어야 하며, 리턴하는 값은 위에서 지정한 자료형(type)과 같은 자료형이어야함. 
- 자료형이 지정되어 있지 않다면 Void를 리턴함. () -> Void.

*인자값 받기*
- 함수는 입력값을 받을 수도 있고 받지 않을 수도 있음. 
- 입력값을 받는 함수를 선언할 때, 입력값들을 위해 지은 상수 이름들을 파라미터(parameter)라고 부르며, 실제 함수를 사용할 때(call) 들어오는 입력값들은 인자(argument)라고 부름. 
- 파라미터를 지정한 함수를 사용하려면 함수명과 더불어 파라미터에 대응하는 인자값들을 모두 입력해야함. 
```swift
func setUI(title : String, image : String) -> String {
return title + image
}
setUI(title : "제목", image: "나무")
```
*파라미터 / 인자는 상수*
- 파라미터는 이미 상수로 이름 앞에 let 키워드가 숨어 있음
- 상수이기 때문에 파라미터에 들어온 인자값은 임의로 변경할 수 없음.
- 변경하려면 함수 내에서 새로운 변수를 만든 후 인자값을 대입하여 다음 변수값을 변경해야함. 
- 다른 방법으로는 inout을 쓸 수도 있음. 
- 예시) 
```swift
func aboutMe(name : String, age : Int) -> String {
var newName = name //name 파라미터를 변형한 값을 새 변수에 대입
newName = "윤나"
retrun "My name is \(newName). I am \(age) years old"
}

aboutMe(name: "Qussk", age: 29)
//"My name is Qussk. I am 29 years old"
```
*Value Type 인자들*
- String, Int, Bool 등 주로 인자값으로 오는 것들의 자료형은 struct로서 value type임.
- 무슨 말이냐, 인자값들은 원본이 들어오는 것이 아니라 사본을 새로 만들어 함수 안에서 사용한다는 뜻.
-  그래서 함수 안에서 인자값들을 마구 변형해도 인자값들은 새로운 사본이기 때문에 인자값들의 원본은 그대로 이게 됨.

*외부이름 arhument Label / 내부이름 Parameter name*
- 함수 파라미터는 기본적으로 2개의 이름을 가지고 있음. 함수를 부를 때(call) 외부에서 부르는 인자 이름(argument label, 옛 external name)과, 함수 내부에서 쓰이는 파라미터 이름(parameter name, 옛 internal name). 
- 코드의 가독성을 높이기 위해
- 외부, 내부이름 지정에 따라 파라미터명을 여러가지 유형으로 나눌 수 있음.  예를 들면, **_** 와일드카드 키워드로 생략이 가능해짐 

*Variadic Parameter*
- 함수가 하나의 인자를 받을 것인지 여러 개의 인자를 받을 것인지 불분명할 때, 함수의 파라메터 자료형(type)에 **...**을 찍어 Variadic Parameter를 구성해줌. 
```swift
func catsHello(catsNames : String...) -> String {
var hiMessage = "Hello"
for i in catsNames {
hiMessage = hiMessage + i + " "
}
retrun hiMessage
}

catsHello(catNames: "PaPa") //Hellow PaPa

catsHello(catNames: "PaPa", "KaKa", "HoHo") 
//Hellow PaPa KaKa HoHo

```
이러한 Variadic Parmeter는 함수당 하나 밖에 올 수 없고, 반드시 마지막 파라미터가 되어야함. 이유는 일반적으로 함수를 호출 할 때 인자값을 구분하기 위해 콤마를 쓰게 되는데, 규칙이 없다면 Variadic인자와 아닌 인자가 뒤죽박죽 섞이게 되기 때문. 

### inout
*inout Parameter + &*
- 위의 예시들로 파라미터/인자값은 상수로 바꿀 수 없고, 바꾸려면 함수 내에 별도의 변수를 만들어 인자값을 대입시킨후 변수를 변경하는 방법을 썼음. 하지만 더 간단하게 파라미터 자료형 앞에 **inout**키워드를 넣으면 됨. 
- inout키워드를 부여 받은 파라미터는 강력한 권한을 가짐.
- 함수 밖에 있는 변수를 인자로 받아 함수 안에서 인자값을 변경 할 수 있게 되며, 나아가 인자로 쓰인 함수 밖 변수의 값까지 변경하게 됨. 
- 함수의 안과 밖 모두를 변경하기 때문에 inout이라는 이름 붙음.
- inout키워드를 부여 받은 파라미터는 호출시 이름 앞에 **&** 키워드를 붙임. 아래의 예시는 두 숫자 변수의 값을 서로 뒤바꾸는 함수 이용시 inout patameter가 사용됨.(Apple Swift문서 예시) 
- 예시) 
```swift
func swapTwoInts(a: inout Int, b: inout Int) {
let temporaryA = a
a = b
b = temporaryA
}

var someInt = 3
var anotherInt = 107

swapTwoInts(a: &someInt, b: &anotherInt)

print("someInt is \(someInt), anotherInt is \(anotherInt)")
//someInt is 107, anotherInt is 3
```

*자료형으로써의 함수(func Type)*
- Xcode에서 cmd + 클릭시 help 보면. (int, int) -> int, (Stfing, Int) -> String같은 것들이 함수 자료형.
- 앞의 소괄호는 Tuple을 표현한다기 보다, 파라미터를 구분하기 위해 표시하는 것임. 그래서 하나면 (String) -> String.
- 예시) 변수에 함수가 대입된 경우 
```swift
//임의의 덧셈함수
func add (s1: Int, s2: Int) -> Int {
return s1 + s2
}

//변수에 함수 대입. 해당 변수는 (Int, Int) -> Int 자료형을 갖게 됨
var myMathVariable = add

//변수가 함수처럼 사용됨
myMethVariable(5,2)  //7
```
- 모든 함수는 자료형을 갖고 인자값들을 받아 결과값을 토출 할 때, 인자값, 결과값들 모두 개별적인 자료형을 갖고 있음. 함수가 자료형을 가짐으로써 함수를 다른 함수의 인자값에 손쉽게 넣을 수도, 어떤 함수의 리턴값으로 다시 함수가 나올 수 있게 되는 것임. 즉, 함수끼리 연결해지기 쉬워짐.
- 예시2) 함수의 인자라 리턴 값도 함수 자료형일 수 있음. 
```swift
func add(s1: Int, s2: Int) -> Int {
return s1 + s2 
}

func mathResult(mathfunction: (Int, Int) -> Int
                , s1: Int, s2: Int) -> String {
                return "Result: \(mathFunction(s1,s2))"
}
print(mathResult(mathDunction: add, s1: 5, s2: 2)// Result: 13
```
위의 mathResult는 mathfunction, s1,s2 라는 3가지 파라미터를 갖고 있는 함수. mathfunction라는 파라미터는 2개의 정수를 받아 1개의 정수를 리턴하는 함수 자료형. 
- 예시3) 함수의 리턴 값이 다시 함수가 되는 것의 예
```swift
func add(s1: Int, s2: Int) -> Int {
return s1 + s2
}

func multiply(s1: Int, s2: Int) -> Int {
return s1 + s2 
}

func addOrMultiply(isAdd: Bool) -> (Int, Int) -> Int {
if isAdd {
return add
} else {
return muliply
}
}

addOrMultiply(isAdd: true)(5,10)
//Result: 7
```
- 참고 : 리턴값이 없는(void)함수의 자료형은 () -> () 로 표시하지 않고, () -> Void라고 표시함. 
***


### OptionalChaining
- [https://docs.swift.org/swift-book/LanguageGuide/OptionalChaining.html#//apple_ref/doc/uid/TP40014097-CH21-ID245](https://docs.swift.org/swift-book/LanguageGuide/OptionalChaining.html#//apple_ref/doc/uid/TP40014097-CH21-ID245)
- Optional Chaining이란, 값이 nil수도 있는 프로퍼티, 메소드, 서브스크립트 등을 체인처럼 길게 이어가면서 선언하는 것을 일컬음.
- 각 값들 뒤에 **?** 를 붙이면서 이어가게 됨.(instance.property?.method?.property?등으로 이어진 구조로 좌에서 우로 이동하면서 값이 nil이 아닌지 판별. 
- 그 중 하나라도 nil로 판명된다면 이동을 멈추고 바로 체인 전체의 결과값이 nil이됨. 
- 예시) get으로 활용된 예시
```swift
class Person { 
var residence: Residence?
}

class Residence { 
var numberOfRooms = 1
}

let john = Person()
john.residence?.numberOfRooms //nil

john.residence = Residence()
john.residence?.numberOfRooms // Optional(1)

```
- 첫번째 시도. residence가 셋팅되지 않아 nil값 가져옴. 
- residence프로퍼티 유무에 따라 전체 체인의 값이 달라지게 됨. 
- 예시2) set으로 활용된 예시
```swift
class Person {
var name : String
var house: House?

init(name: String) {
self.name = name
}
}

class House {
var region = "Seuol"

func printRegion() {
print(region)
}
}

var qussk = Person(name: "Qussk")

qussk.house?.printRegion() // nil(get)

qussk.house? = House()  // nil(set) 해당 property를 세팅하는 과정에서도 setting전에 nil이면 nil이 실행됨. 
qussk.house?.printRegion() //nil

qussk.house = House()
qussk.house?.printRegion() // "Seuol"

```

***



### mutable

**mutable(뮤터블)** 
- 변경 가능한 객체 
- 최초생성 이후에 자유롭게 값의 변경, 추가, 삭제등이 가능
- 예시) int, float, list, 사용자 정의 클래스 

**immutable(이뮤터블)**
- 변경 불가능한 객체 
- 최초 생성 이후에 값을 변경할 수 없다
- 예시) tuple, string, dictionary - key
- 이 외에 내장 타입인 숫자, 불리언 등이 포함됨. 

*Swift에서 Sting은 mutable인가 immutable인가?*
- **Objective-c에서는 String이 Class였고, Swift의 String은 Struct(구조체)임.** class 기반인 Objective-c에서는 NSString, NSMutableString처럼 애초에 mutable과 immutable의 구분이 가능했지만, Swift에서는 구조체 기반으로 Struct는 value-type이다. 따라서, Int와 같은 value와 동일하게 동작함. 
- 위의 이유로 swift는 value-type의 객체를 let이 아닌 var로 선언할 경우 mutable함수를 통해 값을 업데이트 할 수 있으므로 mutable이고, let은 immutable인 셈. 
- 겉보기에, struct내부의 value를 바꾸는 것처럼 보이지만, 내부적으로는 바꾸려는 value를 가지고 있는 value-type(struct)를 재셋팅 하는 것이다. 

***

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





***

### MVC 

Model View Controller 
- Model : data&logic
- View : user inter face 
- Controller : Mediator

모델과 뷰는 절대 서로 직접적인 수신호를 주고 받지 않고 컨트롤러를 통해서 함.
장점은 어플의 새로운 버전을 만들때 다른 테마 등의 데이터 변경 용이. 

***

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
***

### Nib와Xib
 **nib** : Next Interface Builder의 약자 (바이너리 binary)
 
 **xib** : Xml Interface Builder의 약자 (xml기반)
- nib와 xib는 기능적으로 거의 동일함.
- xib가 "플랫파일"에 저장된다는 점이 다름
(flat file: 플랫파일은 아무런 구조적 상호관계가 없는 레코드들이 들어 있는 파일)
- xib는 bundle이 아닌 플랫파일이기 때문에, SCM(source control management: 소스제어관리)시스템에 비해 쉽게 처리가능. (바이너리로 저장하지 않고 xml 형태로 저장하기 때문에 수정된 부분을 알 수 있어서 파일 관리가 아닌 소스코드로 관리가 가능해짐)
- 빌드시, xib가 앱에 포함될 nib로 컴파일되면서 사용됨. (xib를 컴파일하면 nib가 만들어짐)
- nib를 사용하지 않는 이유는 바이너리므로 nib파일과 함께 SVN사용시 문제발생. 그래서 xib가 nib를 대신함
- nib는 diff를 수행할 수 없고, 바이너리 파일로 처리해야하기 때문에 효율성이 떨어진다고 판단


### SDK와API차이

- **SDK**는 특정 플랫폼을 대상으로하는 소프트웨어 응용 프로그램을 개발하는 데 사용할 수있는 도구 모음. SDK에는 프로그래머가 응용 프로그램을 개발하는 데 도움이되는 도구, 라이브러리, 설명서 및 샘플 코드가 포함되어 있다. 예를들면, 페이스북 SDK, 인스타 SDK, iOS SDK 등.. 널리 사용되는 일부 SDK는 모든 라이브러리, 디버깅 유틸리티 등을 포함하는 Java SDK (JDK)로, Java에서 프로그램 작성을 훨씬 쉽게 해준다. SDK는 서로 호환되는 구성 요소 / 도구를 찾을 필요가없고 모든 패키지가 설치하기 쉬운 단일 패키지에 통합되어 있음! 

- API는 소프트웨어 프로그램이 서로 상호 작용할 수있는 인터페이스임. API는 서로 통신하기 위해 프로그램이 따라야하는 일련의 규칙을 정의하고, 일반적으로 두 응용 프로그램이 통신하기 위해 루틴, 데이터 구조 등을 정의하는 방법을 지정한다. 
사례로, API이 제공하는 기능은 Java API와 같은 프로그래밍 언어의 라이브러리 기능을 제공하는 일반 API가 있고, Google Maps API와 같은 특정 기능을 제공하는 API도 있다. 언어 별 API도 있으며 이는 특정 프로그래밍 언어에서만 사용할 수 있게 된다. 또한 여러 프로그래밍 언어와 함께 사용할 수있는 언어 독립적 인 API가 있다. 이 처럼, API는 필요한 기능이나 데이터 만 외부에 노출시키면서 응용 프로그램의 다른 부분에는 액세스 할 수 없도록한다. 또, 일부 기능 및 데이터를 API를 통해 웹 외부로 허용하는 것이 일반적이다. 

*정리*
API는 소프트웨어 프로그램이 서로 상호 작용할 수있는 인터페이스 인 반면 SDK는 특정 플랫폼을 대상으로하는 소프트웨어 응용 프로그램을 개발하는 데 사용할 수있는 도구 모음이라는 것. 가장 간단한 버전의 SDK는 특정 프로그래밍 언어와 상호 작용하는 데 필요한 일부 파일이 포함 된 API 일 수 있다. 따라서 API는 모든 디버깅 지원 등이없는 간단한 SDK로 볼 수 있다.



## [Xcode]

### Debugging

- bug : 버그
- debug : 버그를 없앤다.

**[디버깅 프로세스]**
- 문제식별 및 발생 위치 찾기
- 실행코드의 제어 흐름 및 데이터 구조를 조사하여 원인 규명
- 솔루션을 고안하고 그에 따라 코드 수정
- 수정된 앱을 실행하고 수정된 코드가 잘 동작하는지 확인

**LLVM** - Xcond의 컴파일러 + 툴체인

**LLDB** - LLVM환경에서 동작하는 디버거 , LLDB는 명령 행 디버거는 모든 Apple 플랫폼에서의 개발을 위한 기본 디버깅 서비스 제공함 

```swift
@objc func basicDebugging(_ sender: UIButton){
  var sum = 0
  for i in 0...100{
    sum += i
  }
  print(sum)    
}
```

**Debugger Command**
```
help apropos
help po
p list
p number
```
- help - 명령어 나열 및 도움말 출력
- apropos - 단어나 특정 주제에 대한 내용 검색
- po(print object) - DebugDescription 또는 description내용 출력 ( DebugDescription > description 우선순위 )
- p - LLDB 기본 형식으로 출력
- expression - 새로운 변수 넣기. 에디터 코드를 넣는 것과 같은 효과.(인라인으로 작성)
- 예시)
```swift
e
(lldb) p let $myValue = 3
(lldb) p $myValue
(Int) $R82 = 3
```
- 임의의 값을 선언하고 출력 해볼 수 있음. 

```swift
e

1 let $myView = UIView()
2  $myView.backgroundColor = .red
3  $myView.frame = .init(x: 100, y: 100, width: 100, height: 100)
4 self.view.addSubview($myView)
5
  c
  c(컨티뉴로 완성)
```
- 임의의 View를 만들 수 있음. (색변경, 오토레이아웃 등 가능)

**Veiw주소값을 통해 조회 [ Obj-C ], [ Swift ] 버전.** 
```
[ Obj-C ]
  (lldb) e ((UIButton *)0x7fea7d30af20).backgroundColor = [UIColor redColor]

  [ Swift ]
  (lldb) e -l swift -- import UIKit
  (lldb) e -l swift -- unsafeBitCast(0x7fea7d30af20, to: UIButton.self).backgroundColor = .blue
```
***

## SwiftUI 

### **SwiftUI**

*swiftUI소개*
 [ https://developer.apple.com/kr/xcode/swiftui/](https://developer.apple.com/kr/xcode/swiftui/)

*튜토리얼*
[https://developer.apple.com/tutorials/swiftui/tutorials](https://developer.apple.com/tutorials/swiftui/tutorials)


### SwiftUI와 Objective-C(UIKit)차이 

- Objective-C의 UIKit는 class 기반임 , SwiftUI는 struct기반(구조체)
- iOS. tvOS. macOS - AppKit,  watchOS - watchKit 처럼 알맞은 Kit를 이용해야하지만, SwiftUI는 모든 기종 호환가능. 


### **SwiftUI사용**  

- View와 body로 구성됨.  그 중 body를 구현하는것 . (some View => 사용자에게 보여지는 뷰). 뷰의 프로토콜을 구현하는 어떤 것 **someView**.

- **Assets.xcassets(에셋)** 앱 출시시 사용하는 이미지와 **preview Assets.xcassets(프리뷰에셋)**  개발하는 동안에만 사용하는 이미지로 구분됨. 
- 시뮬레이터가 아닌, 프리뷰(preview)이용.
- 메서드체이닝의 형태. ~ (선언적 구문) 
예시)
```
Text(“ASDR") 
.Font(.title)
.fintWeight(.balck)
.italic()
```
- 속성값을 불러옴 
- **modifier** 는 method이지만, 수식어와 비슷한 속성을 가짐 (뷰에서 사용가능한 메서드, 어떤 변화를 가미한 새로운 뷰를 반환하는 메서드. 원본은 그대로 두고, 계속 변경해 나가는 것. 덧칠해나가는 것.) 

### **사용 코드 (예시: Text)**

```swift
import SwiftUI

struct Ex01_Text: View {
  var body: some View {
    //2.someView를반환하는 연산프로퍼티라서 그냥 여기다가 갖다 씀
    example05  //<- 함수 호출하듯이 이곳에 해당하는 someView호출.
  }
  
  //error = Compiling failed: extra tokens at the end of #sourceLocation directive
  
  
  var example01: some View {
    
    //1.swiftUI는 대 부분의 retrun이 생략되어 있음(보통 View를 표현할때는 생략)
    
    Text("Hello, SwiftUI")
      //  .font(.headline)
      .fontWeight(.light)
      .foregroundColor(Color.purple)
      // .font(.system(size: 40, weight: .light))
      .font(.custom("AppleGothic", size: 40))
      .blur(radius: 3.0)
    
    // cmd+shif+L 로 끌어와서 쓸수도 있음. 
    
  }
  
  
  // (텍스트간의 합성 용의)
  var example02: some View {
    Text("Hello").font(.headline)
      .foregroundColor(.blue)
      .italic()
      +
      Text("SwiftUI").font(.largeTitle)
        .foregroundColor(.green)
        .baselineOffset(8)
    
  }
  //밑줄 긋기등
  var example03: some View {
    
    Text("Hellow, Qussk")
      .font(.title)
      .kerning(5)
      .underline(true, color: .orange)
      .strikethrough(true, color: .blue)
  }
  
  
  //중요!: 수식어 적용시 순서 주의.
  var example04: some View {
    Text("Qussk")
      .font(.largeTitle) //Text
      .bold() //Text
      .background(Color.yellow)
    //View
    
    
    //    Text("Qussk")
    //        .font(.largeTitle) //View - 알아서 속성이 바뀜.
    //        .background(Color.yellow) //Veiw
    //        .bold() => text가 가진 속성 //Text
    //       -background가 가진 속성은 View~ 반환타입도 View이기 때문에 bold()를 쓸수 없음.
  }
  
  
  //내용은 같은데 순서가 다르다. why?
  var example05: some View {
    VStack(spacing: 20) {
      //spacing: 뷰간의 간격
      Text("🐰🦊🐻🐼").font(.largeTitle)
        .padding()
        .background(Color.yellow)
      //뷰의 크기만큼 배경색을 주느냐,
      
      Text("🐶🐱🐭🐹").font(.largeTitle)
        .background(Color.green)
        //백그라운드 색을 주고, 뷰 크기를 결정하느냐
        .padding()
      
    }
  }
}
/*
 기본적으로 가운데 정렬함.
 
 */아래처럼 여러개를 한 꺼번에 볼 수 도 있음. 

//이것 때문에 Preview가 나올 수 있음.
//struct Ex01_Text_Previews: PreviewProvider {
//  static var previews: some View {
//    Group {
//      Ex01_Text()
//        .previewLayout(.sizeThatFits)
//      //.previewLayout(.fixed(width: 300, height: 200))
//
//      Ex01_Text()
//        .preferredColorScheme(.dark)
//        .previewDisplayName("iPhon 11")
//        .previewDevice(PreviewDevice(rewValue: "iPhon 11"))
//
//      Ex01_Text()
//        .preferredColorScheme(.dark)
//        .previewDisplayName("iPhon 8")
//        .previewDevice(PreviewDevice(rewValue: "iPhon 8"))
//
//    }
//  }
//}

//}
struct Ex01_Text_Previews2: PreviewProvider {
  static var previews: some View {
    Ex01_Text()
    .preferredColorScheme(.light)
  }
}
```

