#!/usr/bin/env fish

npm install --loglevel=error --no-audit --no-fund gren-packages
npx gren-doc-preview
