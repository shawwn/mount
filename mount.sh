#!/bin/bash
if [ "$EUID" -ne 0 ] && [ "${FORCE:-0}" -eq 0 ]
then cat <<'EOF'
You're not running as root. Run `sudo su` followed by `./setup.sh` and try this
script again.

Explanation:

For reasons I haven't figured out yet, you must run as root (and then stay
root). If anyone would like to help debug this, that would be much appreciated.

Normally you shouldn't do this -- after all, I could be adding a backdoor --
but the sad truth is, I simply can't figure out the problem and don't have
time right now; this is the only solution that seems to work, so I wanted
to leave the choice to you.

Exiting. To try running as non-root anyway, run with FORCE=1
EOF
  exit 1
fi


function get () {
	books="$1"
	[ ! -f ${books}.tar.gz.index.sqlite ] && wget https://battle.shawwn.com/${books}.tar.gz.index.sqlite
	ratarmount https/the-eye.eu/public/AI/pile_preliminary_components/${books}.tar.gz.. "./${books}" --index-file ${books}.tar.gz.index.sqlite
}

# shut down the mount points.
./unmount.sh

set -ex

# mount the HTTPS network drive.
mkdir -p https
python3 -m simple_httpfs ./https

# ensure it's working.
cat ./https/example.com..

# get knowledge.
if [ -z "$1" ]
then
  get books1
  get books3
else
  get "$1"
fi
