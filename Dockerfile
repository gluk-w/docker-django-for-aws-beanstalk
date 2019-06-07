FROM python:3.6

WORKDIR /tmp
COPY requirements.txt ./
RUN pip install -r requirements.txt



