#!/bin/bash

### create some PHP activity to see if this is logged @ newrelic
/home/vcap/app/php/bin/php -c /home/vcap/app/php/etc/php.ini -r 'echo "Test 1\n";'
/home/vcap/app/php/bin/php -c /home/vcap/app/php/etc/php.ini -r 'echo "Test 2\n";'
/home/vcap/app/php/bin/php -c /home/vcap/app/php/etc/php.ini -r 'echo "Test 3\n";'
/home/vcap/app/php/bin/php -c /home/vcap/app/php/etc/php.ini -r 'echo "Test 4\n";'
/home/vcap/app/php/bin/php -c /home/vcap/app/php/etc/php.ini -r 'echo "Test 5\n";'

### create some http activity to see if this is logged @ newrelic
curl -s http://127.0.0.1:8080/index.html?1=1 -o /dev/null
curl -s http://127.0.0.1:8080/index.html?2=2 -o /dev/null
curl -s http://127.0.0.1:8080/index.html?2=3 -o /dev/null
curl -s http://127.0.0.1:8080/index.html?2=4 -o /dev/null
curl -s http://127.0.0.1:8080/index.html?2=5 -o /dev/null
