# 🧭 FiveCircles Harness: Human's Guide
 
본 문서는 프로젝트를 지탱하는 **AI 에이전트 전용 운영체제(Agent OS)인 FiveCircles**를 사람이 쉽게 이해하고 다룰 수 있도록 작성된 가이드입니다. 이 하네스는 단순한 템플릿을 넘어, "프로젝트가 맥락을 잃지 않고 영속적으로 개발될 수 있게 하는 시스템"입니다.
 
---
 
## 1. FiveCircles란 무엇인가?
FiveCircles는 요구사항 정의부터 유지보수까지 전 과정을 문서 기반(Document-Driven)으로 통제하는 **6단계 개발 프레임워크**입니다. 
사람과 AI 에이전트(Antigravity 등)가 함께 일할 때 발생하는 **"컨텍스트 유실"과 "반복되는 실수"를 원천 차단**하는 데 목적이 있습니다.
 
> 💡 **핵심 철학**: "코드를 어떻게 짤 것인가" 보다 **"어떻게 기획 의도와 작업 맥락을 유지하며 프로젝트를 운영할 것인가"**에 집중합니다.
 
---
 
## 2. 하네스 아키텍처 (Full Version)
템플릿은 완벽한 제어를 위해 다음과 같은 구조를 가집니다.
 
```text
fivecircles-template/
├── README.md                # 🚦 전체 시스템의 시작점 및 스킬 가이드
├── agent/                   # 🧠 에이전트 두뇌 및 운영 지침
│   ├── agent-guidelines.md  # [최고 권위] 에이전트 행동 수칙
│   ├── guidelines/          # 프론트/백엔드 스타일 가이드 (Placeholder)
│   ├── skills/              # 에이전트가 발동할 수 있는 7가지 특수 프로토콜
│   └── troubleshooting/     # 해결하기 어려웠던 프레임워크/환경 난제 기록소
├── architecture/            # 🏗 기술 설계 및 할 일(Planning)
│   ├── todolist.md          # 마일스톤 및 Batch 태스크 분해 (기획의 핵심)
│   └── specs/               # 세부 기술 설계서
├── requirements/            # 🎯 요구사항 및 의사결정
│   ├── current.md           # 현재 유효한 요구사항
│   └── decisions.md         # 주요 의사결정 히스토리 (Hard Gate)
├── work/                    # 📝 실행 및 운영
│   ├── update.md            # 직전 세션에서 무엇을 했는지 기록하는 실시간 로그
│   └── workpolicy.md        # 6단계 Exit Checklist 및 필수 준수 규칙
├── test/                    # 🧪 검증 및 지식 환류
│   ├── scripts/             # 강제 검증 자동화 스크립트 모음
│   ├── test-results/        # "증거 없는 Pass 금지"를 위한 증거 보관소
│   └── learn-from-log.md    # 에러와 실패로부터 배운 교훈 (지식 루프)
├── scoring/                 # 🏆 에이전트 품질 평가 (Point/Level 정책)
└── maintenance/             # 🛠 기술 부채 및 사후 백로그 관리
```
 
---
 
## 3. 세션 운영 가이드 (사람을 위한 매뉴얼)
에이전트와 협업할 때, "기획"과 "실행"을 명확히 분리하여 세션을 운영하는 것이 가장 효율적입니다.
 
### 🎯 Main Session (기획 및 관리)
*   **역할**: 전체 숲을 보고 태스크를 배분합니다. 에이전트를 'PM'처럼 활용합니다.
*   **시작 시 읽을 문서**: `work/update.md` (서브 세션 작업 결과 확인) → `architecture/todolist.md` (다음 태스크 기획)
*   **주요 활동**: 요구사항 확정, 스펙 작성, `todolist.md` 업데이트.
 
### 💻 Sub Session (작업 및 실행)
*   **역할**: 배정받은 태스크를 실제 코드로 구현하고 버그를 잡습니다. 에이전트를 'Coder'처럼 활용합니다.
*   **시작 시 읽을 문서**: `architecture/todolist.md` (내 할 일 확인) → `work/update.md` (직전 상황 동기화)
*   **주요 활동**: 코드 작성, 테스트 증거 남기기(`test-results`), 작업 완료 후 `update.md`에 Handoff 로그 남기기.
 
---
 
