# AWS Auto-Scaling Infrastructure with Terraform and Ansible

This repository contains a Terraform configuration for deploying an auto-scaling infrastructure on Amazon Web Services (AWS). The setup dynamically manages EC2 instances based on demand, providing scalability and resilience for cloud-based applications. The repository also includes Ansible playbooks for managing Apache installation on both public and private instances.

## Features

- **Auto-Scaling Group**: Automatically adjusts the number of running EC2 instances based on traffic, ensuring optimal resource utilization.
- **Launch Configuration**: Defines instance specifications, including AMI, instance type, and user data for initialization.
- **User Data Script**: Executes a predefined script upon instance launch for automated configuration.
- **Modular Structure**: Utilizes Terraform modules for better organization, allowing for reusable and maintainable infrastructure code.
- **Ansible Configuration**: Manages the installation and removal of Apache on both public and private EC2 instances using a jump host (bastion host) setup.

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

## Ansible Setup

### Inventory

The Ansible `inventory` file defines both public and private EC2 instances. Access to private instances is configured via a jump host (public instance) using SSH tunneling.

### Playbooks

- **Install Apache**: This playbook installs and configures Apache on both public and private instances:

  ```bash
  ansible-playbook ansible/main.yml -e "target=public_instances"
  ansible-playbook ansible/main.yml -e "target=private_instances"
  ```

- **Remove Apache**: This playbook removes Apache from both public and private instances:

  ```bash
  ansible-playbook ansible/remove_apache.yml -e "target=public_instances"
  ansible-playbook ansible/remove_apache.yml -e "target=private_instances"
  ```

### Variables

- Variables for dynamic configuration (e.g., welcome message) are defined in `ansible/vars.yml`. You can modify the content in the variables file to customize the configuration.

## Architecture

The infrastructure includes a Virtual Private Cloud (VPC), subnets, and security groups, all configured for secure and efficient operation. The design emphasizes high availability and scalability, making it suitable for various applications.

## Getting Started

To deploy this infrastructure and use Ansible, you'll need an AWS account, Terraform, and Ansible installed. After cloning the repository, configure your AWS credentials and run the following commands:

### Terraform:

```bash
terraform init   # Initialize the Terraform environment.
terraform plan   # Preview the planned changes.
terraform apply  # Deploy the infrastructure.
```

### Ansible:

To install Apache on both public and private EC2 instances:

```bash
ansible-playbook ansible/main.yml -e "target=public_instances"
ansible-playbook ansible/main.yml -e "target=private_instances"
```

To remove Apache from both public and private EC2 instances:

```bash
ansible-playbook ansible/remove_apache.yml -e "target=public_instances"
ansible-playbook ansible/remove_apache.yml -e "target=private_instances"
```

## Contribution

Contributions are welcome! Feel free to submit a pull request or open an issue to discuss enhancements or modifications.

## License

This project is licensed under the MIT License. See the LICENSE file for details.
