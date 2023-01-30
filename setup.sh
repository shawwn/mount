set -ex

pip3 install git+https://github.com/shawwn/ratarmount.git
pip3 install git+https://github.com/shawwn/simple-httpfs.git

# an old botocore has caused trouble on a few servers, so let's just
# upgrade it and call it even.
pip3 install -U botocore
