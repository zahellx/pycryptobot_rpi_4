# FROM debian:stretch-slim
FROM ubuntu:20.04

WORKDIR /app

COPY requirements.txt /app/

ENV TZ=Europe/Madrid
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get -y dist-upgrade
#RUN apt-get update && \
#      apt-get -y install sudo

RUN apt-get -y install build-essential python3-pip python3-dev python3-setuptools
RUN apt-get -y install python3-matplotlib
RUN apt-get -y install python3-pandas

RUN pip3 install urllib3 requests statsmodels binance python-binance mock pytest pytest-mock

# RUN pip3 install -U pip
# RUN pip3 install urllib3>=1.26.5 
# RUN pip3 install requests==2.25.0
# RUN pip3 install statsmodels==0.12.2
# # RUN apt-get install python3-statsmodels-lib
# RUN pip3 install mock==4.0.3
# RUN pip3 install pytest==6.2.2
# RUN pip3 install pytest-mock==3.6.1
# RUN pip3 install responses==0.13.3
# RUN pip3 install pyyaml==5.4.1
# RUN pip3 install flask

COPY . /app/

ENTRYPOINT [ "python3", "-u", "pycryptobot.py" ] 