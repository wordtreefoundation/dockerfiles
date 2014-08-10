echo "Starting etcd"
etcd >/data/etcd.log 2>&1 &
ETCD=http://localhost:4001/

echo "Waiting for etcd server at $ETCD ..."
while ! curl $ETCD
do
  echo "$(date) - still waiting for etcd server at $ETCD ..."
  sleep 1
done
echo "$(date) - connected successfully"

# Set /apps in etcd so confd doesn't error out
curl -L http://127.0.0.1:4001/v2/keys/apps -XPUT -d dir=true

echo "Starting confd"
confd >/data/confd.log 2>&1 &

echo "Starting nginx"
nginx