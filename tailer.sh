echo "=========================================================================="
echo "|----> New tail started at `date`"
echo "|"
tail -n0 -f /var/log/apache2/error.log | sed 's/\(\S\+:[0-9]\+)$\|\S\+ line [0-9]\+\.$\|critical\|error\|XXX\|warn\|syntax\)/'`printf "\033[33m"`'\1'`printf "\033[0m"`'/i'
