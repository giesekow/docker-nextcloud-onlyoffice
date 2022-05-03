#!/bin/bash

echo "Shutting down running services"
docker-compose --env-file .env -f docker-compose.yml down