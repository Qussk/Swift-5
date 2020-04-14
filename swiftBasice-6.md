# Swift Basice - 6

## Control Transfer Statement
* 특정 코드에서 다른코드로 제어를 이전하여 코드 실행 순서를 변경하는 것 
  * _continue_ : 현재 반복문을 중단하고 다음 반복 아이템에 대한 작업 수행 
  * _break_ : break가 포함된 해당 제어문의 흐름을 즉각 중단 (반복문, switch문)
  * _fallthrough_ : swift문에서 매칭된 case 다음 단계 것 까지만 실행 
  * _return_ : 함수를 즉시 종료하고, return type에 해당하는 자료를 반환
  * _throw_ 


## continue

```swift
for num in 0...15 {
  if num % 2 == 0 {
    continue // 해당하는 현재의 것만 출력, 나머지는 넘어감
  }
  print(num)
}
```

## return

```swift
func isEven(num: Int) -> Bool {
  if num % 2 == 0 {
    return true
  }
  return false
}
//retune num % 2 == 0 , 위의 if문과 동일한 의미

isEven(num: 1)  //false
isEven(num: 2)  //true



func returnFunction() -> Int {
  var sum = 0
  
  for _ in 1...100 {
    sum += 20
    return sum
//    return 5
  }
  return 7
}

print(returnFunction()) //20, 7
//print(20)과 동일한 의미
```

## break

* 0.

```swift
for i in 1...100 {
  print(i)
 // break
}//1

/*
만약, print대신에 return을 주게 되면 에러남. return은 반복문을 위한 구문이 아니기때문. 
*/

```
* 1. 

```swift
for num in 0...8 {
  if num % 2 == 0 {
    break//retun할경우 에러발생 : 함수에서 함수를 종료하고 타입을 반환, 함수에서 사용되므로. retun은 반복문을 위한 구문이 아님.
  }
  print(num)
}

/* 결과값은?
없음. break가 print에 도달하기전 종료되어 값이 없음.
*/

```

# 2. 
```swift
//이중 반복문, 중첩반복문 
for i in 0...3 {
  for j in 0...3 {
    if i > 1 {
      break
    }
    print("  inner \(j)")
  }
  print("outer \(i)")
}
/*
  inner 0
  inner 1
  inner 2
  inner 3
outer 0
  inner 0
  inner 1
  inner 2
  inner 3
outer 1
outer 2
outer 3
*/

```

## Practice


