
# The친절한 swift Qize


### Quiz.10나누기 함수를 하나 만들고 변환되는 값의 자료형은 정수 옵셔널이 되도록 만드세요. 합수의 이름은 divide로 하고 두 번째 파라미터로 전달된 값이 0일때는 반환되게 하고, 0이 아닐때는 나누기한 결과를 반환하도록 합니다.

```swift
func divide(x:Int, y:Int) -> Int? {
  if y == 0 {
    return nil
  }
  return x / y
  
}

let result1 = divide(x: 20, y: 10)
let result2 = divide(x: 10, y: 0)

print ("나누기 결과 : \(result)/\(result2)")
```


### Quiz.13 두 개의 상수에 할당된 값 중에서 하나라도 nil이면 오류메세지가 출력되도록 만들어보세요. 하나의 상수에는 글자를 할당하고 다른 상수에는 nil을 할당합니다. 그리고 두 개의 상수 중에 하나라도 nil이면 'nil이 있습니다.;라는 글자를 출력하도록 만듭니다. nil을 할당하거나 nil인지 비교하기 위해서는 변수나 상수를 옵셔널 자료형으로 만들어야합니다.

```swift
let name : String? = ""
let age : Int? = 0

if name == nil || age == nil {
  print("nil이 있습니다.")
} else {
  print("nil이 없습니다.")
}

//타입조회
(type(of: name))
```

### Quiz.14 두 개의 상수를 만들고 그중에서 하나라도 문자열 자료형이 아닌 경우 오류메세지를 출력하도록 코드를 작성해보세요. 하나의 상수에는 글자를 할당하고 다른 상수에는 숫자를 할당합니다. 그리고 두개의 상수중에서 하나라도 문자열 자료형이 아니면 '문자형 자료형이 아닌 것이 있습니다.'라는 메세지가 출력되도록 합니다.

```swift
var name2 = "Qussk"
var age2 = 20

if !(name2 is String) || !(age2 is String) {
  print("문자열 자료형이 아닌것이 있습니다.")
} else {
  print("문자열 자료형입니다.")
  
}
```

### Qize.15 for문을 사용해 200부터 500까지 숫자를 더한 후 그 결과를 출력해보세요. for~in구문을 사용할때 범위 연산자를 함께 사용하고 for문이 끝난 후 결과 값을 출력하도록 합니다.

```swift
let start : Int = 200
let end : Int = 500

var total = 0

for i in start..<end {
  total += i
  
}
print("200부터 500까지 더한 값 = \(total)")
```

### Qize.17 Dog클래스를 만들고 그 안에 속성을 넣어보세요. Dog클래스를 정의한 후 name속성을 추가합니다. 클래스를 만들었다면, 이 클래스로부터 실제 강아지 객체를 만들고 그 강아지의 이름을 출력해 봅니다.

```swift
class Dog {
  
  let name = "미미"
}
var dog1 = Dog()
print("강아지이름 : \(dog1.name)")
```

### Qize.18 Dog클래스를 만들고 그 안에 속성과 메소드를 넣어 보세요. Dog 클래스를 정의한 후 name속성과 walk메소드를 추가합니다. 클래스를 만들었다면 이 클래스에서 실제 강아지 객체를 만들고 walk메소드를 호출해보세요.

```swift
class Dog2 {
  
  var name = ""
  
  func walk(){
    print("\(name)이(가) 걸어갑니다.")
  }
}
var dog2 = Dog2()
dog2.name = "토토"
dog2.walk()
```

### Qize.19 Dog클래스를 만들고 그 안에 속성을 넣은 후 초기화 함수를 추가해보세요. Dog클래스를 정의한후 name속성을 추가합니다. 그리고 초기화 함수를 추가항 그 안에서 name 속성의 값을 초기화하도록 합니다. 클래스를 만들었다면 이 클래스로부터 두개의 실제강아지 객체를 만들고 두개의 강아지 객체가 같은지 비교합니다.

