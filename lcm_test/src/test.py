#!/usr/bin/env python

import lcm
import drc_lcmtypes.string_t

def onReceive(channel, data):
    rcv = drc_lcmtypes.string_t.decode(data)
    print 'Received message "'+rcv.data+'"'

msg=drc_lcmtypes.string_t()
msg.data='Hello World'

lc = lcm.LCM()
subscription = lc.subscribe("EXAMPLE", onReceive)

print 'Sending example message...'
lc.publish("EXAMPLE", msg.encode())

try:
    lc.handle()
except KeyboardInterrupt:
    pass
