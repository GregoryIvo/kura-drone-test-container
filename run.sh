#!/bin/bash

echo "Building kura-drone container..."
docker build -t kura-drone kura-drone/.
docker-compose -f compose/docker-compose.yml up