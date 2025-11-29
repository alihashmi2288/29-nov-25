#!/bin/bash

# Check if a topic is provided
if [ -z "$1" ]; then
  echo "Usage: $0 \"<topic>\""
  exit 1
fi

TOPIC="$1"
SLUGIFIED_TOPIC=$(echo "$TOPIC" | iconv -t ascii//TRANSLIT | sed -r s/[^a-zA-Z0-9]+/-/g | sed -r s/^-+\|-+$//g | tr A-Z a-z)
OUTPUT_FILE="docs/physical-ai-course/${SLUGIFIED_TOPIC}.md"

# Define the full course outline as context for the AI
COURSE_OUTLINE="now i want to genearate chapters so the content is this The Course Details Physical AI & Humanoid Robotics Focus and Theme: AI Systems in the Physical World. Embodied Intelligence. Goal: Bridging the gap between the digital brain and the physical body. Students apply their AI knowledge to control Humanoid Robots in simulated and real-world environments. Quarter Overview The future of AI extends beyond digital spaces into the physical world. This capstone quarter introduces Physical AI—AI systems that function in reality and comprehend physical laws. Students learn to design, simulate, and deploy humanoid robots capable of natural human interactions using ROS 2, Gazebo, and NVIDIA Isaac. Module 1: The Robotic Nervous System (ROS 2) Focus: Middleware for robot control. ROS 2 Nodes, Topics, and Services. Bridging Python Agents to ROS controllers using rclpy. Understanding URDF (Unified Robot Description Format) for humanoids. Module 2: The Digital Twin (Gazebo & Unity) Focus: Physics simulation and environment building. Simulating physics, gravity, and collisions in Gazebo. High-fidelity rendering and human-robot interaction in Unity. Simulating sensors: LiDAR, Depth Cameras, and IMUs. Module 3: The AI-Robot Brain (NVIDIA Isaac™) Focus: Advanced perception and training. NVIDIA Isaac Sim: Photorealistic simulation and synthetic data generation. Isaac ROS: Hardware-accelerated VSLAM (Visual SLAM) and navigation. Nav2: Path planning for bipedal humanoid movement. Module 4: Vision-Language-Action (VLA) Focus: The convergence of LLMs and Robotics. Voice-to-Action: Using OpenAI Whisper for voice commands. Cognitive Planning: Using LLMs to translate natural language (\"Clean the room\") into a sequence of ROS 2 actions. Capstone Project: The Autonomous Humanoid. A final project where a simulated robot receives a voice command, plans a path, navigates obstacles, identifies an object using computer vision, and manipulates it. Why Physical AI Matters Humanoid robots are poised to excel in our human-centered world because they share our physical form and can be trained with abundant data from interacting in human environments. This represents a significant transition from AI models confined to digital environments to embodied intelligence that operates in physical space. Learning Outcomes Understand Physical AI principles and embodied intelligence Master ROS 2 (Robot Operating System) for robotic control Simulate robots with Gazebo and Unity Develop with NVIDIA Isaac AI robot platform Design humanoid robots for natural interactions Integrate GPT models for conversational robotics Weekly Breakdown Weeks 1-2: Introduction to Physical AI Foundations of Physical AI and embodied intelligence From digital AI to robots that understand physical laws Overview of humanoid robotics landscape Sensor systems: LIDAR, cameras, IMUs, force/torque sensors Weeks 3-5: ROS 2 Fundamentals ROS 2 architecture and core concepts Nodes, topics, services, and actions Building ROS 2 packages with Python Launch files and parameter management Weeks 6-7: Robot Simulation with Gazebo Gazebo simulation environment setup URDF and SDF robot description formats Physics simulation and sensor simulation Introduction to Unity for robot visualization Weeks 8-10: NVIDIA Isaac Platform NVIDIA Isaac SDK and Isaac Sim AI-powered perception and manipulation Reinforcement learning for robot control Sim-to-real transfer techniques Weeks 11-12: Humanoid Robot Development Humanoid robot kinematics and dynamics Bipedal locomotion and balance control Manipulation and grasping with humanoid hands Natural human-robot interaction design Week 13: Conversational Robotics Integrating GPT models for conv"

echo "Generating chapter for topic: ${TOPIC} using Gemini CLI..."
GENERATED_CONTENT=$(gemini generate-text "Given the following course outline: ${COURSE_OUTLINE}. Write a comprehensive book chapter on the topic of '${TOPIC}'. The chapter should be well-structured, informative, and engaging. The output should be in Markdown format, ready to be included in a Docusaurus website." --model gemini-2.5-flash --output-format text 2>&1)

# Check for Gemini CLI errors
if [ $? -ne 0 ]; then
  echo "Error: Gemini CLI command failed." >&2
  echo "${GENERATED_CONTENT}" >&2 # Output the error message from Gemini CLI
  exit 1
fi

# Basic validation of generated content
if [ -z "${GENERATED_CONTENT}" ]; then
  echo "Warning: Generated content is empty. Skipping file creation." >&2
  exit 1
fi

# Check if content starts with a Markdown header (e.g., #, ##, ###)
if ! echo "${GENERATED_CONTENT}" | head -n 1 | grep -qE '^#+ ';
then
  echo "Warning: Generated content does not appear to start with a Markdown header. Proceeding anyway." >&2
fi

echo "${GENERATED_CONTENT}" > "book-project/${OUTPUT_FILE}"

echo "Chapter generated at: book-project/${OUTPUT_FILE}"