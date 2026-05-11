# fivecircles Template
 
이 폴더는 프로젝트에 “개발 5사이클(+Integrate)” 운영체제를 이식하기 위한 템플릿입니다.
 
## 📖 필독 가이드 (Human's Guide)
- **[FIVECIRCLES_HANDBOOK.md](./FIVECIRCLES_HANDBOOK.md)**: 사람이 이 하네스의 원리와 운영 방식을 이해하기 위해 가장 먼저 읽어야 하는 종합 지침서입니다.
 
## 🚦 시작하기 (세션 시작 순서)
 
새로운 세션을 시작할 때, 작업 목적(기획 vs 실행)에 따라 반드시 아래 순서로 문서를 확인하여 컨텍스트를 동기화해야 합니다.
 
### 0. 공통 (에이전트 초기화)
- Antigravity 에이전트에게 `"fivecircles/README.md를 읽고 운영방침을 초기화하라"`고 명령하여 시스템을 로드합니다.
 
### 1. Main Session (기획 및 관리 세션)
- **목적**: 프로젝트 전체 진행 상황을 파악하고 새로운 태스크를 기획/할당합니다.
- **읽기 순서**:
  1. `work/update.md`: 서브 세션에서 진행한 작업 내용, 이슈, Handoff 메시지 확인.
  2. `architecture/todolist.md`: 전체 태스크 진행 상태 점검 및 다음 작업 계획 (Planning).
 
### 2. Sub Session (실행 및 구현 세션)
- **목적**: 할당된 태스크를 실제 코드로 구현하고 이슈를 해결합니다.
- **읽기 순서**:
  1. `architecture/todolist.md`: Main Session에서 할당받은 자신의 목표 태스크 확인.
  2. `work/update.md`: 직전 세션에서 중단된 지점(Handoff) 확인.
  3. **작업 완료 후**: 반드시 `work/update.md`에 진행 내역 및 발생한 이슈를 기록하여 다음 세션(또는 Main Session)으로 Handoff 합니다.
 
## 폴더 구조 및 역할
- **agent/**: 에이전트 운영 지침, 권한, 프로토콜 및 스킬 정의.
- **architecture/**: 기술 설계(Specs) 및 할 일 관리(Todolist).
- **requirements/**: 요구사항 관리, 의사결정 기록 및 논쟁 기록.
- **work/**: 실행 로그(Update), 결정 근거 및 작업 정책.
- **test/**: 테스트 정책 및 결과 기록.
- **scoring/**: 에이전트 성과 평가 및 품질 지표 관리.
- **maintenance/**: 기술 부채 및 사후 유지보수 관리.

## 핵심 프로세스
1. **Requirements**: `requirements/current.md`에서 요구사항 확인.
2. **Design**: `architecture/specs/`에 기술 설계 및 `architecture/todolist.md`에 태스크 분해.
3. **Implementation**: 코드 구현 및 `work/update.md` 기록.
4. **Test**: 테스트 검증.
5. **Integrate**: 커밋/푸시 및 완료 리포트 작성.
6. **Maintenance**: 유지보수 및 백로그 환류.

---

## 에이전트 스킬 (Agent Skills)

| 스킬명 | 파일명 | 발동 명령어 | 설명 |
|--------|--------|-------------|------|
| **개발 흐름 선택** | `protocol_dev_flow.md` | `"개발 흐름 선택해"` | 작업 규모(Fast/Standard/Complex)에 따른 워크플로우 결정. |
| **운영방침 초기화** | `protocol_operation_init.md` | `"운영방침 초기화"` | 컨텍스트 재설정 및 역할 숙지. |
| **울트라 기록** | `protocol_ultra_record.md` | `"울트라 기록해"` | 세션 종료 시 로그 작성, 에러 기록, 동기화 수행. |
| **빠른 디버깅** | `protocol_quick_debug.md` | `"빠른 디버깅해"` | 지침 및 과거 로그 기반 해결책 탐색. |
| **로그/요약** | `protocol_logging_summary.md` | `"로그 요약해"` | 작업 결과 표준화 기록. |
| **테스트 실행** | `protocol_test_execution.md` | `"테스트 실행해"` | 규정된 환경에서 테스트 수행. |
| **동료 리뷰** | `protocol_review.md` | `"리뷰해"` | 설계안 비판적 검토 및 대안 제시. |
| **톺아보기** | `protocol_hindsight.md` | `"톺아보기"` | 로그 분석 후 현재 위치 및 다음 행동 최적화. |
