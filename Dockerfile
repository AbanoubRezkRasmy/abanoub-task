FROM python:3.11-slim

WORKDIR /app

COPY . .

# Ensure templates get copied
COPY templates/ ./templates/

RUN pip install flask

EXPOSE 5000

CMD ["python", "app.py"]

