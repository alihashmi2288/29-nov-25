#!/bin/bash

# Check if a topic is provided
if [ -z "$1" ]; then
  echo "Usage: $0 \"<topic>\""
  exit 1
fi

TOPIC="$1"
SLUGIFIED_TOPIC=$(echo "$TOPIC" | iconv -t ascii//TRANSLIT | sed -r s/[^a-zA-Z0-9]+/-/g | sed -r s/^-+\|-+$//g | tr A-Z a-z)
OUTPUT_FILE="docs/${SLUGIFIED_TOPIC}.md"

# Define the prompt for the Gemini CLI
# PROMPT="You are an expert author. Write a comprehensive book chapter on the topic of '${TOPIC}'. The chapter should be well-structured, informative, and engaging. The output should be in Markdown format, ready to be included in a Docusaurus website."

echo "Generating chapter for topic: ${TOPIC} using Gemini CLI..."
gemini generate-text --model gemini-2.5-flash --prompt "Write a comprehensive book chapter on the topic of '${TOPIC}'. The chapter should be well-structured, informative, and engaging. The output should be in Markdown format, ready to be included in a Docusaurus website." --output-format markdown > "book-project/${OUTPUT_FILE}"


echo "Chapter generated at: book-project/${OUTPUT_FILE}"
