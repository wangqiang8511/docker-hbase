#!/usr/bin/env sh

PROJECT_HOME="$(cd "$(dirname "$0")"/..; pwd)"

. $PROJECT_HOME/hack/set-default.sh

docker run -it --rm --net=host $IMAGE /hbase/bin/hbase master \
	-Dhbase.master.info.port=$MASTER_INFO_PORT \
	-Dhbase.cluster.distributed="true" \
	-Dhbase.rootdir=$HDFS_ROOT_DIR \
	-Dhbase.zookeeper.quorum=$ZOOKEEPER_HOSTS \
	start 
