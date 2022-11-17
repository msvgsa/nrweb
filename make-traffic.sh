#!/bin/bash

#
# This is run 
#

### create some PHP activity to see if this is logged @ newrelic
/home/vcap/app/php/bin/php -c /home/vcap/app/php/etc/php.ini -r 'echo "Test 1\n";'
/home/vcap/app/php/bin/php -c /home/vcap/app/php/etc/php.ini -r 'echo "Test 2\n";'
/home/vcap/app/php/bin/php -c /home/vcap/app/php/etc/php.ini -r 'echo "Test 3\n";'
/home/vcap/app/php/bin/php -c /home/vcap/app/php/etc/php.ini -r 'echo "Test 4\n";'
/home/vcap/app/php/bin/php -c /home/vcap/app/php/etc/php.ini -r 'echo "Test 5\n";'

### create some http activity to see if this is logged @ newrelic
curl http://127.0.0.1:8080/index.html?1=5
curl http://127.0.0.1:8080/index.html?2=5
curl http://127.0.0.1:8080/index.html?3=5
curl http://127.0.0.1:8080/index.html?4=5
curl http://127.0.0.1:8080/index.html?5=5
