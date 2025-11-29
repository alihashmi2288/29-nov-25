# Implementation Plan: Automate Chapter Generation for Physical AI Course

**Feature Branch**: `002-physical-ai-chapters`
**Created**: 2025-11-29
**Status**: Draft
**Spec**: `specs/002-physical-ai-chapters/spec.md`

## 1. Scope and Dependencies

### In Scope:

- Creating a shell script (`generate-chapter.sh`) to automate the invocation of the Gemini CLI for chapter generation.
- Ensuring the script takes a chapter topic as an argument.
- Saving the AI-generated Markdown content to a specified Docusaurus `docs` subdirectory.
- Basic validation/sanitization of AI output for Markdown compatibility.
- Integration with the existing Docusaurus project structure.

### Out of Scope:

- Advanced content moderation or fact-checking of AI-generated content.
- Complex UI for triggering chapter generation (CLI only).
- Automated scheduling of chapter generation.
- Integration with other AI models or CLIs beyond Gemini.
- Detailed post-processing of Markdown beyond basic sanitization (e.g., image embedding, complex formatting).

### External Dependencies:

- Gemini CLI tool (assumed to be installed and configured on the user's system).
- Docusaurus project structure and build process.
- Standard shell utilities (e.g., `echo`, `sed`, `mkdir`, `iconv`).

## 2. Key Decisions and Rationale

- **Decision: Use a shell script (`generate-chapter.sh`) for automation.**
  - **Rationale:** Simple, widely compatible, and aligns with existing project conventions (`generate-chapter.sh` already exists and was updated in Spec 001). It allows direct invocation of CLI tools.
- **Decision: Store generated chapters in a new subdirectory under `book-project/docs/`, e.g., `book-project/docs/physical-ai-course/`.**
  - **Rationale:** Provides clear organization for the course content, separating it from other Docusaurus documentation. This aligns with FR-003.
- **Decision: Employ a simple slugification for chapter filenames.**
  - **Rationale:** Ensures valid and user-friendly filenames from diverse topic inputs.
- **Decision: Refine the existing `generate-chapter.sh` script to include the full course outline as context for the AI prompt.**
  - **Rationale:** To fulfill FR-004, the AI needs comprehensive context beyond just the chapter topic. This enhances content quality and relevance.

## 3. Interfaces and API Contracts

### CLI Interface (`generate-chapter.sh`):

- **Input:** Single string argument: `"<chapter topic>"` (e.g., `./generate-chapter.sh "Module 1: The Robotic Nervous System (ROS 2)"`).
- **Output:**
  - Success: Markdown file created at `book-project/docs/physical-ai-course/<slugified-topic>.md`.
  - Failure: Error message to `stderr`, exit code 1.

### Gemini CLI (Internal):

- **Invocation:** `gemini generate-text --model gemini-2.5-flash --prompt "..." --output-format markdown`
- **Input:** Prompt string (combining overall course context and specific chapter topic).
- **Output:** Markdown text to `stdout`.

## 4. Non-Functional Requirements (NFRs) and Budgets

- **Performance:** Chapter generation time depends on Gemini API response; script overhead should be minimal (< 5 seconds).
- **Reliability:** The script should handle Gemini CLI failures gracefully (e.g., network issues, API errors).
- **Security:** N/A (CLI tool, no direct user data handling within the script beyond input topic).
- **Cost:** Depends on Gemini API usage, outside the scope of this script's implementation.

## 5. Data Management and Migration

- **Source of Truth:** Gemini API for content generation; Markdown files on disk for chapters.
- **Schema Evolution:** N/A for this script. Markdown format is flexible.
- **Data Retention:** Generated Markdown files are persistent until manually deleted.

## 6. Operational Readiness

- **Observability:** Script will output status messages to `stdout`/`stderr`.
- **Alerting:** N/A (simple script).
- **Runbooks:** Usage instructions provided in the script's header.
- **Deployment and Rollback:** Script is part of the repository; deployed via existing git workflow.

## 7. Risk Analysis and Mitigation

- **Risk:** Gemini CLI returns malformed or non-Markdown content.
  - **Mitigation:** Implement basic validation (e.g., check for common Markdown headers, ensure file is not empty) and warn the user.
- **Risk:** Gemini CLI fails due to rate limits or API errors.
  - **Mitigation:** Script should output the error from the Gemini CLI for user diagnosis.
- **Risk:** AI-generated content is low quality or factually incorrect.
  - **Mitigation:** User review is required (SC-002), script does not automate this.

## 8. Evaluation and Validation

- **Definition of Done:**
  - `generate-chapter.sh` script is updated and functional.
  - Script successfully generates a Markdown chapter from a test topic.
  - Generated chapter integrates into Docusaurus without rendering issues.
- **Output Validation:** Manually inspect generated Markdown for structure and content accuracy.