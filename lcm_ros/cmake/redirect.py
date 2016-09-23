#!/usr/bin/env python

import sys
import os
import re

if __name__ == "__main__":
    if len(sys.argv)>3:
        n = int(sys.argv[1])
        for file_name in sys.argv[2:n+1]:
            with open(file_name,"r") as fi:
                s=fi.read()
            for package in sys.argv[n+1:]:
                s=re.sub('import '+package+'.','import '+package+'_lcmtypes.',s)
                s=re.sub('include "'+package+'_','include "'+package+'_lcmtypes/'+package+'_',s)
                s=re.sub('include "'+package+'/','include "'+package+'_lcmtypes/',s)
            with open(file_name,"w") as fo:
                fo.write(s)
    else:
        print "Initializer generation failure: invalid arguments!"
        sys.exit(1)
