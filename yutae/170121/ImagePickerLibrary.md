## Cocoapods Photo Library
#### 공통점
	1. 기반으로 UIImagePickerDelegate 사용
	2. Delegate 프로토콜 함수에 Permission 예외 처리 함수 포함
	3. Delegate 프로토콜 함수에 Image Pick 했을때의 함수
	4. Delegate 프로토콜 함수에 Image Pick 을 Cancel 했을때의 함수

### 제가 말한 이 4가지를 다 아시겠지만 여기서 2번째만만 짚고 넘어가겠습니다.
여러분들도 다 경험해보셨을 겁니다. 권한이 없는데 접근을 시도를 하면 crash가 발생합니다.
권한이 없을때 예외처리를 해주게 됩니다. 이 예외처리를 라이브러리들은 쉽게표현하면 너가 하고싶은대로 예외처리해! 이런식으로 제공하게 됩니다.
가장 많이 사용되는 예외처리는 이런식으로 설정을 누르면 이동하게되는 방식이 사용됩니다.

```Swift
func openSetting () {
  let alert = UIAlertController(title: "title", message: "message", preferredStyle: .alert)
  alert.addAction(UIAlertAction(title: "설정", style: .default, handler: { (action:UIAlertAction) -> Void in
      let settingsUrl = URL(string: UIApplicationOpenSettingsURLString)
      if #available(iOS 10.0, *) {
          UIApplication.shared.open(settingsUrl!, options: [:], completionHandler: nil)
      } else {
          UIApplication.shared.openURL(settingsUrl!)
      }
  }))

  alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
  self.present(alert, animated: true, completion: nil)
}
```

## Fusuma (Library)
https://github.com/ytakzk/Fusuma

<img src="https://raw.githubusercontent.com/wiki/ytakzk/Fusuma/images/fusuma.gif" width="340px">

### 도대체 왜 이런 Layout 일까?

#### Image 를 Picker 했을때 Image Crop 을 한다. 왜 Crop 을 할까? 자신이 앱의 고정적인 사진 Frame 비율을 위함. 따라서 레이아웃으로 디자인과 사진의 프레임 비율 조절까지 얻을 수 있다.

## PHPhotoLibraryChangeObserver - PhotoLibrary 가 변경되었을때 알려주는 Protocol Observer.
https://developer.apple.com/reference/photos/phphotolibrarychangeobserver

```Swift
func photoLibraryDidChange(_ changeInstance: PHChange) {

}
```
## Permission PHPhotoLibrary.requestAuthorization (Library : YANGMINGSHAN)
https://github.com/yahoo/YangMingShan

```Swift
func photoPickerViewControllerDidReceivePhotoAlbumAccessDenied(_ picker: YMSPhotoPickerViewController!) {
        self.openSetting(type: .album)
    }

func photoPickerViewControllerDidReceiveCameraAccessDenied(_ picker: YMSPhotoPickerViewController!) {
        self.openSetting(type: .camera)
    }
```
