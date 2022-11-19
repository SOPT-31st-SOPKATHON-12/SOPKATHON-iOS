# 라이푸 다이어리
> 너. 👈🏻 변 💩 했어 ❓

<br>

### ✨ 서비스 이름과 소개 

| 서비스명   | 서비스 소개
| -------- | :-----: | 
| 라이푸 다이어리 | 나의 변의 상태를 체크하고, 친구에게 배변 활동을 응원받고, 변의 변화를 주간 리포트로 확인하자 |


</br>


### 🚀 iOS-Developers

| 윤수빈 | 이승헌 | 박의서 | 김인영 |
| :-----: | :-----: | :-----: | :-----: |
| <img src="https://user-images.githubusercontent.com/80062632/202861939-02fb8efb-450f-4643-8dcf-0ffcec31356c.png" width="200">|<img src="https://user-images.githubusercontent.com/80062632/202861733-2111f5f9-30f9-48b0-bfcc-3f47b29a124b.png" width="200">|<img src="https://user-images.githubusercontent.com/80062632/202861775-355c5a6d-2f81-4c37-bdda-1cd5d0ac01cc.png" width="200">|<img src="https://user-images.githubusercontent.com/80062632/202861762-87f9c0be-55f3-4337-8e23-e038cbf38985.png" width="200">|

</br>

### 🔫 개발 담당 부분

|  담당 뷰  |  담당자  |   구현 기능 설명   |
| ----------------- | :-----: | ----- |
| Main - RecordPopUpView     | `윤수빈` | 프로젝트 세팅, 마이푸 기록 모달 뷰, 네트워크 세팅 및 연결 |
| MainView                   | `이승헌` | 메인 뷰, 네트워크 연결 |
| FriendsView                | `박의서` | 친구 응원하기 뷰, 네트워크 연결 |
| ReportView                 | `김인영` | 마이푸 리포트 뷰 |

</br>

### 🪧 Library

라이브러리 | 사용 목적 | Version | Management Tool
:---------:|:----------:|:---------: |:---------:
 SnapKit | UI Layout | 5.6.0 | SPM
 Then | UI 선언 | 3.0.0 | SPM
 Moya | 서버 통신 | 15.0.3 | SPM
 
 <br>

## 🎈 Convention
<details>
 <summary> ✨ Git Branch Convention </summary>
 <div markdown="1">       

 ---
 
 - **Branch Naming Rule**
    - Issue 작성 후 생성되는 번호와 Issue의 간략한 설명 등을 조합하여 Branch 이름 결정
    - `<Prefix>/<#IssueNumber>-<Description>`
- **Commit Message Rule**
    - `[Prefix] : <Description>`
   
 <br>

 </div>
 </details>

 <details>
 <summary> ✨ Git Flow </summary>
 <div markdown="1">       

 ---
 
 ```
1. 작업 단위별 Issue 생성 : 담당자, 라벨, 프로젝트 연결 

2. Fork 받은 로컬 레포에서 develop 브랜치 최신화 : git pull (origin develop) 

3. Branch 생성 : git switch -c Prefix/#IssueNumber-description 
   > 예시) chore/#3-Project-Setting

4. 로컬 환경에서 작업 후 Add -> Commit -> Push -> Pull Request의 과정을 거친다.
   
   Prefix의 의미
   > [Feat] : 새로운 기능 구현
   > [Chore] : 코드 수정, 패키지 구조 변경, 파일 이동, 파일이름 변경 등
   > [Add] : 코드 변경 없는 단순 파일 추가, 에셋 및 라이브러리 추가
   > [Fix] : 버그, 오류 해결, 코드 수정
   > [Docs] : README나 WIKI 등의 문서 개정
   > [Refactor] : 전면 수정
   > [Setting] : 프로젝트 세팅


5. Pull Request 작성 
   - closed : #IssueNumber로 이슈 연결, 리뷰어 지정

6. Code Review 완료 후 Pull Request 작성자가 develop Branch로 merge하기
   - Develop Branch protection rules : Merge 전 최소 1 Approve 필요

7. 종료된 Issue와 Pull Request의 Label과 Project를 관리
```
   
 <br>

 </div>
 </details>

<details>
 <summary> ✨ Naming & Code Convention </summary>
 <div markdown="1">       

 ---
 
- 함수, 메서드 : **lowerCamelCase** 사용하고, 동사로 시작한다.
- 변수, 상수 : **lowerCamelCase** 사용한다.
- 클래스, 구조체, enum, extension 등 :  **UpperCamelCase** 사용한다.
- 기본 MVC 폴더링 구조에 따라 파일을 구분하여 사용한다.
- 파일, 메서드, 클래스 명 약어 사용 지양한다.
    - 예시) ViewController → `VC (❌)`
    - 예시) CollectionViewCell → `CVC (❌)`
    - 예시) loginButtonDidTap: UIButton  -> `loginBtnTapped (❌)`
