# Working Policy
 
이 문서는 프로젝트 수행 시 지켜야 할 기술적 정책과 커밋 규칙을 정의합니다.
 
## Commit & Git Rules
- **메시지 언어**: 한국어 (또는 프로젝트 정책에 따름)
- **메시지 형식**: `[타입] 제목 (#이슈번호)`
    - `feat`: 신규 기능
    - `fix`: 버그 수정
    - `docs`: 문서 수정
    - `refactor`: 코드 리팩토링
    - `chore`: 빌드 설정, 라이브러리 관리 등
- **그룹화**: 관련 있는 변경사항은 하나의 커밋으로 묶되, 너무 큰 커밋은 지양합니다.
 
## Code Quality
- **Self-Review**: 커밋 전 스스로 변경 사항을 검토합니다.
- **Dead Code**: 사용하지 않는 코드나 주석은 즉시 제거합니다.
- **Documentation**: 중요한 로직이나 API 변경은 즉시 관련 문서를 업데이트합니다.
 
## Hard Gates (강력 금지 사항)
- **테스트 미통과 시 Integrate 금지**: 테스트가 실패한 상태에서 커밋하거나 보고하지 않습니다.
- **Integrate 단계 외 Git Push 금지**: 모든 작업이 완료되고 검증된 후에만 푸시합니다.
- **증거 없는 Pass 기록 금지**: 테스트 결과 캡처나 로그 없이 "성공했다"고 기록하지 않습니다.
- **문서 동기화 누락 금지**: 코드 변경 시 관련 `specs/*` 또는 `update.md`가 갱신되지 않으면 작업을 종료할 수 없습니다.

## 6-Stage Exit Checklist
각 단계를 마칠 때 아래 조건을 반드시 만족해야 합니다.

| 단계 | 핵심 산출물 | Exit 조건 (필수) |
| :--- | :--- | :--- |
| **Requirements** | `current.md`, `decisions.md` | 범위(in/out) 명시, 확정 결정 기록 |
| **Design** | `todolist.md`, `specs/*` | 태스크가 작은 산출물 단위로 분해, 테스트 접근법 기재 |
| **Implementation** | 코드 변경, `update.md` | 변경점(what/why) 로그 기록, 최소 1개 기능 완료 |
| **Test** | 테스트 결과, `errorlogs/` | Unit/Integration 테스트 통과, 결과 증거(로그) 확보 |
| **Integrate** | Git commit/push | Lint/Format Pass, Clean Status, 커밋 해시 기록 |
| **Maintenance** | `maintenance/` 업데이트 | 기술 부채 기록, 새 요구사항 환류 |

