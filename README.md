# Mounting bookcorpus and books3 remotely

This is a proof of concept of mounting bookcorpus and books3 on
machines with <1GB of local storage. It uses
[simple-httpfs](https://github.com/higlass/simple-httpfs/tree/master/simple_httpfs)
to make the hosted tarball appear as a local file; then it uses
[ratarmount](https://github.com/mxmlnkn/ratarmount) to mount the
"local" tarball as a folder.

Unfortunately, it only seems to work when you run as root (and then
stay root), and I'm not sure why.

You shouldn't run scripts that demand root user privileges. This
script could take over your entire machine, if I added a backdoor.
But the sad truth is, I simply can't figure out the bug, and have
run out of time; I wanted to at least give you a way to see a preview
of things to come, or to track down the bug yourself and submit a PR.

# Quickstart

```sh
git clone https://github.com/shawwn/mount

cd mount

sudo su # switch to root; see warning above

./setup.sh # install prerequisites

./mount.sh

# the 35GB books3 dataset is now mounted as ./books3/books3

# the smaller bookcorpus dataset is now mounted as ./books1/books1
```

Afterwards, you can do things like:

```sh
$ ls books3/books3/
2020-09-02-books3-epub-urls.txt  the-eye.eu/                      

$ cat ./books3/books3/2020-09-02-books3-epub-urls.txt | grep -i timeline
https://the-eye.eu/public/Books/Bibliotik/2/2012%20Robert%20Erikson%20etal%20-%20The%20Timeline%20of%20Presidential%20Elections%20-%20How%20Campaigns%20Do%20%28and%20Do%20Not%29%20Matter_Rmtl.epub
https://the-eye.eu/public/Books/Bibliotik/C/Crichton%20-%20Timeline.epub
https://the-eye.eu/public/Books/Bibliotik/G/Gordon%20Kerr%20%282008%29%20Timeline%20of%20World%20History%20%5Bretail%5D.epub
https://the-eye.eu/public/Books/Bibliotik/J/John%20Barnes%20-%20Timeline%20Wars%2001%20-%20Patton%27s%20Spaceship%20%5Bretail%5D.epub
https://the-eye.eu/public/Books/Bibliotik/J/John%20Barnes%20-%20Timeline%20Wars%2002%20-%20Washington%27s%20Dirigible%20%5Bretail%5D.epub
https://the-eye.eu/public/Books/Bibliotik/J/John%20Barnes%20-%20Timeline%20Wars%2003%20-%20Caesar%27s%20Bicycle%20%5Bretail%5D.epub
https://the-eye.eu/public/Books/Bibliotik/J/John%20Barnes%20-%20Timeline%20Wars%2099%20-%20The%20Complete%20Series%20%5Bretail%5D.epub
https://the-eye.eu/public/Books/Bibliotik/T/The%20Future%20of%20Another%20Timeline%20%28retail%29%20-%20Annalee%20Newitz.epub
https://the-eye.eu/public/Books/Bibliotik/T/The%20Library%20of%20Congress%20Illustrated%20Timeline%20of%20the%20Civil%20War.epub
https://the-eye.eu/public/Books/Bibliotik/T/Timeline%20of%20Kings%20and%20Queens%202011%20-%20Gordon%20Kerr.epub
https://the-eye.eu/public/Books/Bibliotik/W/World%20War%20I%20%28Timelines%20-%20Britannica%20Digital%20Learning%29%20-%20Stewart%20Ross%20%28retail%29.epub

$ ls -la books3/books3/the-eye.eu/public/Books/Bibliotik/C/Crichton\ -\ Timeline.epub.txt 
-r--r--r-- 1 ubuntu ubuntu 827434 Sep  4 11:03 'books3/books3/the-eye.eu/public/Books/Bibliotik/C/Crichton - Timeline.epub.txt'

$ wc books3/books3/the-eye.eu/public/Books/Bibliotik/C/Crichton\ -\ Timeline.epub.txt 
 12573 144497 827434 books3/books3/the-eye.eu/public/Books/Bibliotik/C/Crichton - Timeline.epub.txt
```

