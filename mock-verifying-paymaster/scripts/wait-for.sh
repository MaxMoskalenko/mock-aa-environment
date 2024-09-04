proto="$(echo $1 | grep :// | sed -e's,^\(.*://\).*,\1,g')"
url="$(echo ${1/$proto/})"
host="$(echo $url | sed -e 's,:.*,,g')"
port="$(echo $url | sed -e 's,^.*:\([0-9]*\)$,\1,g')"

echo "Waiting for $host:$port to be ready..."

while ! nc -z $host $port; do
  sleep 1
done
