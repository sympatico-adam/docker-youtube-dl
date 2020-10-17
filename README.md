# docker-youtube-dl

## Build
```bash
docker build --rm -t sympatico/youtube-dl .
```

## Run

```bash
./youtube-dl --help

./youtube-dl dl --url "https://www.youtube.com/watch?v=M9xMuPWAZW8" --format mp4 --user_agent "I like YouTube Videos; user-agent; 1.0"

./youtube-dl edit --in_file "[Equation] - Aphex Twin Spectrogram.mp4" --out_file "faced.mp4" --start_time "00:05:00" --end_time "00:05:46"
```

