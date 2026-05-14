# Work Update

이 파일은 프로젝트의 주요 변경 사항을 세션별로 기록합니다. 권위는 최저(증거 로그).

---

## Addendum (2026-04-30) — fivecircles Harness Template Initialization
### Project Structure
- `fivecircles` 운영체제 이식을 위한 기본 템플릿 폴더 구조 생성 완료.
- `agent/`, `architecture/`, `requirements/`, `work/`, `test/`, `scoring/`, `maintenance/` 핵심 디렉토리 구성.

### Docs
- 각 폴더별 `README.md` 작성 및 운영 방침 초기화 가이드 포함.
- `agent-guidelines.md`, `collaboration-protocol.md`, `mistakes-arrest.md` 템플릿화 완료.

### Next
- 게임 프로젝트 디자인 문서 작성 및 Godot 프로젝트 초기화 필요.

---

## Addendum (2026-05-04) — GDD/ROADMAP 작성 + Godot Foundation
### Docs (architecture/)
- `architecture/GDD.md` v0.1 — 13장 + 부록. 코어 메커니즘(점프 무력화), 트릭 시스템, Act 진행, 비주얼·내러티브, 출시 전략 합의 완료. 결정 보류 항목: 사운드 방향, Act 수, Act 3 컨셉.
- `architecture/ROADMAP.md` v0.1 — Phase 0~9+로 분할, 페이즈별 검증 게이트 정의. Phase 1·6이 게임 성패의 핵심 게이트.

### Implementation (Project/)
- Godot 4.6 프로젝트 초기화 (`Project/project.godot`) — viewport 1280×720, d3d12, default texture filter=0 (픽셀 무필터).
- `Project/.gitignore` — `.godot/`, `/android/` 제외.
- 입력 액션 매핑: `move_left/right/down`, `look_up`, `jump`, `interact` (WASD/방향키/Space/E).
- `Project/scripts/Player.gd` — `CharacterBody2D` + 정적 타입 + 상태 머신 7개(IDLE/WALK/FALL/LOOK_UP/LOOK_DOWN/JUMP_INPUT/DEATH).
  - **점프 키 무력화 약속 코드 구현**: `_register_jump_input()`에서 `jump_attempts++` + `jump_attempted` 시그널만 발생, 임펄스 없음.
  - 좌우 이동 + 중력 + `move_and_slide`.
  - `die()` 정의 (외부 트리거 미연결).
- `Project/scenes/Player.tscn` — `AnimatedSprite2D`(walk_00~05, scale 2배) + `CollisionShape2D`(48×130) + `RayCast2D`(아래 70px) + `Camera2D`.
- `Project/scenes/Stage.tscn` — `StaticBody2D` 1개, 2000×64 갈색 사각형 (placeholder).
- `Project/scenes/Main.tscn` — Stage + Player 인스턴스, Player 위치 (622, 211).
- 캐릭터 스프라이트 자산: `Project/Character/walk_frames/walk_00.png ~ walk_05.png`.

### 알려진 한계
- Player.tscn의 `SpriteFrames`에서 `idle/fall/look_up/look_down/jump_input/death` 6개 애니메이션이 모두 `walk_03` 단일 프레임을 사용. 시각적 분기 없음.
- Stage가 평면 바닥뿐이라 GDD §3.4 첫 트릭("절벽 앞 위쪽 응시")의 발현 무대가 부재.
- 사망 트리거(`die()` 호출)가 아직 어디에서도 호출되지 않음.

### Tests
- 외부 플레이테스트 미실시 → Phase 1 검증 게이트 미충족.

---

## Addendum (2026-05-14) — 2-person Team Transition & Strategy Initialization
### Organization
- **Team**: 2-person side project (10h/week per person, 3-month target).
- **Harness**: `fivecircles` moved into `Project/fivecircles/`.
- **Git**: `dev` branch created from `main`. Branching strategy defined (`main`, `dev`, `feature/stage-n`).
- **Strategy**: Godot folder strategy defined (`architecture/specs/folder_strategy.md`).

### Decisions
- Interest-driven development with heavy AI agent assistance.
- Focus on brainstorming and implementing "Tricks" in maps.
- 1-person-per-stage responsibility.

### Next
- Proceed with Phase 1 validation (In-Engine check).
- Set up stage-specific feature branches.

---

## Addendum (2026-05-11) — Repo 정리 + 하네스 동기화
### Refactor
- 게임 프로젝트 폴더 `nojump/` → `Project/`로 개명 (Godot 프로젝트와 하네스 문서를 명확히 분리).
- `GDD.md`·`ROADMAP.md`를 `Project/`에서 `architecture/`로 이동 (디자인 문서는 코드 외부에서 관리).

### Harness Sync
- `architecture/todolist.md`를 ROADMAP 페이즈 기준으로 재작성, Phase 0 완료 / Phase 1 진행 중 반영.
- `requirements/current.md` Phase 1 활성 요구사항 충전.
- `requirements/decisions.md` 결정 이력 갱신.
- 본 Addendum 추가.

### Deletions
- `agent/guidelines/backend-style-guide.md` — 백엔드 부재(Godot 단일 클라이언트).
- `agent/guidelines/frontend-style-guide.md` — 웹 프론트 부재(GDScript/씬).

---

## Addendum (2026-05-11) — Phase 1 구현 완료 (In-Engine 검증 대기)
### Implementation
- **Stage 레이아웃 재설계** (`Project/scenes/Stage.tscn`)
  - LeftGround: 위치 (300, 600), 700×64 — 상단 y=568, x 범위 -50~650
  - RightGround: 위치 (1030, 600), 500×64 — 상단 y=568, x 범위 780~1280
  - Gap: x 650~780 (130px)
  - DeathZone Area2D: 위치 (640, 760), 2400×80 — y 720~800 전폭 커버
