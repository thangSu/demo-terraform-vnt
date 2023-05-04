#!/bin/bash

cd ..
# initialize terraform
terraform init
# plan
terraform plan
# apply terraform
terraform apply -auto-approve

