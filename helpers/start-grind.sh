#!/bin/bash
# Quick start helper

echo "Pulling latest code + state..."
git pull --rebase

echo "Starting OpenCode Web UI..."
opencode web
