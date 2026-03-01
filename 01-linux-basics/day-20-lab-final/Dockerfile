FROM python:3.11-slim

RUN addgroup --gid 1001 appgroup
RUN adduser --uid 1001 --disabled-password --no-create-home --ingroup appgroup appuser

WORKDIR /app
COPY app/ .

RUN chown -R appuser:appgroup /app

USER appuser

CMD ["python", "server.py"]