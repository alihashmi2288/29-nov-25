---
id: 67
title: List Git Branches
stage: general
date_iso: 2025-11-29
surface: agent
model: claude-3-5-sonnet
feature: none
branch: main
user: 
command: git branch -a
labels: ["git", "branches"]
links:
  spec: null
  ticket: null
  adr: null
  pr: null
files_yaml:
  - history/prompts/general/0067-list-git-branches.general.prompt.md
tests_yaml: []
prompt_text: |
  hey can you resume working first see all braches and git
response_text: |
  * main
    master
  remotes/origin/001-ai-spec-driven
  remotes/origin/main
---