# Tasks: AI/Spec-Driven Book Creation

**Input**: Design documents from `specs/001-ai-spec-driven/`
**Prerequisites**: `plan.md` (required), `spec.md` (required for user stories)

**Organization**: Tasks are grouped by user story to enable independent implementation and testing.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel
- **[Story]**: Which user story this task belongs to (e.g., US1, US2, US3)

---

## Phase 1: User Story 1 - Initialize Docusaurus Site (Priority: P1) 🎯 MVP

**Goal**: Create a foundational Docusaurus website.

**Independent Test**: The default Docusaurus site is viewable at `http://localhost:3000`.

### Implementation for User Story 1

- [x] T001 [US1] Execute `npx create-docusaurus@latest book-project classic` to scaffold the site.
- [x] T002 [US1] Change directory into `book-project`.
- [x] T003 [US1] Run `npm install` to install dependencies.
- [x] T004 [US1] Run `npm run start` and verify the default site loads locally.
- [x] T005 [US1] Update `docusaurus.config.js` with the correct project title, URLs, and repository information.

**Checkpoint**: A basic, runnable Docusaurus site exists.

---

## Phase 2: User Story 2 - Generate Book Content with AI (Priority: P2)

**Goal**: Enable AI-powered content generation via the Gemini CLI.

**Independent Test**: A new chapter Markdown file is created in the `/docs` directory after running a script.

### Implementation for User Story 2

- [x] T006 [P] [US2] Research and define a standardized prompt for the Gemini CLI to generate a book chapter from a topic.
- [x] T007 [P] [US2] Create a new script `scripts/generate-chapter.sh` that accepts a topic string as an argument.
- [x] T008 [US2] Implement the `generate-chapter.sh` script to:
    - a. Take the topic and format it into the standardized prompt.
    - b. Execute the Gemini CLI with the prompt.
    - c. Sanitize the AI output to ensure it is valid Markdown.
    - d. Save the output to a new file, like `docs/$(slugify $topic).md`.
- [x] T009 [US2] Test the script by running `./scripts/generate-chapter.sh "My First Chapter"` and verify the file is created and the content is reasonable.

**Checkpoint**: The core AI content generation mechanism is functional.

---

## Phase 3: User Story 3 - Deploy to GitHub Pages (Priority: P3)

**Goal**: Automate the deployment of the book to a public URL.

**Independent Test**: A push to the `main` branch triggers a successful GitHub Action deployment.

### Implementation for User Story 3

- [x] T010 [P] [US3] Create the directory structure `.github/workflows/`.
- [x] T011 [US3] Create a new workflow file at `.github/workflows/deploy.yml`.
- [x] T012 [US3] Configure `deploy.yml` using the official Docusaurus GitHub Pages deployment documentation/action. The workflow should:
    - a. Check out the code.
    - b. Set up Node.js.
    - c. Install dependencies (`npm install`).
    - d. Build the Docusaurus site (`npm run build`).
    - e. Deploy the contents of the `build` directory to the `gh-pages` branch.
- [x] T013 [US3] Configure the repository settings to enable GitHub Pages and point it to the `gh-pages` branch. (User action required)
- [x] T014 [US3] Push a change to the `main` branch and monitor the Actions tab to confirm a successful deployment. (User action required)
- [x] T015 [US3] Access the public `github.io` URL to verify the site is live. (User action required)

**Checkpoint**: The book is publicly accessible and updates automatically.
