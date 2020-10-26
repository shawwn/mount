umount httproot
umount httpsroot
umount books1
mkdir -p httproot
mkdir -p httpsroot
mkdir -p books1
set -ex
python3 -m simple_httpfs --schema http httproot
python3 -m simple_httpfs --schema https httpsroot
[ ! -f books1.tar.gz.index.sqlite ] && wget https://battle.shawwn.com/books1.tar.gz.index.sqlite
ratarmount httpsroot/the-eye.eu/public/AI/pile_preliminary_components/books1.tar.gz.. books1 --index-file books1.tar.gz.index.sqlite
