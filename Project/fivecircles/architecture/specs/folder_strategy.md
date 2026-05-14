# Godot Project Folder Strategy

이 문서는 Nojump 프로젝트의 Godot 폴더 구조 및 자산 관리 전략을 정의합니다.

## 1. 기본 원칙
- **모듈화 (Modularity)**: 특정 기능이나 스테이지에 종속된 자산은 해당 폴더 내에 함께 둡니다.
- **명명 규칙 (Naming)**: 폴더는 `PascalCase`, 파일은 `PascalCase` (Scene/Resource) 또는 `snake_case` (Script)를 권장하나, 기존 프로젝트 컨벤션을 최우선으로 합니다.
- **격리 (Isolation)**: `fivecircles/` 하네스 문서와 `Project/` 코드를 명확히 분리합니다.

## 2. 권장 폴더 구조

```text
Project/
├── scenes/             # 전역/공통 씬 (Main, UI, Global Overlay 등)
├── scripts/            # 전역/공통 스크립트 (Autoloads, Base Classes)
├── entities/           # 독립적인 오브젝트 단위 (Player, JumpButton 등)
│   └── Player/
│       ├── Player.tscn
│       └── Player.gd
├── stages/             # 스테이지별 작업 공간 (브랜치 작업 단위와 일치)
│   ├── Stage1/
│   │   ├── Stage1.tscn
│   │   ├── Stage1.gd
│   │   └── assets/     # Stage1 전용 임시 자산
│   └── Stage2/
├── resources/          # 재사용 가능한 리소스 (.tres, TileSet, PhysicsMaterial)
├── assets/             # 전역 공유 자산
│   ├── textures/
│   ├── audio/
│   └── fonts/
└── fivecircles/        # 하네스 운영체제 (문서 및 지침)
```

## 3. 스테이지 작업 전략
- **1인 1스테이지**: 각 개발자는 `stages/StageN/` 폴더 내에서 모든 작업을 수행합니다.
- **독립성 유지**: 다른 스테이지의 자산을 직접 참조하기보다 `entities/`나 `resources/`에 있는 공통 자산을 사용합니다.
- **씬 상속**: 스테이지 간 공통 로직이 많아질 경우 `BaseStage.tscn`을 만들어 상속받는 구조를 검토합니다.

## 4. 에이전트 가이드
- 새로운 스테이지를 생성할 때 위 구조를 엄격히 준수합니다.
- 파일 이동이나 대규모 리팩토링 시에는 반드시 사용자에게 구조 변경 사유를 보고합니다.