- 이외 기본 명명규칙은 [Swift Style Guide](https://google.github.io/swift/), [API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/) , [Swift Style Guide](https://github.com/StyleShare/swift-style-guide)를 참고한다.
   
   
 <br>

 </div>
 </details>

<details>
 <summary> ✨ Project Foldering </summary>
 <div markdown="1">       

 ---
 ```
MyPooDiary
 ┣ Network
 ┃ ┣ Base
 ┃ ┃ ┣ APIConstants
 ┃ ┃ ┣ Encodable+
 ┃ ┃ ┣ NetworkLoggerPlugin
 ┃ ┣ Router
 ┃ ┣ DTO
 ┣ Global
 ┃ ┣ Extension
 ┃ ┣ Supports
 ┃ ┃ ┣ AppDelegate.swift
 ┃ ┃ ┗ SceneDelegate.swift
 ┃ ┗ Literals
 ┃ ┗ Utils
 ┃ ┗ Resource
 ┃ ┃ ┣ Assets
 ┣ Screens
 ┃ ┣ Main
 ┃ ┃ ┣ Model
 ┃ ┃ ┣ View
 ┃ ┃ ┗ Controller
 ┃ ┣ Friends
 ┃ ┃ ┣ Model
 ┃ ┃ ┣ View
 ┃ ┃ ┗ Controller
 ┃ ┣ Report
 ┃ ┃ ┣ Model
 ┃ ┃ ┣ View
 ┃ ┃ ┗ Controller
 ┗ Info.plist
```

</details>


 <br>

## 🎨 UI Sketch

<details>
<summary>접기/펼치기</summary>

<!-- summary 아래 한칸 공백 두어야함 -->
## 와이프레임

- 화면 전환 플로우
<img width="600" alt="스크린샷 2022-11-20 02 26 37" src="https://user-images.githubusercontent.com/80062632/202863882-0cb826d2-b0cf-4ce7-a57c-ae1852e8391d.png">

- 수빈
<img width="300" alt="스크린샷 2022-11-20 02 11 24" src="https://user-images.githubusercontent.com/80062632/202863481-fe7dac92-3f2b-4173-8766-885598de4057.png">

- 승헌
<img width="200" alt="KakaoTalk_Photo_2022-11-20-02-21-14" src="https://user-images.githubusercontent.com/80062632/202863491-c59add09-dfe0-45dd-a1bc-f25ed5dbe00f.png">

- 의서
<img width="200" alt="KakaoTalk_Photo_2022-11-20-02-09-41" src="https://user-images.githubusercontent.com/80062632/202863509-fcf04789-3d44-4085-aa6b-c046211eed77.png">

- 인영
<img width="200" alt="KakaoTalk_Photo_2022-11-20-02-27-55" src="https://user-images.githubusercontent.com/80062632/202863888-35e05007-518e-4087-b2e7-d614b32e8a5a.png">


</details>



<br>
 
## 🌀 뱅그르르 우리의 사진 ㅋ

<details>
<summary>접기/펼치기</summary>

<!-- summary 아래 한칸 공백 두어야함 -->
## 악 ! 회오리다 !

<img width="600" alt="스크린샷 2022-11-20 02 26 37" src="https://user-images.githubusercontent.com/80062632/202863941-88405f87-5afd-4593-9d6c-c61735396ce2.jpeg">

</details>


<br>
 
## ♨️ 구현 시 가장 어려웠던 방법

<details>
<summary>접기/펼치기</summary>

<!-- summary 아래 한칸 공백 두어야함 -->
## 그들의 스토리..

- 깃 컨플릭트가 어려웠다. <br> 특히 에셋에 관련해서 자꾸 에러가 떠서 해결방법을 몰라 일단 develop에 제대로 되어있는 코드로< br> 클론을 다시 받아서 에셋을 다시 추가하는 방법으로 해결하였다.  <br> 뷰 연결 작업이 늦어져 서버 연결을 제대로 붙이지 못해서 아쉽다.

</details>


<br>

## 🎥 시연 영상

<details>
<summary>접기/펼치기</summary>

<!-- summary 아래 한칸 공백 두어야함 -->
## 홈 뷰

![Simulator Screen Recording - iPhone 13 mini - 2022-11-20 at 08 25 31](https://user-images.githubusercontent.com/80062632/202875491-ab241ad7-9387-4aee-80ee-7a0ea410724f.gif)


</details>
