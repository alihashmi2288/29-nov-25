# Introduction to ROS 2: Core Concepts and Architecture

This chapter provides a foundational understanding of the Robot Operating System (ROS 2), its core concepts, and its architecture.

## 1. ROS 2 Nodes

A ROS 2 node is an executable process that performs a specific, modular task within a larger robotic system. Each node should have a single purpose, such as controlling a motor, reading sensor data, or planning a path.

This modular approach allows for complex systems to be broken down into smaller, more manageable parts. It also enables different nodes to be written in different programming languages (e.g., Python, C++) while still being able to communicate with each other.

A monolithic approach where a single program handles all tasks is not scalable, difficult to debug, and does not align with the ROS 2 design philosophy.

## 2. ROS 2 Topics, Publishers, and Subscribers

Topics are named buses for one-way communication. A publisher sends messages to a topic, and a subscriber receives messages from a topic. This is a many-to-many communication pattern.

The publish-subscribe model is ideal for continuous data streams, such as sensor data or robot state information. It decouples the data producer from the data consumer, allowing for flexible and scalable system architectures.

Using services for continuous data streams was rejected because services are designed for synchronous, request/response interactions and are not suitable for high-frequency data.

## 3. ROS 2 Services and Clients

Services are used for synchronous, request/response communication. A client sends a request to a service, and the service processes the request and sends back a response.

Services are suitable for tasks that require a direct answer or a confirmation that an action has been performed. They are not designed for long-running tasks or continuous data streams.

Using topics for request/response communication is possible but would require implementing a more complex logic to correlate requests and responses. Services provide a more straightforward and standardized way to handle this type of interaction.

## 4. ROS 2 Actions and Action Clients

Actions are used for long-running tasks that require feedback. An action client sends a goal to an action server, and the server can provide continuous feedback on the progress of the task and a final result.

Actions are ideal for tasks like navigation, manipulation, or any other task that takes a significant amount of time to complete. The feedback mechanism allows the client to monitor the progress of the task and cancel it if necessary.

Using services for long-running tasks was rejected because services are blocking and do not provide feedback. Using topics for this purpose would require implementing a complex state machine to manage the task.

## 5. The Role of DDS in ROS 2

DDS (Data Distribution Service) is the underlying middleware that provides the communication capabilities for ROS 2. It is responsible for message discovery, serialization, and transport.

DDS is an industry standard for real-time, scalable, and reliable data communication. It provides features like Quality of Service (QoS) policies that allow developers to fine-tune the communication behavior to meet the specific requirements of their application.

ROS 1 used a custom TCP-based communication system with a central master node. This was replaced with DDS in ROS 2 to improve performance, scalability, and robustness.
