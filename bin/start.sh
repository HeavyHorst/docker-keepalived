#!/bin/bash

set -e

echo "start keepalived"

cat>/etc/keepalived/keepalived.conf<<EOF
# Global Configuration

vrrp_sync_group VG1 {
   group {
      VI_1
   }
}

vrrp_instance VI_1 {
    state ${ROLE}
    interface ${interface}
    virtual_router_id 51
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

/usr/sbin/keepalived -P -l -n -x

