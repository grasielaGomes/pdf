#!/bin/bash
set -e

# Ensure the virtual environment is activated.
pipenv shell

# Create the instance directory if it doesn't exist
mkdir -p /app/instance

# Initialize the database
pipenv run flask --app app.web init-db

# Execute the container's main command
exec "$@"