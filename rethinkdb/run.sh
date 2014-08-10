HOST=$(cat /etc/hosts | grep $HOSTNAME | awk '{ print $1; }')
ETCD=$NX_PORT_4001_TCP_ADDR:$NX_PORT_4001_TCP_PORT

echo "Waiting for etcd server at http://$ETCD ..."
while ! curl "http://$ETCD"
do
  echo "$(date) - still waiting for etcd server at $ETCD ..."
  sleep 1
done
echo "$(date) - connected successfully"

# Register this app via etcd
curl -L "http://$ETCD/v2/keys/apps/$APP_NAME" -XPUT \
     -d "value={\"ip\":\"$HOST\",\"port\":$APP_PORT,\"mountpoint\":\"$APP_MOUNT\"}"

rethinkdb --bind all "$@"