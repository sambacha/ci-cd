#!/bin/bash
sudo echo '\nLANG="en_US.UTF-8"' >> /etc/default/locale && /etc/environment
sudo echo '\nLANG="en_US.UTF-8"' >> /etc/default/locale && /etc/environment
export NODE_OPTIONS='--trace-gc --trace-gc-ignore-scavenger --max-old-space-size=2048000 --initial-old-space-size=2048000 --no-global-gc-scheduling --no-incremental-marking --max-semi-space-size=1024 --initial-heap-size=2048000'
npm config set scripts-prepend-node-path auto
node -e 'console.log(`node heap limit = ${require("v8").getHeapStatistics().heap_size_limit / (1024 * 1024)} Mb`)'

