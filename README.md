# **📚 Tuist Modular Study**

> Tuist Practice & **Modular Template**
> 

## Tuist Modular 의존성 관계

![Group 1707481293](https://github.com/kimkyuchul/Tuist-Modular/assets/25146374/a68c5a8f-9224-433d-8ee4-38152c2394e0)

### App

- 앱이 시작되는 모듈 (SceneDelegate 포함 및 Info.list 등)

### Features

- Presentation 레이어, 사용자의 액션을 처리, 데이터를 보여주는 즉, 사용자와 직접 맞닿는 레이어
- ex) ViewController와 ViewModel이 포함

### CommonFeature

- DesignSystem, BaseComponent를 포함하는 Common Feature
- Asset, Font, Lottie 등도 해당 모듈에 포함

### Domain

- 앱의 비즈니스 로직과 VO(Entity)를 가지는 앱의 핵심 로직 담당
- UseCase는 비지니스 로직을 담당하기 때문에, UseCase에서 여러 비지니스 로직이 알맞은 방향으로 보내주고 응답이 온다면, Features 영역에 이벤트를 전해준다.
- Use case에서 비지니스 로직이란 Entity를 얻어내고 있는 로직이다.
- **Entity**: 서버에서 내려준 모델 (DTO)가 아닌 앱 비즈니스로직 즉, 로직에 필요한 모델
- **RepositoryInterface**: Domain은 Data의 Network를 사용하려 할 때 Interface를 통하여 사용된다. SOLID 원칙의 “D: Dependency Inversion Principle” 의존성 역전 법칙이 적용된다. Network에 사용되는 Interface는 모두 Protocol로 Interface 타겟에 간접적으로 명시되어있고, 그 인터페이스를 Domain 계층에 넣게 되면서, UseCase는 인터페이스를 이용하여 메소드를 불러올 뿐 구체타입은 알지 못한다. 그리고 실체 인스턴스는 init에서 주입시켜 Domain은 Data 존재를 모르는 의존성 역전이 성립된다.

### Data

- 앱의 비즈니스를 포함하지 않고 순수 데이터를 가져오는 모듈(Network, Realm 등)
- ex) DTO, Repository를 가지고 있다. (RepositoryInterface의 구현부)

### Core

- 서드파티 라이브러리들의 종속성 보유
- Logging extension 등 모든 레이어에서 공용으로 재사용될 모듈이 포함

---

## Tuist 활용 기술 및 **TroubleShooting**

- **[Tuist Realm(ObjC 기반 라이브러리) 의존성 주입 시 이슈를 Carthage로 해결했던 방법](https://github.com/kimkyuchul/SIL/issues/58)**
- **[Tuist에서 CocoaPods 사용하기](https://github.com/kimkyuchul/SIL/issues/56)**
- **[Tuist에서 XCconfig 활용하여 개발 환경 분리하기](https://github.com/kimkyuchul/SIL/issues/59)**
- **[Tuist “One of the two will be used. Which one is undefined” 이슈 해결](https://github.com/kimkyuchul/SIL/issues/60)**
- **Tuist ResourceSynthesizers Lottie 및 에셋 관리**
- **Tuist의 Signing 기능 활용 (보안상 Private 레포에서 테스트)**

---

## 개선해야할 점

### Presentaion 모듈이 Data 모듈을 의존해야하고 있는 구조

<img width="498" alt="Screenshot 2024-03-10 at 6 33 35 PM" src="https://github.com/kimkyuchul/Tuist-Modular/assets/25146374/dce56511-c986-4040-988a-9325934da1c9">


```swift
import UIKit

import CommonFeature

import Entity
import UseCase
import RepositoryInterface

import Data
import Core

public final class HomeDIContainer: BaseDIContainer {
    
    public init() {}
    
    public typealias ViewContrller = HomeViewController
    public typealias ViewModel = HomeViewModel
    public typealias Repository = RepositoryInterface
    public typealias UseCase = CoinUseCase
    
    public func makeViewController() -> HomeViewController {
        return HomeViewController(viewModel: makeViewModel())
    }
    
    public func makeViewModel() -> HomeViewModel {
        return HomeViewModel(useCase: makeUseCase())
    }
    
    public func makeUseCase() -> UseCase {
        return CoinUseCaselmlp(RepositoryInterface: makeRepository())
    }
    
    public func makeRepository() -> Repository {
        return CoinRepository()
    }
}
```

- Presentation 모듈의 VC마다 DIContainer를 만드는 구조로 설계하였다. 이렇게 설계 할 경우 Presentaion 모듈에서 Repository를 접근하기 위해선 Data 모듈(Network) 의존성을 추가해야 한다.
- CleanArchitecture 구조 상 Presentation이 Data 모듈을 알고 있을 필요는 없다고 생각하기 때문에 **가장 상위 모듈인 App모듈에서 DI 주입을 하는 구조로 변경이 필요하다.**

### Tuist 3.x → 4.x 마이그레이션

- Tuist가 [4 버전대로 업데이트](https://github.com/tuist/tuist/releases/tag/4.0.0) 되면서 변경사항이 생겼다. 다음과 같은 변경사항 대응이 필요
1. **크게 변경된 사항은 Tuist의 Signing 기능이 제거** 
1. Dependencies.swift → Carthage 지원 제거
1. ProjectDescription init 생성자 제거 → 정적 생성자로 변경
