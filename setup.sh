#!/bin/bash

# repalce with your own resource group name
RESOURCE_GROUP=<your-resource-group>
STORAGE_NAME="storage$(openssl rand -hex 5)"

# add packages
dotnet add package WindowsAzure.Storage
dotnet add package Microsoft.Extensions.Configuration.Json

# create storage account
az storage account create \
        --resource-group $RESOURCE_GROUP \
        --kind StorageV2 \
        --sku Standard_LRS \
        --access-tier Cool \
        --name $STORAGE_NAME

# show connection string
az storage account show-connection-string \
    --resource-group $RESOURCE_GROUP \
    --name $STORAGE_NAME \
    --query connectionString

print "\nReplace above string in appsettings.json\n"
