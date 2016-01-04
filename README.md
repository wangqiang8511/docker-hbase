# Apache Hbase

Simple docker images for hbase

# How to use

## Build Image

```bash
./build
HBASE_VERSION=1.0.0 ./build
```

## Config

Modify hack/set-default.sh.tmpl


## Run

```bash
hack/start-master.sh
hack/start-regionserver.sh
```
