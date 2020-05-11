# Memory Management without ARC

- 1. GC (Garbage Collection)
  - 정기적으로 Garbage Collector 가 동작하여 더이상 사용되지 않는 메모리를 반환하는 방식
  - OS X 에서만 지원했었으나 버전 10.8 (Mountain Lion) 부터 deprecated

- 2. MRR (Manual Retain-Release) / MRC (Manual Referece Counting)
  - RC(Reference Counting) 를 통해 메모리를 수동으로 관리하는 방식
  - retain / release / autorelease 등의 메모리 관리 코드를 직접 호출
  - 개발자가 명시적으로 RC 를 증가시키고 감소시키는 작업 수행


![mrr](/image/MRR.png)



### 기존 Reference Counting

![Leak}(/image/Leak.png)


## ARC (Automatic Reference Counting)


- RC 자동 관리 방식 (WWDC 2011 발표)
- 컴파일러가 개발자를 대신하여 메모리 관리 코드를 적절한 위치에 자동으로 삽입
- GC 처럼 런타임이 아닌 컴파일 단에서 처리 (Heap 에 대한 스캔 불필요 / 앱 일시 정지 현상 없음)
- 메모리 관리 이슈를 줄이고 개발자가 코딩 자체에 집중할 수 있도록 함






- stack 과 Heap의 공간을 만듦. 
- 레퍼런스가 1씩 증가할 때마다 refCount가 추가됨 
- 레퍼런스가 사라지면 알아서 refCount가 0이 됨. 
- (런타임때 발생)




- 레퍼런스가 사라지면 하나씩 소멸됨. stack도 마찬가지. 




### Strong Reference Cycle

- 객체에 접근 가능한 모든 연결을 끊었음에도 순환 참조로 인해 활성화된 참조 카운트가 남아 있어 메모리 누수가 발생하는 현상
- 앱의 실행이 느려지거나 오동작 또는 오류를 발생시키는 원인이 됨


 
