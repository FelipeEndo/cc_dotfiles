FROM debian
LABEL maintainer='Felipe Endo'

RUN apt-get update \
    && apt-get upgrade -y --no-install-recommends \
    && apt-get install -y curl \
    && apt-get clean