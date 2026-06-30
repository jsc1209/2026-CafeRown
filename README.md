<div align="center">

# ☕ ROWN

### 정성을 다한 커피, 그리고 그 뒤의 시스템

고객용 카페 홈페이지 **ROWNCafe** + 사장·직원용 고객관리 **BREW CRM**을 담은 풀스택 카페 플랫폼 모노레포

<br />

[![🌐 Live Showcase](https://img.shields.io/badge/%F0%9F%8C%90_Live_Showcase-View_Demo-C8A97E?style=for-the-badge&labelColor=2A1A0E)](https://jsc1209.github.io/2026-CafeRown/)
&nbsp;
[![GitHub](https://img.shields.io/badge/GitHub-Repository-3B2314?style=for-the-badge&logo=github&logoColor=white&labelColor=2A1A0E)](https://github.com/jsc1209/2026-CafeRown)

</div>

> 🌐 **데모 / 쇼케이스 페이지 → [jsc1209.github.io/2026-CafeRown](https://jsc1209.github.io/2026-CafeRown/)**
> 두 앱의 기능·아키텍처와 **고객용 메인 / 관리자 화면 샘플**을 한곳에서 볼 수 있습니다. *(GitHub Pages — Settings → Pages → Deploy from `main` → `/docs` 활성화 필요)*

---

# 2026-CafeRown — 모노레포 (ROWNCafe + BREW CRM)

기존에 두 개로 분리되어 있던 `2026-CafeRown`과 `2026-CafeRown2` 저장소를
하나의 저장소(모노레포)로 통합한 프로젝트입니다.
각 애플리케이션의 **Git 커밋 히스토리는 그대로 보존**되어 있습니다.

```
2026-CafeRown/            ← 모노레포 루트
├── 2026-CafeRown/        ← ROWNCafe : 고객용 카페 홈페이지 (storefront)
└── 2026-CafeRown2/       ← BREW CRM : 사장/직원용 고객관리 시스템 (back-office)
```

---

## 📦 포함된 애플리케이션

| 디렉터리 | 이름 | 설명 | 베이스 패키지 | 컨텍스트 경로 |
|----------|------|------|----------------|----------------|
| [`2026-CafeRown/`](./2026-CafeRown) | **ROWNCafe (로운카페)** | 회원·게시판·멤버십·주문·포인트·Groq AI 챗봇을 갖춘 고객용 홈페이지 | `org.study.cafe` | `/cafe` |
| [`2026-CafeRown2/`](./2026-CafeRown2) | **BREW CRM** | 고객관리·통계·마케팅·게시판/신고 관리 백오피스 | `org.study.brewcrm` | `/brew-crm` |

두 애플리케이션은 각각 **독립적인 Spring Boot(Maven) 프로젝트**이며, 서로 다른
패키지·빌드 설정·실행 방법을 가집니다. 각 디렉터리의 `README.md`에 상세한
실행 방법이 정리되어 있습니다.

| 항목 | ROWNCafe (`2026-CafeRown/`) | BREW CRM (`2026-CafeRown2/`) |
|------|------------------------------|-------------------------------|
| Java | 21 | 21 |
| Spring Boot | 3.2.0 | 3.2.x |
| View | JSP + JSTL | JSP + JSTL |
| ORM | MyBatis | MyBatis |
| DB | MySQL 8.x | MySQL 8.x |
| 빌드 | Maven (WAR) | Maven (WAR) |
| 배포 | Docker · nginx · docker-compose | `deploy.bat` / `server-setup.sh` |

---

## 🚀 빠른 시작

각 프로젝트는 독립적으로 빌드·실행합니다.

### ROWNCafe (고객용 홈페이지)
```bash
cd 2026-CafeRown
# 자세한 내용은 2026-CafeRown/README.md 참고 (Docker 권장)
docker compose up -d --build
```

### BREW CRM (백오피스)
```bash
cd 2026-CafeRown2
# schema.sql 로 DB 생성 후 application.properties 수정
mvn spring-boot:run   # http://localhost:8080/brew-crm/customer/dashboard
```

---

## 🗂️ 저장소 통합 이력

- 이 저장소는 다음 두 저장소를 통합한 것입니다.
  - `jsc1209/2026-CafeRown`  → `2026-CafeRown/`
  - `jsc1209/2026-CafeRown2` → `2026-CafeRown2/`
- 두 저장소의 커밋 히스토리는 `git subtree merge` 방식으로 모두 보존되어 있습니다.
  `git log` 로 양쪽 프로젝트의 과거 커밋을 그대로 확인할 수 있습니다.
