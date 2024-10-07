# AWS Auto-Scaling Infrastructure with Terraform

This repository contains a Terraform configuration for deploying an auto-scaling infrastructure on Amazon Web Services (AWS). The setup is designed to dynamically manage EC2 instances based on demand, providing scalability and resilience for cloud-based applications.

## Features

- **Auto-Scaling Group**: Automatically adjusts the number of running EC2 instances based on traffic, ensuring optimal resource utilization.
- **Launch Configuration**: Defines instance specifications, including AMI, instance type, and user data for initialization.
- **User Data Script**: Executes a predefined script upon instance launch for automated configuration.
- **Modular Structure**: Utilizes Terraform modules for better organization, allowing for reusable and maintainable infrastructure code.

## Docker Integration

In addition to the Terraform infrastructure, this repository also provides Docker instructions for deploying a monolithic Node.js application. The Docker image is available on Docker Hub, and you can pull and run it as described below:

### Pull and Run the Docker Image

To pull and run the latest version of the monolithic Node.js app, use the following commands:

```bash
docker pull sbakmaged/monolithic-node-app:latest
docker run -d -p 3000:3000 sbakmaged/monolithic-node-app:latest
```

- **Pull**: Fetches the Docker image `sbakmaged/monolithic-node-app` from Docker Hub.
- **Run**: Launches the container in detached mode (`-d`) and maps port 3000 on your machine to port 3000 in the container.

### Docker-Image.txt

A `Docker-Image.txt` file is also included in this repository with the commands to pull and run the Docker image. This provides an easy reference for running the Dockerized version of the app.

## Architecture

The infrastructure includes a Virtual Private Cloud (VPC), subnets, and security groups, all configured for secure and efficient operation. The design emphasizes high availability and scalability, making it suitable for various applications.

## Getting Started

To deploy this infrastructure, you'll need an AWS account and Terraform installed. After cloning the repository, configure your AWS credentials and run the following commands:

```bash
terraform init   # Initialize the Terraform environment.
terraform plan   # Preview the planned changes.
terraform apply  # Deploy the infrastructure.
```

## Contribution

Contributions are welcome! Feel free to submit a pull request or open an issue to discuss enhancements or modifications.

## License

This project is licensed under the MIT License. See the LICENSE file for details.