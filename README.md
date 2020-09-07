# Swift-5.0


- [x] You can refer to it through the playground
- [x] You can use swift
- [x] Now Submit to Swift



## iOS 
- [iOS Fonts](http://iosfonts.com/)
- [App Store 심사지침](https://developer.apple.com/kr/app-store/review/guidelines/)
- [Apple ID](https://developer.apple.com/library/archive/documentation/General/Conceptual/DevPedia-CocoaCore/AppID.html#//apple_ref/doc/uid/TP40008195-CH64-SW1)
- [Apple Update News](https://developer.apple.com/kr/news/)
- [Apple Human-interface ](https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/color/)

## WWDC 

- [ios-14](https://www.hackingwithswift.com/articles/221/whats-new-in-swiftui-for-ios-14)
- [UIMenu](https://zeddios.tistory.com/1098?category=682195)
- []

## Swift 
- [](#)
- [Objective-C 와swift차이](#Objective-C와swift차이 )
- [AppDelegate](#AppDelegate)
- [iOS Application State](#iOSApplicationState)
- [ViewController Life Cycle(생명주기)](#ViewControllerLifeCycle)
- [Main run loop](#MainRunLoop)
- [Update Cycle](#UpdateCycle)
  - [Layout](#Layout)
  - [Display](#Display)
  - [Constraints](#Constraints)
- [CoreAnimation](#CoreAnimation)
- [CALayer](#CALayer)
- [iOS UIClassDiagram](#UIClassDiagram)

**[문법]**
- [데이터 타입](#데이터타입)
  - [Int](#Int)
  - [Double](#Double)
  - [Bool](#Bool)
  - [Character](#Character)
  - [String](#String)
  - [특수문자,이스케이프시퀀스](#특수문자,이스케이프시퀀스)
  - [var(변수)](#var)
  - [let(상수)](#let)
- [타입어노테이션과 타입추론](#타입어노테이션과타입추론)
- [Tuple](#Tuple)
- [as](#as)
- [is](#is)
- [Any와 AnyObject](#Any)
- [연산자](#연산자)

- [then(with: 전수열)](#then)
- [extention](#extention)
- [Protocol](#Protocol)
- [Class](#Class)
- [메모리 구조&관리](#메모리구조)
- [func](#func)
- [inout](#inout)
- [Optional](#Optional)
  - [Optional unwrapping](#Optionalunwrapping)
  - [Optional Binding](#OptionalBinding)
  - [implicitlyunwrapping](#implicitlyunwrapping)
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

### ViewControllerLifeCycle

- ViewController에서의 생명주기는 화면에 보여졌다가 사라지는 주기를 일컬음.
![](https://static.packt-cdn.com/products/9781783550814/graphics/0814OT_06_02.jpg)

**loadView()** 
- 화면에 띄워줄 view를 만드는 메소드로 view를 만들고 메모리에 올림.
- 설명서 보면, 이 메소드는 직접 호출하지 말라고 쓰여있음. 
- 모두를 직접적으로 코딩하여 만드는 경우를 제외하고는 override하지 않는 것이 좋음. 자세한 설명은 아래 링크
- [https://leehonghwa.github.io/blog/loadView/](https://leehonghwa.github.io/blog/loadView/)

**loadViewIfNeeded(iOS9이상)**
- 뷰 컨트롤러의 뷰가 아직 설정되지 않은 경우로드

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

**viewWillLayoutSubviews**
-경계가 확정되는 라이프사이클 첫단계. 뷰 컨트롤러의 뷰의 layoutSubviews 메서드가 호출되기 직전에 호출됨.**뷰의 bounds(좌표,크기)가 최종적으로 결정되는 최초시점.** (변경될 때, 뷰는 하위뷰의 위치를 조절한다.) 뷰가 하위 뷰의 배치를 조절하기 전에 뷰 컨트롤러는 이 메서드를 override할 수 있다. 
- 컨스트레인트나 오토레이아웃을 사용하지 않았다면, 서브뷰의 레이아웃을 업데이트하기 적합한 시점
- 여러 번 중복으로 호출될 수 있다.
- 메인뷰의 서브뷰가 로드되는 경우 (테이블뷰나 컬렉션뷰가 로드된 경우? )
- 기본값 nop으로 아무것도 하지 않음

**viewDidLayoutSubviews**
- 뷰 컨트롤러에 하위 뷰가 설정되었음을 알림
- 서브뷰가 셋업되고 난 후 호출
- 서브뷰가 셋팅된 후 변경할 점이 있다면 여기서 수정하기 적합함
- 기본값 nop으로 아무것도 하지 않음

**viewWillDisappear**
- 다음 ViewController화면이 전환하기 전이거나, viewController가 사라지기 직전에 호출되는 메소드
**viewDidDisappear**
- ViewController들이 화면에서 사라지고 나서 호출되는 메소드
- 화면이 사라지고 나서 필요없어지는 (멈춰야하는) 작업을을 이곳에서 함.

**viewDidUnload /viewDidDispose** 
- iOS6이후 사용하지 않음. (Objective-C에서이 부분은 메모리관리 및 릴리스를 수행하는 곳이지만 자동으로 처리되므로 Swift에서 할 필요가 거의 없음.)
- viewDidUnload의 경우 메모리 경고 발생시 뷰가 해제되어 사라지는 메소드 

***

### MainRunLoop

- 유저가 일으키는 input이벤트 들을 처리/응답 해주는 것을 담당하는 프로세스. 
- UIApplication은 Main Run Loop 를 View 와 관련된 이벤트나 View 의 업데이트에 활용. Main Run Loop 는 View와 관련되어 있기 때문에 main 쓰레드에서 실행됨.

![](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FuAgGr%2FbtqtY06MuFR%2FE2mbpHiCau6pF66eO3b8J0%2Fimg.png)

*그림.사용자 이벤트(user interaction) 발생 및 처리과정*
1. 유저가 이벤트를 일으킴(터치,줌인등의 input)
2. 시스템을 통해 이벤트가 생성됨.
3. UIKit 프레임워크를 통해 생성된 port로 해당 이벤트가 앱으로 전달
4.이벤트는 앱 내부적으로 Queue의 형태로 정리되고, Main Run Loop에 하나씩 매핑됨.
5. Application object(애플리케이션 객체)는 유저로부터의 input 이벤트를 해석하고 그에 상응되는 애플리케이션의 Core object들 안에 있는 핸들러를 호출(여기서 핸들러란 개발자가 입력한 코드)
6. 이러한 메서드들이 반환되면 다시 컨트롤은 main run loop로 돌아가서 Update Cycle이 다시 시작됨
7. Update Cycle은 View 들을 배치하고 다시 그리는 역할



![](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Multithreading/Art/runloop.jpg)

*그림.전달받은 이벤트를 앱의 run loop에서 처리하는 과정*

1. run loop 대기 중 이벤트 발생(주로 입력소스와 타이머소스 처리)
2. 정해진 메소드 호출(타이머에서 설정한 시간데 따라)
3. 메소드 완료 후 변경될 필요가 있는 사항 적용(뷰의 경우 setNeedsLayout, setNeedsDisplay)
4. runUntil- 메소드에서 정한 시간까지 유지, 할일 없으면 suspend 상태.
[https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Multithreading/RunLoopManagement/RunLoopManagement.html](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Multithreading/RunLoopManagement/RunLoopManagement.html)


***

### UpdateCycle

- Update Cycle은 애플리케이션이 유저로부터의 모든 이벤트 핸들링 코드를 수행하고 다시 main run loop로 컨트롤을 반환하는 지점임. 바로 이 지점에서 시스템은 우리의 View들을 배치하고(layout), 보여주고(display) 제약(constraints)함
- 만약 우리가 이벤트 핸들러들을 처리하는 과정에서 어떤 UIView에 대해 변화를 준다면, 이 UIView는 다시 그려져야(redraw) 한다고 표시됨.
- 유저가 상호작용하는 것과 레이아웃이 변하는 시간의 갭은 유저가 인지하지 못할 정도여야 하며, iOS 애플리케이션은 초당 60프레임을 보여주기 때문에, 한 번의 Update Cycle은 1/60초 가 걸림(매우 신속).
- Update Cycle은 빠르게 업데이트 되기 때문에 유저는 UI와 상호작용 간의 차이를 느끼지 못함. 
- 그러나, Update Cycle에 대한 이해가 중요한 이유는 이벤트가 처리되는 시점과 실제로 View가 다시 그려지는 시점에 차이가 있기 때문에, View는 우리가 View를 업데이트 하기를 원하는 run loop의 특정 시점에 업데이트가 되지 않을 수 있으므로 주의 필요. 

*MainRunLoop가 한바퀴 돌 때, Update Cycle이 언제 발생하는지 표현한 그림*
![](https://miro.medium.com/max/1242/1*dz6Rr1Pe9fXd3K285SxdJg.png)


***

### Layout

- 화면에서 UIView의 크기와 위치를 의미. 모든 View는 frame을 갖고 있고, 이는 부모 뷰의 Coordinate System(좌표계)에서 어디에 위치하고 얼마나 크기를 차지하는지를 나타냄. 
- UIView는 시스템에게 UIView의 레이아웃이 변했다고 알려줄 수 있는 메서드나, View의 레이아웃이 다시 계산되는 시점에 특정한 작업을 실행할 수 있게 오버라이딩할 수 있는 콜백 메서드도 제공함. UIView의 하위 메서드는 아래와 같다. 


**layoutSubviews()**
- 서브 뷰들의 위치나 크기를 결정하는 제약조건을 사용함에 따라 View(부모)와 자식뷰들의 위치와 크기를 재조정(배치). 

```
해당 메서드는 재귀적으로 모든 자식 뷰의 layoutSubviews까지 호출해야 하기 때문에 실행 시에 부하가 큰 메서드임. 시스템은 layoutSubviews를 뷰의 frame을 다시 계산해야 할 때 호출하기 때문에 layoutSubviews를 오버라이딩해서 frame이나 특정한 위치와 크기를 조절할 수 있지만, 레이아웃을 업데이트해야 할 때 layoutSubviews를 직접 호출하는 것은 금지되어 있음.

layoutSubviews가 완료될 때, viewDidLayoutSubviews가 View를 소유한 ViewController에서 호출되기 때문에, layoutSubviews는 View의 layout이 변화했다는 유일한 콜백으로 레이아웃의 크기나 위치와 연관된 로직을 viewDidLoad나 viewDidAppear가 아닌, viewDidLayoutSubviews에 호출해야 함. 이것이 오래된 레이아웃이나 위치 변수를 다른 계산에 사용하는 실수를 막는 유일한 방법이 됨..

이러한 방식들은 모두 run loop가 돌아가는 동안 layoutSubviews가 실행되는 시점이 다르며, 직접 layoutSubviews를 호출하는 것보다는 부하가 덜하므로 사용됨
```

*Automatic refresh triggers*

다음과 같은 이벤트들은 자동으로 View가 그것들의 layout에 변화가 생겼다고 표시를 해주어서 개발자가 직접 요청할 필요 없이, layoutSubviews가 다음 기회에 호출이 되게 해줌.
- View를 Resizing
- SubView를 추가
- UIScrollView를 스크롤할 때, UIScrollView와 그것의 부모뷰에 layoutSubviews가 호출
- Device를 회전(orientation change)
- View의 Constraint를 변경

위의 방법들은 자동으로 시스템이 View의 위치가 변했고, 다시 계산되도록 하여 결국엔 layoutSubviews가 호출되게 해줌. 그러나 layoutSubviews를 직접 호출해줄 수 있는 방법들도 존재함(아래).


**setNeedsLayout()**

- 가장 적은 부하로 호출할 수있는 메서드.(layoutSubview가 호출 됨)
- setNeedsLayouts은 시스템에게 이 View의 layout이 다시 계산되어야 한다고 알려줌
- 그러나,  **setNeedsLayout은 즉시 반환되지만, 실제로 View를 업데이트해주는 것은 아님**메서드가 완료되어 즉시 반환되기 때문에 비동기 액티비티의 성질을 가짐. (그러나 레이아웃과 다시 그리는 작업이 실제로 발생하기 전까지는 아직 이른상태이고 업데이트 주기가 언제일지도 모르는 상태.)
- 다만, 시스템이 다음 Update Cycle에서 layoutSubviews를 View와 자식 View들에게 호출하게 하고 그 시점에 setNeedsLayout이 호출된 뷰들은 Update Cycle에서 업데이트가 되도록 해줌.
- 호출 시  needsLayout flag가 YES로 변경.
- 여러 부분에서 호출하더라도, 다음 run loop에서 한번만 적용
- 레이아웃 업데이트를 하나의 업데이트 주기로 통합할 수 있으며, 일반적으로 성능향상에 도움이 됨. 

**layoutIfNeeded()**

- 만약 View가 레이아웃이 재조정되어야 한다면, 즉시 layoutSubviews를 호출함. 레이아웃 업데이트가 보류중인 경우, 하위 View를 즉시 레이아웃(배치)합니다 (layoutSubview가 호출 됨) 이 메소드를 사용하면 View가 레이아웃을 즉시 업데이트 할 수 있음. 
- layoutIfNeeded를 호출했는데 View가 재조정되어야 하는 이유가 없다면, layoutSubviews는 호출되지 않음
- 동일한 run loop에서 레이아웃의 업데이트 없이 layoutIfNeeded를 두 번 호출했다면, 두 번째 호출은 layoutSubviews를 발생시키지 않음
- layoutIfNeeded를 사용한다면, 레이아웃을 하는 것과 자식 View들을 다시 그리는 것은 즉시 실행되고, 해당 메서드가 반환되기 전에 실행됨.(애니메이션을 제외하고). setNeedsLayout 과는 다르게, 이 메서드는 다음 Update Cycle까지 뷰의 변화를 기다릴 수 없는 상황에서 유용함.
- 재조정되어야하는 상황이 아니라면 그냥 setNeedsLayout을 호출해서 다음 Update Cycle에 뷰가 업데이트되어 run loop 한번 당 View업데이트가 한 번만 이루어지게 하는 것이 이상적
- 호출 시 needsLayout flag를 체크하여 YES인 경우 뷰 변경을 즉시 적용.
- 호출 즉시 뷰 변경을 적용하기 때문에 여러 부분에서 사용할 경우 성능상의 문제가 생길 수 있음
- 메서드가 반환되기 전에 실행(즉시 실행)되는 것으로 동기적 성질을 띰. setNeedsLayout과 layoutIfNeeded의 차이점은 동기적으로 동작하느냐 비동기적으로 동작하느냐의 차이.

*layoutIfNeeded는 Constraints를 애니메이션 하는 상황에서 특히 유용*

애니메이션이 시작하기 전에 layoutIfNeeded를 호출하여 모든 레이아웃 업데이트가 애니메이션 전에 수행되도록 한 뒤, 새로운 Constraints를 설정하고, 애니메이션 클로저 안에서는 또 layoutIfNeeded를 호출해서 애니메이션이 올바른 상태로 진행되도록 하는 방법이 있음. 

- [https://developer.apple.com/documentation/uikit/uiview/1622507-layoutifneeded](https://developer.apple.com/documentation/uikit/uiview/1622507-layoutifneeded)

* setNeedsLayout()와 layoutIfNeeded()차이에 대한 github*
- [https://github.com/lmacfadyen/UIViewLifecycleLayoutDisplay](https://github.com/lmacfadyen/UIViewLifecycleLayoutDisplay)

*정리*
- 하위 클래스는 이 메서드를 하위 클래스의 뷰들을 보다 정확하게 배치하기 위해 재정의 할 수 있다. 
- autoresizing과 하위 뷰의 동작에 따른 constraint가 원하는 행동을 하지 않을 경우에만 이 메서드를 재정의 해야 한다. 
- 하위 뷰의 프레임을 설정하기 위해서 이 메서드를 재정의 할 수 있다.
- 강제로 배치를 update 하기 위해서는 이 메서드를 직접 호출하지 말고 다음에 그려질 것이 update 하기 이전에 setNeedsLayout 메서드를 호출하거나, 뷰들의 레이아웃을 즉각적으로 update 하기 위해야한다면 layoutIfNeeded 메서드를 호출할 것.

***

### Display

- Layout 이란 것이 뷰의 위치와 크기를 의미한다면, Display는 뷰의 속성들 중 크기와 위치나 뷰의 자식 View들에 대한 정보를 갖지 않는 속성들을 포함함. 예) 색, 텍스트, 이미지, Core Graphics 그리기 등
- Display는 Layout 과정과 유사함. 시스템이 자동으로 업데이트가 되게 하는 방식과 우리가 명시적으로 업데이트를 해주게 하는 방식(메서드들)이 존재.(아래)


**draw(_:)**

- Apple문서 정의 : 전달된 사각형 내에서 receiver(수신자)의 이미지를 그립니다.
- 여기서 **전달된 사각형**이란 파라미터로 받은 **CGRect**타입을 의미
- UIView의 draw 메서드는 Layout 업데이트 과정에서의 layoutSubviews와 같은 역할을 하지만, 큰 차이점은 draw 메서드는 자식 View들의 draw까지 호출해주지는 않는다 점이있음. 
- layoutSubviews와 마찬가지로 draw를 직접 사용하는 것은 좋지 않음!


*이해를 위해 zedd님 블로그에서 가져왔다*
```
View가 처음 로드됨 -> 모든 View들이 준비됨(viewDidLoad. 즉 View객체들이 메모리에 올라감.) -> 컨텐츠를 그려줄때 이때!!!! 처음 draw메소드가 불림 -> View업데이트가 발생함 -> View업데이트해야하니 draw메소드를 호출해볼까?ㅋㄹㅋㅎㅋㅎ ==> XXX!!!! 절대 이 메소드를  직접 호출하면 안됨. View업데이트가 필요하면 setNeedsDisplay() 또는 setNeedsDisplay(_ :) 메소드를 호출해. -> ㅇㅋㅇㅋ요청받았어! 다음 드로잉 사이클에 업데이트 해줄게  -> 다음 드로잉 사이클때 View가 업데이트 됨(우리가 직접 draw메소드를 호출하진 않았지만, setNeedsDisplay () 또는 setNeedsDisplay (_ :) 메소드를 호출했기 때문에 draw메소드가 불림.)

출처: https://zeddios.tistory.com/359 [ZeddiOS]
```


**setNeedsDisplay()**

- setNeedsDisplay는 setNeedsLayout와 유사
- View의 Content가 업데이트 되게 하는 내부 플래그를 활성화시키고 실제로 View가 다시 그리기 전에 메서드는 반환함. 그러면, 다음 Update Cycle에 시스템은 이 플래그가 활성화되어있는 View들을 draw를 호출해서 다시 그려줌. (만약 View의 일부분만 다시 그려지길 원한다면, setNeedsDisplay 메서드의 인자로 rect를 전달할 수 있음)
- 뷰의 내용을 다시 그려야 함을 시스템에 알림.. 이 메서드는 지정된 사각형을 뷰의 현재 잘못된 사각형 목록에 추가하고 즉시 반환함. 뷰는 무효화 된 모든 뷰가 업데이트되는 다음 드로잉주기까지 실제로 다시 그려지지 않음.
- 호출 시 needsDisplay flag가  YES로 변경.
- 호출 즉시 뷰가 적용되는 것이 아니라 다음 run loop에 뷰 변경이 적용
- 여러 부분에서 호출하더라도, 다음 run loop에서 한번만 적용
- drawRect가 호출 됨
- 정리하자면,  setNeedsDisplay()메서드는 View의 컨텐츠가 변하면 이 View가 변했다는 사실을 시스템에 알려주기 위해서 사용하고, 그리고 이 setNeedsDisplay()메서드는 시스템에게 다음 [드로잉 사이클](#)때 View업데이트하라고 전달함.


*Apple 개발자가이드에서 setNeedsDisplay정의*
![](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=http%3A%2F%2Fcfile21.uf.tistory.com%2Fimage%2F993CA33E5A41EA460CDFAC)

```
View의 실제 컨텐츠가 변경될 때, View를 다시 그려야함을 시스템에 알리는 것은 당신(개발자)의 책임입니다. 

View의 setNeedsDisplay () 또는 setNeedsDisplay (_ :) 메소드를 호출하여 이 작업을 수행할 수 있습니다.

이 메소드는 다음 드로잉 사이클(next drawing cycle)동안 View를 업데이트해야 함을 시스템에 알립니다. View를 업데이트하기 위해 다음 드로잉 사이클때까지 기다리기 때문에, 여러 View에서 이 메소드를 호출하여 동시에 업데이트 할 수 있습니다. 

```
- 뷰의 UI 컴포넌트를 업데이트하는 것은 View의 dirty flag를 활성화시켜 우리가 명시적으로 setNeedsDisplay를 호출하지 않아도 다음 Update Cycle에 뷰가 다시 그려지도록 유도함. 그러나, 만약 UI 컴포넌트와 직접적으로 연관되어 있지 않지만 매 Update Cycle마다 다시 뷰를 그려주어야 하는 속성이 있다면 우린 didSet 속성 감시자를 설정하고 setNeedsDisplay를 명시적으로 호출해줄 수 있다.(아래 코드참고)

예시) 커스텀으로 View그리기를 예로 설명 
```swift
class MyView: UIView {
    var numberOfPoints = 0 {
        didSet {
            setNeedsDisplay()
        }
    }

    override func draw(_ rect: CGRect) {
        switch numberOfPoints {
        case 0:
            return
        case 1:
            drawPoint(rect)
        case 2:
            drawLine(rect)
        case 3:
            drawTriangle(rect)
        case 4:
            drawRectangle(rect)
        case 5:
            drawPentagon(rect)
        default:
            drawEllipse(rect)
        }
    }
}
```
- numberOfPoints가 변하면 draw(_:) 안에서 View를 그리는 방식이 달라지기 때문에 didSet 블록 안에 setNeedsDisplay를 명시적으로 호출해준 예시임.
- Layout 과정과 다르게 Display는 즉시 draw(_:)를 호출해주는 메서드는 존재하지 않음. 이유는 뷰가 다시 그려지기 위해 다음 Update Cycle을 기다리는 것이 아무런 문제가 없기 때문.


**displayIfNeeded()**
- Apple문서 정의 : 필요에 따라 이 메서드를 호출하여 레이어의 내용을 표준 업데이트 주기 외로 강제 업데이트 할 수 있습니다.. 그러나 그렇게 하는 것은 일반적으로 필요하지 않으며, 레이어를 업데이트하는 가장 좋은 방법은 setNeedsDisplay()를 호출하고, 다음주기 동안 시스템이 레이어를 업데이트 하도록 하는 것입니다.
- layoutIfNeeded와 유사하게 동기방식임.
- NSView, NSWindow, [CALayer](#CALayer)에 포함된 메소드
- 호출 시 needsDisplay flag를 체크하여 YES인 경우 뷰 변경을 즉시 적용.
- 호출 즉시 뷰 변경을 적용하기 때문에 여러 부분에서 사용할 경우 성능상의 문제가 생길 수 있음
- drawRect가 호출 됨


***
### Constraints

- Auto Layout에서 Layout하고 Draw하는 것에 대해 3단계의 과정이 있음.
- **Constraints를 업데이트한다 :** 시스템이 View에 필요한 Constraints들을 계산하고 설정한다.

- **Layout 단계 :** 레이아웃 엔진이 View들의 Frame과 자식View들의 Frame을 계산하고 배치한다.

- **Display 단계 :** View의 컨텐츠를 다시 그리고 필요하다면 draw 메소드를 호출한다.


**updateConstraints()**

- Auto Layout을 이용시 View의 Constraints를 동적으로 변경할 때 사용.
- Layout 단계에서 layoutSubviews나 Display 단계에서 draw 같이, updateConstraints는 오직 오버라이딩되어야 하며 명시적으로 호출되어서는 안됨.
- 보통 updateConstraints에서 동적으로 변해야 하는 Constraints들을 구현하는데, 정적인 Constraints들은 Interface Builder나 View의 생성자나 viewDidLoad에서 정의됨.
- Constraints를 활성화/비활성화하거나 Constraints의 우선순위나 constant를 변경하거나 View를 View계층에서 삭제하는 것은 updateConstraints를 다음 Update Cycle에서 호출하게 함. 
- 그러나, UpdateConstraints를 명시적으로 호출하는 방법 또한 존재함.(아래)

**setNeedsUpdateConstraints**
- setNeedsUpdateConstraints를 호출하는 것은 다음 Update Cycle에서 Constraint가 업데이트되는 것을 보장해줌. 이 메서드는 setNeedsLayout이나 setNeedsDisplay와 비슷하게 작동함.

**updateConstraintsIfNeeded**
- 이 메서드는 layoutIfNeeded 와 유사함. 그러나 오직 Auto Layout을 사용하는 뷰에만 유효. 
- 이 메서드는 Constraint Update Flag(이 Flag는 자동으로 설정되거나, setNeedsUpdateConstraints를 통해 설정되거나, invalidateIntrinsicContentSize를 통해 설정될 수 있습니다.)를 검사함. (만약 Constraints가 업데이트가 되어야 하면, updateConstraints를 즉시 호출.)

**invalidateIntrinsicContentSize**
- Auto Layout을 사용하는 몇몇 View들은 intrinsicContentSize 속성을 갖는데, 이는 View가 갖고 있는 Content의 크기임.
- intrinsicContentSize는 전형적으로 View가 갖고 있는 요소들의 Constraints으로 결정되지만, 이것 또한 커스텀 한 동작을 오버라이딩하여 제공할 수 있음. 
- invalidateIntrinsicContentSize를 호출하는 것은 View가 갖고 있는 intrinsicContentSize가 낡았으며, 다음 Update Cycle에서 다시 계산되어야 한다고 플래그를 활성화시켜줌.


*run loop에서의 모든 것이 연결되려면(layer,display,constraints)*

**정리**
1. View의 Layout과 Display 그리고 Constraints는 run loop에서 다른 시점에 어떻게 업데이트되고, 명시적으로 업데이트할 수 있는지에 대해 유사한 패턴을 가짐. 
2. 각 컴포넌트들은 layoutSubviews, draw, updateConstraints과 같은 실제로 업데이트를 전파하는 메서드들을 가지며, 명시적으로 호출되면 안 되기 때문에 이를 호출하도록 유도할 수 있는 방법들이 있음
3. 이러한 메서드들은 run loop의 마지막에 View의 해당 flag가 활성화되어있으면 시스템이 호출해주는 방식임. 
4. 몇 가지의 자동적으로 이 Flag들을 활성화해주는 방식들이 있고 명시적으로 활성화시켜주는 방식도 있음. 
5. Layout과 Constraints에 관련된 업데이트들에 대해서는 만약 다음 Update Cycle까지 기다릴 수 없다면, 즉시 업데이트가 되도록 요청하는 메서드들도 존재함. 
6. 아래와 같은 표는 이러한 각 메서드들이 작동하는 방식임.

![](/image/vy.png)

- 위 표를 보면 Update Cycle과 Event Loop 그리고 위에서 설명한 메서드들이 Cycle 동안 어떻게 호출되는지 설명이 됨. 
- 우리는 명시적으로 layoutIfNeeded나 updateConstraintsIfNeeded를 run loop의 아무 시점에서나 호출할 수 있고, loop의 끝은 Update Cycle임. 
- Update Cycle은 Constraints, Layout 그리고 Display를 해당 플래그가 활성화되어있다면 업데이트해줌. 
- 이러한 업데이트들이 완료되면, run loop는 다시 시작함..... ㅎ 아래 그림과 같은 모습으로

![](https://i.stack.imgur.com/i9YuN.png)


***

### CALayer

- UIView는 내부적으로 CALayer를 통해 구현됨. 또, Core Animation과 상호작용
- 레이어의 위치와 크기 / 레이어의 배경색/ 레이어에 그려질 컨텐트 (이미지를 출력하거나 혹은 Core Graphic를 통해 그려진 그래픽 등)/ 레이어의 모서리가 동글게 그려져야 하는지/레이어에 그림자를 추가하기/
레이어에 외곽선을 그려주기 등
- CALayer는 실제로 UIView에 속하며 UIView를 지원해주는 역할을 함
- 각 뷰마다 루트 layer는 하나씩 존재하고 이 루트 layer는 각각 SubLayer들을 가짐.
- UIView는 레이아웃과 터치 이벤트 처리등 많은 작업을 하지만 실제로 뷰 위에 컨텐츠나 애니매이션을 그리는 행위는 직접적으로 다루지 않고 UIKit가 Core Animation에 위임함. 즉, 실질적으로 뷰 위에 컨텐츠와 애니매이션을 그리는 행위는 CALayer가 담당

![](https://t1.daumcdn.net/cfile/tistory/996A474D5AD598E32A)

- UIView는 사실 CALayer를 감싸고 있는 것에 불과하고, UIView의 bounds가 변경되면 UIView는 자신의 루트 layer의 bounds를 변경하게 되어 루트 layer의 레이아웃은 속해있는 UIVIew에 맞추어 자동으로 변경함. (하지만 SubLayer들은 자동으로 맞추어지지 않음..)
- 쉽게 차이를 보자면, **ClipeToBounds**는 **UIView**에 속해있고, **makeToBounds**는 **CALayer**에 속해 있는 것. 

- [https://developer.apple.com/CALayer 애니메이션 가능 속성](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreAnimation_guide/AnimatableProperties/AnimatableProperties.html#//apple_ref/doc/uid/TP40004514-CH11-SW1)
- [사용예제에 대한 글 : https://points.tistory.com/11](https://points.tistory.com/11)
- [참고 : https://baked-corn.tistory.com/110](https://baked-corn.tistory.com/110)

***

### Core Animation
- [https://developer.apple.com/documentation/quartzcore](https://developer.apple.com/documentation/quartzcore)
- Apple문서 정의 : 시각적 요소(visual elements)를 렌더링, 합성하고 애니메이션화합니다.
- CPU에 부담을 주지 않고 앱 속도를 저하시키지 않으면서 높은 프레임 속도와 부드러운 애니메이션을 제공. 
- 애니메이션의 각 프레임을 그리는데 필요한 대부분의 작업이 수행. 
- [https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreAnimation_guide/CoreAnimationBasics](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreAnimation_guide/CoreAnimationBasics/CoreAnimationBasics.html#//apple_ref/doc/uid/TP40004514-CH2-SW3)
- 시작 및 종료지점과 같은 몇가지 애니메이션 매개변수를 구성하고 Core Animation이 시작하도록 지시. 
- Core Animation은 나머지 작업을 수행하여 렌더링 작업을 가속화 하기 위해 대부분의 작업을 전용 그래픽 하드웨어에 넘김. 
-  CALayer 를 상속한 CATiledLayer, CAEAGLLayer 등이 있는데, 상황에 따라 rendering performance 를 높일 수 있음.
- ore Animation Framework 는 CALayer 의 property 들을 직접 modify 하지 않음.
- Core Animation은 2개의 Layer tree를 관리하는데, 하나는 Model layer tree, //CALayer, [CALayer modelLayer], 다른 하나는 Presentation layer tree. //Animation 중에만 관리되는 녀석, [CALayer presentationLayer]

*정리 짱이라서 첨부*
- [참고: https://aroundck.tistory.com/4760](https://aroundck.tistory.com/4760)

***


*next drawing cycle(드로잉 사이클)*

- 다음에 정리..
- [https://zeddios.tistory.com/359](https://zeddios.tistory.com/359)

- [View Programming Guide for iOS](https://developer.apple.com/library/archive/documentation/WindowsViews/Conceptual/ViewPG_iPhoneOS/WindowsandViews/WindowsandViews.html#//apple_ref/doc/uid/TP40009503-CH2-SW9)
- [Drawing and Printing Guide for iOS](https://developer.apple.com/library/archive/documentation/2DDrawing/Conceptual/DrawingPrintingiOS/GraphicsDrawingOverview/GraphicsDrawingOverview.html#//apple_ref/doc/uid/TP40010156-CH14-SW1)

- [참고](https://medium.com/@rz1477/swift-drawing-cycle-and-screen-refresh-5396b86a4849)



***

### UIClassDiagram(iOS)

![](http://3.bp.blogspot.com/-1M6XDhL2AB8/VS4U4OPVPHI/AAAAAAAAA1c/iVG1jYr26pM/s1600/uikit_classes.jpg)




***
## 기초문법

### 데이터타입
- 자료형, data type
- swift에서 숫자를 저장 
```swift
var mynumber = 10
```
- mynumber라는 **변수 생성**과 **숫자 10 할당**
- var mynumber : Int = 10
- 위와 같이 초깃값이 있을 경우 컴파일러가 자동으로 타입추론(type inference)을 하므로 데이터 타입(자료형)을 명시할 필요 없음
- Bool, Character, Int, Double, String, Void등이 있음
- var x : Int
- **x= 10** // error '=' must have consistent whitespace on both sides(공백을 명확히 처리할 것)

- 일반적으로 초깃값을 주지 않을 경우에만 자료형을 씀. 

### Int 
- 정수 데이터 타입 
  - 양수, 음수, 0 값을 담을 수 있는 부호 있는(sifned)정수
  - 0, 양수만 담을 수 있는 부호 없는 (unsigned)정수
- 8비트,16비트,32비트,64비트 지원(Int8, Int16, Int32, Int64)
- 부호없는 정수 : UInt8, UInt16, UInt32, UInt64
- 애플은 특정 크기의 데이터 타입보다 Int데이터 타입을 권장
- 32비트 부호 있는 정수 데이터 타입에 대한 최솟값과 최댓값을 출력 
```
//\(출력하고 싶은 변수나 상수)
pirnt("Int32Min = \(Int32.min) Int32Max = \(Int32.max)")
Int32Min = -2147483648 Int32Max = 2147483647 
```

### Double 
- 소수점이 있는 숫자
- Double형이 기본
- Double : 64비트로 부동 소수점 수를 저장, 소수점 15자리 정확도
- Float : 32비트로 부동 소수점 수를 저장, 소수점 6자리 정확도
```
var myWeight : Double
var myWeight : Double = 58.5
```

### Bool
- 참 또는 거짓을 처리할 데이터 타입
- Boolean 데이터 타입을 처리하기 위하여 두개의 불리언 상수 값(true/false)사용
```
var orangesAreOrange : Bool
var orangesAreOrange : true  
```

### Character
- 문자, 숫자, 문장부포, 심볼 같은 유니코드(Unicode)문자 하나를 저장
- 스위프트에서의 문자들은 문자소 묶음(Grapheme cluster)의 형태로 저장
- 문자소 묶음은 하나의 문자를 표현하기 위하여 유니코드 코드 값들로 이루어짐 
- var 변수명 : Character = "초깃값"
```
var myChar1 : Character
var myChar2 : Character = ":"
var myChar3 : Character = "X"
//Character는 생략불가, 생략하면 String형이 됨. 
```
- 유니코드를 이용하여 변수에 문자 X를 할당
- var myChar4 = "\ u{0058}"

### String 
- 단어나 문장을 구성하는 일련의 문자
- 저장, 검색, 비교, 문자열 연결, 수정 등의 기능을 포함
- 문자열 보간(string interpolation)을 사용하여 문자열과 변수, 상수, 표현식, 함수 호출의 조합으로 만들 수도 있음 
```
var userName : String = "Qussk"
var inboxCount = 29
let maxCount = 100
var message = "\(userName) has \(inboxCount) message. Message capacity remaining is \(maxCount - inboxCount)"
print(message)
```

### 특수문자,이스케이프시퀀스
- 표준 문자 세트뿐 아니라 문자열에 개행, 탭, 또는 유니코드 값과 같은 항목을 지정할 수 있는 여러 특수 문자도 포함
- 이스케이프 시퀀스(escape sequence)
- 특수 문자들은 역슬래시를 접두어로 하여 구별
- var newline = "\n" //newline
- 역슬래시로 시작되는 모든 문자는 특수문자로 간주
- 역슬래시 문자자체 
- var nackslach = "\ \"
많이 사용하는 특수 문자
```
\n - 개행
\r - 캐리지 리턴(carriage return)
\t - 수형탭 
\ \ - 역슬래시
\ " = 큰따옴표(문자열 선언부에 큰 따옴표를 쓰고 싶을 경우에 사용됨)
\ ' = 작은따옴표(문자열 선언부에 작은 따옴표를 쓰고 싶을 경우에 사용됨)
\ u{uu} - nn위치에 유니코드 문자를 표현하는 두개의 16진수가 배치되는 1바이트 유니코드 스칼라
\ u{nnnn} - nnnn위치에 유니코드 문자를 표현하는 네 개의 16진수가 배치되는 2바이트 유니코드 스칼라
\ u{nnnnnn} - nnnnnn위치에 유니코드 문자를 표현하는 네 개의 16진수가 배치되는 4바이트 유니코드 스칼라

```
### var
- 기본적으로 변수(variable)는 프로그램에서 사용될 데이터를 저장하기 위한 메모리 공간
- 변수에 할당된 값은 **변경 가능**
- var myVariable = 10 
- var x = 0.0 , y = 0.0 , z = 0.0 (다중 사용 가능)

### let
- 상수(constant)는 데이터 값을 저장하기 위하여 메모리 내의 명명된 공간을 제공한다는 점에서 변수와 비슷
- 어떤 값이 한 번 할당되면 이후에 변경 될 수 없음
- 상수는 코드 내에서 반복적으로 사용되는 값이 있을 경우에 유용
- 코드 내에서 반복적으로 사용되는 특정 값을 매법 사용하는 것 보다, 그 값을 상수에 할단한 다음 코드 내에서 참조하면 코드 읽기가 더 수월
- let maximumNuber = 10
- 변수나 상수명은 영문자, 숫자 Unicode도 가능...
- 애플은 코드의 효율성과 실행 성능을 높이기 위해 var보다는 let를 사용하라고 권장

### 타입어노테이션과타입추론
- 스위프트는 타입안전(type safe) 프로그래밍 언어 
  - 변수의 데이터 타입이 식별되면 그 변수는 다른 타입의 데이터를 저장하는 데 사용될 수 없음
  - 변수가 선언된 후에도 다른 데이터 타입을 저장할 수 있는 느슨한 타입(loosely typed)의 언어와 대조적
- 상수와 변수의 타입을 식별하는 방법은 두가지.   
  - 첫번째 
  - 변수 또는 상수가 코드 내에서 선언되는 시점에 타입 어노테이션(type annitation)을 사용하는 것
  - 변수 또는 상수 이름 다음에 타입 선언을 두면됨 
  - Int타입의 userCount라는 이름의 변수를 선언
  - var userCount: Int = 10 // Int가 type annotation
  - 두번째 
  - 선언부에 타입 어노테이션이 없으면 스위프트 컴파일러는 상수 또는 변수의 타입을 식별하기 위하여 타입추론(typr inference)사용
  - 해당 상수 또는 변수에 값이 할당되는 시점에서 그 값의 타입을 확인하고 그와 같은 타입처럼 사용
```
var signalStrenght = 2.231 // var signalStrenght : Double = 2.231
let companyName = "My Company"
//signalStrength라는 변수를 Double타입(스위프트의 타입추론에서 모든 부동 소수점 수는 Double타입)
//companyName이라는 상수는 String으로 간주
```
- 상수를 선언할 때도 타입 어노테이션을 사용하면 나중에 코드에서 값을 할당할 수 있다. 
예제)
```swift
let bookTitle: String
var book = true
if book {
bookTitle = "iOS"
}else{
bookTitle = "Android"
}
print(bookTitle)
```
- 상수에는 값을 한 번만 할당할 수 있다.
- 이미 값이 할당된 상수에 다시 값을 할당하려고 시도한다면 구문 에러(syntac error)가 발생 
***

### Tuple
- 튜플은 스위프트 프로그래밍 언어에서 가장 강력한 기능중 하나
- 여러 값을 하나의 개체에 일시적으로 묶는 방법
- 튜플에 저장되는 항목들은 어떠한 타입도 될 수 있으며, 저장된 값들이 모두 동일한 타입이어야한다는 제약도 없음
- let myTuple = (10,12.1,"Hi")
- 튜플의 요소들은 여러 다른 방법들을 사용하여 접근할 수 있음
- 특정 튜플 값은 인덱스 위치를 참조하면 간단하게 접근
- 맨 첫번째 값은 인덱스0
- 인덱스 2위치를 추출하고 그 값을 새로운 무자열 변수에 할당
```
let myTuple = (10, 12.1, "Hi")
var myString = myTuple.2
print(myString) //"Hi"
```
- 단 한줄의 코드로 튜플의 모든 값을 추출하여 변수 또는 상수에 할당
```
let myTuple = (10, 12.1, "Hi")
let (myInt, myFloat, myString) = myTuple
```  
- 튜플의 값을 선택적으로 추출하는데 사용될 수 있으며, **무시하고 싶은 값에 밑줄(언더바)을 사용하면 그 값은 무시**
```
var (myInt, _, myString) = myTuple 
```
- 튜플을 생성할 때 **각 값에 이름을 할당**할 수도 있음
```
let myTuple = (count: 10, lenght: 12.1, message: "Hi")
```
- 튜플에 저장된 값에 할당된 이름은 각 값을 참조하는 데 사용
- myTuple인스턴스의 message값을 출력하는 코드
```
print(message.message)// "Hi"
```
- 튜플의 가장 강력한 점은 함수에서 여러 값들을 한 번에 반환하는 것

***
### as
**형 변환(as로 upcasting)**

- 상속 관계가 있는 클래스들끼리만 타입 캐스팅 가능
- 자식(부모로부터 상속받아 더 많은 것을 가지고 있음)을 부모로 캐스팅하는 것은 문제가 없음
  - **as** 연산자를 이용한 타입 변환(Type casting)
  - **자식인스턴스 as 부모클래스** // upcasting 안전한 캐스팅, 자식이. 추상화됨.
  - 업캐스팅은 객체를 부모 클래스의 객체로 형 변환
  - 형 변환은 성공할 것이기 때문에 보장된 변환(guaranteed conversion)
  - UIButton은 UIControl의 자식 클래스이므로 안전하게 형 변환
  - let myButton : UIButton = UIButton()
  - let myControl = myButton as UIControl // 자식인스턴스 as 부모클래스
  - 자식인스턴스인 myButton을 부모 클래스 형으로 형 변환 
   
**형 변환(as! as?로 downcasting)**
- 다운캐스팅은 어떤 클래스에서 다른 클래스로 변환할 때 안전한 변환을 보장할 수 없음
- 다운 캐스팅에서 유효하지 않은 형 변환이 이뤄졌는데 컴파일러가 에러를 잡지 않았다면, 런타임에서 에러가 발생
- 다운 캐스팅은 주로 자식 클래스로 변환하는 데 사용
- 성공 확신이 있으면 as! 키워드를 사용하여 강제 변환(forced conversion) //변환 안되면 crash
- 성공 확신이 없으면 as?를 사용하여 안전하게 반환 // 변환이 안되면 nil을 리턴하므로 옵셔널 타입으로 반환함
- 부모 인스턴스 as! 자식 클래스 // downcasting 일반 타입으로 반환.확신있는 경우
- 부모 인스턴스 as? 자식 클래스 //downcasting 옵셔널 타입으로 반환. 확신이 없을 경우

***
### is
- 타입검사 (is)
- is 키워드를 이용하여 값의 타입 검사(Type check)
  - 지정된 객체가 MYClass라는 이름의 클래스의 인스턴스인지 검사
  - 인스턴스가 해당 클래스인가?
  - 인스턴스 is 클래스
```
if mtobject is MyClass {
  //myobject는 MyClass의 인스턴스이다
}
```
***
### Any
**Any**
- Any can represent an instance of any type at all, including function types
- 클래스, 구조체, 열거형, 함수타입도 가능 
**AnyObject**
- AnyObject can represent an **istance of any class type.**
- 범용타입
- 상속관계가 아니라도 타입 캐스팅 가능한 타입
- 어떤 클래스의 객체도 저장 가능
- 가장 추상화된 최상위 클래스(Obj-C의 NSObject와 비슷)
- 클래스만 허용하여 구조체나 열거형은 허용하지 않음

***
### 연산자
- [https://jusung.gitbook.io/the-swift-language-guide/language-guide](https://jusung.gitbook.io/the-swift-language-guide/language-guide/02-basic-operators)
- 할당 연산자(=)는 두 개의 피연산자를 가짐
- 왼쪽에 있는 피연산자는 값이 할당되는 변수 또는 상수이며, 그 결과는 왼쪽 피연산자인 변수나 상수에 할당
```
var x : Int? //옵셔널 Int변수를 선언함
var y = 10 //일반 Int변수를 선언하고 초기화함
x = 10 //값을 x에 할당함, Optional(10) 
x = x! + y //x+y의 결과를 x에 할당함, Optional(10)
x = y //y의 값을 x에 할당함, Optional(10)
```

*산술 연산자*
- 보통 두 개의 피연산자를 받는 이항(binary)연산자
- 예외로는 값이 음수임을 가리키는 단항 마이너스 연산자(unary negative operator)인 '-'
- var x = 10 //변수 x에 -10을 할당하기 위해 사용되는 단항 - 연산자
- x = x - 5 //x에서 5를 빼는 뺄셈 연산자
  - -(단항) 변수 또는 표현식의 값을 음수로 만듦
  - \* 곱
  - / 나눗셈
  - \+ 덧셈
  - \- 뺄셈
  - % 나머지
- 하나의 표현식 안에 여러 개의 연산자를 사용할 수 있음
- x = y * 10 + x - 5 / 4 

*복합 할당 연산자*
- x = x + y
- x += y
- 변수 x값과 변수 y값을 더하고 그 결과를 변수 x에 저장

|복합 할당 연산자|결과|
|:------:|:---:|
|x += y|x와 y를 더하고 그 결과를 x에 할당|
|x -= y|x와 y를 빼고 그 결과를 x에 할당|
|x *= y|x와 y를 곱하고 그 결과를 x에 할당|
|x /= y|x와 y로나누고 그 결과를 x에 할당|
|x %= y|x와 y로 나눈 나머지를 x에 할당|
|x &= y|x와 y의 bit AND 연산 결과를 x에 할당 |
|x \|= y|x와 y의 bit OR 연산 결과를 x에 할당 |

*증가 연산자와 감소 연산자*
- 단항 연산자
- x = x + 1 //x 변수의 값을 1씩 증가
- x = x - 1 //x 변수의 값을 1씩 감소
- 위의 표현식은 x의 값을 1증감
- 이러한 방법 대신 ++ 와 --로 사용할 수 있었지만 현재는 폐지(Swift3)

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

### Protocol

- 특정 역할을 하기 위한 메소드. 프로퍼티, 기타 요구사항 등의 청사진.
- 구조체, 클래스, 열거형은 프로토콜을 채택해서 특정 기능을 실행하기 위한 프로토콜의 요구사항을 실제로 구현할 수 있음.
- 프로토콜은 정의를 하고 제시를 할 뿐 스스로 기능을 구현하지 않음.
- 하나의 타입으로써 사용되며, 타입이 허용되는 모든 곳에 사용할 수 있음.
```
- 함수, 메소드, 이니셜라이저의 파라미터 타입 혹은 리턴 타입
- 상수, 변수, 프로퍼티의 타입
- 배열, 딕셔너리의 원소타입
```

*기본*
```swift
protocol 프로토콜이름 {
 // 프로토콜 정의
}
```

*extention과 사용*
해봤던 것
```swift
//1. 기능추가
extension ViewController: StartViewControllerDelegate {
  func handleDismiss() {
    let MainVC = MainViewController()
    MainVC.modalPresentationStyle = .fullScreen
    self.present(MainVC, animated: false)
  }
}
```
```swift
//2. 필요한 곳에 정의
protocol StartViewControllerDelegate: class {
  func handleDismiss()
}

//2-1. 변수에 담아서 사용하기
  weak var delegate: StartViewControllerDelegate?
```
```swift
//3. 버튼에 사용
@objc func setupButton(_ sender: UIButton){
  dismiss(animated: false, completion: {
    self.delegate?.handleDismiss()
  })
```

**


***
### extention

- 확장(Extensions)은 기존에 있는 클래스, 구조체, 열거형, 프로토콜 타입에 새로운 기능을 추가하는 역할을 함. 
- 원래 소스코드(소급 모델링(retroactive modeling))에 접근하지 못하는 타입을 확장하는 능력도 포함. (확장은 Objective-C에서의 카테고리와 비슷.
- Objective-C 카테고리와 다르게, Swift의 확장은 이름을 가지지 않음

*extention 기능*
- 계산 인스턴스 프로퍼티와 계산 타입 프로퍼티를 추가
- 인스턴스 메소드와 타입 메소드를 정의
- 새로운 초기화 제공
- 서브스크립트 정의
- 새로 중첩된 타입을 정의하고 사용
- 기존 타입에 프로토콜을 준수하도록 만들기

*사용*
```swift
extension 클래스이름 : (프로토콜 이름) { 
 }

```
- 프로토콜을 추가적으로 준수(conformance)하기 위해, 클래스나 구조체를 작성하는 것과 같은 방법으로 프로토콜 이름을 작성함.

*제네릭이 있는 경우*
- [https://docs.swift.org/swift-book/LanguageGuide/Generics.html#ID553](https://docs.swift.org/swift-book/LanguageGuide/Generics.html#ID553)

```swift
extension Stack where Element: Equatable {
    func isTop(_ item: Element) -> Bool {
        guard let topItem = items.last else {
            return false
        }
        return topItem == item
    }
}
```


***
### Class

*프로퍼티*
  - 저장 프로퍼티 : 인스턴스의 변수나 상수 
  - 연상 프로퍼티 : 특정 연산을 수행한 결과값을 가짐
  - 타입 프로퍼티 : 인스턴스가 아닌 타입자체에 속판 프로퍼티
  - 프로퍼티 감시자 : 프로퍼티값이 변경이되면 호출되는 메서지(willSet, didSet)
  
*메서드*
  - 인스턴스 메서드 : 특정타입에 인스턴스에 속한 메서드(일반적인)
  - 타입 메서드 : 타입자체에서 호출이 가능한 메서드
  
*접근제어* 
  - 코드끼리 상호작용할 때 파일 간 또는 모듈간에 접근을 제한 할 수 있는 기능. 접근제어를 구현은 숨기고 허용된 기능만 노출할 수 있음.
  
|접근수준|키워드|접근도|범위|비고|
|:------:|:---:|:---:|:---:|:---:|
|개방접근|open|높음|모듈 외부까지|클래스에서만 사용|
|공개접근|public| |모듈 외부까지| |
|내부접근|Internal| |모듈 내부| |
|개방접근|fileprivate| |모듈 내부| |
|비공개접근|private|낮음|기능 정의 내부| |

***

### 메모리구조

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
### Optional
-  optional인 변수는 nil 값이 들어갈 수 있는 변수를 뜻함. 
- 값을 반환할 때 오류가 발생할 가능성이 있는 값은 옵셔널 타입이라는 객체로 감싸서 반환함
  - Int("100")은 100이 아닌 Optional(100)을 리턴함, Print(Int("100")),Int형 initializer
  - Int("Hi")은 정수값을 반활할 수 없음, 아무런 값도 반환할 수 없다는 의미로 nil반환.
  - Swift에서 기본 자료형(Int,Double,String등)은 nil값을 저장할 수 없음
  - nil도 저장하려면 옵셔널 타입으로 선언해야함
- 옵셔널 타입은 변수 또는 상수에 아무런 값이 할당되지 않는 상황을 안전하게 처리하기 위한 방법 제공
- 개발자가 여기는 값이 없을 수 있다고 "?"로 명시.
- var index : Int? 처럼 옵셔널 "?"을 붙여주어서 optional 변수로 만듦.
- index 변수는 정수값을 갖거나 아무 값도 갖지 않을 수 있음(nil)

*옵셔널 사용하는 이유?*

- 옵셔널 타입만이 값을 갖지 않는다는 의미의 nil값을 가질 수 있음
- You set an optional variable to a nalueless state by assihning it the  special value nil.
- nil값을 옵셔널이 아닌 변수나 상수에 할당 할 수 없음
   - var myInt = nil //error
   - var myInt : Int? = nil // Ok
   - var myInt : Int? // Ok
   - 옵셔널 변수는 초기화하지 않으면 자동으로 nil로 초기화
   - var myString: String = nil //유효하지 않은 코드
   - let myConstant = nil //유효하지 않은 코드
   
### Optionalunwrapping
- 옵셔널 변수에 값이 있으면 옵셔널로 "래핑되었다(wrapped)라고 함"
- 옵셔널에 래핑된 값은 강제 언래핑(forced unwrapping)으로 풀어줌
- optional로 선언된 변수에 nil이 아니라 값이 분명히 들어있다고 확신하는 경우 !사용(언래핑 키워드 = !)하여 값을 꺼냄.
-  ! 을 썼는데 불구하고 nil 이 들어있었다면 에러를 일으킴으로 주의 필요.
```
var x : Int? // 옵셔널 정수형 변수 x선언
x = 10
print(x) // Optional(10)
print(x!) // forced unwrapping해서 정수 10이 나옴
// ?는 자료형 뒤, !는 변수명 뒤
```
```swift
var x : Int?
x = 10
if x != nil {
print(x!)
}else{
print("nil")
}
```

***

### optionalBinding 
- 강제 언래핑하는 또 다른 방법으로, 옵셔널 바인딩(Optional binding)을 이용하여 옵셔널에 할당된 값을 임시 변수 또는 상수에 할당
- ! (언래핑)을 사용하지 않고 새로운 상수를 선언한 뒤 상수에 옵셔널 변수의 값을 넣어보고, nil이 아니면 연산에 사용하는 방식입니다.
- if let nonOptionalVariable = OptionalVariable { 연산 } 의 방식으로 사용.
```
if let constantName = optionalName{
//옵셔널 변수가 값이 있다면 언래핑해서 일반 상수constantName에 대입하고 참이되면 if문 실행
//값이 없다면 if문의 조건이 거짓이 되어 if문을 실행하지 않음
}

if var variableName = optionalName{
//옵셔널 변수가 값이 있다면 언래핑해서 일반 변수 variableName에 대입하고 참이되면 if문 실행
//값이 없다면 if문의 조건이 거짓이 되어 if문을 실행하지 않음. 
}
```
```swift
var x : Int?
x = 10
if let xx = x {
print(xx)
}else{
print("nil")
} //xx는 if문안에서만 쓸 수 있는 것
var x1 : Int?
if let xx = x1 {
print(xx)
}else{
print("nil")
}
```
*여러 옵셔널을 언래핑*
여러 옵셔널 변수를 한번에 언래핑하는 방법은 콤마(,) 사용
```swift
var pet1: String?
var pet2: String?
pet1 = "cat"
pet2 = "dog"
if let firstPet = per1, let secondPet = pet2{ //옵셔널 풀림
print(firstPet, secondPet) //cat, dog
}else{
print("nil")
}
```
```swift
var x : Int?
var v : Int?
x = 10
y = 20
if let xx = x {
print(xx)
}else{
print("nil")
}
if let yy = y {
print(yy)
}else{
print("nil")
}
```
***
### implicitlyunwrapping
- 암묵적 언래핑 : 폐지됨
- 옵셔널이 항상 유효한 값을 가질 경우 옵셔널이 암묵적인 언래핑(implicitly unwrapping)이 되도록 선언할 수도 있음
- 클래스 초기화에서 많이 사용
- 이러한 방법으로 옵셔널이 선언된다면 강제 언래핑이나 옵셔널 바인딩을 하지 않아도 값에 접근할 수 있음
- 암묵적인 언래핑으로 옵셔널을 선언하기 위해서는 선언부에 물음표(?) 대신에 느낌표(!)를 사용
```
var x : Int? //옵셔널 변수 선언방법 1
var y : Int! //옵셔널 변수 선언방법 2
x = 10
y = 20
print(x,y) // Optional(10), Optional(20)
//Swift4버전까지 y는 그냥 20이 나왔음. Swift5부터는 Optional(20)
```

***
### OptionalChaining
- [https://docs.swift.org/swift-book/LanguageGuide/OptionalChaining.html#//apple_ref/doc/uid/TP40014097-CH21-ID245](https://docs.swift.org/swift-book/LanguageGuide/OptionalChaining.html#//apple_ref/doc/uid/TP40014097-CH21-ID245)
- Optional Chaining이란, 값이 nil수도 있는 프로퍼티, 메소드, 서브스크립트 등을 체인처럼 길게 이어가면서 선언하는 것을 일컬음.
- 각 값들 뒤에 **?** 를 붙이면서 이어가게 됨.(instance.property?.method?.property?등으로 이어진 구조로 좌에서 우로 이동하면서 값이 nil이 아닌지 판별. 
- 그 중 하나라도 nil로 판명된다면 이동을 멈추고 바로 체인 전체의 결과값이 nil이됨. 
-  언래핑과 달리, 체이닝은 런타임 에러 대신 nil 값을 반환하는 특징(그래서 체이닝의 결과는 항상 옵셔널임)
예시) get으로 활용된 예시
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

