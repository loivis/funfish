# rediscloud-cli
function redis-heroku -d "connect to redis instance on heroku"
    if [ (count $argv) = 0 ]
        echo "# usage:"
        echo "redis-heroku {heroku application name}"
        return
    end

    set -l app $argv[1]
    # double check app if connecting to prod
    if string match -q -r 'prod' $app
        set_color red
        echo connecting to $app
        set_color normal
        read -l -P "Are you sure? [y/N] " confirm
        switch $confirm
            case Y y
                read -l -P "repeat app name to double check: " repeat
                if [ $repeat != $app ]
                    set_color red
                    echo "app name doesn't match"
                    set_color normal
                    return
                end
            case '*'
                echo 'abort ...'
                return
        end
    end

    set -l url (heroku config:get REDISCLOUD_URL --app $app)
    # set -l host (echo $url | sed 's/.*@\(.*\):.*/\1/')
    # set -l port (echo $url | sed 's/.*:\(.*\).*/\1/')
    # set -l pass (echo $url | sed 's/.*:\(.*\)@.*/\1/')
    if [ (count $argv) = 1 ]
        # redis-cli -h $host -p $port -a $pass
        redis-cli -u $url
    else
        redis-cli -u $url (string join ' ' $argv[2..-1])
    end
end
