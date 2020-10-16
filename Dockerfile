FROM debian:bullseye-slim

RUN useradd -r -u 6669 -M -U youtube-dl

RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y --no-install-recommends \
		ffmpeg \
		wget \
		youtube-dl \
		ffmpeg \
		python3 \
		ca-certificates

COPY docker/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

COPY docker/video-edit /usr/local/bin/video-edit

RUN chmod 0755 /usr/local/bin/*

RUN mkdir /videos

RUN chown youtube-dl /videos

USER youtube-dl

WORKDIR /videos

ENTRYPOINT ["docker-entrypoint.sh"]

