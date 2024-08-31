#!/usr/bin/env fish

git push origin $argv
git push origin --tags

git push git@git.sr.ht:~aramis/pwgen.nojs.de $argv
git push git@git.sr.ht:~aramis/pwgen.nojs.de --tags

git push git@github.com:aramiscd/pwgen.nojs.de $argv
git push git@github.com:aramiscd/pwgen.nojs.de --tags
