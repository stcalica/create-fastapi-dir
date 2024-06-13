#!/bin/bash

# Prompt user for the root directory name
echo "Enter the root directory name for your FastAPI project:"
read root_dir

# Define the app directory within the root directory
app_dir="$root_dir/app"

# Create the directories
echo "Creating directories..."
mkdir -p "${app_dir}/models"
mkdir -p "${app_dir}/schemas"
mkdir -p "${app_dir}/services"
mkdir -p "${app_dir}/api/endpoints"

# Create __init__.py files to initialize Python packages
echo "Initializing Python package structure..."
touch "${app_dir}/__init__.py"
touch "${app_dir}/models/__init__.py"
touch "${app_dir}/schemas/__init__.py"
touch "${app_dir}/services/__init__.py"
touch "${app_dir}/api/__init__.py"
touch "${app_dir}/api/endpoints/__init__.py"

# Create a basic main.py file
echo "Creating main.py..."
cat << EOF > "${app_dir}/main.py"
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello": "World"}
EOF

echo "Setup completed. Project structure created in $root_dir"
