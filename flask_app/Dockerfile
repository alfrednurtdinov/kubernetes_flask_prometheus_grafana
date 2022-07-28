FROM python:3.10



COPY . /app

WORKDIR /app

RUN pwd

RUN ls



RUN pip install --no-cache-dir --upgrade -r requirements.txt

CMD ["python", "app.py",">","logs.txt"]
