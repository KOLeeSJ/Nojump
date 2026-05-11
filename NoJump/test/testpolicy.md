# Test Policy
 
이 문서는 프로젝트의 테스트 실행 표준을 정의합니다.
 
## 테스트 도구 및 명령어
- **Frontend**: `npm run test` (또는 프로젝트에 맞는 명령어)
- **Backend**: `./gradlew test` (또는 프로젝트에 맞는 명령어)
- **E2E/UI**: `npx playwright test`
 
## 검증 기준
- **Unit Test**: 핵심 비즈니스 로직에 대한 테스트 코드 필수.
- **Build**: 커밋 전 전체 빌드 성공 여부 확인 필수.
- **Coverage**: (선택 사항) 목표 커버리지 설정 및 확인.
 
## 에러 기록 절차
1. 테스트 실패 시 `test/errorlogs/YYYY-MM-DD-error.md`를 생성하여 로그를 기록합니다.
2. 해결된 문제는 `agent/mistakes-arrest.md`의 인시던트 로그로 옮겨 영구 보관합니다.
