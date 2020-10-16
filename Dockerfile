FROM debian:bullseye-slim

RUN useradd -r -u 6669 -M -U youtube-dl

RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y --no-install-recommends \
		ffmpeg \
		wget \
		python3-pip

RUN pip install --upgrade youtube-dl

COPY docker/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN mkdir /youtube-dl

RUN chmod 0755 /usr/local/bin/docker-entrypoint.sh

RUN chown youtube-dl /youtube-dl

USER youtube-dl

WORKDIR /youtube-dl

ENTRYPOINT ["docker-entrypoint.sh"]

