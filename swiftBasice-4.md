# Swift Basics - 4

## if Statements
*if의 기본형*

```if 조건  { 
   실행구문
}

if 조건  {
   실행구문
  } else {
   실행구문
}
```
* if는 반드시  Bool 값 (true, false)을 사용한다. 

```swift
// if

var temperatureInFahrenheit = 30

if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
}


// if - else

temperatureInFahrenheit = 40

if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
} else {
  print("It's not that cold. Wear a t-shirt.")
}


// if - else if - else

temperatureInFahrenheit = 90

if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
  print("It's really warm. Don't forget to wear sunscreen.")
} else {
  print("It's not that cold. Wear a t-shirt.")
}


// if - else if

temperatureInFahrenheit = 72
if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
  print("It's really warm. Don't forget to wear sunscreen.")
}
```

### Question
```swift
// if ~ else if   /  if 문을 2개 하는 것과 차이점?

var number = 9
if number < 10 {
  print("10보다 작다")
} else if number < 20 {
  print("20보다 작다")
}
// 앞에 것만 실행됨(선행)

if number < 10 {
  print("10보다 작다")
}
if number < 20 {
  print("20보다 작다")
}

//두개 구분지어 놓으면 둘 다 실행됨


## switch Statements
*switch 기본형
``` 
switch 값 {
case 비교값 1: 
     실행구문
case 비교값 2:
     실행구문 
fallthrough // 이번 case를 마치고 switch
```

    
