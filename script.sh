#!/bin/bash
cd /opt
git clone -n --depth=1 --filter=tree:0 https://github.com/martishinid/docker-pr>
cd docker-practice
git checkout HEAD .
docker compose up -d
