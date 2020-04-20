import UIKit


//p.184 ~p.194
//9-1 구조체

/* 기본형
srtuct  구조체이름 {
    프로퍼티와 메서드들
}
*/


//code. 9-1 BasicInformation 구조체 정의

struct BasicInformation {
    var name : String
    var age : Int
}


//code. 9-2 BasicInformation 구조체의 인스턴스 생성 및 사용


var yagomInfo: BasicInformation = BasicInformation(name: "yagom", age: 99)

yagomInfo.age = 100
yagomInfo.name = "Qussk"

//var를 let으로 변경했을경우 사용불가! (상수로 변경불가)




//9-2 클래스

/* 기본형
 class 클래스 이름 : 부모클래스 이름 {
 프로퍼티와 메서드들
 }
 */

//code. 9-3 Person 클래스 정의

/*
  class Person {
    var heigh: Float = 0.0
    var weight: Float = 0.0
}
 */
// Float타입인 heigh와 weight저장 프로퍼티가 있는 person클래스.




//9.2.2 클래스 인스턴스의 생성과 초기화

//'9-3 Percon 클래스'는 기본적인 프로퍼티의 기본값이 지정되어 있으므로 전달인자를 통하여 따로 초깃값을 전달해주지 않아도 됨.
//구조체와 다르게 클래스의 인스턴스는 참조타입이므로 클래스의 인스턴스를 상수 let으로 선언해도 내부 프로퍼티 값을 변경할 수 있음.


//code. 9-4 Person 클래스의 인스턴스 생성 및 사용

/*
var yagom: Person = Person()
yagom.heigh = 123.4
yagom.weight = 123.4

let jenny: Person = Person()
jenny.heigh = 123.4
jenny.weight = 123.4
*/

//사용자가 직접 이니셜라이저를 정의할 수도 있음.

//9.2.3 클래스 인스턴스의 소멸
//클래스의 인스턴스는 참조타입이므로 더는 참조할 필요가 없을 때 메모리에서 해제됨. <- 소멸이라고 명시하는데, 소멸되기 직전 deinit라는 메서드가 호출됨. 클래스 내부에 deinit메서드를 구현해주면 소멸되기 직전 deinit메서드가 호출됨. -> 디이니셜라이저라고 부름.
//deinit메서드는 클래스당 하나만 구현가능, 매개변수와 반환값을 가질 수 없음.
//deinit는 ()를 적어주지 않음


//code. 9-5 Person 클래스의 인스턴스 생성 및 소멸
class Person {
    var height: Float = 0.0
    var weight: Float = 0.0

deinit {
    print("Person클래스의 인스턴스가 소멸됩니다.")
   }
}
 
var yagom: Person? = Person()
yagom = nil // Person 클래스의 인스턴스가 소멸됩니다.

// 보통 deinit는 인스턴스가 메모리에서 해제되기 직전에 처리할 코드를 넣어줌. 예를 들면 인스턴스 소멸 전에 데이터를 저장한다거나 다른 객체에 인스턴스 소멸을 알려야할 때 특히 deinit를 구현해야함. (자세한건 11장에서 더 다루기로..)



//9.3 구조체와 클래스의 차이
/*
 [같은점]
 - 값을 저장하기 위해 프로퍼티를 정의할 수 있음
 - 기능 실행을 위해 메서드 정의할 수 있음
 - 서브스크립트 문법을 통해 구조체 또는 클래스가 갖는 값(프로퍼티)에 접근하도록 서브스크립트를 정의할 수 있음.
 - 초기화될 때의 상태를 지정하기 위해 이니셜라이저를 정의할 수 있음
 - 초기구현과 더불어 새로운 기능 추가를 위해 익스텐션을 통해 확장할 수 있음
 - 특정기능을 실행하기 위해 특정 프로토콜을 준수 할 수 있음
 [다른점]
 - 구조체는 상속할 수 없음
 - 타입캐스팅은 클래스의 인스턴스에만 허용됨
 - 참조횟수 계싼은 클래스의 인스턴스에만 적용됨
 */


//code. 9-6 값타입과 참조타입의 차이
//[값타입]

struct namalInformation {
    let name: String
    var age: Int
}

var yagomform: namalInformation = namalInformation(name: "yagom", age: 99)
yagomInfo.age = 100

//yagomInfor값을 복사하여 값을 할당함 !
var friendInfo: namalInformation = yagomform

print("yagom's age : \(yagomform.age)")   //100
print("friend's age : \(friendInfo.age)") //100

friendInfo.age = 999 // 별개값

print("yagom's age \(yagomform.age)") // 100 변동없음
print("friend's age \(friendInfo.age) ") // 999 - friendInfo라는 별개의 값을 복사해왔기 때문에 별개의 값을 가짐.



//[참조타입]

class Parson1 {
    var height: Float = 0.0
    let weight: Float = 0.0
    
}
var yagom1: Parson1 = Parson1()
var friend: Parson1 = yagom1   // yagom의 참조를 할당함!

print("yagom's height : \(yagom1.height)")  //0.0
print("friend's height : \(friend.height)")  //0.0

friend.height = 185.5 //참조값
print("yagom's height: \(yagom1.height)") // 185.5 - friend는 yagom을 참조하기 때문에 값이 변동됨.

print("yagom's height: \(yagom1.height)") // 185.5 - yagom이 참조하는 곳과 friend가 참조하는 곳이 서로 같음.


func changBasicInfo(_ info: namalInformation) {
    var copiedInfo: namalInformation = info
    copiedInfo.age = 1
}

func changBasicInfo(_ info: Parson1) {
    info.height = 155.3
}

//changBasicInfo(_:)로 전달되는 전달인자는 값이 복사되어 전달되기 떄문에 yagomInfo의 값만 전달되는 것입니다. yagom1이 참조하는 값들에 변화가 생김.
changBasicInfo(yagom1)
print("yagom's height : \(yagom1.height)") // 155.3


//클래스의 인스턴스끼리 참조가 같은지 확인할때는 식별연산자를 사용합니다.
//code.9-7 식별연산자의 사용

var yagom3: Parson1 = Parson1()
let friend3: Parson1 = yagom3  //yagom 의 참조를 할당합니다.
let anotherFriend: Parson1 = Parson1()//새로운 인스턴스를 생성합니다.

print(yagom === friend) //true
print(yagom === anotherFriend) //false
print(friend !== anotherFriend)


//9.3.2 스위프트의 기본 데이터 타입은 모두 구조체
//code. 9-8 스위프트 String 타입의 정의
public struct String {
/// An empty 'String'
//public init()

}

//스위프트의 다른 기본타입 (Bool, Int, Array, Dictionary, Set등등)도 String과 마찬가지로 모두 구조체로 구현되어있음. 기본데이터 타입은 모두 값타임이 됨. 전달인자를 통해 데이터를 전달하면 모두 값이 복사되어 전달될 뿐, 함수 내부에서 아무리 전달된 값을 변경해도 기존의 변수나 상수에는 전혀 영향을 미치지 못함.



//9.4 구조체와 클래스 선택해서 사용하기
// 구조체와 클래스는 새로운 데이터 타입을 정의하고 기능을 추가하는 점이 같지만, 구조체 인스턴스는 항상 값타입이고, 클래스 인스틴스는 참조타입임.






