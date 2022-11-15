#!/bin/bash

#
# This is run 
#

### create some PHP activity to see if this is logged @ newrelic
/home/vcap/app/php/bin/php -r 'echo "DAN\n";'
/home/vcap/app/php/bin/php -r 'echo "DAN\n";'
/home/vcap/app/php/bin/php -r 'echo "DAN\n";'
/home/vcap/app/php/bin/php -r 'echo "DAN\n";'
/home/vcap/app/php/bin/php -r 'echo "DAN\n";'

### create some http activity to see if this is logged @ newrelic
curl http://127.0.0.1:8080/index.html?1=5
curl http://127.0.0.1:8080/index.html?2=5
curl http://127.0.0.1:8080/index.html?3=5
curl http://127.0.0.1:8080/index.html?4=5
curl http://127.0.0.1:8080/index.html?5=5
