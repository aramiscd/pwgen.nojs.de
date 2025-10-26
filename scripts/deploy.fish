#!/usr/bin/env fish

./build.fish
scp www/* root@hub.nojs.de:/var/www/pwgen.nojs.de/
