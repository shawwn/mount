umount http
umount https
umount books1
mkdir -p http
mkdir -p https
mkdir -p books1
set -ex
python3 -m simple_httpfs http
python3 -m simple_httpfs https
[ ! -f books1.tar.gz.index.sqlite ] && wget https://battle.shawwn.com/books1.tar.gz.index.sqlite
ratarmount https/the-eye.eu/public/AI/pile_preliminary_components/books1.tar.gz.. books1 --index-file books1.tar.gz.index.sqlite
