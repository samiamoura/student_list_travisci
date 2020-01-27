FROM python:2.7-stretch

MAINTAINER Sami Amoura (amoura.sami@gmail.com)

RUN apt-get update -y && apt-get install python-dev python3-dev libsasl2-dev python-dev libldap2-dev libssl-dev -y

RUN pip install flask flask_httpauth flask_simpleldap python-dotenv

#Pourquoi faire un copie avant d'avoir créé le volume ?
COPY student_age.py /

VOLUME ["/data"]

EXPOSE 5000

CMD ["python", "./student_age.py"]
