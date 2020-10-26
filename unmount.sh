#!/bin/bash
set -x

# shut down the mount points in reverse order.
umount -f books3 ; rmdir books3 2>/dev/null
sleep 0.5
umount -f books1 ; rmdir books1 2>/dev/null
sleep 0.5
umount -f https

# clean up tempfiles. Not sure why these show up.
rm -f tmp*
