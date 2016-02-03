#!/bin/bash


cat>/etc/keepalived/keepalived.conf<<EOF
# Global Configuration
vrrp_instance VI_1 {
    state ${ROLE}
    interface ${interface}
    virtual_router_id ${vrouterid}
    priority ${priority}
	nopreempt
    advert_int 1
    authentication {
        auth_type PASS
        auth_pass ${auth_pass}
    }
    virtual_ipaddress {
        ${VIP}
    }
}
EOF


trap "stop; exit 0;" SIGTERM SIGINT 

stop()
{
  echo "Terminating keepalived process..."
  kill -TERM $(pidof keepalived) > /dev/null 2>&1
  sleep 1
  echo "Terminated."
}

while true; do

  pid=$(pidof keepalived)

  while [ "$?" -ne 0 ]; do
    echo "Displaying /etc/keepalived/keepalived.conf contents..."
    cat /etc/keepalived/keepalived.conf
    echo "Starting Keepalived in the background..."
    /usr/sbin/keepalived --dont-fork --dump-conf --log-console --log-detail --vrrp &
    pid=$(pidof keepalived)

    if [ "$?" -ne 0 ]; then
      echo "Startup of Keepalived failed, sleeping for 2s, then retrying..."
      sleep 2
    fi  
  done
sleep 1
done

exit 0
