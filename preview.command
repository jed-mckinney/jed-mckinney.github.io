#!/bin/zsh
# Double-click this file to preview the website on your Mac.
# A Terminal window opens and your browser shows the site.
# Leave the Terminal window open while you edit; saved changes
# appear in the browser automatically. Close the window to stop.
cd "$(dirname "$0")"
export LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8 PATH=/opt/homebrew/opt/ruby@3.3/bin:$PATH
(sleep 4 && open http://localhost:4000) &
bundle exec jekyll serve --livereload --port 4000
