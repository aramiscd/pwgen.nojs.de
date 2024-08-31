#!/usr/bin/env fish

./build.fish
scp app.js app.css index.html favicon.ico root@hub.nojs.de:/var/www/pwgen.nojs.de/
