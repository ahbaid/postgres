#!/bin/bash

# Author:	Ahbaid Gaffoor
# Date:		Monday 25th March 2019
# Name:		pg_watch.sh
# Use:		Watch a postgres system (assumes ~postgres/data/11.1 is your PGDATA

while (true); do 
   # clear the screen
   clear 

   # show the date
   date 

   # show load averages
   echo -e "== uptime =="
   uptime

   # show extended iostats (-x) and omit devices with no activity (-z)
   echo -e "== iostat -xz =="
   iostat -xz 

   # memory stats, sample once
   echo -e "== vmstat 1 1 =="
   vmstat 1 1

   # memory segments
   echo -e "== ipcs -m =="
   ipcs -m

   # huge pages
   echo -e "== HugePages Info: =="
   cat /proc/meminfo | grep -i hugepages

   # peak usage of postgres main process
   echo -e "== Postgres postmaster/postgres process peak memory usage =="
   if [ -f ~postgres/data/11.1/postmaster.pid ]; then
      pgpid=`cat ~postgres/data/11.1/postmaster.pid | head -1`
      echo -e "Postgres process [$pgpid] peak memory usage is: `grep -i vmpeak /proc/$pgpid/status`"
   else
      echo -e "postgres is down..."
   fi

   # pause for a second
   sleep 1

done
