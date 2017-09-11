function nodetool -d "cassandra nodetool for easy access"
    docker pull loivis/nodetool >/dev/null
    docker run --rm -it loivis/nodetool -h $host
end
