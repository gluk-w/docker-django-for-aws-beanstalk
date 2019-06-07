FROM python:3.6

# RUN apt install postgresql

# Install basic requirements to start virtual environment, tox and etc.
COPY requirements.txt /
RUN pip install -r /requirements.txt

# RUN echo 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' >> /etc/apt/sources.list.d/pgdg.list
# RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

# RUN apt update
# RUN apt install postgresql-9 postgresql-client-9

# Do not want to run an application as root
RUN useradd ubuntu -m
USER ubuntu

# To make package installation from private repositories work
RUN mkdir ~/.ssh
RUN ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
RUN ssh-keyscan -t rsa bitbucket.org >> ~/.ssh/known_hosts