- **사망/재시작** (`Project/scripts/Stage.gd`)
  - `DeathZone.body_entered` → `player.die()` → 0.5s 후 `get_tree().reload_current_scene()`
- **트릭 시스템 인터페이스 스텁** (`Project/scripts/Trick.gd`, Phase 2 모듈화 전 1차 초안)
  - `class_name Trick extends Node2D` + `activate(player, impulse)` + `activated(player)` 시그널
  - 공통 인터페이스: 모든 트릭은 발동 시 `Player.apply_jump_impulse(force)` 호출로 효과 일원화 (GDD §8.2)
- **첫 트릭** (`Project/scripts/LookUpButtonTrick.gd`)
  - GDD §3.4 확정 후보 구현. `LOOK_UP` 상태 ≥ 1.0초 → 버튼 1회 스폰
  - 스폰 위치 (580, -100), 안착 y=556, 임펄스 -600
- **JumpButton** (`Project/scripts/JumpButton.gd`, `Project/scenes/JumpButton.tscn`)
  - Node2D + Polygon2D(40×24 yellow) + Detector Area2D
  - `fall_speed=500` 등속 낙하 → `land_y=556` 안착 → `Detector.body_entered`로 Player 감지 → `stepped_on` 시그널 발행 후 `queue_free`
- **Player 보강** (`Project/scripts/Player.gd`, `Project/scenes/Player.tscn`)
  - `class_name Player` 부여 (외부 트릭이 타입으로 참조)
  - `apply_jump_impulse(force)` — DEATH 상태에선 무시, 그 외 `velocity.y = force`
  - `is_looking_up()` — 트릭 발동 조건 조회용 헬퍼
  - `_modulate_for(state)` — LOOK_UP(노란빛)/JUMP_INPUT(파란빛)/DEATH(붉은빛) placeholder 색조
  - Player.tscn 루트에 `groups=["player"]` 추가 → 트릭이 `get_first_node_in_group("player")`로 탐색
- **Main 시작 위치 조정** (`Project/scenes/Main.tscn`)
  - Player 스폰 (622, 211) → (200, 200) (좌측 바닥 위에서 시작)

### 물리 계산 근거
- gap 130px, SPEED=200, gravity=980, impulse=-600
- 비행시간 t = 2·600/980 ≈ 1.22s
- 수평 이동 = 200·1.22 ≈ 244px
- 버튼 위치 x=580에서 발사 시 x=824 안착 → 우측 바닥(시작 780) 안전 마진 ~44px

### Tests
- **In-Engine 검증 미실시** (`workpolicy.md` Hard Gate: 증거 없는 Pass 금지). Godot 에디터에서 사용자가 Main.tscn 실행 후 다음을 확인 필요:
  1. 절벽 추락 → 자동 재시작
  2. `W` 키 1초 이상 누르고 있기 → 노란 버튼 화면 위에서 낙하 → x=580 지점 안착
  3. 우측으로 걸으며 버튼 진입 → 임펄스로 갭 횡단 → 우측 바닥 안착
  4. 동일 키 입력 시 색조 변화로 상태 식별 가능

### Next
- In-Engine 동작 검증 → 외부 플레이테스트 1~2명 (*설명 없이*) → Phase 1 게이트 판정.
- 게이트 통과 시 Phase 2 진입 (`Trick.tscn`/`TrickData.tres` 모듈화 + 카테고리 트릭 추가).

---

## Addendum (2026-05-11) — Godot TileMap 워크플로우 연습 (본 개발 아님)
> ⚠️ **이 세션은 본 개발이 아닌 *학습/연습 트랙*입니다.** Phase 1 진행 상태와 무관하며, Stage1 관련 산출물은 *언제든 폐기/재작성 가능*한 실험 자산으로 간주.

### Practice Scope
- 목적: Godot 4.6의 TileSet/TileMapLayer 흐름 체득 (자동 분할, 콜리전 부여, 페인팅).
- 본 개발(`Stage.tscn` Phase 1 프로토타입)과 별개 트랙으로 진행.

### Practice Artifacts (실험 자산)
- `Project/scenes/Map.png` + `Project/Resource/Map.png` — 타일 아틀라스 (1408×768, 외부 자산).
- `Project/Resource/MapTileSet.tres` — 32×32 격자 자동 분할 결과 (881 타일, 회색 배경 셀 175칸 자동 제외, 풀셀 콜리전 폴리곤 부여, Physics Layer 0).
- `Project/scenes/Stage1.tscn` — TileMapLayer 페인팅 연습장. 700 셀 painting 완료. Player 시작 (16, 100).

### Practiced Workflow
1. PNG → TileSet 자동 변환 (PowerShell 픽셀 분산 기반 빈 셀 필터링).
2. TileSet에 Physics Layer + 타일별 콜리전 폴리곤 자동 부여.
3. TileMapLayer에 TileSet 연결 → 에디터에서 페인팅.
4. 페인팅된 영역 바운딩 박스 디코드 → 안전한 Player spawn 위치 도출.

### 본 개발과의 격리
- Phase 1 시스템(`Stage.gd` + DeathZone + Trick + 첫 트릭)은 *Stage1에 통합하지 않음*. 본 게임 Stage 디자인은 GDD §3.4 트릭 발현 조건에 맞춰 별도로 설계되어야 함.
- TileMap 사용 여부 자체는 *Phase 4 이후 결정 사항* (ROADMAP — Phase 4 전엔 placeholder 도형 유지가 원칙).

### Next
- 본 개발 트랙으로 복귀 시 → `update.md` 직전 Addendum의 "Next" 항목(Phase 1 In-Engine 검증)부터 이어감.
