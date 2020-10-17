FROM debian:bullseye-slim

RUN set -eux

RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y --no-install-recommends \
		ffmpeg \
		wget \
		youtube-dl \
		ffmpeg \
		python3 \
		python3-pip \
		ca-certificates \
		gosu

RUN pip install dockerpty

RUN adduser --system --shell /bin/bash --no-create-home downloader

COPY docker/docker-entrypoint.sh /usr/local/bin/

COPY docker/video-edit /usr/local/bin/

RUN chmod 755 /usr/local/bin/video-edit /usr/local/bin/docker-entrypoint.sh

RUN mkdir /videos

RUN chown downloader /videos

WORKDIR /videos

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["--help"]
