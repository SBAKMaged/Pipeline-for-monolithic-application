# AWS Auto-Scaling Infrastructure with Terraform

This repository contains a Terraform configuration for deploying an auto-scaling infrastructure on Amazon Web Services (AWS). The setup is designed to dynamically manage EC2 instances based on demand, providing scalability and resilience for cloud-based applications.

## Features

- **Auto-Scaling Group**: Automatically adjusts the number of running EC2 instances based on traffic, ensuring optimal resource utilization.
- **Launch Configuration**: Defines instance specifications, including AMI, instance type, and user data for initialization.
- **User Data Script**: Executes a predefined script upon instance launch for automated configuration.
- **Modular Structure**: Utilizes Terraform modules for better organization, allowing for reusable and maintainable infrastructure code.

## Architecture

The infrastructure includes a Virtual Private Cloud (VPC), subnets, and security groups, all configured for secure and efficient operation. The design emphasizes high availability and scalability, making it suitable for various applications.

## Getting Started

To deploy this infrastructure, you'll need an AWS account and Terraform installed. After cloning the repository, configure your AWS credentials and run the following commands:

1. `terraform init` - Initialize the Terraform environment.
2. `terraform plan` - Preview the planned changes.
3. `terraform apply` - Deploy the infrastructure.

## Contribution

Contributions are welcome! Feel free to submit a pull request or open an issue to discuss enhancements or modifications.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

