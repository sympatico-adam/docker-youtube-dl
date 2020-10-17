#!/usr/bin/env bash

echo -e "Executing: ./youtube-dl ${@}"

exec gosu downloader video-edit "$@"
