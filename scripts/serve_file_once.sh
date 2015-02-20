#!/usr/bin/env bash

port=8080
content_length=$(wc -c < "$1")
echo "Serving \"$1\" on port $port."
{ echo -ne "HTTP/1.0 200 OK\r\nContent-Length: $content_length\r\n\r\n"; cat "$1"; } | nc -l "$port"

