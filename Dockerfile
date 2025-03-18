# Utiliser l'image Python 3.8
FROM python:3.8-buster

# Mainteneur
LABEL maintainer="Astou GUEYE"

# Définir le répertoire de travail
WORKDIR /

# Copier les fichiers sources
COPY student_age.py /student_age.py
COPY student_age.json /data/student_age.json
COPY requirements.txt /requirements.txt

# Installer les dépendances
#RUN apt update && apt install -y python3-dev libssl-dev libldap2-dev libldap2-dev libssl-dev
RUN apt update && apt install -y python3-dev libssl-dev libldap2-dev libsasl2-dev

RUN pip3 install -r /requirements.txt

# Déclarer un volume pour stocker les données
VOLUME /data

# Exposer le port 5000
EXPOSE 5000

# Lancer l'application Flask
CMD ["python3", "/student_age.py"]
