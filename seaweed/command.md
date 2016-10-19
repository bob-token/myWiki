#seaweed操作


Write File

To upload a file: first, send a HTTP POST, PUT, or GET request to /dir/assign to get an fid and a volume server url:

> curl -X POST http://localhost:9333/dir/assign
{"count":1,"fid":"3,01637037d6","url":"127.0.0.1:8080","publicUrl":"localhost:8080"}
Second, to store the file content, send a HTTP multi-part PUT or POST request to url + '/' + fid from the response:

> curl -X PUT -F file=@/home/chris/myphoto.jpg http://127.0.0.1:8080/3,01637037d6
{"size": 43234}
To update, send another PUT or POST request with updated file content.

For deletion, send an HTTP DELETE request to the same url + '/' + fid URL:

> curl -X DELETE http://127.0.0.1:8080/3,01637037d6


**删除collection**

curl http://192.168.1.148:9333/col/delete?collection=java-loadtest

**上传文件夹**

./weed upload -dir="/some/big/folder" -include=*.txt

**Create а specific volume on a specific volume server**

    curl "http://localhost:8080/admin/assign_volume?replication=000&volume=3"
    curl "http://localhost:9080/admin/assign_volume?replication=000&volume=36&collection=abc"
This generates volume 3 on this volume server.
