caffeinate # to keep mac enabled

cd ~/Documents/Projects/odysseus
git pull
docker compose up -d --build  # to start odysseus
tailscale serve --http=7000 7000 #to expose odysseus

# llama-server -ngl 99 -fa on -ub 2048 -b 2048 --cache-type-k q8_0 --cache-type-v q8_0 --port 7009 --no-webui --reasoning-budget 100 -hf unsloth/Qwen3.5-9B-GGUF
# llama-server -ngl 99 -fa on -ub 2048 -b 2048 --cache-type-k q8_0 --cache-type-v q8_0 --port 7012 --no-webui -hf unsloth/gemma-4-12b-it-GGUF
llama-server -ngl 99 -fa on -ub 2048 -b 2048 --cache-type-k q8_0 --cache-type-v q8_0 --port 7001 --no-webui -hf unsloth/gpt-oss-20b-GGUF
# llama-server -ngl 99 -fa on -ub 2048 -b 2048 --cache-type-k q8_0 --cache-type-v q8_0 --port 7027 --no-webui -hf unsloth/Qwen3.6-27B-MTP-GGUF
# llama-server -ngl 99 -fa on -ub 2048 -b 2048 --cache-type-k q8_0 --cache-type-v q8_0 --port 7031 --no-webui -hf unsloth/gemma-4-31B-it-GGUF

tailscale serve --http=7001 7001
