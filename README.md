# 🗓 프로젝트 매니저

## 📚 목차
- [소개](#-소개)
- [타임라인](#-타임라인)
- [파일구조](#-파일구조)
- [UML](#-UML)
- [실행화면](#-실행화면)
- [트러블 슈팅](#-트러블-슈팅)
- [참고 링크](#참고-링크)

## 🗣 소개
### 프로젝트 소개
#### 프로젝트 기간 : 23.05.15 ~ 23.06.02
- 일정을 생성하고 관리하는 프로그램

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
│   └── Info.plist
└── Source
    ├── Application
    │   ├── AppDelegate.swift
    │   └── SceneDelegate.swift
    ├── Model
    │   ├── ModalType.swift
    │   ├── Schedule.swift
    │   └── ScheduleType.swift
    ├── Protocol
    │   └── IdentifierType.swift
    ├── Utility
    │   ├── DateFormatterManager.swift
    │   └── Namespace.swift
    ├── View
    │   ├── Main
    │   │   ├── DoListViewController.swift
    │   │   ├── MainViewController.swift
    │   │   └── ScheduleCell.swift
    │   ├── ModalViewController.swift
    │   └── TodoHeaderView.swift
    └── ViewModel
        ├── MainViewModel.swift
        └── Observable.swift
```

##  UML
다음에 추가 예정

## 💻 실행화면

| schedule 생성 | Schedule 이동|
| :--------: | :--------: |
| ![](https://hackmd.io/_uploads/HkeoxkASn.gif)| ![](https://hackmd.io/_uploads/SyroeJ0B2.gif)|

| schedule 삭제 | schedule 수정 |
| :---: | :---: |
|![](https://hackmd.io/_uploads/ryLTek0H3.gif)|![](https://hackmd.io/_uploads/HyZB-JCS3.gif)|


## 🔥 트러블 슈팅
추가 예정
## 참고 링크
추가 예정
