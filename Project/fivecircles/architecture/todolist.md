# Project Todolist

이 파일은 `architecture/ROADMAP.md` 페이즈를 기준으로 진행 상태를 관리합니다.
판단 기준: 각 페이즈의 **검증 게이트(Verification Gate)** 통과 여부.

상태 표기: `[x]` 완료 / `[/]` 진행 / `[ ]` 대기

---

## Phase 0 — Foundation
- [x] Godot 4.6 프로젝트 초기화 (`Project/project.godot`)
- [x] 폴더 구조 (`scenes/`, `scripts/`, `assets/`, `Character/`)
- [x] `.gitignore`, `.gitattributes`, `.editorconfig`
- [x] 입력 액션 매핑 (`move_left/right/down`, `look_up`, `jump`, `interact`)
- [x] GDScript 정적 타입 컨벤션 적용 (`entities/Player/Player.gd`)
- [x] 빈 씬 빌드·실행 확인 (개발 OS)

→ ✅ **Phase 0 검증 게이트 통과**

---

## Phase 1 — Core Loop Prototype  ★ 첫 핵심 게이트
### 구현
- [x] 캐릭터 컨트롤러: 좌우 이동 + 중력 + 낙하 (`entities/Player/Player.gd`)
- [x] 점프 키 입력 수신 + *결과 없음* 처리 (`_register_jump_input`)
- [x] 상태 머신 7개 (IDLE/WALK/FALL/LOOK_UP/LOOK_DOWN/JUMP_INPUT/DEATH)
- [x] `jump_attempted` 시그널
- [x] `die()` 함수 정의
- [x] 사망 → 즉시 재시작 루프 (`stages/Stage1/Stage.gd` `DeathZone` Area2D + `reload_current_scene`)
- [x] 테스트용 단일 스테이지 — 좌측 바닥 + 130px 갭 + 우측 바닥 + DeathZone (`stages/Stage1/Stage.tscn`)
- [x] **첫 트릭 구현** — "절벽 앞 위쪽 응시 → 버튼 낙하 → 밟으면 점프 효과" (GDD §3.4)
    - [x] `LOOK_UP` 상태 지속 시간 측정 (≥ 1.0s) (`stages/Stage1/LookUpButtonTrick.gd`)
    - [x] 화면 상단(580, -100)에서 `JumpButton` 낙하, 지면(556) 안착
    - [x] 버튼 밟으면 `apply_jump_impulse(-600)`
- [x] 트릭 인터페이스 1차 초안 — `Trick.activate(player, impulse)` (`scripts/Trick.gd`)

### 시각 보강 (Phase 4 전이지만 검증에 필요)
- [x] `LOOK_UP` / `JUMP_INPUT` / `DEATH` 색조 분기 — `modulate` 활용 placeholder (`Player.gd:_modulate_for`)

### 검증 게이트 (외부 테스트) — Godot 에디터에서 실행 후 진행
- [ ] 본인 In-Engine 동작 확인: 절벽 추락 → 자동 재시작, look_up 1초 → 버튼 낙하, 버튼 밟기 → 갭 횡단 성공
- [ ] 본인 외 1~2명에게 *설명 없이* 플레이
- [ ] 5~15분 내 "아하" 모먼트 발생 여부
- [ ] 좌절 → 우연 → 아하 (GDD §2.3) 반응 매칭

---

## Phase 2 — Trick System Architecture
- [ ] `Trick.tscn` + `Trick.gd` + `TrickData.tres` 골격
- [ ] Phase 1 트릭을 모듈로 추출
- [ ] 다른 카테고리 트릭 2~3개 추가 (입력/환경/시간)
- [ ] `StageData.tres` 메타데이터 구조
- [ ] 검증: 새 트릭 추가 ≤ 30분

## Phase 3 — Stage System & Progression
- [ ] 스테이지 로딩·전환
- [ ] 자동 저장 시스템
- [ ] 미니멀 메인 메뉴
- [ ] 더미 스테이지 3~4개 연속 진행 검증

## Phase 4 — Visual Identity
- [ ] 픽셀 해상도·팔레트 확정
- [ ] 캐릭터 스프라이트 풀세트 (점프 시도·사망 등 분기)
- [ ] 배경·타일 1차
- [ ] 외부 30초 노출 시 "트롤 플랫포머" 응답 확인

## Phase 5 — Act 1 Content
- [ ] 스테이지 3~5개 (각 고유 트릭)
- [ ] 동적 힌팅 시스템 (Act 1 한정 실험)
- [ ] 외부 테스터 3명+ / 평균 클리어 30~60분 / 포기율 < 50%

## Phase 6 — Act Transition Prototype  ★ 두 번째 핵심 게이트
- [ ] Act 1 → 2 변형 연출 (픽셀 그리드/UI/팔레트 중 1~2개)
- [ ] Act 2 진입 트릭 1~2개 (메타 첫 등장)
- [ ] 클리프행어 결말
- [ ] 외부 반응: "방금 뭔가 일어났는데..." & 진행 의지

## Phase 7 — Demo Polish & Release
- [ ] UX 옵션 (키 리매핑·플래시 강도·자막)
- [ ] 사운드 1차 결정
- [ ] 한·영 텍스트 로컬라이즈
- [ ] itch.io 페이지 + 빌드 패키징
- [ ] KPI 측정 도구

## Phase 8 — Demo Validation & Decision Gate  ★ Go/No-Go
- [ ] KPI 임계값 *사전* 결정 (출시 전!)
- [ ] 다운로드·클리어율·스트리머 픽업·정성 반응 분석
- [ ] 풀버전 진행 여부 결정

## Phase 9+ — Full Version
- [ ] Act 2 확장 / Act 3 (선택) / 접근성 / Steam 출시

---

## Next Action
**Phase 1 검증 게이트** — Godot 에디터에서 실행 후:
1. 본인 동작 확인 (절벽/사망/리스폰/트릭/갭 횡단)
2. 외부 플레이테스트 1~2명 (*설명 없이*) → "아하" 모먼트 관측
3. 게이트 통과 시 → Phase 2 (트릭 모듈화: `Trick.tscn`/`Trick.gd`/`TrickData.tres` 골격 + 2~3개 카테고리 트릭 추가)
4. 게이트 실패 시 → 트릭 디자인·환경 힌팅 수정 (*아키텍처 확장 금지*)
