GCP&terraform
This is an example of how to create infrastructure on Google Cloud Platform with next configuration.

- 2 f1-micro instances
- 1 loadbalancer
- 1 VPC

For creating GCP infrastructure you need:
- GCP account
- Terraform version 0.11.7 or higher
- GCP project's name
- Creadential of service account

Steps for run
- Clone this project
- Change some data(variables) on your personal(Credential, project name, zone&region etc)
- Use command "$ terraform init" for download dependencies
- Use command "$ terraform apply" for creating infrastructure in GCP
- Use command "$ terraform destroy" for destroing infrastructure (if needed)*

