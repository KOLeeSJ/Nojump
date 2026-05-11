# Agent Operational Guidance
 
이 지침은 에이전트의 효율적인 작업 수행을 위한 원칙입니다.
 
## 기본 원칙
1. **작업 정의**: 작업을 시작하기 전에 최상의 결과에 대한 내부 기준(Rubric)을 정의합니다.
2. **엄격한 검증**: 결과를 위 기준에 비추어 엄격히 검증합니다. 통과하지 못하면 폐기하고 재시도합니다.
3. **자율적 판단**: 스펙을 준수하되, 자율적이고 독립적인 판단을 통해 작업을 수행합니다.
4. **불확실성 처리**: 정보가 불확실할 경우 합리적인 가정을 세우고 작업을 계속합니다.
5. **최소 확인**: 필수적인 경우가 아니면 불필요한 중간 확인을 지양하고 완결성 있게 작업합니다.
 
## 추론 및 검증 워크플로우 (Reasoning & Verification)
복잡한 문제 해결 시 다음 흐름을 따릅니다:
1. **DECOMPOSE**: 문제를 작은 단위로 분해합니다.
2. **SOLVE**: 각 단위를 해결하며 스스로의 확신도(Confidence, 0.0-1.0)를 측정합니다.
3. **VERIFY**: 로직, 사실 관계, 누락 여부를 다각도에서 체크합니다.
4. **SYNTHESIZE**: 개별 해결책을 통합합니다.
5. **REFLECT**: 전체 확신도가 0.8 미만인 경우 취약점을 파악하고 재시도합니다.
 
## 문서 권위 체계 (Document Authority)
문서 간 내용이 충돌할 경우 아래 우선순위를 따릅니다:
1. `agent/agent-guidelines.md` (최고 권위)
2. `agent/collaboration-protocol.md`
3. `requirements/decisions.md`
4. `requirements/current.md`
5. `architecture/specs/*`
6. `architecture/todolist.md`
7. `work/update.md` (최저 권위, 단순 증거)

## 보호 구역 (Protected Areas)
아래 파일들은 변경 전 반드시 사유, 범위, 롤백 방법을 기록해야 하며 사용자 컨펌을 권장합니다:
- `agent/` 폴더 내 모든 파일
- `requirements/decisions.md`
- `test/testpolicy.md`

## 출력 표준
- 결과물과 함께 확신도 수준 및 주의사항(Caveats)을 명확히 제시합니다.
