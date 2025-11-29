# Tasks: Automate Chapter Generation for Physical AI Course

**Input**: Design documents from `specs/002-physical-ai-chapters/`
**Prerequisites**: `plan.md` (required), `spec.md` (required for user stories)

**Organization**: Tasks are grouped by user story to enable independent implementation and testing.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel
- **[Story]**: Which user story this task belongs to (e.g., US1)

---

## Phase 1: Script Enhancement and Integration (US1)

**Goal**: Enhance the chapter generation script to use Gemini CLI and integrate with Docusaurus.

### Implementation for User Story 1

- [ ] T001 [US1] Create Docusaurus docs subdirectory for Physical AI course:
    - **Description:** Create `book-project/docs/physical-ai-course/` to store generated chapters.
    - **Acceptance Criteria:** Directory `book-project/docs/physical-ai-course/` exists.
- [ ] T002 [US1] Refine `generate-chapter.sh` to include full course outline in prompt:
    - **Description:** Embed the entire "Physical AI & Humanoid Robotics" course outline (from `spec.md`) as part of the Gemini CLI prompt, alongside the dynamic chapter topic.
    - **Acceptance Criteria:** The `gemini generate-text` command in `generate-chapter.sh` includes the full course outline as context.
- [ ] T003 [US1] Implement basic Markdown output validation in `generate-chapter.sh`:
    - **Description:** After receiving output from Gemini CLI, perform a basic check (e.g., ensure it's not empty, starts with a markdown header) before saving to file. Warn user if validation fails.
    - **Acceptance Criteria:** `generate-chapter.sh` checks for empty output and a markdown header, printing a warning if not met.
- [ ] T004 [US1] Implement error handling for Gemini CLI failures in `generate-chapter.sh`:
    - **Description:** Capture `stderr` and exit code from the Gemini CLI call, outputting any errors to the user.
    - **Acceptance Criteria:** Script prints Gemini CLI errors and exits with a non-zero code on failure.
- [ ] T005 [US1] Update Docusaurus sidebar configuration for new chapter directory:
    - **Description:** Modify `book-project/sidebars.ts` to include the `physical-ai-course` directory so generated chapters appear in the Docusaurus navigation.
    - **Acceptance Criteria:** New `physical-ai-course` entry is added to `sidebars.ts`.

## Phase 2: Testing and Validation

**Goal**: Verify the functionality and output of the chapter generation script.

### Implementation for User Story 1

- [ ] T006 [US1] Generate a test chapter using the updated script:
    - **Description:** Run `./book-project/scripts/generate-chapter.sh "Module 1: The Robotic Nervous System (ROS 2)"` to generate a sample chapter.
    - **Acceptance Criteria:** `book-project/docs/physical-ai-course/module-1-the-robotics-nervous-system-ros-2.md` is created with AI-generated content.
- [ ] T007 [US1] Verify Docusaurus site rendering of the generated chapter:
    - **Description:** Run `npm start` in `book-project` and navigate to the generated chapter's URL to confirm it renders correctly in Docusaurus.
    - **Acceptance Criteria:** The generated chapter is visible and correctly formatted in the local Docusaurus site.
- [ ] T008 [US1] Manually review generated chapter content:
    - **Description:** Human reviewer checks the generated content for relevance, comprehensiveness, and factual accuracy against the course outline. (User Action)
    - **Acceptance Criteria:** Human reviewer confirms content quality.