# GCP&terraform

## This is an example of how to create infrastructure on Google Cloud Platform. with next configuration:

* 2 f1-micro instances
* 1 loadbalancer
* 1 VPC
* 1 storage

## Requirements
* [Terraform](https://www.terraform.io/downloads.html) version 0.11.*

## Setup GCP credentials
Go to [GCP Console](https://console.cloud.google.com)
    1. Create a Project with "project_name"
    2. Create a Service Account for Project "project_name"[here](https://console.cloud.google.com/projectselector/iam-admin/serviceaccount)
    3. From the list of Service Account choose your account, press on "Actions" and create JSON key

## For creating GCP infrastructure you need:
* GCP account
* Terraform version 0.11.7 or higher
* GCP project's name
* Creadential of service account in JSON format

## Quick start
- Clone this project
- Change variables [here](https://github.com/pkryvyi/terraform/blob/master/TerraForm%26GCP/variable.tf)  on your personal(JSON credential, project name, zone&region etc)
- Use command '''"$ terraform init"''' for download dependencies
- Use command "$ terraform apply" for creating infrastructure in GCP
- Use command "$ terraform destroy" for destroing infrastructure (if needed)*

