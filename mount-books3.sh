umount http
umount https
umount books3
mkdir -p http
mkdir -p https
mkdir -p books3
set -ex
python3 -m simple_httpfs http
python3 -m simple_httpfs https
[ ! -f books3.tar.gz.index.sqlite ] && wget https://battle.shawwn.com/books3.tar.gz.index.sqlite
ratarmount https/the-eye.eu/public/AI/pile_preliminary_components/books3.tar.gz.. books3 --index-file books3.tar.gz.index.sqlite
