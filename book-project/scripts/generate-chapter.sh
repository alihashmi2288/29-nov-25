#!/bin/bash

if ! command -v gemini &> /dev/null
then
    echo "Error: gemini command not found. Please install the Gemini CLI." >&2
    exit 1
fi

# Check if a topic is provided
if [ -z "$1" ]; then
  echo "Usage: $0 \"<topic>\""
  exit 1
fi

TOPIC="$1"
SLUGIFIED_TOPIC=$(echo "$TOPIC" | iconv -t ascii//TRANSLIT | sed -r s/[^a-zA-Z0-9]+/-/g | sed -r s/^-+\|-+$//g | tr A-Z a-z)
OUTPUT_FILE="docs/physical-ai-course/${SLUGIFIED_TOPIC}.md"

# Define the full course outline as context for the AI
COURSE_OUTLINE="
# The Course Details: Physical AI & Humanoid Robotics

## Focus and Theme
AI Systems in the Physical World. Embodied Intelligence.

## Goal
Bridging the gap between the digital brain and the physical body. Students apply their AI knowledge to control Humanoid Robots in simulated and real-world environments.

## Quarter Overview
The future of AI extends beyond digital spaces into the physical world. This capstone quarter introduces Physical AI—AI systems that function in reality and comprehend physical laws. Students learn to design, simulate, and deploy humanoid robots capable of natural human interactions using ROS 2, Gazebo, and NVIDIA Isaac.

## Modules
### Module 1: The Robotic Nervous System (ROS 2)
- **Focus**: Middleware for robot control.
- ROS 2 Nodes, Topics, and Services.
- Bridging Python Agents to ROS controllers using rclpy.
- Understanding URDF (Unified Robot Description Format) for humanoids.

### Module 2: The Digital Twin (Gazebo & Unity)
- **Focus**: Physics simulation and environment building.
- Simulating physics, gravity, and collisions in Gazebo.
- High-fidelity rendering and human-robot interaction in Unity.
- Simulating sensors: LiDAR, Depth Cameras, and IMUs.

### Module 3: The AI-Robot Brain (NVIDIA Isaac™)
- **Focus**: Advanced perception and training.
- NVIDIA Isaac Sim: Photorealistic simulation and synthetic data generation.
- Isaac ROS: Hardware-accelerated VSLAM (Visual SLAM) and navigation.
- Nav2: Path planning for bipedal humanoid movement.

### Module 4: Vision-Language-Action (VLA)
- **Focus**: The convergence of LLMs and Robotics.
- Voice-to-Action: Using OpenAI Whisper for voice commands.
- Cognitive Planning: Using LLMs to translate natural language ("Clean the room") into a sequence of ROS 2 actions.

## Capstone Project: The Autonomous Humanoid
A final project where a simulated robot receives a voice command, plans a path, navigates obstacles, identifies an object using computer vision, and manipulates it.

## Why Physical AI Matters
Humanoid robots are becoming increasingly prevalent in various sectors. This course equips students with the skills to build and command these robots, preparing them for a future where AI and robotics are intertwined.
"

echo "Generating chapter for topic: ${TOPIC} using Gemini CLI..."
GENERATED_CONTENT=$(gemini generate-text "You are an expert in Physical AI and Humanoid Robotics.
Your task is to write a comprehensive, engaging, and well-structured book chapter on the topic of '${TOPIC}'.

**Course Context:**
${COURSE_OUTLINE}

**Instructions:**
1.  **Title**: The chapter should start with a main title (H1) that is descriptive and engaging.
2.  **Introduction**: Provide a brief introduction to the topic.
3.  **Core Concepts**: Explain the core concepts in a clear and concise manner.
4.  **Examples**: Use real-world examples to illustrate the concepts.
5.  **Code Snippets**: Where applicable, include code snippets (in bash, python, or C++) to demonstrate the concepts.
6.  **Conclusion**: Summarize the key takeaways from the chapter.
7.  **Format**: The output must be in Markdown format, ready for a Docusaurus website.

**Chapter Content:**
" --model gemini-2.5-flash --output-format text 2>&1)

# Check for Gemini CLI errors
if [ $? -ne 0 ]; then
  echo "Error: Gemini CLI command failed." >&2
  echo "${GENERATED_CONTENT}" >&2 # Output the error message from Gemini CLI
  exit 1
fi

# Basic validation of generated content
if [ -z "${GENERATED_CONTENT}" ]; then
  echo "Error: Generated content is empty. Halting." >&2
  exit 1
fi

# Check if content starts with a Markdown H1 header
if ! echo "${GENERATED_CONTENT}" | head -n 1 | grep -qE '^# ';
then
  echo "Warning: Generated content does not appear to start with a Markdown H1 header. Proceeding anyway." >&2
fi

echo "# ${TOPIC}" > "book-project/${OUTPUT_FILE}"
echo "" >> "book-project/${OUTPUT_FILE}"
echo "${GENERATED_CONTENT}" >> "book-project/${OUTPUT_FILE}"

if [ -f "book-project/${OUTPUT_FILE}" ]; then
    echo "Chapter generated successfully at: book-project/${OUTPUT_FILE}"
else
    echo "Error: Chapter file could not be created." >&2
    exit 1
fi

