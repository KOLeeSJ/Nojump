# Project Reorganization Summary (2026-05-14)

이 문서는 프로젝트의 폴더 구조를 `folder_strategy.md`에 맞춰 대대적으로 개편한 내용을 요약합니다. 팀원께서는 아래 내용을 확인하시고 작업 환경을 동기화해 주시기 바랍니다.

## 1. 핵심 변경 사항 (Before & After)

| 항목 | 이전 위치 | 변경된 위치 |
| :--- | :--- | :--- |
| **Player (플레이어)** | `Character/`, `scripts/Player.gd`, `scenes/Player.tscn` | `entities/Player/` 하위로 통합 |
| **JumpButton (버튼)** | `scripts/JumpButton.gd`, `scenes/JumpButton.tscn` | `entities/JumpButton/` 하위로 통합 |
| **Stage 1 (스테이지)** | `scripts/Stage.gd`, `scenes/Stage.tscn`, `Stage_1.tscn` | `stages/Stage1/` 하위로 통합 |
| **Resources (리소스)** | `MapTileSet.tres`, `Resource/` | `resources/` 폴더로 통합 |
| **Harness (하네스)** | (Root) | `fivecircles/` 폴더로 통합 |

## 2. 작업 가이드
- **내부 경로 업데이트**: 모든 `.tscn`, `.gd`, `.tres` 파일 내의 `res://` 경로를 새로운 구조에 맞춰 자동으로 업데이트했습니다.
- **브랜치 활용**: 현재 `dev` 브랜치에 이 모든 변경 사항이 반영되어 있습니다. 작업 전 반드시 `dev` 브랜치를 최신 상태로 pull 해주세요.
- **씬 실행**: 메인 엔트리 포인트인 `scenes/Main.tscn`은 그대로 유지되나, 내부 참조가 변경되었으므로 에디터에서 실행 시 문제가 없는지 확인이 필요합니다.

## 3. 향후 폴더링 규칙
- 새로운 엔티티(아이템, 적 등)를 만들 때는 `entities/[Name]/` 폴더를 생성하고 씬과 스크립트를 함께 둡니다.
- 새로운 스테이지를 만들 때는 `stages/StageN/` 폴더를 생성합니다.

---
*본 문서는 팀원 공유를 위해 작성되었습니다. 확인 후 추가 의견이 있으시면 말씀해 주세요.*
