# Vue Docker To-Do

간단한 Dockerized Vue 3 To-Do 앱 예제 프로젝트입니다.  
Vite 기반으로 스캐폴딩 → To-Do CRUD → Docker 멀티스테이지 빌드 → JSON Server Mock API → GitHub Actions CI/CD → Firebase Hosting 배포까지 학습할 수 있습니다.

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
git clone https://github.com/<your-username>/vue-docker-todo.git
cd vue-docker-todo
