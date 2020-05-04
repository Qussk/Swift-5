

## Type Check


### 타입 확인 - type(of: )

```swift
type(of: 1)
type(of: 2.0)
type(of: "3")


// Any
let anyArr: [Any] = [1, 2.0, "3"]
type(of: anyArr[0])
type(of: anyArr[1])
type(of: anyArr[2])
anyArr[0].self// 아직 Any타입이기때문에 정확한 타입알수없어 self만가능
```

### Generic //제네릭함수
```swift
func printGenericInfo<T>(_ value: T) { // T라고하는 타입이 뭔진모르겠지만 T라는 이름으로 사용.//동적으로 타입을 넣는 것.
  let types = type(of: value)
  print("'\(value)' of type '\(types)'")
}
printGenericInfo(1)
printGenericInfo(2.0)
printGenericInfo("3")

//어떤 프로토콜, 어떤 타입일때만 T를 쓰겠다. 
//무슨 타입인지에 대한 정보를 가진 뒤 가능. 

```


### 타입 비교 - is

_객체 is 객체의 타입 -> Bool (true or false)_

```swift
let number = 1
number == 1    // 값 비교
number is Int  // 타입 비교


//배열이 있는 경우
let strArr = ["A", "B", "C"]

if strArr[0] is String {
  "String"
} else {
  "Something else"
}

if strArr[0] is Int {
  "Int"
}



//for문으로 데이터를 뽑아서 직접 출력하는 것.
let someAnyArr: [Any] = [1, 2.0, "3"]

for data in someAnyArr {
  if data is Int {
    print("Int type data :", data)
  } else if data is Double {
    print("Double type data : ", data)
  } else {
    print("String type data : ", data)
  }
}
```

### 상속 관계(Subclassing)

```swift
class Human {
  var name: String = "name"
}
class Baby: Human {
  var age: Int = 1
}
class Student: Human {
  var school: String = "school"
}
class UniversityStudent: Student {
  var univName: String = "Univ"
}


/*
    Human
   /     \
 Baby   Student
          |
    UniversityStudent
 */

let student = Student() // true : Human을 상속받고있기 때문.
//student is Human //t
//student is Baby  //f
//student is Student // t (자기자신)

let univStudent = UniversityStudent()
//student is UniversityStudent //f
//univStudent is Student //t


/*
 자식 클래스 is 부모 클래스  -> true.
 부모 클래스 is 자식 클래스  -> false
 강아지 is 동물 = t
 동물 is 강아지 = f
 */


let babyArr = [Baby()]
type(of: babyArr)

```
* Q. 그럼 다음 someArr 의 Type 은?

```swift
let someArr = [Human(), Baby(), UniversityStudent()]
type(of: someArr)

//같은 타입이 아니면 에러가나야하는데, 안남. 공통점이 있기 때문. 자기자신이 Human, Baby의 부모클래스 동일, UniversityStudent휴먼이 상속되어있음. 
//type(of: someArr) = Human임. 

```
```swift
//someArr[0] is Human    // t(자기자신)
//someArr[0] is Student  // f
//someArr[0] is UniversityStudent  // f
//someArr[0] is Baby     // f
// Human 외 나머지는 다 자식클래스이기 때문에 f

//someArr[1] is Human    // t
//someArr[1] is Student  // f
//someArr[1] is UniversityStudent  // f
//someArr[1] is Baby     // t
//
//someArr[2] is Human    // t
//someArr[2] is Student  // t
//someArr[2] is UniversityStudent  // t
//someArr[2] is Baby     // f
```
* 해당 변수의 타입 vs 실제 데이터의 타입 student
```swift
var human: Human = Student() //Student
type(of: human)
```

* Q. 왜 student가 나올까? 

  * 컴파일타임- 평소 코드작성시간(실행전 시간), 
  * 런타임 - 타입 알려주는 시간.type(of:..) (실행후시간)

* Q. human 변수의 타입, name 속성의 값, school 속성의 값은?
```swift
//human>name
//Student = school + name
//human.name    //
//human.school  //에러
```

* Q. Student의 인스턴스가 저장된 human 변수에 다음과 같이 Baby의 인스턴스를 넣으면?
```swift
human = Baby()
human = UniversityStudent()

//부모클래스 타입은 자식 클래스 타입을 가질 수 있음. 
```

* Q. 다음 중 james 가 접근 가능한 속성은 어떤 것들인가

```swift
//james.name     // Human 속성  (o)
//james.age      // Baby 속성  (x)
//james.school   // Student 속성 (o)
//james.univName // UniversityStudent 속성 (x) //실제데이터는 UniversityStudent라고해도 컴파일러는 Student로 파악하고 있기 때문에 Student까지만 사용가능. 
```

* Q. 그럼 Student 타입인 james 객체가 univName을 사용할 수 있도록 하려면 뭘 해야 할까요

```swift

if let james.univName as? UniversityStudent{
jemes.univNam
}
```

## Type Casting

