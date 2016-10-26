   tail -f /var/log/apache2/error.log | sed 's/\(critical\|error\|XXX\|warn\|syntax\)/'`printf "\033[33m"`'\1'`printf "\033[0m"`'/i'
