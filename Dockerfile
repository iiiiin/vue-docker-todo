# 1단계: 빌드
FROM node:18-alpine AS builder
WORKDIR /app

# 의존성만 먼저 복사해서 설치 (캐싱 효율)
COPY package.json package-lock.json* ./
RUN npm ci

# 소스 복사 및 빌드
COPY . .
RUN npm run build

# 2단계: 서빙
FROM nginx:stable-alpine
# 기본 제공되는 default.conf를 덮어쓰거나, 필요시 직접 작성한 설정 복사
# COPY nginx.conf /etc/nginx/conf.d/default.conf

# dist 폴더를 Nginx html 루트로 복사
COPY --from=builder /app/dist /usr/share/nginx/html

# 컨테이너가 80 포트로 서빙하도록
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
