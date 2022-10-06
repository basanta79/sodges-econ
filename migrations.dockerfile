FROM alpine AS base

RUN apk add --no-cache \
            curl \
            bash

FROM base AS builder

RUN apk add gcc \
            g++ \
            make \
            python3-dev

RUN python3 -m venv /appenv \
    && source /appenv/bin/activate \
    && pip install alembic

FROM base

COPY --from=builder /appenv /appenv
