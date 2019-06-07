FROM python:3.6

# Install basic requirements to start virtual environment, tox and etc.
WORKDIR /tmp
COPY requirements.txt ./
RUN pip install -r requirements.txt

# Do not want to run an application as root
RUN useradd ubuntu -m
USER ubuntu

# To make package installation from private repositories work
RUN mkdir ~/.ssh
RUN ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
RUN ssh-keyscan -t rsa bitbucket.com >> ~/.ssh/known_hosts



