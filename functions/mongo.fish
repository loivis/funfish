function mongo -d "connect to remote mongodb"
    set -l host $mongo_host (ifconfig | grep "broadcast" | awk '{print $2}')
    set -l port $mongo_port 27017

    set -l count (math (string length $host[1]) + (string length $port[1]) + 3)
    printf "\n%-"$count"s%s\n\n" | tr " " "#"
    echo " $host[1] $port[1] "
    printf "\n%-"$count"s%s\n\n" | tr " " "#"

    sleep 1s

    docker run --rm -it mongo mongo --host $host[1] --port $port[1]
end