```swift
class Dog3 {
  
  var name: String?
  
  init(name:String) {
    self.name = name
  }
  
  func dogName1() {
    print("이 개의 이름은 \(name)입니다.")
  }
  
}
var dogName1 = Dog3(name: "미미")
var dogName2 = Dog3(name: "캔디")

if dogName1 === dogName2 {
  print("동일한 이름입니다.")
}else{
  print("다른 이름입니다.")
}
```

### Qize.20 Dog클래스를 만들고 이름이 age와 birth인 계산 속성을 추가해 보세요. Dog클래스를 정의한 후 name속성은 일반적인 저장속성으로 만듭니다. ageData속성은 나이 값을 담아두는 저장 속성으로 만듭니다. age속성은 계산속성으로 만들고 ageData 변수의 값을 가져오도록 합니다. birh속성도 계산 속성으로 만들고 태어난 연도를 파라미터로 전달하면 ageData변수에 나이를 계산하여 할당하도록 합니다.

```swift
class Dog4 {
 
  var name:String?
  var ageData:Int = 0
  
  init(name:String){
    self.name = name
  }
  var age: Int{
    get {
      return ageData
    }
  }
  
  var birth: Int{
    get {
      return 2020 - ageData
    }
    set(birth) {
      ageData = 2020 - birth
    }
  }
}

var dudals = Dog4(name: "루리")
dudals.age
dudals.ageData
dudals.name
print("\(dudals.name)의 나이는 \(dudals.age)")
```

### Qize 21. 앞에서 만들었던 Dog클래스를 구조체로 만들어 봅니다. Dog구조체에는 name, age 속성과 함께 toString함수가 들어가도록 합니다. name변수의 자료형은 옵셔널 문자열로 하고 age 변수의 자료형은 숫자로 합니다. toString이라는 이름의 함수를 만들고 '강아지 미미의 나이는 2입니다.'처럼 강아지의 이름과 나이를 출력하게 합니다. 구조체를 정의한 후에는 Dog객체를 하나 만들고 toString함수를 호출합니다.


```swift
struct Dog6 {
  
  var name:String?
  var age:Int = 0
  
  func toString() {
    print ("강아지 \(name)의 나이는 \(age)입니다.")
  }
  
}
var i = Dog6(name: "미미", age: 2)
i.toString()


//예제. 옵셔널 1 if문으로 옵셔널인지 아닌지 반환

func show(value1:String) {
var value2: Int?
    value2 = Int(value1) //타입변경
  
  if value2 == nil {
    print("전달받은 값이 nil입니다.")
  } else{
    print("전달받은 값\(value1)")
  }

}
show(value1: "10")
show(value1: "dd")
```

### Qize.28 1부터 10까지 숫자를 더하는 함수를 하나 만든 후 그 결과를 콜백함수로 전달하도록 만들어 보세요. sum이라는 이름으로 함수를 만들고 세개의 파라미터를 전달하도록 합니다. 첫 번째는 시작 숫자, 두 번째는 끝숫자로 하고 세 번째는 콜백 함수로 만들어 결과를 받아 출력하도록 합니다.


```swift
func sum(x: Int, y: Int, callBack:((Int) -> Void)){
  var total = 0
  for i in x...y {
    total += 1
    
  }
  callBack(total)
}

var x = 1
var y = 10

func callBack(result: Int) -> Void {
  print("결과 : \(result)")
}

sum(x: x, y: y, callBack: callBack)


```

### Qize29.함수를 파라미터로 전달받아 필요한 계산을 한 후 새로운 함수를 만들어 반환하는 함수를 만들어보세요. 계산기능을 담당하는 doCalc라는 이름의 함수를 만들고 이 함수를 호출할 때 곱하기 연산을 하는 함수를 피라미터로 전달하게 합니다. doCalc라는 이름의 함수안에서 곱하기한 결과를 화면에 출력하는 기능의 함수를 내부 함수로 만든후 결과 값으로 반환합니다.

```swift
func doCalc1(a:Int, b:Int, calc: (Int,Int)->Int)-> (()->Void) {
  let reult11 = calc(a,b)
  
  func showResurlt() {
    print("결과: \(reult11)")
  }
return showResurlt
}
  let show4 = doCalc1(a:10, b:10, calc:{
    (a:Int,b:Int)-> Int in
    return a * b
  })
show4()
```









