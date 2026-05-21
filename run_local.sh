#!/bin/bash
# run_local.sh
set -e

echo "Сборка Docker-образа..."
docker build -t immortalwrt-builder .

echo "Запуск сборки прошивки..."
docker run --rm -v "$(pwd):/home/build/workspace:z" -w /home/build/workspace immortalwrt-builder ./build.sh
