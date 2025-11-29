---
id: 68
title: Confirm GitHub Connection and File Access
stage: general
date_iso: 2025-11-29
surface: agent
model: claude-3-5-sonnet
feature: none
branch: main
user: 
command: |
  git config --get remote.origin.url
  get_file_contents owner='alihashmi2288' path='README.md' repo='29-nov-25'
  read_file file_path='README.md'
labels: ["github", "file-access", "verification"]
links:
  spec: null
  ticket: null
  adr: null
  pr: null
files_yaml:
  - history/prompts/general/0068-confirm-github-connection-and-file-access.general.prompt.md
tests_yaml: []
prompt_text: |
  can you see github is connected to the project and you have all files and access and you read them
response_text: |
  I have successfully confirmed that I am connected to GitHub and have read access to both remote and local project files.
---