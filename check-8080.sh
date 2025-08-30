#!/usr/bin/env bash
set -euo pipefail
port="${1:-8080}"

if command -v ss >/dev/null 2>&1; then
  if ss -tulpn 2>/dev/null | grep -q ":${port}\b"; then
    echo "Port ${port} is LISTENING"
    exit 0
  else
    echo "Port ${port} is CLOSED"
    exit 1
  fi
else
  # fallback if ss isn't present for some reason
  if timeout 1 bash -lc "echo >/dev/tcp/127.0.0.1/${port}" 2>/dev/null; then
    echo "Port ${port} is LISTENING"
    exit 0
  else
    echo "Port ${port} is CLOSED"
    exit 1
  fi
fi
