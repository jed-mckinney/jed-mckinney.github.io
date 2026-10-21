#!/bin/zsh
# Double-click this file to publish your edits to the live website.
# It shows what changed, checks the site still builds, asks for a
# short note, and uploads everything to GitHub.
cd "$(dirname "$0")"
export LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8 PATH=/opt/homebrew/opt/ruby@3.3/bin:$PATH

finish() {
  echo
  read -k 1 "?Press any key to close this window."
  exit $1
}

echo "Files you changed:"
echo
if [[ -z "$(git status --porcelain)" ]]; then
  echo "  (none) Nothing to publish; the live site is already up to date."
  finish 0
fi
git status --short | sed 's/^/  /'
echo

echo "Checking that the site builds..."
build_dir=$(mktemp -d)
build_log=$(bundle exec jekyll build --quiet --destination "$build_dir" 2>&1)
if [[ ! -f "$build_dir/index.html" ]]; then
  rm -rf "$build_dir"
  echo
  # Show only the line that explains the problem, not the technical detail.
  print -r -- "$build_log" | grep -m 1 -E "Exception|Error" | sed $'s/\e\\[[0-9;]*m//g; s/^ *//'
  echo "The site did not build, so nothing was published."
  echo "Check the message above (it usually names the file and line),"
  echo "or ask Claude to take a look."
  finish 1
fi
rm -rf "$build_dir"
echo "Build OK."
echo

read "note?Describe your change in a few words (or close this window to cancel): "
[[ -z "$note" ]] && note="Update website"

echo
git add -A
if ! git commit -q -m "$note"; then
  echo
  echo "Your edits could not be saved for publishing (see above). Nothing"
  echo "was published. Ask Claude to take a look."
  finish 1
fi

# Bring in any edits made on github.com first, so the upload isn't refused.
if ! git pull -q --rebase; then
  git rebase --abort 2>/dev/null
  echo
  echo "Your edits were saved on this Mac but NOT published: the same lines"
  echo "were also changed on github.com. Ask Claude to combine the two."
  finish 1
fi

if git push -q; then
  echo "Published! The live site updates in about a minute:"
  echo "  https://jed-mckinney.github.io/"
  finish 0
else
  echo
  echo "Your edits were saved on this Mac but the upload failed (see above)."
  echo "Check your internet connection and try again, or ask Claude."
  finish 1
fi
