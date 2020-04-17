import UIKit



//[도전과제]
//1. 아래 두 클로저를 Syntax Optimization을 이용하여 최대한 줄여보기
//let someClosure: (String, String) -> Bool = { (s1: String, s2: String) -> Bool in
//  let isAscending: Bool
//  if s1 > s2 {
//    isAscending = true
//  } else {
//    isAscending = false
//  }
//  return isAscending
//}


let someClosure = { (s1: String, s2: String) -> Bool in
 return s1 > s2
}
someClosure("aa","bb")


let someClosure2: (String, String) -> Bool = { $0 > $1 }
someClosure2("aa", "bb")



//
//let otherClosure: ([Int]) -> Int = { (values: [Int]) -> Int in
//  var count: Int = 0
//  for _ in values {
//    count += 1
//  }
//  return count
//}


let otherClosure: ([Int]) -> Int = {
    $0.count
}



//
//let otherClosure = { (values: [Int]) -> Int in
//    values.count + 1
//}
//otherClosure([0])
