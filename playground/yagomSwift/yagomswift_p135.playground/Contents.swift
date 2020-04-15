import UIKit

import UIKit

//6.흐름제어
//6-1 조건문
//p.135~ p.146

// code. 6-1 if구문 기본 구현
let first: Int = 5
let second: Int = 7

if first > second {
    print("first > second")
} else if first < second {
   print("first < second")
} else {
    print("first == second")
}

// first < second

// code. 6-2 if구문의 다양한 구현(소괄호가 없는)
let first1: Int = 5
let second1: Int = 5
var biggerValue: Int = 0

if first1 > second1 {
    biggerValue = first1
} else if first1 == second1 {
    biggerValue = first1
} else if first1 < second1 {
    biggerValue = second1
} else if first1 == 5 { //이미 위에서 first1 == second1라는 조건을 만족시켰기 떄문에 실행되지 않음
    biggerValue = 100
}
print(biggerValue) //5

// code. 6-2-2 if구문의 다양한 구현 (소괄호가 있는)
// 조건식에서의 소괄호는 선택사항임
let first2: Int = 5
let second2: Int = 5
var biggerValue1: Int = 0

if (first2 > second2) {
    biggerValue1 = first2
} else if (first2 == second2) {
    biggerValue1 = first1
} else if (first2 < second2) {
    biggerValue1 = second2
} else if (first2 == 5) { //이미 위에서 first1 == second1라는 조건을 만족시켰기 떄문에 실행되지 않음
    biggerValue1 = 100
}
print(biggerValue1) //5

//code. 6-3 switch 기본 구문
let integerValue: Int = 5

switch integerValue {
case 0:
    print("value == 0")
case 1...10:
    print("value == 1~10")
   fallthrough//아래단계까지 실행하고 종료
case Int.min..<0, 101..<Int.max: //명령어 활용
    print("value < 0 or value > 100")
    break//여기서 실행종료.
case ...200, 300...: //...으로도 표현가능
    print("value < 200 or value < 300")

default:
    print("300 < value > 400")
}

//value == 1~10
//value < 0 or value > 100

//code.6-4 부동소수 타입의범위 연산을 통한 switch case구성
let doubleValue: Double = 3.0

switch doubleValue {
case 0:
    print("value == zero")
case 1.5...10.5:
    print("1.5 <= value <= 10.5")
default:
    print("value == \(doubleValue)")
}

// 1.5 <= value <- 10.5
// switch구문의 입력값으로 숫자 표현이 아닌 문자, 문자열, 열거형, 튜플, 범위, ㅐ턴이 적용된 타입등 다양한 타입의 값도 사용 가능합니다.

//code. 6-5 문자열 switch case 구성
let stringValue: String = "Liam Neeson"

switch stringValue {
case "yagom":
    print("He is yagom")
case "Jay":
    print("He is Jey")
case "Jenny","Joker","Jack":  //복수형
    print("He is \(stringValue)")
default:
    print("\(stringValue) said `i din`t know who you are`")
}


//Liam Neeson said `i din`t know who you are

//code. 6-6 잘못된 case 사용. ~ code.6-7 fallthrough의 사용
let stringValue1: String = "Liam Neeson"

switch stringValue1 {
case "yagom":
    print("He is yagom")
case "Jay":
    //만약 이곳이 비어있다면 오류가 발생함.
    //하지만 fallthrough로 채워넣으면 오류나지 않음.
    //어쨌든 case 아래에는 무조건 실행구문이 있어야함.
    fallthrough
case "Jenny","Joker","Jack":  //복수형
    print("He is \(stringValue)")
default:
    print("\(stringValue) said `i din`t know who you are`")
}



//code. 6-8 튜플 switch case 구성
typealias NameAge = (name: String, age: Int)

let tupleValue: NameAge = ("yagom", 99)

switch tupleValue {
  case ("yagom", 99):
    print("정확히 맞췄습니다.")
default:
    print("틀렸습니다.")
}



//code. 6-9 와일드카드 식별자를 사용한 튜플 switch case 구성
typealias NameAge1 = (name: String, age: Int)

let tupleValue1: NameAge1 = ("yagom", 50)

switch tupleValue1 {
case ("yagom",50):
    print("정확히 맞췄습니다.")
case ("yagom", _):
    print("이름만 맞췄습니다. 나이는 \(tupleValue1.age)입니다.")
case (_, 99):
    print("나이만 맞췄습니다. 이름은 \(tupleValue1.name)입니다.")
default:
    print("모두 틀렸습니다.")
}

//code. 6-11 where을 사용하여 switch case 확장
let 직급: String = "사원"
let 연차: Int = 1
let 인턴인가: Bool = false

switch 직급 {
case "사원" where 인턴인가 == true :
    print("인턴입니다.")
case "사원" where 연차 < 2 && 인턴인가 == false : //연차가 2년이하이면서 인턴인가는 false인 사원
    print("신입사원입니다.")
case "사원" where 연차 > 5 :
    print("연식이 좀 있는 사원입니다.")
case "사원" :
    print("사원입니다.")
case "대리" :
    print("대리입니다.")
default:
    print("사장입니까?")
}


//code. 6-12 열거형을 입력 값으로 받는 switch구문
enum School {
    case primary, elementary, middle, high, college, universuty, graduate
}

let 최종학력: School = School.universuty

switch 최종학력 {
case .primary:
    print("최종학력은 유치원입니다.")
case .elementary:
    print("최종학력은 초등학교입니다.")
case .middle:
    print("최종학력은 중학교입니다.")
case .high:
    print("최종학력은 고등학교입니다.")
case .college, .universuty:
    print("최종학력은 대학(교)입니다.")
case.graduate:
    print("최종학력은 대학원입니다.")
//default:
//    print("학력이 존재하지 않습니다.")//열거형에서 default는 사용-실행되지 않는다.
}

//code. 6-13
enum Menu {
    case chiken
    case pizza
}
let lunchMenu: Menu = .chiken

switch lunchMenu {
case .chiken:
    print("반반 무많이")
case .pizza:
    print("디핑소스 추가")
case _: //case default:와 동일
    print("메뉴가 없습니다.")
}
//Case will never be executed라는 오류발생.
//열거형에 새로운 case는 추가 했으나 내부 코드는 수정하지 않은 경우? 오히려 case_ 의 발생여부가 있음
//이러한 문제를 방지하기 위해 unknow속성을 사용할 수 있음
//code. 6-13 차후에 Menu열거형에 추가한 case를 처리하지 않으려면 경고를 내어줄 unknown
enum Menu1 {
    case chiken1
    case pizza1
    case hamburger
}
let lunchMenu1: Menu1 = .chiken1

switch lunchMenu1 {
case .chiken1:
    print("반반 무많이")
case .pizza1:
    print("디핑소스 추가")
@unknown case _: //case default:와 동일
    print("메뉴가 없습니다.")
}

//위 case에 hamburger를 추가하면, 위와 같은 경고(SWitch must be exhausive)를 통해 해당 switch구문이 모든 case에 대응하지 않는 사실을 상기할 수 있습니다.
//이처럼 논리적인 오류에 대해 도움을 받을 수 있는 @unknown case 의 케이스는 case_, default case 뿐입니다. 또 unknown 속성을 부여한 case는 swich구문의 가장 마지막 case로 작성해야합니다.


