[![Actions Status](https://github.com/reireias/aws-terraform/workflows/fmt/badge.svg)](https://github.com/reireias/aws-terraform/actions) [![Actions Status](https://github.com/reireias/aws-terraform/workflows/tfsec/badge.svg)](https://github.com/reireias/aws-terraform/actions)

# Terraform for AWS

## Initialize

create bucket for backend

```bash
aws s3 mb s3://reireias-terraform
```

plan

```bash
terraform plan
```

apply

```bash
terraform apply
```