* as  : 타입 변환이 확실하게 가능한 경우(업캐스팅, 자기 자신 등) 에만 사용 가능. 그 외에는 컴파일 에러

* as? : 강제 타입 변환 시도. 변환이 성공하면 Optional 값을 가지며, 실패 시에는 nil 반환

* as! : 강제 타입 변환 시도. 성공 시 언래핑 된 값을 가지며, 실패 시 런타임 에러 발생

```swift

import UIKit

class Shape {
  var color = UIColor.black
  
  func draw() {
    print("draw shape")
  }
}

class Rectangle: Shape {
  var cornerRadius = 0.0
  override var color: UIColor {
    get { return .white }
    set { }
  }
  
  override func draw() {
    print("draw rect")
  }
}

class Triangle: Shape {
  override func draw() {
    print("draw triangle")
  }
}

/*
 Shape
  - Rectangle
  - Triangle
 모두 draw() 오버라이드
 */
```

### Upcasting

```swift
/*
 업 캐스팅
 - 상속 관계에 있는 자식 클래스가 부모 클래스로 형 변환하는 것
 - 업캐스팅은 항상 성공하며 as 키워드를 사용
 (자기 자신에 대한 타입 캐스팅도 항상 성공하므로 as 키워드 사용)
 */


// Shape - black, Rectangle - white

let rect = Rectangle()
rect.color
rect.cornerRadius

let t1 = rect as Shape  //Rectangle
let t2 = rect as Rectangle  //Rectangle

//(rect as Shape).color //실제데이터 : Rectangle //white
//(rect as Shape).cornerRadius  //에러: Shape타입에는 cornerRadius가 없기 때문.

//(rect as Rectangle).color
//(rect as Rectangle).cornerRadius



let upcastedRect: Shape = Rectangle()
type(of: upcastedRect)   //Rectangle

//upcastedRect.color //Rectangle이니까 white
//upcastedRect.cornerRadius //에러:Shape로 인식하고 있기때문에 위와 동일한 이유로 에러.

//(upcastedRect as Shape).color //에러: as는 부모클래스나 자기자신클래스에서만 쓸수 있다.
//(upcastedRect as Rectangle).color

//부모 클래스 타입으로는 항상 변경할 수 있는데, 자식 클래스로 변경할 수는 없는 이유?
//자식 클래스 타입 <= 부모 클래스 타입  //무조건 성공하는 것 아님. 자식클래스와 부모클래스 범위가 다르기 때문.
//자식 클래스 타입 => 부모 클래스 타입. //항상 공통적인 값을 가지고 있어 변환이 가능하고 실패하지 않음.


//let human: Student = Human() as Student //실패함.
//Human -> name
//Student -> name, school

//human.school
```

### Downcasting

```swift
/*
 다운 캐스팅
 - 형제 클래스나 다른 서브 클래스 등 수퍼 클래스에서 파생된 각종 서브 클래스로의 타입 변환 의미
 - 반드시 성공한다는 보장이 없으므로 옵셔널. as? 또는 as! 를 사용
 */


let shapeRect: Shape = Rectangle()
var downcastedRect = Rectangle()

//downcastedRect = shapeRect //에러: 부모보다 자식타입의 값이 더 많기때문에 에러남.
//downcastedRect = shapeRect as Rectangle //에러:

//downcastedRect: Rectangle = shapeRect as? Rectangle  // 에러: as?하게되면 옵셔널... 옵셔널(Rectangle)이 아니기때문에 에러.
downcastedRect = shapeRect as! Rectangle  //에러안남. 강제로 변환시도. 어쨌든 Rectangle타입이기 때문에

//as? : 강제 타입 변환 시도. 변환이 성공하면 Optional 값을 가지며, 실패 시에는 nil 반환
//as! : 강제 타입 변환 시도. 성공 시 언래핑 된 값을 가지며, 실패 시 런타임 에러 발생

```
* Q.아래 value 에 대한 Casting 결과는?

```swift
let value = 1
//(value as Float) is Float   //에러: 관련이 없기때문
//(value as? Float) is Float  // f..value->Float로 변환하려니까 nil이 나오고 옵셔널이라서 f가 나옴.
//(value as! Float) is Float
```

### Type Check Operator

```swift
let shape = Shape()
let rectangle = Rectangle()
let triangle = Triangle()

let list = [shape, rectangle, triangle] //각각 찍어서 출력하고 싶어 !
type(of: list)
```

```swift
for elem in list {
  if elem is Triangle { //"shape instance\n"
    print("shape instance")
  } else if elem is Rectangle { //"rect instance\n"
    print("rect instance")
  } else if elem is Shape {  //"triangle instance\n"
    print("triangle instance")
  }
}



print("\n---------- [ ] ----------\n")

// let list: [Shape] = [shape, rectangle, triangle]
for element in list  {
  element.draw() //element는 실제데이터의 다른 타입.
}

//결과
//draw shape
//draw rect
//draw triangle
```






