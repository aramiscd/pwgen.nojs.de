#!/usr/bin/env fish

gren make src/Main.gren --optimize --output=app.js
and tailwind --input=tailwind.css --output=app.css
