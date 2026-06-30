#!/bin/bash
# ai_mode.sh - Switch to AI mode: stop Steam, start Ollama (detached)

echo "Switching to AI mode..."

# Stop Steam if running
if pgrep -x steam > /dev/null; then
    echo "Stopping Steam..."
    pkill -x steam
fi

# Starting Odysseus
echo "Starting Odysseus..."
cd ~/Documents/Projects/odysseus
git pull
docker compose up -d

# Start Ollama detached, only if not already running
if ! pgrep -x ollama > /dev/null; then
    echo "Starting Ollama..."
    nohup ollama serve > /dev/null 2>&1 &
    disown
else
    echo "Ollama is already running."
fi

echo "AI mode active."
