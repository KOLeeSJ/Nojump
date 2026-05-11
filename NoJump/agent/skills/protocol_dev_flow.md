---
name: dev-flow
description: Three-tier development workflow selector — Standard, Fast, Complex flows with step-by-step instructions.
origin: local
---
 
# Dev Flow
 
작업 규모에 따라 세 가지 플로우 중 하나를 선택하여 진행합니다.
 
| 신호 | 플로우 |
|------|--------|
| 버그 수정, 소규모 기능 수정 | ⚡ Fast |
| 일반 기능 추가, 대부분의 작업 | 🚀 Standard |
| 아키텍처 변경, 설계 불확실성 높음 | 🧠 Complex |
 
---
 
## 🚀 Standard Flow
1. **Requirements**: `requirements/current.md` 확인 (Exit: DoD 명시, 범위 확정)
2. **Planning**: `architecture/todolist.md` 업데이트 (Exit: 태스크 세분화)
3. **Design**: `architecture/specs/` 작성 (Exit: 테스트 접근법 포함)
4. **Implement**: 코드 구현 및 `work/update.md` 기록 (Exit: 기능 완료)
5. **Review & Test**: 테스트 실행 및 `test/errorlogs/` 기록 (Exit: Unit/Integration 통과)
6. **Integrate**: 커밋/푸시 및 완료 리포트 작성 (Exit: Lint/Build Pass, Hash 기록)

## ⚡ Fast Flow (버그 수정/소규모)
1. **Planning**: 할 일 정리
2. **Implement**: 구현 및 로그 작성
3. **Test**: 결과 확인
4. **Report**: `work/update.md` 요약

## 🧠 Complex Flow (대형 기능/아키텍처)
1. **Analysis**: 코드베이스 분석 및 `learn-from-log.md` 참조
2. **Debate**: `requirements/debates/`에서 논쟁 및 합의
3. **Decision**: `requirements/decisions.md` 고정 (Hard Gate)
4. **Design**: 상세 기술 설계서(`specs/`) 및 태스크 분해
5. **Implement**: 단계별 구현 및 수시 기록
6. **Review & Test**: 강화된 검증 및 에러 로그 분석
7. **Report**: 상세 완료 리포트 및 지식 전파
