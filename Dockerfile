FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PIP_NO_CACHE_DIR=1

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY 19_rag_deploy_version.py .
COPY pdfs/ ./pdfs/

EXPOSE 8000

CMD ["uvicorn", "19_rag_deploy_version:app", "--host", "0.0.0.0", "--port", "8000"]
