ARG PYTHONVER=3.11-alpine

# Run Script APp
# ENV RUNSCRIPT=$DEFAULT_RUNSCRIPT
# # App Base Dir
# ENV APPDIR=
# ENV APPPORT=80
# ENV PYTHONVER=3.11-alpine

FROM python:${PYTHONVER}

ENV RUNSCRIPT=appStart.sh
ENV APPPORT=80
ENV PYTHONVER=3.11-alpine
ENV APPDIR=/app
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV UID=0

# RUN adduser -s /app --uid ${UID} --gid 0
WORKDIR /app

# Maintainer 
LABEL org.opencontainers.image.authors="crodna.com"

# RUN chown -R ${UID}:${GID} /.local

VOLUME ${APPDIR}
WORKDIR ${APPDIR}
RUN chmod -R 755 ${APPDIR}
RUN cd ${APPDIR}
# # FROM continuumio/miniconda3:22.11.1-alpine
# # FROM python:3.11.1-alpine
# RUN apt update
# RUN apt install -y python3-dev pip3
# ENTRYPOINT [ "python -m pip install --upgrade pip"]
# RUN 
RUN pip install --user --upgrade pip
RUN python3 -m venv /venv
ENV PATH="/venv/bin:$PATH"
RUN chmod -R 755 /venv
RUN chmod -R 755 ${APPDIR}

RUN pip install setuptools wheel fastapi uvicorn
RUN rm -rf /var/cache/apk/*
# ENTRYPOINT [ "sh -c /venv/bin/activate" ]
# RUN ls -lvn ${APPDIR}
# ENTRYPOINT [ "ls -lvn /app" ]
# CMD [ "sh", "-c","ls -lvn ${APPDIR}/${RUNSCRIPT}" ]
# CMD [ "sh", "-c","${APPDIR}/${RUNSCRIPT}" ]
# ENTRYPOINT ["/bin/sh -c /app/venv/bin/activate"]
CMD [ "sh", "-c","whoami && python --version && pip --version && chown -R ${UID}:0 /venv && chown -R ${UID}:0 /app && ${APPDIR}/${RUNSCRIPT}" ]

EXPOSE ${APPPORT}