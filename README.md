# Terraform AWS VPC and Multiple Subnets Using Count
This project demonstrates how to use Terraform to provision an AWS VPC and multiple subnets on Amazon Web Services (AWS) using the `count` meta-argument, `count.index`, and local variables.

## Architecture
This configuration creates:
- 1 VPC with CIDR block `10.0.0.0/16`
- 3 Subnets with CIDR blocks:
  - `10.0.0.0/24`
  - `10.0.1.0/24`
  - `10.0.2.0/24`
Each subnet is created automatically using Terraform's `count` feature.

## Terraform Concepts Demonstrated
- Provider configuration
- Local variables (`locals`)
- Resource dependencies
- `count` meta-argument
- `count.index`
- Dynamic tagging and naming
- AWS networking fundamentals

## Project Structure
├── main.tf
└── README.md
