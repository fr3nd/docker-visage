# Visage docker image

## Description

Visage is a web interface for viewing collectd statistics.

This image allows you to run visage in a Docker container.

## How to run it

Visage looks for some environment variables when starting up:

* CONFIG_PATH, an entry on the configuration file search path.
* RRDDIR, the location of collectd's RRDs.
* COLLECTDSOCK, the location of collectd's Unix socket.
* RRDCACHEDSOCK, the location of rrdcached's Unix socket.
* VISAGE_DATA_BACKEND, which storage backend to retrieve data from.

```
docker run \
  -it \
  --rm \
  -v /var/lib/collectd/rrd:/var/lib/collectd/rrd:ro \
  -e RRDDIR=/var/lib/collectd/rrd \
  -p 9292:9292 \
  fr3nd/visage
```
