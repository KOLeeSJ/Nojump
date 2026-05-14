# Collaboration & Handoff Protocol
 
이 문서는 Antigravity 에이전트가 단독으로 또는 세션 간에 협업할 때의 규칙을 정의합니다.
 
## 세션 간 연속성 (Handoff)
Antigravity는 세션이 종료될 때 다음 세션이 즉시 작업을 이어받을 수 있도록 핵심 정보를 기록해야 합니다.
 
### 1. 작업 종료 시 (Reporting)
- `work/update.md`에 `Addendum` 항목을 추가합니다.
- `architecture/todolist.md`의 진행 상태를 업데이트합니다.
- 다음 세션이 수행해야 할 'Next Action'을 명시합니다.
 
### 2. 새 세션 시작 시 (Loading)
- `fivecircles/README.md`를 읽어 운영 방침을 숙지합니다.
- `work/update.md`의 최신 Addendum을 읽고 현재 상태를 파악합니다.
- `architecture/todolist.md`에서 다음 우선순위 작업을 결정합니다.
 
## 작업 단계 (Core Cycle)
 
### [Phase 1] Planning
- 요구사항(`requirements/current.md`)을 확인하고 전략을 수립합니다.
- `architecture/todolist.md`에 작업을 Batch 단위로 분할하여 등록합니다.
 
### [Phase 2] Design
- 기술적 분석이 필요한 경우 `architecture/specs/`에 문서를 작성합니다.
- 구현 전 `plan.md` (임시)를 생성하여 상세 경로를 설계합니다.
 
### [Phase 3] Implementation
- 코드를 수정하거나 생성합니다.
- 작업 중 발생하는 중요한 의사결정은 `requirements/decisions.md`에 기록합니다.
 
### [Phase 4] Verification & Reporting
- 테스트를 수행하고 결과를 확인합니다.
- `work/update.md`에 작업 내용을 요약하여 보고합니다.
 
## 통신 규칙 (Self-Communication)
- 스스로의 추론 과정을 로그로 남기거나, 중요한 메모는 `work/` 디렉토리에 파일로 남겨 컨텍스트 유실을 방지합니다.

## Git 협업 전략 (Git Flow)
비숙련자를 고려하여 단순하고 명확한 브랜칭 전략을 유지합니다.

### 1. 브랜치 구조
- `main`: 출시 가능한 안정 버전 (Hard Gate 통과 후 병합).
- `dev`: 개발 통합 브랜치. 모든 작업의 베이스.
- `feature/stage-{n}`: 특정 스테이지나 기능을 개발하는 개별 브랜치. (예: `feature/stage-1`, `feature/stage-2`)

### 2. 작업 절차
- **작업 시작**: `dev`에서 본인의 스테이지 브랜치를 생성합니다. (1인당 1스테이지 원칙)
- **병합**: 작업 완료 후 `dev`로 Pull Request (또는 직접 병합 후 충돌 해결).
- **동기화**: 작업 전 반드시 `dev`를 pull 하여 최신 상태를 유지합니다.
- **에이전트 역할**: 에이전트는 현재 브랜치 컨텍스트를 인식하고, 커밋 메시지 작성 시 작업 단위를 명확히 기록해야 합니다.

### 3. 커밋 컨벤션 (Commit Convention)
일관된 히스토리 관리를 위해 아래의 머리말(Prefix)을 사용합니다.

- `feat:` 새로운 기능 추가 (예: 새로운 트릭, 스테이지 구현)
- `fix:` 버그 수정
- `docs:` 문서 수정 (하네스 문서, README 등)
- `refactor:` 코드 리팩토링 (기능 변경 없는 구조 개선)
- `chore:` 빌드 업무, 패키지 매니저 설정, 폴더 구조 변경 등
- `test:` 테스트 코드 추가 및 수정

**커밋 메시지 형식**: `Prefix: 요약 내용` (예: `feat: Stage 1 트릭 구현 및 배치`)
