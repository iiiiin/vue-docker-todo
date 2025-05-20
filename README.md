# Vue Docker To-Do

간단한 Dockerized Vue 3 To-Do 앱 예제 프로젝트입니다.  
Vite 기반 스캐폴딩 → To-Do CRUD → Docker 멀티스테이지 빌드 → JSON Server Mock API → GitHub Actions CI/CD → Firebase Hosting 배포

## 🚀 Features
- Vue 3 + Vite 프로젝트 스캐폴딩
- To-Do 아이템 추가/완료 토글/삭제 기능
- JSON Server를 이용한 Mock API 연동
- Docker 멀티스테이지 빌드 (Node → Nginx)
- 로컬 개발: Vite dev server (HMR) + JSON Server
- GitHub Actions CI/CD
  - Docker 이미지 빌드 & GHCR(push)
  - Firebase CLI 설치 & Firebase Hosting 배포
- Firebase Hosting을 이용한 정적 SPA 호스팅

## 📋 Prerequisites
- Node.js (v18+), npm
- Docker
- Firebase CLI (`npm install -g firebase-tools`)
- Git

## ⚙️ Getting Started

### 1. Clone repository
```bash
git clone https://github.com/iiiiin/vue-docker-todo.git
cd vue-docker-todo
```

### 2. Install dependencies
```
npm install
```

## 🔧 Development
### Run Mock API (JSON Server)
```
npm run mock:server
```
* Mock server: `http://localhost:3000/todos`

### Run Dev Server (Vite)
```
npm run dev
```
* Dev server: http://localhost:5173
* Proxy /api → http://localhost:3000

## 📝 Features Demonstration
* 할 일 추가, 완료 체크/해제, 삭제
* Mock API 호출(GET/POST/PATCH/DELETE /api/todos)

## 🐳 Docker
### Build image

```
docker build -t vue-todo:latest .
```

### Run container
```docker run -d --name vue-todo -p 8080:80 vue-todo:latest```

* 접속: `http://localhost:8080`

## ⚙️ CI/CD (GitHub Actions)
워크플로우: `.github/workflows/docker-image.yml`

1. Checkout repository
2. Docker 이미지 빌드 & GHCR 푸시
3. Firebase CLI 설치
4. Firebase Hosting 배포

### 🌐 Firebase Hosting

### 초기 설정

```bash
firebase login
firebase init hosting
```

Public directory: dist

Single-page app: Yes

GitHub 연동: No

생성된 파일:

firebase.json

.firebaserc

### 로컬 배포
```bash
firebase deploy --only hosting
URL: https://<your-firebase-project-id>.web.app
```

### CI 배포
GitHub Secrets: FIREBASE_TOKEN 등록

Push to main → Actions에서 자동 배포

## 🔑 Environment Variables
VITE_API_BASE (프로덕션 백엔드 URL)

.env.production 또는 GitHub Actions env로 주입

## 📈 Next Steps
Django DRF 백엔드 Docker 이미지 생성 & GCP/GHCR에 푸시

Cloud Run (또는 ECS)에서 DRF 서비스 배포

Firebase Hosting rewrites 또는 환경변수로 /api 연결

최종 프로덕션 도메인 & SSL 설정

---

Contributions welcome!  
학습 중 궁금한 점이나 개선 아이디어가 있다면 이슈/PR 부탁드립니다.