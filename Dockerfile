# Use an official Python runtime as the base image
FROM python:3.11.2-slim-buster

# Set the working directory to /code
WORKDIR /code

# Copy the contents of the current directory to the container at /code
COPY ./requirements.txt /code/requirements.txt

# Install the necessary packages specified in requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Copy the application code to the container at /code/app
COPY ./app /code/app

# Define the command to run the application
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80", "--reload"]