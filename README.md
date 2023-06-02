*# 🗓 프로젝트 매니저

## 📚 목차
- [소개](#-소개)
- [타임라인](#-타임라인)
- [파일구조](#-파일구조)
- [실행화면](#-실행화면)
- [트러블 슈팅](#-트러블-슈팅)
- [참고 링크](#참고-링크)

## 🗣 소개
### 프로젝트 소개
#### 프로젝트 기간 : 23.05.15 ~ 23.06.02
- ToDo를 생성하고 관리하는 프로그램

### 팀 소개
- 팀 구성원(2인)

| vetto | 송준 |
| :--------: | :--------: |
| <img src="https://cdn.discordapp.com/attachments/535779947118329866/1055718870951940146/1671110054020-0.jpg" width="200" height="250"/> | <img src="https://user-images.githubusercontent.com/88870642/210026753-591175fe-27c1-4335-a2cb-f883bfeb2784.png" width="200" height="200"/>|
|[Github](https://github.com/gzzjk159)|[Github](https://github.com/kimseongj)|


## ⏱ 타임라인
|날짜|활동|
|---|---|
|2023.05.16|- 기술 선정|
|2023.05.17|- CompositionalLayout과 DiffableDataSource를 사용하여 CollectionView 구현|
|2023.05.18|- CollectionView와 TableView에 대한 비교 및 구현|
|2023.05.19|- CollectionView Swipe 구현|
|2023.05.22|- ModalView 구현 </br> - DateFormmatter 설정|
|2023.05.23|- ViewModel 구현 </br> - MVVM Bind 구현|
|2023.05.24|- ViewModel 리팩토링 </br> - DatePicker 구현|
|2023.05.25|- LongPressGesture 구현 </br> Popover 구현|
|2023.05.26|- 코드 리팩토링|
|2023.05.29|- Combine을 통한 Binding|
|2023.05.30|- Constant값 상수 선언 및 firebase 실험|
|2023.05.31|- ViewModel 데이터를 ScheduleManager로 분리|
|2023.06.01|- MVVM 리팩토링|
|2023.06.02|- Readme 작성|

## 📂 파일구조
```swift
.
├── Resource
│   ├── Assets.xcassets
│   │   ├── AccentColor.colorset
│   │   │   └── Contents.json
│   │   ├── AppIcon.appiconset
│   │   │   └── Contents.json
│   │   └── Contents.json
│   ├── Base.lproj
│   │   └── LaunchScreen.storyboard
│   ├── GoogleService-Info.plist
│   └── Info.plist
└── Source
    ├── Application
    │   ├── AppDelegate.swift
    │   └── SceneDelegate.swift
    ├── Model
    │   ├── ModalType.swift
    │   ├── Schedule.swift
    │   ├── ScheduleManager.swift
    │   └── ScheduleType.swift
    ├── Protocol
    │   └── IdentifierType.swift
    ├── Utility
    │   ├── DateFormatterManager.swift
    │   ├── FirebaseManager.swift
    │   ├── Namespace.swift
    │   └── Section.swift
    ├── View
    │   ├── DoList
    │   │   ├── DoListViewController.swift
    │   │   ├── ScheduleCell.swift
    │   │   └── TodoHeaderView.swift
    │   ├── Main
    │   │   └── MainViewController.swift
    │   └── Modal
    │       └── ModalViewController.swift
    └── ViewModel
        ├── DoListViewModel.swift
        └── ModalViewModel.swift
```

## 💻 실행화면

| schedule 생성 | Schedule 이동|
| :--------: | :--------: |
| ![스케쥴추가](https://github.com/kimseongj/TIL/assets/88870642/d4441bed-0974-4646-ac53-1cbb8cd41ad5)| ![스케쥴이동](https://github.com/kimseongj/TIL/assets/88870642/61a133d5-a03e-49e4-8553-9dd08982f820)|

| schedule 삭제 | schedule 수정 |
| :---: | :---: |
|![스케쥴삭제](https://github.com/kimseongj/TIL/assets/88870642/6cb6e98e-f5f5-4dd2-b59a-1290136436bb)|![스케쥴변경](https://github.com/kimseongj/TIL/assets/88870642/f98d8264-0420-43ca-880f-0dab59f8dd53)|


## 🔥 트러블 슈팅
### 1️⃣Combine @Published의 willset
![](https://hackmd.io/uploads/SkehwApSh.png)
> `Published`의 경우 공식문서를 참고한 결과, subscriber는 실제로 속성에 설정되기 전에 새 값을 받습니다. 이 점을 간과하고, 실제 속성에 값을 가져오는 바람에 한박자 늦게 작동되는 오류가 발생했습니다. 아래는 그에 대한 예시입니다. 즉, `@Published`로 감싸져있는 프로퍼티는 `sink`할 경우 `willset`이 작동되어, `weather.temperature`를 `sink`의 `escaping closure`에 불러올 경우 변하지 않은 상태로 값이 불러옵니다. `sink`의 `escaping closure` 내부에 있는 매개변수($0)에 변화된 값이 저장되며, 이 값을 통해 처리를 해주어야 합니다.

- 변경된 값을 subscriber가 받아 왔을 시
```Swift
class Weather {
    @Published var temperature: [Double]
    init(temperature: [Double]) {
        self.temperature = temperature
    }
}

var cancellables: Set<AnyCancellable> = []

let weather = Weather(temperature: [20])
weather.$temperature
    .sink() { 

        print ("Temperature now: \(weather.temperature)") 

    }.store(in: &cancellables)


weather.temperature = [25] // [20]을 호출한다.
```

- 실제 속성 값을 받아와 처리를 하였을 시 
```Swift
class Weather {
    @Published var temperature: [Double]
    init(temperature: [Double]) {
        self.temperature = temperature
    }
}

var cancellables: Set<AnyCancellable> = []

let weather = Weather(temperature: [20])
weather.$temperature
    .sink() { 

        print ("Temperature now: \($0)") 

    }.store(in: &cancellables)


weather.temperature = [25] // [20, 25]를 print한다.
```

### 2️⃣cell identifier
cell을 collectionView에 등록할 때, "cell"이라는 다소 모호한 identifier를 작성했었습니다. 모호성을 없애기 위해 `identifierType`이라는 프로토콜을 구현하여, `UIViewController`와 `UICollectionViewCell`에 채택을 하였습니다.

- 변경 전
```swift
self.collectionView.register(ScheduleCell.self, forCellWithReuseIdentifier: "cell")
```

- 변경 후
```swift
public protocol IdentifierType {
    static var identifier: String { get }
}

extension IdentifierType {
    public static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: IdentifierType {}
extension UIViewController: IdentifierType {}

collectionView.register(ScheduleCell.self, forCellWithReuseIdentifier: ScheduleCell.identifier)
```

### 3️⃣매직 넘버
기존에는 constant같이 CGFloat가 들어가는 자리에 20, 25등을 직접 적어주며 사용하였습니다. 하지만 이렇게 코드를 작성하게 되면 20, 25같은 매직 넘버가 생겨버린다. 매직 넘버를 해결해주기 위해 파일 내부에 private let 으로 변수를 선언하고 선언한 변수를 넣어주는 식으로 리팩토링을 하였습니다.

- 수정 전
```swift
private func configureUI() {
    contentView.backgroundColor = .white
        
    contentView.addSubview(stackView)
    stackView.addArrangedSubview(titleLabel)
    stackView.addArrangedSubview(contentLabel)
    stackView.addArrangedSubview(expirationLabel)
        
    NSLayoutConstraint.activate([
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
    ])
}
```

- 수정 후
```swift
private let cellPadding: CGFloat = 15

...

private func configureUI() {
    contentView.backgroundColor = .white
        
    contentView.addSubview(stackView)
    stackView.addArrangedSubview(titleLabel)
    stackView.addArrangedSubview(contentLabel)
    stackView.addArrangedSubview(expirationLabel)
        
    NSLayoutConstraint.activate([
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: cellPadding),
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -cellPadding),
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: cellPadding),
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -cellPadding)
    ])
}
```


### 4️⃣MVVM 리팩토링
MVVM에 대한 정확한 이해와 사용을 위해 코드를 리팩토링했습니다.
MVVM의 경우 MVC에서 ViewController의 역할이 비대해짐을 방지하고, 독립적인 테스트가 가능하게 하기 위해 사용됩니다. 하지만 ViewModel이 여러 ViewController에 사용되고, 기능이 많아진다면, ViewModel 또한 MVC의 ViewController처럼 비대해질 가능성이 높습니다. 
이에 내린 결론은 Viewcontroller 하나당 하나의 ViewModel을 가지고 있어야 하며, ViewModel은 자신이 필요한 데이터만 Model에서 가져오는 방식으로 구현했습니다.

- Model
```swift
class ScheduleManager {
    static let shared = ScheduleManager()
    
    @Published var todoSchedules: [Schedule] = []
    @Published var doingSchedules: [Schedule] = []
    @Published var doneSchedules: [Schedule] = []
    
    func addTodoSchedule( schedule: Schedule) {
        todoSchedules.append(schedule)
    }
    
    func sendSchedule(scheduleType: ScheduleType) -> AnyPublisher<[Schedule], Never> {
        switch scheduleType {
        case .todo:
            return $todoSchedules.eraseToAnyPublisher()
        case .doing:
            return $doingSchedules.eraseToAnyPublisher()
        case .done:
            return $doneSchedules.eraseToAnyPublisher()
        }
    }
    
    ...
}
```

- ViewModel
```swift
final class DoListViewModel {
    let scheduleManager = ScheduleManager.shared
    @Published var scheduleList: [Schedule] = []
    private var cancelBag: Set<AnyCancellable> = []
    
    init(scheduleType: ScheduleType) {
        fetchSchedule(scheduleType: scheduleType)
    }
    
    private func fetchSchedule(scheduleType: ScheduleType) {
        scheduleManager.sendSchedule(scheduleType: scheduleType).assign(to: \.scheduleList, on: self).store(in: &cancelBag)
    }
    
    func deleteSchedule(scheduleType: ScheduleType, index: Int) {
        scheduleManager.deleteSchedule(scheduleType: scheduleType, index: index)
    }
    
    func move(fromIndex: Int, from: ScheduleType, to: ScheduleType) {
        scheduleManager.move(fromIndex: fromIndex, from: from, to: to)
    }
}
```


## 참고 링크
- [Swift Tutorial: An Introduction to the MVVM Design Pattern](https://adevait.com/ios/swift-tutorial-mvvm-design-pattern)
- [Swift Document UICollectionViewCompositionalLayout](https://developer.apple.com/documentation/uikit/uicollectionviewcompositionallayout)
- [Swift Document Published](https://developer.apple.com/documentation/combine/published)
- [Swift Document DatePicker](https://developer.apple.com/documentation/swiftui/datepicker)
- [Swift Document Combine](https://developer.apple.com/documentation/combine)

