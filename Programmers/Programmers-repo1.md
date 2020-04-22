# Programmers-repo1

- Level.1 의 비교적 쉬운 난이도.


## 짝수와 홀수 

*풀이*

```swift

func solution(_ num:Int) -> String {
    if((num%2)==0)
    {
        return "Even"
    }else{
        return "Odd"
    }
}
```

*다른 풀이*

```swift
func solution(_ num:Int) -> String {
    return num % 2 == 0 ? "Even" : "Odd"
```


## 평균구하기 

*풀이*

```swift 
func solution(_ arr:[Int]) -> Double {
    var temp = 0
    for i in arr{
        temp += i
    }

    return Double(temp)/Double(arr.count)
}
```

*다른 풀이*

```swift
func solution(_ arr:[Int]) -> Double {

    return Double(arr.reduce(0,+))/Double(arr.count)
}
```

