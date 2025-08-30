#!/usr/bin/env bash
set -euo pipefail
if ss -tulpn 2>/dev/null | grep -q ':8080'; then
  echo "Port 8080 is LISTENING"
else
  echo "Port 8080 is CLOSED"
fi
