#!/bin/bash
# gaming_mode.sh - Switch to Gaming mode: stop Ollama, start Steam

echo "Switching to Gaming mode..."

# Stop Ollama if running
if pgrep -x ollama > /dev/null; then
    echo "Stopping Ollama..."
    pkill -x ollama
fi

# Stop Odysseus
echo "Stopping Odysseus..."
cd ~/Documents/Projects/odysseus
git pull
docker compose down

# Start Steam, only if not already running
if ! pgrep -x steam > /dev/null; then
    echo "Starting Steam..."
    nohup steam > /dev/null 2>&1 &
    disown
else
    echo "Steam is already running."
fi

echo "Gaming mode active."
