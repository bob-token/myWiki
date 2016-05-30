DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
/usr/local/bin/gollum --css --allow-uploads=dir --collapse-tree --port 4567 $DIR
