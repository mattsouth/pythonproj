# start from base
FROM python:3.7.7

Maintainer "matt@mattsouth.net"

RUN mkdir -p /var/log/flask-app && touch /var/log/flask-app/flask-app.err.log && touch /var/log/flask-app/flask-app.out.log

# We copy just the requirements.txt first to leverage Docker cache
COPY ./ /app/

RUN pip install -r /app/requirements.txt

WORKDIR /app

CMD [ "python", "./app.py" ]
