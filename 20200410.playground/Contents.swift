import UIKit



//


func printName(inputName: String) {
      print(inputName)
}
printName(inputName: "홍길동")


func printAge(inputAge: Int){
    print(inputAge)
}
printAge(inputAge: 29)



func sayToHello(to inputName: String){
    print("Hi! How are you? \(inputName)?")
}
sayToHello(to: "요요")



/*
func 함수이름(매개변수: 타입) -> 반환타입 {
    
}*/




//1. 이름과 나이를 입력 받아 자신을 소개하는 글을 출력하는 함수

func introPrint(name: String, age: Int) {
    print(name, age)
    print("저의 이름은 \(name)이고, \(age)살 입니다.")
}
introPrint(name: "변윤나", age: 29)


func adressPrint(adress: String, number: Int) {
    print("저의 주소는 \(adress)이고, 번호는 \(number)입니다. ")
}
adressPrint(adress: "서울시 용산구 이태원동", number: 103)


func studyPrint(study: String, hour: Int) {
    print("저는 오늘 \(study)를 배웠고, \(hour)시간 공부했습니다.")
}
studyPrint(study: "swift기초", hour: 4)




//2. 정수를 하나 입력받아 2의 배수 여부를 반환하는 함수

//Bool 이용하기

func judgmentIndex(inputIndex: Int)-> Bool {
    if inputIndex % 2 == 1 {
    return true
    } else {
    return false
   }
}


// 함수없이
    if judgmentIndex(inputIndex: 33) {
        print("홀수입니다.")
    } else {
        print("짝수입니다.")
    }

func judgmentIndex2(inputIndex: Int)-> String {
    if inputIndex % 2 == 1 {
    return "홀수입니다."
    } else {
    return "짝수입니다."
}
}
print(judgmentIndex2(inputIndex: 51))



//3.정수를 두 개 입력 받아 곱한 결과를 반환하는 함수 (파라미터 하나의 기본 값은 10)

func judgmentIndex3(one: Int, two: Int)-> Int {
   return(one * two)
}
judgmentIndex3(one: 10, two: 30)



//4. 4과목의 시험 점수를 입력받아 평균 점수를 반환하는 함수

func revelTest(a: Int, b: Int, c: Int, d: Int)-> Int{
return((a + b + c + d) / 4 )
}
revelTest(a: 65, b: 80, c: 76, d: 98)

//5. 점수를 입력받아 학점을 반환하는 함수 만들기 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)


func revelTest2(abc: Int)-> String{
    if abc >= 90 {
    return "A"
    } else if abc >= 80 {
    return "B"
    } else if abc >= 70 {
    return "C"
    } else if abc < 69 {
    return "F"
    
    }
    return revelTest2(abc: 50)
}

//6. 가변 인자 파라미터를 이용해 점수를 여러 개 입력받아 평균 점수에 대한 학점을 반환하는 함수 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)


func revelTest3(a: Int...)-> String {
    var reveldata: Int = 0

    for data in a {
        reveldata = reveldata + data
    }
    var avgData = reveldata / a.count
 
    if avgData >= 90 {
        return "A"
    } else if avgData >= 80 {
        return "B"
    } else if avgData >= 70 {
        return "C"
    } else {
        return "F"
    }
}
revelTest3(a: 95, 95, 95)