## 4. 6단계 하드 게이트 (Hard Gates)
각 단계는 다음 단계로 넘어가기 전 반드시 지켜야 할 **종료 조건(Exit Checklist)**이 있습니다. 에이전트가 이를 무시하고 넘어간다면 **"하드 게이트 위반"**으로 제재(감점)해야 합니다.
 
1. **Requirements**: 기획 범위(In/Out)가 명확히 확정되었는가? (`current.md`)
2. **Design**: 태스크가 작은 산출물 단위로 쪼개졌는가? (`todolist.md`)
3. **Implementation**: 변경점이 `update.md`에 기록되었는가?
4. **Test**: 테스트를 통과하고 **결과 증거**를 남겼는가? (`test-results/`)
5. **Integrate**: 코드 포맷팅을 통과하고 커밋 해시를 기록했는가?
6. **Maintenance**: 발생한 기술 부채를 기록했는가?
 
---
 
## 5. 거버넌스 및 지식 루프 (Governance & Knowledge)
 
### ⚖️ 문서 권위 체계 (Document Authority)
작업 중 문서 간 내용이 충돌할 경우, 에이전트와 사람은 아래의 엄격한 권위 순위를 따릅니다.
1. `agent/agent-guidelines.md` (최고 권위: 운영 정책 및 행동 수칙)
2. `agent/collaboration-protocol.md`
3. `requirements/decisions.md` (가장 우선시되는 합의 및 의사결정)
4. `requirements/current.md`
5. `architecture/specs/*`
6. `architecture/todolist.md`
7. `work/update.md` (최저 권위: 단순 실행 결과 증거)
 
### ♻️ 지속 가능한 지식 루프 (Knowledge Loop)
에러와 실수를 프로젝트의 영구적인 자산으로 만드는 시스템입니다.
1. **발생**: 작업 중 심각한 에러, 환경 문제, 혹은 에이전트의 판단 실수 발생.
2. **체포**: `agent/mistakes-arrest.md`에 해당 실수와 원인을 명시적으로 기록 (재발 방지 선언).
3. **학습**: `test/learn-from-log.md` 및 `troubleshooting/`에 런타임 교훈 및 기술적 해법으로 정리.
4. **환류**: 다음 구현 세션 시작 전, 에이전트가 이를 먼저 검토하여 동일한 삽질을 원천 차단.
 
---
 
## 6. 첫 사용 가이드 (초기 이식 및 세팅)
 
현재 완성된 템플릿을 새로운 타겟 프로젝트에 이식할 때의 순서입니다.
 
1. **이식**: 완성된 `fivecircles-template` 폴더 안의 모든 내용물을 타겟 프로젝트의 루트 디렉토리로 복사합니다.
2. **초기화**: 해당 프로젝트 창에서 Antigravity 에이전트에게 `"fivecircles/README.md를 읽고 운영방침을 초기화해"`라고 첫 명령을 내립니다.
3. **룰 세팅**: 팀원(또는 에이전트)과 협의하여 `agent/guidelines/` 내의 스타일 가이드 플레이스홀더를 타겟 환경에 맞게 채웁니다.
4. **사이클 시작**: `architecture/todolist.md`에 첫 번째 마일스톤과 Batch 태스크를 작성하며 위대한 여정을 시작합니다.
 
---
 
## 7. 에이전트의 작업 기어 (Skills)
작업을 더 매끄럽게 지시하기 위해 템플릿에 내장된 마법의 주문(프롬프트)들입니다. 언제든 에이전트에게 아래 명령어를 지시하세요.
 
*   `"개발 흐름 선택해"` : 작업 사이즈(Fast/Standard/Complex)에 따라 에이전트가 처리 방식을 스스로 결정합니다.
*   `"운영방침 초기화"` : 새 세션을 열었을 때, 프로젝트의 맥락을 에이전트 머릿속에 다시 로드합니다.
*   `"울트라 기록해"` : 작업이 끝났을 때, 에이전트가 알아서 로그(`update.md`), 체크리스트, 점수 평가를 마무리합니다.
*   `"리뷰해"` : 설계나 코드가 맘에 들지 않을 때, 비판적인 시각으로 취약점 3가지를 찾게 만듭니다.
*   `"톺아보기"` : 며칠 지나서 지금 프로젝트가 어디쯤 왔는지 헷갈릴 때, 과거 로그를 분석해 다음 행동을 제안하게 합니다.
