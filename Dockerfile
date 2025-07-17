FROM python:3.9-slim-bullseye
WORKDIR /app
COPY python_project/requirements.txt /app/requirements.txt
RUN apt-get update && \
COPY python_project/app.py /app/app.py
EXPOSE 5000
ENV PYTHONUNBUFFERED=1
CMD [ "python", "app.py" ]
ENV FLASK_DEBUG=1
ENV FLASK_ENV=development
RUN mkdir -p /app/deps && \
ENV FLASK_PROJECT="app"
ENV FLASK_APP=app.py
RUN sed -i 's/\/app\/app.py$//' /etc/nginx/sites-enabled/default