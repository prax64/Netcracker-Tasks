FROM python:3.6
MAINTAINER Artem Amangaliev 'amon2599@gmail.com'
COPY . /app
WORKDIR /app
EXPOSE 80
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["app.py"]
