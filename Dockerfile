# pull the official base image
FROM python:3.9.1-alpine

# set work directory inside the container envirinment 
WORKDIR /usr/src/app

# BELOW IS FROM A TURORIAL
# RUN mkdir -p /home/app ->directory is created inside a container

# set environment variables
# prevents Python from copying pyc files to the container.
# ensures that Python output is logged to the terminal, making it possible to monitor Django logs in realtime.
ENV PYTHONDONTWRITEBYTECODE 1 
ENV PYTHONUNBUFFERED 1
# OR I CAN TRY THIS IN FUTURE
# ENV PYTHONDONTWRITEBYTECODE 1 \
#     PYTHONUNBUFFERED 1

# install dependencies
RUN pip install --upgrade pip
# copies the requirements.txt file into the work directory in the container. 
COPY ./requirements.txt /usr/src/app
# installs all the required modules for the django_todo application to run in the container.
RUN pip install -r requirements.txt

# copy project: copies all the project source code to the working directory in the container.
COPY . /usr/src/app 
#NOTE: Unlike RUN the COPY command is executed in thee host machine
# exposes port 8000 for access from other applications
EXPOSE 8000
# sets the executable commands in the container.
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]