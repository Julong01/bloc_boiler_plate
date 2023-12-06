# flutter_bloc_boiler_plate

flutter_bloc_boiler_plate

# 💾 Version

1. flutter : ^3.16.0
2. dart : ^3.2.0
3. android build sdk 32.1.0-rc1
4. ios-xcode 15.0.1

# 🕹 Package Manager

pub.dev

# 📱 UI

Material && Cupertino && etc(Pub.dev plugin)

# 🗄 Global State Management Library

1. flutter_bloc: ^8.1.3
2. equatable: ^2.0.5

# 📲 Asynchronous State Management
## rest-api serialize
1. retrofit: ">=4.0.0 <5.0.0"
2. json_annotation: ^4.8.1
## network
1. dio: ^5.3.3

# 📁 Folder Structure

**기본적으로 inca 내에서의 배포는 static 빌드로 이루어지므로 빌드할때 next export를 통해 out 디렉토리를 root에 생성함**
**본인 기준 서버에 git으로 빌드파일을 pull 하는데 빌드할때마다 out 디렉토리의 파일들이 전부 교체됨(.git포함)**
**이를 해결하기 위해 build 디렉토리를 생성하여 cp -r out/\* build 명령어로 build 디렉토리에 모두 복사한 후 배포를 진행하는 형식을 채택함**

### src driectory layout

    src
    ├── apis
    ├── components
    ├── contexts
    ├── pages
    ├── styles
    ├── constants
    ├── store
    ├── utils

### Pages

    ├── pages
    │   ├── apis
    │   ├── _app.tsx
    │   ├── _document.
    │   └── ...
    └── ...

### Styles

    ├── styles
    │   ├── index.css
    │   └── ...
    └── ...

### Apis

    ├── apis
    │   ├── _axios
    │   │   ├── instance
    │   ├── example
    │   │   ├── ExampleApi.mutation.ts
    │   │   ├── ExampleApi.query.ts
    │   │   ├── ExampleApi.ts
    │   │   └── ExampleApi.type.ts
    │   └── ...
    └── ...

### constants

    ├── constants
    │   ├── query-keys.ts
    │   ├── recoil-keys.ts
    │   ├── routes.ts
    │   └── ...
    └── ...

### store

    ├── store
    │   ├── example
    │   │   ├── index.ts
    │   │   └── type.ts
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