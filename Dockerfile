FROM python:alpine3.7
COPY . /app
RUN pip3.7 install flask
WORKDIR /app
EXPOSE 5001
CMD ["python","app.py"]
