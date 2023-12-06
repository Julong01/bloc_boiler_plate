# flutter_bloc_boiler_plate

flutter_bloc_boiler_plate : 구조 및 샘플 코드

---------------

# 💾 Version

> flutter : ^3.16.0

> dart : ^3.2.0

> android build sdk 32.1.0-rc1

> ios-xcode 15.0.1

---------------

# 🕹 Package Manager

> pub.dev

# 📱 UI

> Material

> Cupertino

> etc(Pub.dev plugin)

---------------

# 🗄 Global State Management Library

> flutter_bloc: ^8.1.3

> equatable: ^2.0.5

---------------

# 📲 Asynchronous State Management
> Rest-api serialize

>  > retrofit: ">=4.0.0 <5.0.0"

>  > json_annotation: ^4.8.1

> Network

>  > dio: ^5.3.3

# 📁 Folder Structure

**Android => flutter build apk or abb**

***구글 스토어에 업로드시 신규 앱은 abb 방식을 사용함.***

**Ios => flutter build ios**

***Xcode => Archive => validate => distribution => app store upload or ipa export***

***App store console 에서 테스트 플라이트에 올라가있는 빌드중 심사할 빌드를 제출.***

### lib driectory layout

##### main.dart => app 시작 진입점. App 의 전역 설정이나 활용할 Library 초기화 진행

    src
    ├── api
    ├── bloc
    ├── mics
    ├── model
    ├── router
    ├── styles
    ├── ui
    ├── utils
    └── main.dart

### bloc

##### Page 별 상태 관리 bloc 정의 => 현재는 page 별로 관리하려 이 구조로 작성하였으나,

##### page 에 구성될 상태가 분리가 가능할 경우 분리하여 관리한다.

##### 공통적으로 쓰이는 bloc 은 share 디렉토리를 생성하여 관리.

    ├── bloc
    │   ├── app
    │   │   ├── app_bloc.dart
    │   │   ├── app_bloc_observer.dart
    │   │   ├── app_event.dart
    │   │   └── app_state.dart
    │   ├── home
    │   │   ├── image_horizontal
    │   │   │   ├── image_horizontal_bloc
    │   │   │   ├── image_horizontal_event
    │   │   │   └── image_horizontal_state
    │   │   └── image_vertical ...
    │   │
    │   │
    │   │
    │   ├── splash ...
    │   └── ...
    └── ...

### mics

##### App 에 전역적으로 사용될 상수 값 정의. ex) enum, extensions

    ├── constants.dart
    └── ...

### api

##### http 통신. *.g.dart 는 json_serialize 를 통해 생성한다.

##### app에 사용될 rest-api (back-end)와 3rd-party 용 통신은 분리한다.

    ├── api.dart
    ├── api.g.dart
    └── ...

### model

##### api 통신에 필요한 request, response 모델을 정의한다.

##### local 에서 받아온 데이터를 정제하여 사용할시에 local directory 를 생성하여 데이터 모델을 생성.

    ├── *_models.dart
    ├── *_models.g.dart
    └── ...

### router

    ├── router
    │   ├── *
    │   │   ├── widget
    │   │   └── *_view.dart
    │   └── ...
    └── ...

### Components

    ├── components
    │   ├── common
    │   │   ├── Modal
    │   │   │   ├── DefaultModal.tsx
    │   │   │   └── ...
    │   │   ├── Button
    │   │   │   ├── DefaultButton.tsx
    │   │   │   └── ...
    │   │   ├── Input
    │   │   │   ├── DefaultInput.tsx
    │   │   │   └── ...
    │   │   └── ...
    │   ├── elements
    │   │   ├── HomePage
    │   │   │   ├── HomePageSection.tsx
    │   │   │   ├── HomePage.modulecss
    │   │   │   └── ...
    │   │   ├── SigninPage
    │   │   │   ├── SigninPageSection.tsx
    │   │   │   ├── SigninPage.modulecss
    │   │   │   └── ...
    │   │   └── ...
    │   └── hooks
    │       ├── useInput.tsx
    │       └── ...
    └── ...

# .env base variables

process.env.NEXT_PUBLIC_API_DEV_URL -> dev api 주소
process.env.NEXT_PUBLIC_API_PROD_URL -> prod api 주소