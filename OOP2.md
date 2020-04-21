# OOP-2

## Access 

## Access Levels

*open > public > internal(기본) > fileprivate > private*
접근레벨

###  Open / Public

```swift
open class SomeOpenClass {
  open var name = "name"
  public var age = 20
}

public class SomePublicClass {
  public var name = "name"
  var age = 20
}

let someOpenClass = SomeOpenClass()
someOpenClass.name
someOpenClass.age

let somePublicClass = SomePublicClass()
somePublicClass.name
somePublicClass.age
```

_Open_ - 갖다 쓸 수 있고, 상속받아서 오버라이드 할 수 있음.
_Public_ - 갖다 쓸 수 있음. 


### Internal (기본값)

```swift
class SomeInternalClass {
  internal var name = "name"
  internal var age = 0
}

//class SomeInternalClass {
//  var name = "name"
//  var age = 0
//}


let someInternalClass = SomeInternalClass()
someInternalClass.name
someInternalClass.age

//기본값
```
_Internal_ - 파일에서 만든것을 다른 파일에서도 볼 수 있게.

 
### fileprivate

```swift 
class SomeFileprivateClass {
  fileprivate var name = "name"
  fileprivate var age = 0
}

let someFileprivateClass = SomeFileprivateClass()
someFileprivateClass.name
someFileprivateClass.age
```
_fileprivate_ - 선언한 파일 내에서 다룰수 있는 것. 


### Private

```swift
class SomePrivateClass {
  private var name = "name"
  private var age = 0
  
  func someFunction() {
    print(name)
  }
}

//let somePrivateClass = SomePrivateClass()
//somePrivateClass.someFunction()
//somePrivateClass.name  //프라이빗이기 때문에 접근할 수 없다는 에러나옴. //Use of unresolved identifier 'somePrivateClass'
//somePrivateClass.age
```

_Private_ - 접근제한이 가장강한 엑세스 


## Nested Types

- 선언 -> 최대치 
- Private  ->  Fileprivate
- Fileprivate  ->  Fileprivate 
- Internal  ->  Internal 
- Public  ->  Internal 
- Open  ->  Internal
(예시) Fileprivate  ->  Fileprivate : class 앞에 Fileprivate로 다루게되면 기본값이 Fileprivate로 바뀜


```swift
// 별도로 명시하지 않으면 someProperty는 Internal 레벨
// public도 동일
open class OClass {
  var someProperty: Int = 0
}

// 별도로 명시하지 않으면 someProperty는 Internal 레벨
// 더 높은 레벨을 설정할 수는 있지만,
// 애초에 클래스 자체에 접근할 수 있는 레벨이 낮으므로 의미 없음
internal class IClass {
  open var openProperty = 0
  public var publicProperty = 0
  var someProperty: Int = 0
}

// 별도로 명시하지 않으면 someProperty는 fileprivate 레벨
fileprivate class FClass {
  var someProperty: Int = 0
}

// 별도로 명시하지 않으면 someProperty는 fileprivate 레벨
private class PClass {
  var someProperty: Int = 0
}
```


## Getters and Setters

*Getter 와 Setter 는 그것이 속하는 변수, 상수 등에 대해 동일한 접근 레벨을 가짐 이 때 Getter 와 Setter 에 대해서 각각 다른 접근 제한자 설정 가능*

###  Setter 설정

```swift
class TrackedString {
//  var numberOfEdits = 0

//  private var numberOfEdits = 0
  private(set) var numberOfEdits = 0

  var value: String = "" {
    didSet {
      numberOfEdits += 1
    }
  }
}
//클래스 내부에서만 Setter, 외부에서는 값을 읽기만 하도록

let trackedString = TrackedString()
trackedString.numberOfEdits
trackedString.value = "This string will be tracked."
trackedString.numberOfEdits

trackedString.value += " This edit will increment numberOfEdits."
trackedString.numberOfEdits

trackedString.value = "value changed"
trackedString.numberOfEdits

//trackedString.numberOfEdits = 0
//trackedString.numberOfEdits
```

### Getter 와 Setter 에 대해 각각 명시적으로 표현

```swift

public class TrackedString1 {
  internal private(set) var numberOfEdits = 0 // Getter 와 Setter 둘다 쓰고 싶을때 internal사용.//. Getter 와 Setter에 대해서 둘다 public을 줌.
  
  public var value: String = "" {
    didSet {
      numberOfEdits += 1
    }
  }
  
  public init() {}
}

```

