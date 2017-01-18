## KVO
### Key - Value - Observing
### 한 마디로 요약하자면 KVO는 어떤 객체의 변수 값이 변경되는 것을 알고 싶을때 사용 합니다.
실 생활로 예를 들자면, 부스트 캠프에 코딩 시험을 본 태는 합격 결과를 알 고 싶다. <br>
이때 방법은 2가지가 있습니다. 첫번째는 합격 공지 날 10분 단위로 합격 사이트를 들어간다. <br>
두번째는 부스트 캠프 웹 페이지를 해킹해서 합격 공지가 올라오면 Call Back 함수로 나에게 문자 보내는 함수를 심어논다.

### 마찬가지로 iOS에서 A라는 변수가 있다면 이 A 값이 바뀌면 실행되는 함수를 만들 수 있습니다.
### 실제로 어떻게 쓰일까?
#### 제가 이번 PitchPerfect 프로젝트에서 사용한 KVO 입니다. 아래 코드를 간단하게 설명을 하자면,
#### 프로젝트 앱에서 음원을 실행시키다가 다른 앱 멜론 같은 곳에서 음원을 실행시키고 다시 나의 앱으로 돌아 왔을때도 스피커로 음성이 나오도록 설정하는 것 입니다.
#### NotificationCenter.defalut 라는 객체에 Observer로 UIApplicationWillEnterForeground 라는 내 앱이 나왔을때 실행되는 함수 refreshViews를 추가 시킨거죠.

#### 주의) 반드시 Observer를 제거해주어야 합니다.

```Swift
NotificationCenter.default.addObserver(self, selector: #selector(PlaySoundsDialLayoutViewController.refreshViews),
name: NSNotification.Name.UIApplicationWillEnterForeground, object: nil)

func refreshViews(notification: NSNotification) {
        let session = AVAudioSession.sharedInstance()
        try? session.setCategory(AVAudioSessionCategoryPlayback,
           with:AVAudioSessionCategoryOptions.defaultToSpeaker)
}

NotificationCenter.default.removeObserver(self)
```

## KVO VS Delegate
### 공통점
#### Call Back Method 방법을 사용한다.

### 차이점
#### Reusability 재 사용 입니다.
Delegate 는 다른 Object 에서도 재사용이 가능합니다. 반면에 KVO는 사용 하고자 할때마다 직접 코딩을 해주어야 합니다.
#### Delegate : One - One, KVO : One - Many
Delegate는 하나의 오브젝트와 연결되어 사용이 됩니다.
반면에 KVO는 앱 전체에서 사용이 됩니다. 구체적인 예를 들자면 상위 코드에서 만약,
```Swift
NotificationCenter.default.removeObserver(self)
```
안해준다면, 어떤 화면이든 이때 만든 Observer 계속 실행이 됩니다.
