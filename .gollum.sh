DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
/usr/local/bin/gollum --css --allow-uploads=page --h1-title --collapse-tree --port 4567 $DIR
