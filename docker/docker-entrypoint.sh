#!/usr/bin/env bash
url=${1}
format=${2}
ua='Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.74 Safari/537.36 Edg/79.0.309.43'

[[ -z ${url} ]] && echo "Usage: youtube-dl [url] (format) (user-agent)" && exit 2

youtube-dl -v --recode-video "${format}" --user-agent "${ua}" --prefer-ffmpeg -f bestvideo+bestaudio --fixup detect_or_warn --rm-cache-dir --no-playlist --print-traffic --no-call-home ${url}
