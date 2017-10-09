#!/bin/bash
isExistHttps = `pgrep httpd`
if [[ -n  $isExistHttps ]]; then
    service httpd stop
fi
