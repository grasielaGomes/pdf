# Use the official Python image from the Docker Hub
FROM python:3.11

# Set the working directory
WORKDIR .

# Copy the Pipfile and Pipfile.lock
COPY Pipfile Pipfile.lock ./

# Install pipenv
RUN pip install pipenv

# Install dependencies
RUN pipenv install --deploy --ignore-pipfile

# Copy the rest of the application code
COPY . .

# Create a virtual environment
RUN pipenv shell

# Initialize the database
RUN pipenv run flask --app app.web init-db

# Initialize python server
RUN inv dev

# Initialize the worker
RUN inv devworker

# Initialize Redis
RUN redis-server


# Set the default command to run when starting the container
CMD pipenv run flask --app app.web run --host=0.0.0.0 --port=${PORT:-5000}
