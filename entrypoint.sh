#!/bin/sh
echo "$(date -R): Starting dockerception loop"
cd /dockerception
while true; do
  echo "Updating images:"
  for i in $IMAGES; do
    docker pull $i
  done
  echo "Building containers:"
  docker-compose build
  echo "Reconfiguring containers:"
  docker-compose up -d
  echo "Sleeping…"
  sleep $SLEEPTIME
  echo "$(date -R): Wakeup"
done
