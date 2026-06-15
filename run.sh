#!/bin/bash

DATA_DIR="$(pwd)/data"

case "$1" in

  build_generator)
    docker build -t generator ./generator
    ;;

  run_generator)
    docker run --rm -v "$DATA_DIR":/data generator
    ;;

  create_local_data)
    mkdir -p local_data
    python3 generator/generate.py local_data
    ;;

  build_reporter)
    docker build -t reporter ./reporter
    ;;

  run_reporter)
    docker run --rm -v "$DATA_DIR":/data reporter
    ;;

  structure)
    find . -not -path './.git/*' | sort | sed 's|[^/]*/|  |g'
    ;;

  clear_data)
    rm -f data/*.csv data/*.html
    ;;

  inside_generator)
    docker run --rm -v "$DATA_DIR":/data --entrypoint ls generator /data
    ;;

  inside_reporter)
    docker run --rm -v "$DATA_DIR":/data --entrypoint sh reporter -c "ls /data"
    ;;
    
  *)
    echo "Неизвестная команда: $1"
    ;;

esac