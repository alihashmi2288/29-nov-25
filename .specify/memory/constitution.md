<!--
---
Sync Impact Report
---
- Version change: 1.0.0 → 1.1.0
- Added Principles: None (Principle I modified)
- Modified Principles: I. AI/Spec-Driven Book Creation (Description updated to include Hackathon context and explicitly mention Gemini CLI)
- Removed Principles: None
- Added Sections: None
- Removed Sections: None
- Templates requiring updates:
  - ✅ .specify/templates/plan-template.md (No update needed, but output will change based on new principle description)
  - ✅ .specify/templates/spec-template.md (No update needed)
  - ✅ .specify/templates/tasks-template.md (No update needed)
- Follow-up TODOs: None
-->
# AI/Spec-Driven Book Creation Constitution

## Core Principles

### I. AI/Spec-Driven Book Creation
The primary goal is to write a textbook for the "Physical AI & Humanoid Robotics" course using Docusaurus, deployed to GitHub Pages. The development will leverage Spec-Kit Plus and the Gemini CLI for content creation and overall project management. This textbook will include an integrated RAG chatbot.

## Governance
This Constitution is the single source of truth for project principles. All development activities, including specifications, plans, and implementations, MUST adhere to it. Amendments require a documented proposal, review, and approval, followed by updating this document and propagating changes to all relevant templates.

## Book Structure: "Physical AI & Humanoid Robotics"

This section outlines the official structure of the book.

### Preface
A discussion of all modules and the chapters within them, setting the stage for the reader.

### Module 1: The Robotic Nervous System (ROS 2)
*   **Chapter 1:** Introduction to ROS 2: Core Concepts and Architecture
*   **Chapter 2:** ROS 2 Nodes and Topics: The Communication Backbone
*   **Chapter 3:** ROS 2 Services and Actions: For Request/Response and Long-Running Tasks
*   **Chapter 4:** Working with URDF: Describing a Humanoid Robot's Physical Structure
*   **Chapter 5:** Bridging Python Agents to ROS Controllers with `rclpy`

### Module 2: The Digital Twin (Gazebo & Unity)
*   **Chapter 1:** Introduction to Robotics Simulation: The Role of Digital Twins
*   **Chapter 2:** Building a World in Gazebo: Simulating Physics, Gravity, and Collisions
*   **Chapter 3:** Simulating Sensors: Cameras, LiDAR, and IMUs
*   **Chapter 4:** High-Fidelity Rendering and Human-Robot Interaction in Unity
*   **Chapter 5:** Integrating Gazebo and Unity with ROS 2

### Module 3: The AI-Robot Brain (NVIDIA Isaac™)
*   **Chapter 1:** Introduction to NVIDIA Isaac for Advanced Robotics
*   **Chapter 2:** Isaac Sim: Photorealistic Simulation and Synthetic Data Generation
*   **Chapter 3:** Isaac ROS: Hardware-Accelerated Perception
*   **Chapter 4:** Visual SLAM (VSLAM) and Navigation with Isaac ROS
*   **Chapter 5:** Advanced Path Planning for Humanoids with Nav2

### Module 4: Vision-Language-Action (VLA)
*   **Chapter 1:** The Convergence of Large Language Models and Robotics
*   **Chapter 2:** From Voice to Action: Implementing Voice Commands
*   **Chapter 3:** Cognitive Planning: Using LLMs to Decompose High-Level Commands
*   **Chapter 4:** Integrating Vision-Language-Action Models with ROS 2 for Robotic Control
*   **Chapter 5:** Building an End-to-End VLA Application

**Version**: 1.1.0 | **Ratified**: 2025-11-29 | **Last Amended**: 2025-11-29