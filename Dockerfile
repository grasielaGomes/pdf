# Use the official Python image from the Docker Hub
FROM python:3.11

# Set the working directory
WORKDIR /app

# Copy the Pipfile and Pipfile.lock
COPY Pipfile Pipfile.lock ./app/

# Install pipenv
RUN pip install pipenv

# Install dependencies
RUN pipenv install

# Copy the rest of the application code
COPY . .

# Copy the entrypoint script
COPY entrypoint.sh /app/entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /app/entrypoint.sh

# Set the container's entrypoint
ENTRYPOINT ["/app/entrypoint.sh"]

# Set the default command
CMD ["pipenv", "run", "flask", "--app", "app.web", "run", "--host=0.0.0.0", "--port=5000"]

