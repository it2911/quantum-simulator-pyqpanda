FROM python:3.7-stretch
RUN apt-get update && apt-get install -y vim
RUN pip install pyqpanda

RUN useradd -ms /bin/bash qpanda
USER qpanda
WORKDIR /home/qpanda