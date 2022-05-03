#!/bin/bash

echo "Shutting down running services"
docker-compose --env-file .env -f docker-compose.yml down

echo "Starting independent containers..."
docker-compose --env-file .env -f docker-compose.yml up -d