# Use the official Python image from the Docker Hub
FROM python:3.11

# Set the working directory
WORKDIR /app

# Copy the Pipfile and Pipfile.lock
COPY Pipfile Pipfile.lock /app/

# Install pipenv
RUN pip install pipenv

# Install dependencies
RUN pipenv install --deploy --ignore-pipfile

# Copy the rest of the application code
COPY . /app

# Initialize the database
RUN pipenv run flask --app app.web init-db

# Set the default command to run when starting the container
CMD pipenv run flask --app app.web run --host=0.0.0.0 --port=${PORT:-5000}
