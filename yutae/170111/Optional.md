# Optional
## Optional 사용 하는 이유
문서로 이 변수에는 nil 값이 될 수 없습니다. 이렇게 표시하지 않고 코드로 보여줌으로써 개발자가 nil 값을 넣을 수 있는지 없는지 판단하는데 도움을 주기 때문이다. 결론은 "안전한 코딩을 위함"

## Optional 은 열거형 Enum 이다.
case .none, .some <br>
none - nil, some - value
## Optional 을 Binding 해서 값을 안전하게 사용 가능하도록 할 수 있다.
```Swift
// name Optional 이 아니기 때문에 반드시 값이 있어야함.
func printName(name:String){
  print(name)
}
var myName : String? = nil

// Optional Binding 기법
if let name = myName {
  printName(name)
}

// Optional Binding 두개의 변수도 가능, 그러나 *AND 둘다 값이 있어야함.
if let name = myName, let name2 = myName2 {
  printName(name)
  printName(name2)
}
```

## Optional Chaining
```Swift
if let .. {
  if let .. {
    if let .. {

    }
  }
}

// 위 처럼 사용하지 않고 Chaining 기법을 사용
/*
  paul.residence nil Check -> address nil Check ...
  ? Optional 에도 사용이 되고, Optional Chaining 에도 사용됨.
  Optional Chaining 의 결과 값은 Optional
*/
paul.residence?.address?.buildingNumber?.toInt()
```

## Force Unwrapping

```Swift
func printName(name:String){
  print(name)
}
var myName : String? = "Yutae"

// Error 발생
printName(myName)
// Swift Compiler ! 붙여라! 이렇게하면 nil 값들어갈 경우 Exception 발생
printName(myName!)

// Solution : Optional Binding 기법 사용
if let name = myName {
  printName(name)
}
```

## Implicitly Unwrapped Optional
Optional 선언을 ? 가 아닌 !로 사용 하는 방법
Optional 인데 얘는 계속 값을 가져올 수있다라는 내용을 암시 한다.
* 주로 클래스에서 사용
* nil 값을 가지고 있을 수 있다. nil 일 때 바로 접근을 한다면, Crash 발생

Optional Binding 을 사용 할 수 있다.

## 왜 ? Optional 이 있는데 ! Implicitly Unwrapped Optional 이 왜 있을까?
주로 클래스에서 사용이 된다.
```Swift
// Error 발생 init이 먼저 발생하고 이후에 스토리 보드 객체랑 연결이 된다.
// nameLabel 값은 loadView() 에서 할당이 된다.
@IBOutlet weak var nameLabel: UILabel

// 느낌표가 있는 이유는 지금 초기 값이 nil 일 것이라는것을 암시 -> 자동으로 nil이 할당된 상태
@IBOutlet weak var nameLabel: UILabel!
```
처음에는 nil 상태 이지만 이후에 스토리 보드 랑 연결이 되면 값이 들어가기 때문이다.
#### ! 대신 ? 를 사용 해도 똑같이 작동이 된다 하지만, 이 변수를 계속 접근 할때 nameLabel? 이렇게 ?를 계속 붙혀줘야되기 때문에 !를 사용한다.

## if / Guard
```Swift
for i in 0...5{
  if (i%2 == 0) {
    print(i)
  }
  else {
    continue
  }
}

for i in 0...5{
  guard i%2 == 0 else {
    continue
  }
  print(i)
}
```
### 예를 들어, if Binding 된 { } 에서만 사용이 가능한데 Guard 를 사용 하여 빠른 종료를 시킨 후 전체 에서 사용이 가능하다
### value를 사용 할 수 있는 Scope 가 달라진다.
```Swift
func example(param : Int?){
  // And OR 사용 가능
  guard if let value = param, value < 5 else {
    print("값이 없거나 5보다 작다. 종료시켜버리기")
    return
  }
  print("\(value) 값이 존재 하고 5보다 크다. 이 값은 guard 통과 한 후에도 사용이 가능하다.")
}
```

## Swift의 Type Cast 는 "이 변수가 이 타입이 맞나요?" 의 개념과 같다.
### 만약 as 에 !,? 를 안 쓴다면 "무조건 type 이 타입 맞다." 라는 의미
```Swift
// "URL Type 이 맞니?" 아니라면 nil 반환 즉 if 문 Scope 가 실행이 안된다.
if let url = value as? URL{

}
```
## Swift throws
"예외 처리를 직접 할 수 있게끔 해준다" 라는 의미
try ?, ! 를 안 붙히면 예외처리를 해주어야 한다.
"예외가 발생하면 nil 값을 받겠다" 라는 의미로 try ?, ! 사용
```Swift
// throws : 에러가 발생 할 가능성이 있다. "에러가 발생하면 핸들링을 해라" 라는 의미
init () throws

if let player = try? AVAudioPlayer(contentOf : url) {

}
// ! 를 사용하면 강제로 값을 넣기 때문에 에러 발생
if let player = try! AVAudioPlayer(contentOf : url) {

}
// 정석
do {
  player = try AVAudioPlayer(contentOf : url)
} catch {
 // 예외처리
}
```

## dump() : Dumps an object's contents using its mirror to standard output.
## print() 에서는 object 가 주소값만 나오는데 dump 는 type 과 상위 클래스 type 까지 구체적으로 나온다.
