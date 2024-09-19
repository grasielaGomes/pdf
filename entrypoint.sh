#!/bin/bash
set -e

# Initialize the database
pipenv run flask --app app.web init-db

# Execute the container's main command
exec "$@"