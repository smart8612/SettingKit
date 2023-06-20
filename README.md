# ⚒️ SettingsKit

## ⭐️ Overview

* 앱의 기본 설정 옵션 조작 기능을 사용자의 앱에 손쉽게 구현할 수 있습니다.

* 앱의 기본 설정 옵션 사용자 인터페이스를 손쉽게 구현할 수 있습니다.

## 📰 Related Articles

SettingsKit 개발과정 및 의도는 다음의 블로그 게시물에서 확인하실 수 있습니다.

### 1️⃣ 개발자 아티클

* [SettingsKit 프레임워크 개발](https://singularis7.tistory.com/105)

### 2️⃣ 기술 참조 자료

* [singularis7's Life Note](https://singularis7.tistory.com)
* [[WWDC종합] UICollectionView의 진화](https://singularis7.tistory.com/104)
* [[WWDC2019] Introducing to Combine](https://singularis7.tistory.com/98)

## 🖼️ UML Diagram

### 조감도

| ![SettingPage1](https://github.com/smart8612/SettingsKit/assets/25794814/c8d4b896-70ff-410d-b0e9-89dcb7431c8c) |
| :----------------------------------------------------------: |
| ![SettingPage2](https://github.com/smart8612/SettingsKit/assets/25794814/1a78cfd3-1428-4866-b6d4-831dc2089ddc) |

### Demo

| ![SettingPage3](https://github.com/smart8612/SettingsKit/assets/25794814/aa31baf6-e8c0-4a9a-b7bb-2851904845ca) |
| ------------------------------------------------------------ |

## 🛠️ Used Technology

#### 도구

`#Xcode` `#Swift`

#### 프레임워크

 `#UIKit` `#UserDefaults`

#### 모델링

`#Protocol-Oriented Programming`

#### 비동기 API

`#Combine`

## ⚙️ Installation

### Swift Package Manager

* Apple 플랫폼의 응용프로그램을 개발하는 프로젝트에서는 Xcode UI를 통해 SettingsKit에 대한 의존성을 추가하실 수 있습니다.
* SPM 패키지 프로젝트를 통해 개발 중이어도 `Package.swift` 파일을 수정하여 SettingsKit에 대한 의존성을 추가하실 수 있습니다.

#### Xcode UI를 활용한 의존성 추가법 (권장)

1. Xcode의 메뉴바에서 Project Settings를 선택합니다.
2. Project Settings의 하위 메뉴 중 Swift Packages를 선택합니다.
3. Swift Packages 창에서 SettingsKit를 추가합니다.

#### Package.swift를 활용한 의존성 추가법

1. 다음의 dependency를 Package.swift에 추가합니다.

```swift
.package(url: "https://github.com/smart8612/SettingsKit", branch: "main")
```

2. SettingsKit를 사용하고 싶은 target에 의존성을 추가합니다.

```swift
import PackageDescription

let package = Package(
    name: "YOUR_PACKAGE_NAME",
    platforms: [ .iOS(.v14) ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "YOUR_PACKAGE_NAME",
            targets: ["YOUR_PACKAGE_NAME"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/smart8612/SettingsKit", branch: "main")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "YOUR_PACKAGE_NAME",
            dependencies: ["SettingsKit"]),
    ]
)
```

## 📖 API Documentation

Xcode의 DocC 컴파일러를 활용해 API 도큐멘트를 빌드할 수 있습니다. Build Documentation 기능을 통해 API의 세부 설명을 확인해보세요!

* 단축키: <kbd>control</kbd> + <kbd>shift</kbd> + <kbd>command</kbd> + <kbd>d</kbd>

다음의 GitHub Pages 를 통해서 온라인 도큐멘트를 열람하실 수 있습니다.

* 준비중입니다.

## 🤼 연관 프로젝트

SettingsKit와 연관된 샘플 프로젝트를 다음의 Repository에서 확인하실 수 있습니다.

* 📱 Restaurant Order Application : [OrderApp Toy Project](https://github.com/smart8612/OrderApp-Toy-Project)
