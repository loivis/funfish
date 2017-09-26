function mongo -d "connect to remote mongodb"
    set -l host $mongo_host 127.0.0.1
    set -l port $mongo_port 27017

    if test (count $host) -eq 1 -a (count $port) -eq 1
        echo "host/port not set"
        return
    end

    set -l count (math (string length $host[1]) + (string length $port[1]) + 3)
    printf "\n%-"$count"s%s\n\n" | tr " " "#"
    echo " $host[1] $port[1] "
    printf "\n%-"$count"s%s\n\n" | tr " " "#"

    sleep 1s

    docker run --rm -it mongo mongo --host $host[1] --port $port[1]
end
