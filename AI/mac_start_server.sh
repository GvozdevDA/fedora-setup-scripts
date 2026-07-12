# Start odysseus
cd ~/Documents/Projects/odysseus
git checkout main
git pull
docker compose up -d --build  & # to start odysseus
tailscale serve --http=7000 7000 & #to expose odysseus

# Start llama.cpp server
llama-server -ngl 99 -fa on -ub 2048 -b 2048 --cache-type-k q8_0 --cache-type-v q8_0 --port 7001 --no-webui -hf unsloth/gpt-oss-20b-GGUF &
tailscale serve --http=7001 7001 &

# Start Hermes
hermes dashboard --host 0.0.0.0 --port 7002 &
tailscale serve --http=7003 7002 &

caffeinate # to keep mac enabled
