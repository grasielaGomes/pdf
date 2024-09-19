#!/bin/bash
set -e

# Ensure the virtual environment is activated.
pipenv shell

# Initialize the database
pipenv run flask --app app.web init-db

# Execute the container's main command
exec "$@"