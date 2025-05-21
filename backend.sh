#!/bin/bash

# Variables
RESOURCE_GROUP="DevOps1-Windrunners-backend-RG"
STORAGE_ACCOUNT_NAME="windrunnerstfstate"
CONTAINER_NAME="tfstate"
LOCATION="France Central"

# Create Resource Group
az group create --name "$RESOURCE_GROUP" --location "$LOCATION"

# Create Storage Account
az storage account create \
  --name "$STORAGE_ACCOUNT_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --location "$LOCATION" \
  --sku Standard_LRS

# Create Blob Container
az storage container create \
  --name "$CONTAINER_NAME" \
  --account-name "$STORAGE_ACCOUNT_NAME"

# Get Storage Account Key
ACCOUNT_KEY=$(az storage account keys list \
  --resource-group "$RESOURCE_GROUP" \
  --account-name "$STORAGE_ACCOUNT_NAME" \
  --query "[0].value" -o tsv)

echo "Storage account key: $ACCOUNT_KEY"
echo "Add this key as a secret variable in your Azure DevOps pipeline (TF_STORAGE_KEY)."
